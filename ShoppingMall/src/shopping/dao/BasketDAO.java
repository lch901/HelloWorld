package shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.BasketVo;
import vo.Basket_productVo;
import vo.MemberVo;

public class BasketDAO {
	public static void jangbaguni(BasketVo vo) {
		Connection con=null;
		PreparedStatement ps=null;
		
		String sql=" insert into t_basket(i_basket,i_member,i_product,qty,price)values((select nvl(max(i_basket),0)+1 from t_basket),?,?,?,?) ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getI_member());
			ps.setInt(2, vo.getI_product());
			ps.setInt(3, vo.getQty());
			ps.setInt(4, vo.getPrice());
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,null);
		}
	}
	
	public static List<Basket_productVo> basket_ProductList(MemberVo memberVo){
		List<Basket_productVo> list = new ArrayList();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=	" select a.i_basket,b.pic,b.nm,b.price,(a.price*a.qty),b.qty,a.qty,a.i_member,rank() over(order by a.i_basket) from t_basket a\r\n" + 
					" inner join t_product b\r\n" + 
					" on a.i_product = b.i_product where i_member = ? ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, memberVo.getI_member());
			rs = ps.executeQuery();
			while(rs.next()) {
				Basket_productVo vo = new Basket_productVo();
				vo.setI_basket(rs.getInt(9));// i_basket (x), rank~~~ (0)
				vo.setPic(rs.getString(2));
				vo.setNm(rs.getString(3));
				vo.setPrice(rs.getInt(4));
				vo.setBuy_price(rs.getInt(5));
				vo.setQty(rs.getInt(6));
				vo.setBuy_qty(rs.getInt(7));
				vo.setI_member(rs.getInt(8));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con, ps, rs);
		}
		return list;
	}
}
