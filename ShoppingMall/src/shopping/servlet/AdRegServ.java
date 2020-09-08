package shopping.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.DAO;
import shopping.dao.ProductDAO;
import vo.ProductVo;
						// url관련 경로에러는 개발자도구에서도 볼수있음
@WebServlet("/admin/reg")// admin/reg  ->http://www.localhost:8090/ShoppingMall/admin/reg
						// /admin/reg ->http://www.localhost:8090/admin/reg  
public class AdRegServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = ProductDAO.productCnt();
		ProductVo vo = new ProductVo();
		vo.setI_product(result);
		
		request.setAttribute("vo",vo);
		request.setAttribute("view", "reg.jsp");
		request.getRequestDispatcher("temp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int i_product = Integer.parseInt(request.getParameter("i_product"));
		String nm = request.getParameter("nm");
		int price = Integer.parseInt(request.getParameter("price"));
		String pic = request.getParameter("pic");
		String info = request.getParameter("info");
		
		System.out.println(i_product);
		System.out.println(nm);
		System.out.println(price);
		System.out.println(pic);
		System.out.println(info);
		
		ProductVo vo = new ProductVo();
		vo.setI_product(i_product);
		vo.setNm(nm);
		vo.setPrice(price);
		vo.setPic(pic);
		vo.setInfo(info);
		
		ProductDAO.insertProduct(vo);
		response.sendRedirect("reg?complete=1");
	}

}
