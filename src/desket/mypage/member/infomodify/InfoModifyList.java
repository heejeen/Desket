package desket.mypage.member.infomodify;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.MemberDTO;
import desket.home.HomeDAO;

@WebServlet("/mypage/member/infomodify/infomodifylist.do")
public class InfoModifyList extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//InfoModifyList.java
		
		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);
		
		//세션에서 아이디 비밀번호 받기
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		String pw = session.getAttribute("pw").toString();

		//세션새로 받아오기
		HomeDAO dao = new HomeDAO();
		MemberDTO result = dao.getMember(id,pw);
		
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
		}
		
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/member/infomodify/infomodifylist.jsp");
		dispatcher.forward(req, resp);
	}//doGet(req,resp)

}//class InfoModifyList