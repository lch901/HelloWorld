package shopping.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.PurchaseDAO;
import vo.Purchase_productVo;

@WebServlet("/admin/saleMon")
public class AdSaleMonServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat type1 = new SimpleDateFormat("yyyy-MM");// mm (x), MM (o)
		Date time = new Date();
		String date =  type1.format(time);
		
		String y = request.getParameter("y");
		String m = request.getParameter("m");
		
		String product = request.getParameter("product");
		if(product == null) {
			product="";
		}
		
		String d =date;
		if(y != null && m != null) {
			d = y+"-"+m;
		}
		
		List<Purchase_productVo> list = PurchaseDAO.saleMonList(d,product);

		int year=0;
		int mon=0;
		if(y==null && m==null) {
			year=Integer.parseInt(date.substring(0,4));
			mon=Integer.parseInt(date.substring(5,7));
		}else {
			year=Integer.parseInt(y);
			mon=Integer.parseInt(m);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("y",year);
		request.setAttribute("m",mon );
		request.setAttribute("product", product);
		request.setAttribute("view","saleMon.jsp");
		request.getRequestDispatcher("temp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
