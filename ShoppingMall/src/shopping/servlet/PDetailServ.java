package shopping.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shopping.dao.ProductDAO;
import shopping.dao.PurchaseDAO;
import vo.MemberVo;
import vo.ProductVo;
import vo.PurchaseVo;


@WebServlet("/pDetail")
public class PDetailServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String i_product = request.getParameter("i_product");
		System.out.println(i_product);
		ProductVo vo = ProductDAO.getProduct(i_product);
		
		request.setAttribute("vo", vo);
		request.setAttribute("view", "pDetail.jsp");
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
		
		PurchaseVo vo = new PurchaseVo();
		vo.setI_member(memberVo.getI_member());
		vo.setI_product(i_product);
		vo.setQty(qty);
		vo.setPrice(productVo.getPrice());
		
		PurchaseDAO.insertPurchase(vo);
		ProductDAO.updateProduct_em(i_product, qty);
		response.sendRedirect("pList");
	}

}
