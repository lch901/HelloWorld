package shopping.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.AdminVo;
import vo.MemberVo;
import vo.ProductVo;

public class DAO {
	public static Connection getCon() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
//		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","shopping","hr");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		System.out.println("DB");
		return con;
	}
	
	public static void close(Connection con,PreparedStatement ps, ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
			con.close();
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
