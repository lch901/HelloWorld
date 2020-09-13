package shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.MemberVo;
import vo.PurchaseVo;
import vo.Purchase_productVo;

public class PurchaseDAO {
	public static void insertPurchase(PurchaseVo vo) {
		Connection con=null;
		PreparedStatement ps=null;
		
		String sql=" insert into t_purchase(i_purchase,i_member,i_product,qty,price)values((select nvl(max(i_purchase),0)+1 from t_purchase),?,?,?,?) ";
		
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
			DAO.close(con, ps, null);
		}
	}
	
	public static List<Purchase_productVo> purchaseList(MemberVo memberVo){
		List<Purchase_productVo> list = new ArrayList();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=	" select a.i_purchase,b.pic,b.nm,b.price,b.price*a.qty,b.qty,a.qty,a.r_dt,b.i_product,a.i_member,rank() over(order by a.i_purchase) as num from t_purchase a\r\n" + 
					" inner join t_product b\r\n" + 
					" on a.i_product = b.i_product where a.i_member = ? order by num desc ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, memberVo.getI_member());
			rs = ps.executeQuery();
			while(rs.next()) {
				Purchase_productVo vo = new Purchase_productVo();
				vo.setI_purchase(rs.getInt(11));// i_purchase (x), num (o)
				vo.setPic(rs.getString(2));
				vo.setNm(rs.getString(3));
				vo.setPrice(rs.getInt(4));
				vo.setBuy_price(rs.getInt(5));
				vo.setQty(rs.getInt(6));
				vo.setBuy_qty(rs.getInt(7));
				vo.setR_dt(rs.getString(8));
				vo.setI_product(rs.getInt(9));
				vo.setI_member(rs.getInt(10));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con, ps, rs);
		}
		return list;
	}
	
	public static List<Purchase_productVo> saleDayList(String s_r_dt,String e_r_dt){
		List<Purchase_productVo> list = new ArrayList();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=	" select to_char(r_dt,'yyyy-mm-dd'),pic,nm,price,sum(qty),sum(p) from\r\n" + 
					" (select a.r_dt,b.pic,b.nm,b.price,a.qty,a.price*a.qty as p from t_purchase a\r\n" + 
					" inner join t_product b\r\n" + 
					" on a.i_product = b.i_product \r\n" + 
					" where to_char(a.r_dt,'yyyy-mm-dd') between ? and ?)\r\n" + 
					" group by to_char(r_dt,'yyyy-mm-dd'),pic,nm,price ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1,s_r_dt);
			ps.setString(2,e_r_dt);
			rs = ps.executeQuery();
			while(rs.next()) {
				Purchase_productVo vo = new Purchase_productVo();
				vo.setR_dt(rs.getString(1));
				vo.setPic(rs.getString(2));
				vo.setNm(rs.getString(3));
				vo.setPrice(rs.getInt(4));
				vo.setQty(rs.getInt(5));
				vo.setTotal_price(rs.getInt(6));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con, ps, rs);
		}
		return list;
	}
	
	public static List<Purchase_productVo> saleMonList(String d,String product){
		List<Purchase_productVo> list = new ArrayList();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=	" select to_char(r_dt,'yyyy-mm'),pic,nm,price,sum(qty),sum(p) from\r\n" + 
					" (select a.r_dt,b.pic,b.nm,b.price,a.qty,a.price*a.qty as p from t_purchase a\r\n" + 
					" inner join t_product b\r\n" + 
					" on a.i_product = b.i_product \r\n" + 
					" where to_char(a.r_dt,'yyyy-mm') between ? and ?)\r\n";
					if(!product.equals("")) {
						sql+="where nm = ? ";
					}
					sql+=" group by to_char(r_dt,'yyyy-mm'),pic,nm,price ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1,d);
			ps.setString(2,d);
			if(!product.equals("")) {
				ps.setString(3, product);
			}
			rs = ps.executeQuery();
			while(rs.next()) {
				Purchase_productVo vo = new Purchase_productVo();
				vo.setR_dt(rs.getString(1));
				vo.setPic(rs.getString(2));
				vo.setNm(rs.getString(3));
				vo.setPrice(rs.getInt(4));
				vo.setQty(rs.getInt(5));
				vo.setTotal_price(rs.getInt(6));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con, ps, rs);
		}
		return list;
	}
	
	public static List<Purchase_productVo> pList(String d,String product){
		List<Purchase_productVo> list = new ArrayList();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=	" select to_char(r_dt,'yyyy-mm'),pic,nm,price,sum(qty),sum(p) from\r\n" + 
					" (select a.r_dt,b.pic,b.nm,b.price,a.qty,a.price*a.qty as p from t_purchase a\r\n" + 
					" inner join t_product b\r\n" + 
					" on a.i_product = b.i_product \r\n" + 
					" where to_char(a.r_dt,'yyyy-mm') between ? and ?)\r\n";
					sql+="where nm = ? ";
					sql+=" group by to_char(r_dt,'yyyy-mm'),pic,nm,price ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1,d);
			ps.setString(2,d);
			ps.setString(3, product);
			rs = ps.executeQuery();
			while(rs.next()) {
				Purchase_productVo vo = new Purchase_productVo();
				vo.setR_dt(rs.getString(1));
				vo.setPic(rs.getString(2));
				vo.setNm(rs.getString(3));
				vo.setPrice(rs.getInt(4));
				vo.setQty(rs.getInt(5));
				vo.setTotal_price(rs.getInt(6));
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
