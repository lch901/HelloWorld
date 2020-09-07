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
		String sql=" insert into member(m_num,id,pw,nm,tel,email,addr,sex)values((select nvl(count(*),0)+1 from member),?,?,?,?,?,?,?) ";
		
		try {
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
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,null);
		}
		return re;
	}
}
