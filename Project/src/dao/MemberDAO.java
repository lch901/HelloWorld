package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.MemberVO;

public class MemberDAO {
	private static MemberDAO instance=new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	//join.jsp - JoinServ - member테이블 insert
	public int join(MemberVO vo){
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int re=-1;
		String sql=" insert into member(i_member,id,pw,nm,tel,email,addr,sex)values((select nvl(count(*),0)+1 from member),?,?,?,?,?,?,?) ";
		
		try{
			con=DAO.getCon();
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPw());
			ps.setString(3, vo.getNm());
			ps.setString(4, vo.getTel());
			ps.setString(5, vo.getEmail());
			ps.setString(6, vo.getAddr());
			ps.setString(7, vo.getSex());
			re=ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DAO.close(con,ps,null);
		}
		return re;
	}
	
	//member테이블의 모든 변수를 가져오기
	public MemberVO getMember(String id){
		MemberVO vo=new MemberVO();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql=" select * from member ";
		
		try{
			con=DAO.getCon();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs!=null){
				vo.setI_member(rs.getInt("i_member"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setNm(rs.getString("nm"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setAddr(rs.getString("addr"));
				vo.setSex(rs.getString("sex"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DAO.close(con,ps,rs);
		}
		return vo;
	}
	
	//findIdPw.jsp - FindIdPwServ - member테이블 아이디확인
	public void findIdPw(String email){
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select * from member where email=?";
		
		try{
			con=DAO.getCon();
			ps=con.prepareStatement(sql);
			ps.setString(1,email);
			rs=ps.executeQuery();
			if(rs!=null){
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DAO.close(con,ps,rs);
		}
		
	}
}
