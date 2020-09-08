package pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.jmx.snmp.Timestamp;
	//1.클래스객체 생성
	public class BoardDBBean {
	private static BoardDBBean instance=new BoardDBBean();//BoardDBBean
	public static BoardDBBean getInstance(){
		return instance;
	}
	
	//2.DB커넥션
	public Connection getConnection()throws Exception{
		Context ctx=new InitialContext();//톰캣의 server.xml의 Context클래스를 가져오기
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");//context태그에서 jdbc.myoracle을 찾기
		Connection con=ds.getConnection();
//		System.out.println("DB");
		return con;
	}
	
	//3.board insert
	public int writeBoard(BoardBean board)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql=null;
		int re=-1;
		

		int b_id=board.getB_id();
		int b_ref=board.getB_ref();
		int b_step=board.getB_step();//단계 답변
		int b_level=board.getB_level();//답변 답변
		int num=0;//board텡블의 행의 수
		
		con=getConnection();
		sql=" select max(b_id) from board ";
		ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			num=rs.getInt(1)+1;
		}else{//행이없으면 num=1로 저장
			num=1;
		}
		if(b_id!=0){
			sql=" update board set b_step=b_step+1 where b_ref=? and b_step > ? ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, b_ref);
			ps.setInt(2, b_step);
			ps.executeUpdate();
			
			b_step++;
			b_level++;
		}else{
			b_ref=num;
			b_step=0;
			b_level=0;
		}
		
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh-mm");//7
//		Timestamp t_sdf=new Timestamp();
//		t_sdf.getDateTime();
		
		sql="insert into board(b_id,b_name,b_email,b_title,b_content,b_pwd,"
				+ "b_date,b_ip,b_ref,b_step,b_level,b_fname,b_fsize)values(?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		
//		sql="insert into board(b_id,b_name,b_email,b_title,b_content,b_pwd)values(?,?,?,?,?,?) ";
		ps=con.prepareStatement(sql);
		ps.setInt(1,num);
		ps.setString(2, board.getB_name());
		ps.setString(3, board.getB_email());
		ps.setString(4, board.getB_title());
		ps.setString(5, board.getB_content());
		ps.setString(6, board.getB_pwd());
		ps.setTimestamp(7,board.getB_date());
//		b_hit는 자동생성
		ps.setString(8, board.getB_ip());
		ps.setInt(9, b_ref);
		ps.setInt(10,b_step);
		ps.setInt(11, b_level);
		ps.setString(12, board.getB_fname());
		ps.setInt(13, board.getB_fsize());
		re=ps.executeUpdate();
		
		con.close();
		ps.close();
		rs.close();
		
		return re;//insert가 되면 1,아니면 -1
	}
	
	//4.board select
	//ArrayList<String> a=new ArrayList<String>();
	//a.add("대한민국");
	//a.add("일본");
