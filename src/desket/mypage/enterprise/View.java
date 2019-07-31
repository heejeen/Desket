package desket.mypage.enterprise;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.JobAdvertisementDTO;

@WebServlet("/mypage/enterprise/view.do") //주소관리 위해서는 webxml을 쓰는것이 더 좋음
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//기업 공고 상세보기
		HttpSession session = req.getSession();
		
		//1. 데이터 가져오기
		req.setCharacterEncoding("UTF-8");
		String seq = req.getParameter("seq");
		
		
		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);
		
		//2. DB작업
		EnterpriseDAO dao = new EnterpriseDAO();
		
		JobAdvertisementDTO dto = dao.get(seq);
		
		// Feedback.java 에서 F5에 의한 조회수 증가 방지 티켓 발급
		session.setAttribute("isFeedback", "n");
		
		req.setAttribute("dto", dto);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/enterprise/view.jsp");
		dispatcher.forward(req, resp);
	}

}

