package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.ProductVo;

public class ProductDAO {
	public static List<ProductVo> productList(){
		List<ProductVo> list = new ArrayList();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=DAO.getCon();
			ps=con.prepareStatement(" select * from t_product ");
			rs=ps.executeQuery();
			while(rs.next()) {
				ProductVo vo=new ProductVo();
				vo.set("");
				vo.setI_product("");
				vo.setI_product("");
				vo.setI_product("");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con, ps, rs);
		}
		
		return list;
	}
}
