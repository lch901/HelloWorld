package shopping.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shopping.dao.PurchaseDAO;
import vo.MemberVo;
import vo.Purchase_productVo;

@WebServlet("/purchaseList")
public class PurchaseListServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVo vo = (MemberVo)session.getAttribute("memberVo");
		List<Purchase_productVo> list = PurchaseDAO.purchaseList(vo);
		
		request.setAttribute("list", list);
		request.setAttribute("view","purchaseList.jsp");
		request.getRequestDispatcher("temp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
