package shopping.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.ProductDAO;
import vo.ProductVo;

@WebServlet("/admin/im")
public class ImServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ProductVo> productList = ProductDAO.productList(); 
		List<ProductVo> list = ProductDAO.imList();
		
		request.setAttribute("productList", productList);
		request.setAttribute("list",list );
		request.setAttribute("view", "im.jsp");
		request.getRequestDispatcher("temp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String i_product = request.getParameter("i_product");//정수값을 문자열로 가져왔음.
		int qty = Integer.parseInt(request.getParameter("qty"));
		
		System.out.println(i_product);
		System.out.println(qty);
		
		
		ProductDAO.insertIm(Integer.parseInt(i_product),qty);
		ProductDAO.updateProduct_im(Integer.parseInt(i_product),qty);
		response.sendRedirect("im");
	}

}
