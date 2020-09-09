package serv;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

@WebServlet("/findIdPw")
public class FindIdPwServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public FindIdPwServ() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type");
		if(type==null){
			type="id";
		}
		System.out.println(type+"type");
		
		request.setAttribute("type", type);
		request.setAttribute("view", "findIdPw.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id=request.getParameter("id");
		String email=request.getParameter("email");
		String find_type=request.getParameter("find_type");
		
		System.out.println(id);
		System.out.println(email);
		System.out.println(find_type);
		
		MemberDAO dao=MemberDAO.getInstance();
		if(find_type.equals("id")){
//			dao.findId(id);
		}else if(find_type.equals("pw")){
//			dao.findPw(id,email);
		}
	}

}
