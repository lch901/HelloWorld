package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO {
	public static Connection getCon() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
//		DB
//		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//ip번호:1521/xe","system","1234");
//		System.out.println("DB");
		return con;
	}
	
	public static void close(Connection con,PreparedStatement ps,ResultSet rs) {
		try {
			con.close();
			ps.close();
			if(rs!=null) {
				rs.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
