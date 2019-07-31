package desket.mypage.member.resume;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.MemberDTO;
import desket.dto.ResumeDTO;
import desket.mypage.member.infomodify.InfoModifyDAO;

@WebServlet("/mypage/member/resume/addok.do")
public class AddOk extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AddOk.java
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		
		//DB
		ResumeDAO daoResume = new ResumeDAO();
		InfoModifyDAO daoInfo = new InfoModifyDAO();
		
		
		
		//기본정보 업데이트 -> tblMember
		String infoName = req.getParameter("infoName");
		String infoBirth = req.getParameter("infoBirth");
		String infoGender = req.getParameter("infoGender");
		String infoTel = req.getParameter("infoTel");
		String infoEmail = req.getParameter("infoEmail");
		String infoAddress = req.getParameter("infoAddress");
		String infoPic = req.getParameter("infoPic");
		if(infoPic.equals("")) { infoPic = "nopic.png"; }

		MemberDTO mdto = new MemberDTO();
		mdto.setName(infoName);
		mdto.setBirth(infoBirth);
		mdto.setGender(infoGender);
		mdto.setTel(infoTel);
		mdto.setEmail(infoEmail);
		mdto.setAddress(infoAddress);
		mdto.setPic(infoPic);
		
		//기본정보 업데이트
		int infoResult = daoInfo.editInfo(mdto, id);
		
		

		
		
		//등록글 seq
		String seq = null;
		//추가정보 등록 -> tblResume
		if(infoResult == 1) {
			
			String resumeTitle = req.getParameter("resumeTitle");
			String resumePic = req.getParameter("resumePic");
			if(resumePic.equals("")) { resumePic = "nopic.png"; }
			String resumeTask = req.getParameter("resumeTask");
			String resumeNationality = req.getParameter("resumeNationality");
			String resumeEducation = req.getParameter("resumeEducation");
			String resumeMajor = req.getParameter("resumeMajor");
			String resumeGraduation = req.getParameter("resumeGraduation");
			String resumeGrades = req.getParameter("resumeGrades");
			String resumeCareer = req.getParameter("resumeCareer");
			String resumeSalary = req.getParameter("resumeSalary");
			String 	resumePortfolio = req.getParameter("resumePortfolio");
			
			ResumeDTO rdto = new ResumeDTO();
			rdto.setTitle(resumeTitle);
			rdto.setPic(resumePic);
			rdto.setTask(resumeTask);
			rdto.setNationality(resumeNationality);
			rdto.setEducation(resumeEducation);
			rdto.setMajor(resumeMajor);
			rdto.setGraduation(resumeGraduation);
			rdto.setGrades(resumeGrades);
			rdto.setCareer(resumeCareer);
			rdto.setSalary(resumeSalary);
			rdto.setPortfolio(resumePortfolio);
			
			//추가정보 업데이트 및 해당글 seq 가져오기
			seq = daoResume.addResume(rdto, id);
			req.setAttribute("seq", seq);
		}//추가정보 등록

		
		
		
		//자소서 개수 넘겨받기
		int cnt = Integer.parseInt(req.getParameter("cnt"));
		
		//자소서 등록
		if(cnt != 0 && infoResult == 1 && seq != null) {
			
			String letterTitle = "";
			String letterContent = "";
			int letterResult = -1;
			
			for (int i=1; i<=cnt; i++) {
				letterTitle = req.getParameter("letterTitle"+i);
				letterContent = req.getParameter("letterContent"+i);
				if(!letterTitle.equals("") && !letterContent.equals("")) {
					letterResult = daoResume.addLetter(letterTitle, letterContent, seq);
				}
			}
			if(letterResult != 0) {
				req.setAttribute("letterResult", letterResult);
			}
		}//자소서 등록
		
		
		
		//언어 개수 넘겨받기
		int lanCnt = Integer.parseInt(req.getParameter("lanCnt"));
		
		//가능 언어 등록
		if(lanCnt !=0 && infoResult == 1 && seq != null ) {
			
			String language = "";
			int languageResult = -1;
			
			for (int i=1; i<=lanCnt; i++) {
				language = req.getParameter("language"+i);
				if(!language.equals("")) {
					languageResult = daoResume.addLanguage(language, seq);
				}
			}
			if(languageResult != 0) {
				req.setAttribute("languageResult", languageResult);
			}
		}//가능 언어 등록

		
		
		
		//자격증 개수 넘겨받기
		int cerCnt = Integer.parseInt(req.getParameter("cerCnt"));
		
		//소유 자격증 등록
		if(cerCnt !=0 && infoResult == 1 && seq != null ) {
			
			String certificate = "";
			int certificateResult = -1;
			
			for (int i=1; i<=cerCnt; i++) {
				certificate = req.getParameter("certificate"+i);
				if(!certificate.equals("")) {
					certificateResult = daoResume.addCertificate(certificate, seq);
				}
			}
			if(certificateResult != 0) {
				req.setAttribute("certificateResult", certificateResult);
			}
		}//소유 자격증 등록
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/member/resume/addok.jsp");
		dispatcher.forward(req, resp);
	}//doGet(req,resp)

}//class AddOk
























