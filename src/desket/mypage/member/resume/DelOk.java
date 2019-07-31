package desket.mypage.member.resume;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/member/resume/delok.do")
public class DelOk extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//DelOk.java

		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);

		ResumeDAO dao = new ResumeDAO();

		//이력서 seq 받아오기
		String seq = req.getParameter("seq");
		//이력서 지우기 결과
		int resumeResult = dao.delResume(seq);
		req.setAttribute("resumeResult", resumeResult);
		
		
		//자소서 지우기 결과
		if (resumeResult == 1) {
			int letterResult = dao.delLetter(seq);
			req.setAttribute("letterResult", letterResult);
		}
		
		//소유 자격증 지우기 결과
		if (resumeResult == 1) {
			int certificateResult = dao.delCertificate(seq);
			req.setAttribute("certificateResult", certificateResult);
		}
		
		//가능 언어 지우기 결과
		if (resumeResult == 1) {
			int languageResult = dao.delLanguageResult(seq);
			req.setAttribute("languageResult", languageResult);
		}

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/member/resume/delok.jsp");
		dispatcher.forward(req, resp);
	}//doGet(req,resp)

}//class DelOk
















