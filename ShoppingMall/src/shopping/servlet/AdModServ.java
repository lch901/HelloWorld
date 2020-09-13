package shopping.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.ProductDAO;
import vo.ProductVo;

@WebServlet("/admin/mod")
public class AdModServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String i_product = request.getParameter("i_product");
		ProductVo vo = ProductDAO.getProduct(i_product);
		
		request.setAttribute("vo", vo);
		request.setAttribute("view", "mod.jsp");
		request.getRequestDispatcher("temp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int i_product = Integer.parseInt(request.getParameter("i_product"));
		String nm = request.getParameter("nm");
		int price = Integer.parseInt(request.getParameter("price"));
		String pic = request.getParameter("pic");
		int yn_sale = Integer.parseInt(request.getParameter("yn_sale"));
		String info = request.getParameter("info");
		
		System.out.println(i_product);
		System.out.println(nm);
		System.out.println(price);
		System.out.println(pic);
		System.out.println(yn_sale);
		System.out.println(info);
		
		ProductVo vo = new ProductVo();
		vo.setI_product(i_product);
		vo.setNm(nm);
		vo.setPrice(price);
		vo.setPic(pic);
		vo.setYn_sale(yn_sale);
		vo.setInfo(info);
		
		ProductDAO.updateProduct(vo);
		response.sendRedirect("list?complete=1");
		
	}

}
