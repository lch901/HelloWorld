package shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.AdminVo;

public class AdminDAO {
	public static int confirmPw(String mid,String mpw) {
		int result=0;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=	" select mid,mpw from t_admin where mid=? ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, mid);
			rs = ps.executeQuery();
			while(rs.next()) {
				if(mid.equals(rs.getString(1))) {
					result=2;
					if(mpw.equals(rs.getString(2))) {
						result=1;
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
	
	public static AdminVo getAdmin(String mid) {
		AdminVo vo = new AdminVo();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=" select * from t_admin where mid = ? ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, mid);
			rs = ps.executeQuery();
			while(rs.next()) {
				vo.setI_admin(rs.getInt(1));
				vo.setMid(rs.getString(2));
				vo.setMpw(rs.getString(3));
				vo.setNm(rs.getString(4));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,rs);
		}
		
		return vo;
	}
}
