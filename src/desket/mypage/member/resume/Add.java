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
import desket.dto.MemberDTO;
import desket.home.HomeDAO;

@WebServlet("/mypage/member/resume/add.do")
public class Add extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Add.java
		
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

		
		
		//언어 리스트 불러오기
		ResumeDAO rdao = new ResumeDAO();
		
		ArrayList<LanguageDTO> languageList = rdao.getLanguageList();
		req.setAttribute("languageList", languageList);

		
		
		//자격증 리스트 불러오기
		ArrayList<CertificateDTO> certificateList = rdao.getCertificateList();
		req.setAttribute("certificateList", certificateList);
		
		
		
		
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/member/resume/add.jsp");
		dispatcher.forward(req, resp);
	}//doGet(req,resp)

}//class Add
