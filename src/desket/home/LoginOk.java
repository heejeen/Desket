package desket.home;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.*;


@WebServlet("/home/loginok.do") 
public class LoginOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//로그인 하기
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String logintype = req.getParameter("logintype");
		
		
		HomeDAO dao = new HomeDAO();
		if(logintype.equals("enterprise")) {			
		//DB
		
		EnterpriseMemberDTO result = new EnterpriseMemberDTO();
		
		result = dao.getEnterprise(id,pw);
		
		if(result != null) {
			//로그인 성공 > 인증 티켓 발급
		session.setAttribute("businessNumber", result.getBusinessNumber());
		session.setAttribute("enterpriseName", result.getEnterpriseName());
		session.setAttribute("id", result.getId());
		session.setAttribute("pic", result.getPic());
		session.setAttribute("logintype",logintype );			
		}
		
		}else if(logintype.equals("member")) {
		
		MemberDTO result = new  MemberDTO();		
		
		result = dao.getMember(id,pw);
		
		if(result!=null) {
		session.setAttribute("address", result.getAddress());
		session.setAttribute("birth", result.getBirth());
		session.setAttribute("class", result.getClass());
		session.setAttribute("email", result.getEmail());
		session.setAttribute("gender", result.getGender());
		session.setAttribute("id", result.getId());
		session.setAttribute("name", result.getName());
		session.setAttribute("pic", result.getPic());
		session.setAttribute("pw", result.getPw());
		session.setAttribute("regdate", result.getRegdate());
		session.setAttribute("status", result.getStatus());
		session.setAttribute("tel", result.getTel());
		session.setAttribute("logintype",logintype );			
			
		}
		
		
			
		}else if(logintype.equals("admin")) {
			
		session.setAttribute("id", id);
		session.setAttribute("logintype", "admin");
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/home/loginok.jsp");
		dispatcher.forward(req, resp);
		
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req,resp);
	}

}

