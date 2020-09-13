package pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDBBean {
	//1. 자신을 객체화하는 변수(instance)
	private static MemberDBBean instance=new MemberDBBean();

	//2.자신을 객체화하여 리턴하기 위한 메소드
	public static MemberDBBean getInstance() {
		return instance;
	}
	
	//3.DB연동
	public Connection getConnection()throws Exception{
		Context ctx=new InitialContext();//톰캣의 server.xml의 Context클래스를 가져오기
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");//context태그에서 jdbc.myoracle을 찾기
		Connection con=ds.getConnection();
//		System.out.println("DB");
		return con;
	}
	
	
	//4.테이블 insert
	public int insertMember(MemberBean member)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		String sql="insert into memberT(mem_uid,mem_pwd,mem_name,mem_email,mem_regdate,mem_addr) values(?,?,?,?,?,?)";
		int re=0;
		
		con=getConnection();
		ps=con.prepareStatement(sql);
		ps.setString(1,member.getMem_uid());
		ps.setString(2,member.getMem_pwd());
		ps.setString(3,member.getMem_name());
		ps.setString(4,member.getMem_email());
		ps.setTimestamp(5,member.getMem_regdate());//Timestamp
		ps.setString(6,member.getMem_addr());
		re=ps.executeUpdate();
		
		
		con.close();
		ps.close();
		return re;
	}
	
	//5.id중복확인
	public int confirmID(String mem_uid)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql=" select mem_uid from memberT where mem_uid=? ";
		int re=0;
		
		
		con=getConnection();
		ps=con.prepareStatement(sql);
		ps.setString(1, mem_uid);
		rs=ps.executeQuery();
		/*while(rs.next()){
			if(rs.getString(1).equals(mem_uid)){
				re=1;
			}
		}*/
		if(rs.next()){//값이 존재하면 1
			re=1;
		}else{//값이 없으면 -1
			re=-1;
		}
		
		con.close();
		ps.close();
		rs.close();
	
		return re;
	}
	
	//6.아이디가 일치하는 멤버의 정보를 얻어오는 메소드
	public MemberBean getMember(String mem_uid)throws Exception{
		MemberBean mb=new MemberBean();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql=" select mem_uid from memberT where mem_uid=? ";
		
		con=getConnection();
		ps=con.prepareStatement(sql);
		ps.setString(1, mem_uid);
		rs=ps.executeQuery();
		
		if(rs.next()){
			mb.setMem_uid(rs.getString(1));
			mb.setMem_pwd(rs.getString(2));
			mb.setMem_name(rs.getString(3));
			mb.setMem_email(rs.getString(4));
			mb.setMem_regdate(rs.getTimestamp(5));
			mb.setMem_addr(rs.getString(6));
		}
	
		
		con.close();
		ps.close();
		rs.close();
		return mb;
	}
	
	//7.데이터수정update
	public int updateMember(MemberBean member)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		int re=-1;
		String sql=" update memberT set mem_name=?,mem_pwd=?,mem_email=?,mem_addr=? where mem_uid=? ";
		
		con=getConnection();
		ps=con.prepareStatement(sql);
		ps.setString(1, member.getMem_name());
		ps.setString(2, member.getMem_pwd());
		ps.setString(3, member.getMem_email());
		ps.setString(4, member.getMem_addr());
		ps.setString(5, member.getMem_uid());
		re=ps.executeUpdate();//insert,update,delete
		
		con.close();
		ps.close();
		return re;
	}
	
	//8. 데이터 삭제 delete
	public int deleteMember(String mem_uid)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		int re=-1;
		String sql=" delete from memberT where mem_uid=? ";
		
		con=getConnection();
		ps=con.prepareStatement(sql);
		ps.setString(1, mem_uid);
		re=ps.executeUpdate();
		
		con.close();
		ps.close();
		return re;
	}
	
	//9.사용자 인증
	public int userCheck(String mem_uid,String mem_pwd)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int re=0;
		String sql=" select mem_pwd from memberT where mem_uid=? ";
		
		con=getConnection();
		ps=con.prepareStatement(sql);
		ps.setString(1, mem_uid);
		rs=ps.executeQuery();
		if(rs.next()){
			if(mem_pwd.equals(rs.getString("mem_pwd"))){
				re=1;
			}else{
				re=-1;
			}
		}
		
		con.close();
		ps.close();
		rs.close();
		return re;
	}
}
