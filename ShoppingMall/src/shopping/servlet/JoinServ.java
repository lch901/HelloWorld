package shopping.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.dao.MemberDAO;
import vo.MemberVo;

@WebServlet("/join")
public class JoinServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("view", "join.jsp");
		request.getRequestDispatcher("temp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String nm = request.getParameter("nm");
		int sex = Integer.parseInt(request.getParameter("sex"));
		
		System.out.println(mid);
		System.out.println(mpw);
		System.out.println(nm);
		System.out.println(sex);
		
		MemberVo vo = new MemberVo();
		vo.setMid(mid);
		vo.setMpw(mpw);
		vo.setNm(nm);
		vo.setSex(sex);
		
		MemberDAO.insertMember(vo);
		response.sendRedirect("login?msg=complete");
	}

}
