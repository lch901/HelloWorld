package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.ProductVO;

public class ProductDAO {
	private static ProductDAO instance=new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	}
	
	public List<ProductVO> mainList(){
		List<ProductVO> list=new ArrayList<ProductVO>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql=" select * from product ";
		
		try{
			con=DAO.getCon();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				ProductVO vo=new ProductVO();
				vo.setI_product(rs.getInt("i_product"));
				vo.setNm(rs.getString("nm"));
				vo.setPrice(rs.getInt("price"));
				vo.setPic(rs.getString("pic"));
				vo.setQty(rs.getInt("qty"));
				vo.setInfo(rs.getString("info"));
				list.add(vo);
				System.out.println(rs.getString("pic"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DAO.close(con, ps, rs);
		}
		return list;
	}
}
