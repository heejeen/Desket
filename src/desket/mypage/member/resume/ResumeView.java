package desket.mypage.member.resume;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.LetterDTO;
import desket.dto.ResumeDTO;

@WebServlet("/mypage/member/resume/resumeview.do")
public class ResumeView extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//ResumeView.java
		
		//세션에서 아이디받기
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		String loginType = session.getAttribute("logintype").toString();
		
		if(loginType.equals("enterprise")) {
			id = req.getParameter("id");
		}
		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);
		
		//이력서 seq 받기
		String seq = req.getParameter("seq");
		req.setAttribute("seq", seq);
		
		//이력서 불러오기
		ResumeDAO dao = new ResumeDAO();
		ResumeDTO resume = dao.getView(seq);
		req.setAttribute("resume", resume);
		
		//소유자격증 불러오기
		ArrayList<String> certificate = dao.getCertificate(id, seq);
		req.setAttribute("certificate", certificate);
		
		//가능언어 불러오기
		ArrayList<String> language = dao.getLanguage(id, seq);
		req.setAttribute("language", language);
		
		//자기소개서 불러오기
		ArrayList<LetterDTO> letter = dao.getLetter(id, seq);
		req.setAttribute("letter", letter);
		
		
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/member/resume/resumeview.jsp");
		dispatcher.forward(req, resp);
	}//doGet(req,resp)

}//class ResumeView