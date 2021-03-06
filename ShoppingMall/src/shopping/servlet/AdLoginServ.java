package shopping.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shopping.dao.AdminDAO;
import vo.AdminVo;

@WebServlet("/admin/login")
public class AdLoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("view", "login.jsp");
		request.getRequestDispatcher("temp.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		System.out.println(mid);
		System.out.println(mpw);
		
		
		
		int result = AdminDAO.confirmPw(mid,mpw);
		
		AdminVo vo = AdminDAO.getAdmin(mid);
		
		if(result ==1) {
			HttpSession session = request.getSession();
			session.setAttribute("adminVo", vo);
			response.sendRedirect("home");
		}else if(result == 2){
			request.setAttribute("msg","비밀번호가 틀렸습니다.");
			request.setAttribute("mid",mid );
			doGet(request,response);
		}else {
			request.setAttribute("msg","아이디가 존재하지않습니다.");
			request.setAttribute("mid",mid );
			doGet(request,response);
		}
		
	}

}
