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

@WebServlet("/admin/list")
public class AdListServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		System.out.println(search);
		if(search == null){
			search="";
		}
		
		String s_page = request.getParameter("page");
		int page = 1;
		if(s_page != null) {
			page = Integer.parseInt(s_page);
		}
		
		int pageCnt = ProductDAO.pageCnt(search);
		List<ProductVo> list = ProductDAO.productList(page,search);
		
		request.setAttribute("page", page);
		request.setAttribute("search", search);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("list",list);
		request.setAttribute("view", "list.jsp");
		request.getRequestDispatcher("temp.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
