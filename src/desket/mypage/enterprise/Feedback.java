package desket.mypage.enterprise;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.HollandTestDTO;
import desket.dto.HumanityTestDTO;
import desket.dto.MBTITestDTO;
import desket.dto.SkillTestDTO;

@WebServlet("/mypage/enterprise/feedback.do")
public class Feedback extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//feedback.java
		//1. DB작업 > DAO위임 (select)
		//2. JSP 반환 + 결과호출
		String seq = req.getParameter("seq");
		String feedbackStatus = req.getParameter("feedbackStatus");
//		String evSuccess = req.getParameter("evSuccess");
		
//		int result = 0;
//		int result2 = 0;
//		int result3 = 0;
//		int result4 = 0;
		
		
		//1. 
		req.setCharacterEncoding("UTF-8");
		EnterpriseDAO dao = new EnterpriseDAO();
		
		//MBTI 검사
		ArrayList<FeedbackMBTIDTO> fmlist = dao.fmlist(seq);
		
		//홀랜드 검사
		ArrayList<FeedbackHollandDTO> fhlist = dao.fhlist(seq);
		
		//인적성 검사
		ArrayList<FeedbackHumanityDTO> fhmlist = dao.fhmlist(seq);
		
		//기술 검사
		ArrayList<FeedbackSkillDTO> fslist = dao.fslist(seq);
		
		
		
		//신뢰도 증가 중첩되는것을 막기
		HttpSession session = req.getSession();
		
		String id = session.getAttribute("id").toString();
		
		if (session.getAttribute("isFeedback") == null 
			|| session.getAttribute("isFeedback").toString().equals("n")) {
			
			//MBTI 문제를 재구성(피드백)하여 신뢰도를 재조정한다.
			if (fmlist.get(0).getAllComplianceRate() < 80) {
				dao.fmUpdate(seq); //20
			}
			
			if (fhlist.get(0).getAllComplianceRate() < 80) {
				dao.fhUpdate(seq); //30
			}
			
			if (fhmlist.get(0).getAllAnswerRate() >= 70) {
				dao.fhmUpdate(seq); //6
			}
			
			if (fslist.get(0).getAllAnswerRate() >= 50) {
				dao.fsUpdate(seq); //8
			}
			session.setAttribute("isFeedback", "y"); // F5금지
		}
		
		
		//MBTI 질문의 재조정이 성공하였다. 기존의 문제와 재조정된 문제를 보여준다.
		ArrayList<FeedbackMBTIDTO> fmUpdateList = dao.fmUpdateList(seq);
		ArrayList<MBTITestDTO> fmNewList = dao.fmNewList(seq);
		
		//Holland 질문의 재조정이 성공하였다. 기존의 문제와 재조정된 문제를 보여준다.
		ArrayList<FeedbackHollandDTO> fhUpdateList = dao.fhUpdateList(seq);
		ArrayList<HollandTestDTO> fhNewList = dao.fhNewList(seq);
		
		//Humanity 질문의 재조정이 성공하였다. 기존의 문제와 재조정된 문제를 보여준다.
		ArrayList<FeedbackHumanityDTO> fhmUpdateList = dao.fhmUpdateList(seq);
		ArrayList<HumanityTestDTO> fhmNewList = dao.fhmNewList(seq);
		
		//Skill 질문의 재조정이 성공하였다. 기존의 문제와 재조정된 문제를 보여준다.
		ArrayList<FeedbackSkillDTO> fsUpdateList = dao.fsUpdateList(seq);
		ArrayList<SkillTestDTO> fsNewList = dao.fsNewList(seq);
		
		
		
		//req로 받던 애들 전부 session으로 바꿔야한다. // 기업에 필요한일
		req.setAttribute("fmlist", fmlist);
		req.setAttribute("fhlist", fhlist);
		req.setAttribute("fhmlist", fhmlist);
		req.setAttribute("fslist", fslist);
		
		req.setAttribute("fmUpdateList", fmUpdateList);
		req.setAttribute("fmNewList", fmNewList);
		req.setAttribute("fhUpdateList", fhUpdateList);
		req.setAttribute("fhNewList", fhNewList);
		req.setAttribute("fhmUpdateList", fhmUpdateList);
		req.setAttribute("fhmNewList", fhmNewList);
		req.setAttribute("fsUpdateList", fsUpdateList);
		req.setAttribute("fsNewList", fsNewList);
		
		req.setAttribute("seq", seq);
		req.setAttribute("feedbackStatus", feedbackStatus);
		req.setAttribute("id", id);
//		req.setAttribute("evSuccess", evSuccess);
		
//		req.setAttribute("result", result);
//		req.setAttribute("result2", result2);
//		req.setAttribute("result3", result3);
//		req.setAttribute("result4", result4);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/enterprise/feedback.jsp");
		dispatcher.forward(req, resp);

	}

}
