package shopping.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shopping.dao.BasketDAO;
import shopping.dao.ProductDAO;
import shopping.dao.PurchaseDAO;
import vo.BasketVo;
import vo.Basket_productVo;
import vo.MemberVo;
import vo.ProductVo;
import vo.PurchaseVo;

@WebServlet("/basket")
public class BasketServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		
		List<Basket_productVo> list = BasketDAO.basket_ProductList(memberVo);
		
		request.setAttribute("list",list);
		request.setAttribute("view","basket.jsp");
		request.getRequestDispatcher("temp.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int i_product = Integer.parseInt(request.getParameter("i_product"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		
		System.out.println(i_product);
		System.out.println(qty);
		
		HttpSession session = request.getSession();
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		ProductVo productVo = ProductDAO.getProduct(i_product);
		
		BasketVo vo = new BasketVo();
		vo.setI_member(memberVo.getI_member());
		vo.setI_product(i_product);
		vo.setQty(qty);
		vo.setPrice(productVo.getPrice());
		
		BasketDAO.jangbaguni(vo);
		response.sendRedirect("pList");
	}

}