//	public ArrayList<BoardBean> listBoard(String pageNUM)throws Exception{
//		ArrayList<BoardBean> list =new ArrayList<BoardBean>();
//		//BoardBean board=new BoardBean(); //BoardBean을 여기서 객체화를 하면  모든 행이 같은 값으로 나오는 이유는
//		//ArrayList는 board로부터 값을 덮어쓰는게 아니라 주소값을 가져오기 때문에 
//		//ArrayList의 모든 방들은 board하나의 주소값을 가져오기 때문에 모든 방이 board가 마지막으로 덮어쓴값을 가지게됨.
//		//while문안에 board를 객체화하면 ArrayList의 1방마다 board의 주소값이 지정되기때문에 정상적으로 나옴.
//		Connection con=null;
//		PreparedStatement ps=null;
//		ResultSet rssel=null;//결과통
//		
//		String sqlsel="select * from board order by b_ref desc, b_step asc";
//		
//		con=getConnection();
//		ps=con.prepareStatement(sqlsel);
//		rssel=ps.executeQuery();
//		while(rssel.next()) {
//			BoardBean board=new BoardBean();
//			board.setB_id(rssel.getInt(1));
//			board.setB_name(rssel.getString(2));
//			board.setB_email(rssel.getString(3));
//			board.setB_title(rssel.getString(4));
//			board.setB_content(rssel.getString(5));
//			board.setB_pwd(rssel.getString(6));
//			board.setB_date(rssel.getTimestamp(7));
//			board.setB_hit(rssel.getInt(8));
//			board.setB_ip(rssel.getString(9));
//			board.setB_ref(rssel.getInt(10));
//			board.setB_step(rssel.getInt(11));
//			board.setB_level(rssel.getInt(12));
//			list.add(board);
//		}
//		return list;
//	}
	
	
	public ArrayList<BoardBean> listBoard(String pageNUM) throws Exception {  //list.jsp에서 page번호가 전달될수 있다
		Connection con=null;
		PreparedStatement pstmtsel=null;
		ResultSet rssel=null;     //결과통
		
	
		String sqlsel="select * from board order by b_ref desc, b_step asc";
		ArrayList<BoardBean> boardlist=new ArrayList<BoardBean>();//배열명boardlist
		BoardBean board;  //임시메모리
		con=getConnection();
		
		//페이지를 위한 추가---------------------------------------
		int absolutepage=1;     //절대페이지=1
		int dbcount=0;       //전체카운드 =50개
		PreparedStatement pstmt=con.prepareStatement("select count(b_id) from board");
		ResultSet rs=pstmt.executeQuery();  //50
		if(rs.next()) {
		     dbcount=rs.getInt(1);    //dbcount=50	
		}
		if(dbcount%BoardBean.pagesize == 0)    
		     BoardBean.pagecount = dbcount/(BoardBean.pagesize); // 총 페이지수 구하기
		   else
		     BoardBean.pagecount = dbcount/(BoardBean.pagesize)+1; // 총 페이지수 구하기
		    
		   if(pageNUM!=null) {   //pageNUM=3
		     BoardBean.pageNUM=Integer.valueOf(pageNUM);//지정된 페이지 보여주기
		     absolutepage=(BoardBean.pageNUM-1)*BoardBean.pagesize+1; // 21
		   }
		 //---------------------------------------
		   
		pstmtsel=con.prepareStatement(sqlsel, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		rssel=pstmtsel.executeQuery();
		if(rssel.next()) {
			rssel.absolute(absolutepage);   //동적인 준비된통
			int count=0;
			while(count<BoardBean.pagesize) {
				board=new BoardBean();
				board.setB_id(rssel.getInt("b_id"));
				board.setB_name(rssel.getString("b_name"));
				board.setB_email(rssel.getString("b_email"));
				board.setB_title(rssel.getString("b_title"));
				board.setB_content(rssel.getString(5));
				board.setB_pwd(rssel.getString(6));
				board.setB_date(rssel.getTimestamp(7));
				board.setB_hit(rssel.getInt(8));
				board.setB_ip(rssel.getString(9));
				board.setB_ref(rssel.getInt(10));
				board.setB_step(rssel.getInt(11));
				board.setB_level(rssel.getInt(12));
				boardlist.add(board); //boardlist배열에 추가한다 (board레코드)를  
				if(rssel.isLast()) break;
				else { 
					rssel.next();
				}
				count++;
			}
		}
		return boardlist;   //boardlist배열 리턴
	}
	
	//5.한개의 레코드를 보기
	public BoardBean getBoard(String b_id,boolean b_hit) {
		BoardBean board=new BoardBean();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sqlup="update board set b_hit=b_hit+1 where b_id=?";
		String sql="select * from board where b_id=?";
		
		try {
			con=getConnection();
			
			if(b_hit==true) {
				ps=con.prepareStatement(sqlup);
				ps.setInt(1, Integer.parseInt(b_id));
				ps.executeUpdate();
			}
			
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(b_id));
			rs=ps.executeQuery();
			if(rs.next()) {
				board.setB_id(rs.getInt("b_id"));//1
				board.setB_name(rs.getString("b_name"));//2
				board.setB_email(rs.getString("b_email"));//3
				board.setB_title(rs.getString("b_title"));//4
				board.setB_content(rs.getString("b_content"));//5
				board.setB_pwd(rs.getString("b_pwd"));//6
				board.setB_date(rs.getTimestamp("b_date"));//7
				board.setB_hit(rs.getInt("b_hit"));//8
				board.setB_ip(rs.getString("b_ip"));//9
				board.setB_ref(rs.getInt("b_ref"));//10
				board.setB_step(rs.getInt("b_step"));//11
				board.setB_level(rs.getInt("b_level"));//12
			}
			
			con.close();
			ps.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	//6.board update
	public int editBoard(BoardBean board){
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int re=-1;
		String sqlsel="select b_pwd from board where b_id=?";
		String sqlup="update board set b_name=?,b_email=?,b_title=?,b_content=? where b_id=?";
		
		try {
			con=getConnection();
			ps=con.prepareStatement(sqlsel);
			ps.setInt(1, board.getB_id());
			rs=ps.executeQuery();
			if(rs.next()) {
				if(!board.getB_pwd().equals(rs.getString("b_pwd"))) {
					re=0;//비번틀리면 리셋
				}else {
					con=getConnection();
					ps=con.prepareStatement(sqlup);
					ps.setString(1, board.getB_name());
					ps.setString(2, board.getB_email());
					ps.setString(3, board.getB_title());
					ps.setString(4, board.getB_content());
					ps.setInt(5, board.getB_id());
					re=ps.executeUpdate();//성공
				}
			}
			
			
			rs.close();
			con.close();
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	//board delete
	public int deleteBoard(String b_id,String b_pwd)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int re=-1;
		
		String sqlsel="select b_pwd from board where b_id=?";
		String sqldel="delete from board where b_id=?";
		
		con=getConnection();
		ps=con.prepareStatement(sqlsel);
		ps.setInt(1, Integer.parseInt(b_id));
		rs=ps.executeQuery();
		if(rs.next()){//행이 존재하지않으면 실행하지 않게
			String pwd=rs.getString(1);
			if(!pwd.equals(b_pwd)){
				re=0;
			}else{
				ps=con.prepareStatement(sqldel);
				ps.setInt(1, Integer.parseInt(b_id));
				re=ps.executeUpdate();
			}
		}
		
		con.close();
		ps.close();
		rs.close();
		
		return re;
	}
	
}
