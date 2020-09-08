package shopping.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shopping.dao.MemberDAO;
import vo.MemberVo;

@WebServlet("/changePw")
public class ChangePwServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("view", "changePw.jsp");
		request.getRequestDispatcher("temp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String beforeMpw = request.getParameter("beforeMpw");
		String mpw = request.getParameter("mpw");
		String mpwre = request.getParameter("mpwre");
		
		System.out.println(beforeMpw);
		System.out.println(mpw);
		System.out.println(mpwre);
		
		HttpSession session = request.getSession();
		MemberVo vo = (MemberVo)session.getAttribute("memberVo");
		if(!vo.getMpw().equals(beforeMpw) || !mpw.equals(mpwre)) {
			request.setAttribute("msg", "비밀번호를 다시 확인해 주세요.");
			doGet(request,response);
		}else {
			MemberDAO.changePw(vo.getI_member(),mpw);
			request.setAttribute("msg", "비밀번호가 변경 되었습니다.");
			doGet(request,response);
		}
	}

}
