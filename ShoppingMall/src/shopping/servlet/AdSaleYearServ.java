package shopping.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.PurchaseDAO;
import vo.Purchase_productVo;

@WebServlet("/admin/saleYear")
public class AdSaleYearServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String s_r_dt = request.getParameter("s_r_dt");
		String e_r_dt = request.getParameter("e_r_dt");
		
		List<Purchase_productVo> list = PurchaseDAO.saleDayList(s_r_dt,e_r_dt);
		
		request.setAttribute("s", s_r_dt);
		request.setAttribute("e", e_r_dt);
		request.setAttribute("list", list);
		request.setAttribute("view","saleYear.jsp");
		request.getRequestDispatcher("temp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
