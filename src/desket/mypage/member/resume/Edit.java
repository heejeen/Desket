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

import desket.dto.CertificateDTO;
import desket.dto.LanguageDTO;
import desket.dto.LetterDTO;
import desket.dto.MemberDTO;
import desket.dto.ResumeDTO;
import desket.home.HomeDAO;

@WebServlet("/mypage/member/resume/edit.do")
public class Edit extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Edit.java
		
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
		
		//이력서 seq 받기
		String seq = req.getParameter("seq");
		
		//이력서 불러오기
		ResumeDAO rdao = new ResumeDAO();
		ResumeDTO resume = rdao.getView(seq);
		req.setAttribute("resume", resume);
		
		//자격증 리스트 불러오기
		ArrayList<CertificateDTO> certificateList = rdao.getCertificateList();
		req.setAttribute("certificateList", certificateList);

		//소유자격증 불러오기
		ArrayList<String> certificate = rdao.getCertificateSeq(seq);
		req.setAttribute("certificate", certificate);
		
		//언어 리스트 불러오기
		ArrayList<LanguageDTO> languageList = rdao.getLanguageList();
		req.setAttribute("languageList", languageList);

		//가능언어 불러오기
		ArrayList<String> language = rdao.getLanguageSeq(seq);
		req.setAttribute("language", language);
		
		//자기소개서 불러오기
		ArrayList<LetterDTO> letter = rdao.getLetter(id, seq);
		req.setAttribute("letter", letter);
		
		
		
		
		
		
		
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/member/resume/edit.jsp");
		dispatcher.forward(req, resp);
	}//doGet(req,resp)

}//class Edit
















