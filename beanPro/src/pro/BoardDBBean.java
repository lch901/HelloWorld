package pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
	//1.
	public class BoardDBBean {
	private static BoardDBBean instance=new BoardDBBean();//BoardDBBean
	public static BoardDBBean getInstance(){
		return instance;
	}
	
	//2.
	public Connection getConnection()throws Exception{
		Context ctx=new InitialContext();//톰캣의 server.xml의 Context클래스를 가져오기
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");//context태그에서 jdbc.myoracle을 찾기
		Connection con=ds.getConnection();
//		System.out.println("DB");
		return con;
	}
	
	//3.board insert
	public void writeBoard(BoardBean board)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql=null;
		int num=0;//board텡블의 행의 수
		
//		con=getConnection();
//		sql=" ";
//		rs=ps.executeQuery();
//		
//		//8. b_hit는 'defalut 0'으로 자동생성됨.
//		int b_ip=rs.getInt(9);
//		int b_ref=rs.getInt(10);
//		int b_step=rs.getInt(11);
//		int b_level=rs.getInt(12);
//		
//		board.setB_ip(b_ip);
//		board.setB_ref(b_ref);
//		board.setB_step(b_step);
//		board.setB_level(b_level);
		
		con=getConnection();
		sql=" select max(b_id) from board ";
		ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
		
		if(rs.next()){
			num=rs.getInt(1)+1;
		}else{//행이없으면 num=1로 저장
			num=1;
		}
//		if(b_id!=0){
//			sql=" update board set b_step=b_step+1 where b_ref=? and b_step > ? ";
//			ps=con.prepareStatement(sql);
//			ps.setInt(1, b_ref);
//			ps.setInt(1, b_step);
//			ps.executeUpdate();
//			
//			b_step++;
//			b_level++;
//		}else{
//			b_ref=num;
//			b_step=0;
//			b_level=0;
//		}
//		sql="insert into board(b_id,b_name,b_email,b_title,b_content,b_pwd,"
//				+ "b_date,b_ip,b_ref,b_step,b_level)values(?,?,?,?,?,?,?,?,?,?,?) ";
		
		sql="insert into board(b_id,b_name,b_email,b_title,b_content,b_pwd)values(?,?,?,?,?,?) ";
		ps=con.prepareStatement(sql);
		ps.setInt(1,num);
		ps.setString(2, board.getB_name());
		ps.setString(3, board.getB_email());
		ps.setString(4, board.getB_title());
		ps.setString(5, board.getB_content());
		ps.setString(6, board.getB_pwd());
		ps.execute();
//		ps.setTimestamp(7, board.getB_date());
		//b_hit는 자동생성
//		ps.setInt(8, );
//		ps.setInt(9, );
//		ps.setInt(10,);
//		ps.setInt(11, );

		
		con.close();
		ps.close();
		rs.close();
	}
	
	//4.board select
	//ArrayList<String> a=new ArrayList<String>();
	//a.add("대한민국");
	//a.add("일본");
	public ArrayList<BoardBean> listBoard()throws Exception{
		ArrayList<BoardBean> list =new ArrayList<BoardBean>();
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rssel=null;//결과통
		ResultSet pageset=null;//갯수를 담는 결과통
		String sql="select count(b_id) from board";
//		String sqlsel="select * from board order by b_ref desc, b_step asc";
		String sqlsel="select * from board";
		
		con=getConnection();
		ps=con.prepareStatement(sqlsel);
		rssel=ps.executeQuery();
		while(rssel.next()) {
			BoardBean board=new BoardBean();
			board.setB_id(rssel.getInt(1));
			board.setB_name(rssel.getString(2));
			board.setB_email(rssel.getString(3));
			board.setB_title(rssel.getString(4));
			board.setB_content(rssel.getString(5));
			board.setB_pwd(rssel.getString(6));
			board.setB_date(rssel.getTimestamp(7));
			board.setB_hit(rssel.getInt(8));
			board.setB_ip(rssel.getString(9));
			board.setB_ref(rssel.getInt(10));
			board.setB_step(rssel.getInt(11));
			board.setB_level(rssel.getInt(12));
			list.add(board);
		}
		return list;
	}
	
	//5.한개의 레코드를 보기
	public BoardBean getBoard(String b_id) {
		BoardBean board=new BoardBean();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select * from board where b_id=?";
		
		
		try {
			con=getConnection();
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
				}
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
			
			
			rs.close();
			con.close();
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	//board delete
	public int deleteBoard(int b_id,String b_pwd)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int re=-1;
		
		String sqlsel="select b_pwd from board where b_id";
		String sqldel="delete from board where b_id";
		
		con=getConnection();
		ps=con.prepareStatement(sqlsel);
		ps.setInt(1, b_id);
		rs=ps.executeQuery();
		if(rs.next()){//행이 존재하지않으면 실행하지 않게
			String pwd=rs.getString(1);
			if(!pwd.equals(b_pwd)){
				re=0;
			}else{
				ps=con.prepareStatement(sqldel);
				ps.setInt(1, b_id);
				re=ps.executeUpdate();
			}
		}
		
		con.close();
		ps.close();
		rs.close();
		
		return re;
	}
}
