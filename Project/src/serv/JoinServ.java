package serv;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/join")
public class JoinServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("view", "join.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String nm=request.getParameter("nm");
		String tel=request.getParameter("tel");
		String email=request.getParameter("email");
		String addr=request.getParameter("addr");
		String sex=request.getParameter("sex");
		System.out.println(id);
		System.out.println(pw);
		System.out.println(nm);
		System.out.println(tel);
		System.out.println(email);
		System.out.println(addr);
		System.out.println(sex);
		
		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		vo.setNm(nm);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setAddr(addr);
		vo.setSex(sex);
		
		MemberDAO dao=MemberDAO.getInstance();
		dao.join(vo);
		response.sendRedirect("main");
	}

}
