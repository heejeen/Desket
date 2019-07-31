package desket.mypage.enterprise;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/enterprise/evaluation.do")
public class Evaluation extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Evaluation.java
		//1. 데이터 가져오기(seq)
		//2. DB작업
		//3. 결과 반환 및 JSP호출
		
		//1.
		String seq = req.getParameter("seq");
		
		//2.
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
		
		//3.
		req.setAttribute("fmlist", fmlist);
		req.setAttribute("fhlist", fhlist);
		req.setAttribute("fhmlist", fhmlist);
		req.setAttribute("fslist", fslist);
		req.setAttribute("seq", seq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/enterprise/evaluation.jsp");
		dispatcher.forward(req, resp);

	}

}
