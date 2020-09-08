package shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.MemberVo;

public class MemberDAO {
	public static int confirmPw(String mid,String mpw) {
		int result=0;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=	" select mid,mpw from t_member where mid=? ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, mid);
			rs = ps.executeQuery();
			while(rs.next()) {
				if(mid.equals(rs.getString("mid"))) {
					result=1;
					if(!mpw.equals(rs.getString("mpw"))) {
						result=2;
					}
				}
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,rs);
		}
		
		return result;
	}
	
	public static void insertMember(MemberVo vo) {
		Connection con = null;
		PreparedStatement ps=null;
		
		String sql=" insert into t_member(i_member,mid,mpw,nm,sex)values((select nvl(max(i_member),0)+1 from t_member),?,?,?,?) ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			ps.setString(2, vo.getMpw());
			ps.setString(3, vo.getNm());
			ps.setInt(4, vo.getSex());
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,null);
		}
	}
	
	public static MemberVo getMember(String mid) {
		MemberVo vo = new MemberVo();
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs=null;
		
		String sql=" select * from t_member where mid = ? ";
		
		try {
			con = DAO.getCon();
			ps =con.prepareStatement(sql);
			ps.setString(1,mid);
			rs = ps.executeQuery();
			while(rs.next()) {
				vo.setI_member(rs.getInt(1));
				vo.setMid(rs.getString(2));
				vo.setMpw(rs.getString(3));
				vo.setNm(rs.getString(4));
				vo.setSex(rs.getInt(5));
				vo.setR_date(rs.getString(6));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,rs);
		}
		return vo;
	}
	
	public static void changePw(int i_member,String mpw) {
		Connection con=null;
		PreparedStatement ps=null;
		
		String sql=" update t_member set mpw = ? where i_member = ?  ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, mpw);
			ps.setInt(2, i_member);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con, ps, null);
		}
	}
	
}
