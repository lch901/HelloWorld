package shopping.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.MemberVo;

@WebServlet("/logout")
public class LogoutServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type");
		System.out.println(type);
		
		HttpSession session = request.getSession();
		if(type.equals("member")) {
			session.setAttribute("memberVo", null);
			response.sendRedirect("login");
		}else if(type.equals("admin")){
			session.setAttribute("adminVo", null);
			response.sendRedirect("admin/login");
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
