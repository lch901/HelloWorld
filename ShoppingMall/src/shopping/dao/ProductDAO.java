package shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.ProductVo;

public class ProductDAO {
	public static int productCnt() {
		int result =0;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=" select nvl(max(i_product),0)+1 from t_product ";
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,rs);
		}
		
		return result;
	}
	
	public static List<ProductVo> productList(){
		List<ProductVo> list = new ArrayList();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=" select * from t_product order by i_product ";
		
		try {
			con =DAO.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductVo vo = new ProductVo();
				vo.setI_product(rs.getInt(1));
				vo.setNm(rs.getString(2));
				vo.setPrice(rs.getInt(3));
				vo.setPic(rs.getString(4));
				vo.setQty(rs.getInt(5));
				vo.setInfo(rs.getString(6));
				vo.setYn_sale(rs.getInt(7));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,rs);
		}
		
		return list;
	}
	
	public static List<ProductVo> productList(int pageCnt,String search){
		int s_idx = 5*(pageCnt -1) +1; 
		int e_idx = pageCnt * 5;
		List<ProductVo> list = new ArrayList<ProductVo>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=	" select * from \r\n" + 
					" (select i_product,nm,price,pic,qty,yn_sale,info,rank() over(order by i_product) as num from t_product \r\n";
					if(!search.equals("")) {
						sql+=" where nm like '%"+search+"%' \r\n";
					}
					sql+=" )where num between ? and ? ";
					
		try {
			con =DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1,s_idx);
			ps.setInt(2,e_idx);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductVo vo = new ProductVo();
				vo.setI_product(rs.getInt(1));
				vo.setNm(rs.getString(2));
				vo.setPrice(rs.getInt(3));
				vo.setPic(rs.getString(4));
				vo.setQty(rs.getInt(5));
				vo.setYn_sale(rs.getInt(6));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,rs);
		}
		
		return list;
	}
	
	public static ProductVo getProduct(String i_product) {
		ProductVo vo = new ProductVo();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=" select * from t_product where i_product = ? ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(i_product));
			rs = ps.executeQuery();
			while(rs.next()) {
				vo.setI_product(rs.getInt(1));
				vo.setNm(rs.getString(2));
				vo.setPrice(rs.getInt(3));
				vo.setPic(rs.getString(4));
				vo.setQty(rs.getInt(5));
				vo.setYn_sale(rs.getInt(6));
				vo.setInfo(rs.getString(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			DAO.close(con,ps,rs);
		}
		
		return vo;
	}
	public static ProductVo getProduct(int i_product) {
		ProductVo vo = new ProductVo();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=" select * from t_product where i_product = ? ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, i_product);
			rs = ps.executeQuery();
			while(rs.next()) {
				vo.setI_product(rs.getInt(1));
				vo.setNm(rs.getString(2));
				vo.setPrice(rs.getInt(3));
				vo.setPic(rs.getString(4));
				vo.setQty(rs.getInt(5));
				vo.setYn_sale(rs.getInt(6));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			DAO.close(con,ps,rs);
		}
		
		return vo;
	}
	
	public static void updateProduct(ProductVo vo) {
		Connection con=null;
		PreparedStatement ps=null;
		
		String sql=" update t_product set nm=?,price=?,pic=?,yn_sale=?,info=? where i_product = ? ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getNm());
			ps.setInt(2, vo.getPrice());
			ps.setString(3, vo.getPic());
			ps.setInt(4, vo.getYn_sale());
			ps.setString(5, vo.getInfo());
			ps.setInt(6, vo.getI_product());
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,null);
		}
	}
	
	public static List<ProductVo> imList(){
		List<ProductVo> list = new ArrayList();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=	" select b.i_pi,a.nm,sum(price*b.qty),b.qty from t_product a \r\n" + 
					" inner join t_product_import b \r\n" + 
					" on a.i_product = b.i_product\r\n" + 
					" group by b.i_pi,a.nm,b.qty order by i_pi desc ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductVo vo = new ProductVo();
				vo.setI_pi(rs.getInt(1));
				vo.setNm(rs.getString(2));
				vo.setPrice(rs.getInt(3));
				vo.setQty(rs.getInt(4));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,rs);
		}
		return list;
	}
	
	public static void insertIm(int i_product,int qty) {
		Connection con=null;
		PreparedStatement ps=null;
		
		String sql=" insert into t_product_import(i_pi,i_product,qty)values((select nvl(max(i_pi),0)+1 from t_product_import),?,?) ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, i_product);
			ps.setInt(2, qty);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,null);
		}
	}
	
	public static void updateProduct_im(int i_product,int qty) {
		Connection con=null;
		PreparedStatement ps=null;
		
		String sql=" update t_product set qty = qty + ? where i_product = ? ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, qty);
			ps.setInt(2, i_product);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,null);
		}
	}
	
	public static void updateProduct_em(int i_product,int qty) {
		Connection con=null;
		PreparedStatement ps=null;
		
		String sql=" update t_product set qty = qty - ? where i_product = ? ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, qty);
			ps.setInt(2, i_product);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,null);
		}
	}
	
	public static void insertProduct(ProductVo vo) {
		Connection con=null;
		PreparedStatement ps=null;
		
		String sql=" insert into t_product(i_product,nm,price,pic,info)values((select nvl(max(i_product),0)+1 from t_product),?,?,?,?) ";
		
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getNm());
			ps.setInt(2, vo.getPrice());
			ps.setString(3, vo.getPic());
			ps.setString(4, vo.getInfo());
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con,ps,null);
		}
	}
	
	public static int pageCnt(String search) {
		int result = 0;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=" select ceil(count(*)/5) from t_product ";
				if(!search.equals("")) {
					sql+="where nm like '%"+search+"%' "; 
					//sql+="where nm like '%?%' "; ps.setInt(1,search) <-  ?에 search값이 들어갈때 ''이 붙어서 들어감. 만약 search=안녕
				}
		try {
			con = DAO.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DAO.close(con, ps, rs);
		}
		return result;
	}
	
	
}
