package desket.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.EnterpriseInfoDTO;
import desket.dto.JobAdvertisementDTO;

@WebServlet("/notice/view.do") //주소관리 위해서는 webxml을 쓰는것이 더 좋음
public class view extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		
		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);
		
		String id = req.getParameter("id"); //기업 id
		String seq = req.getParameter("seq"); //공고 SEQ
		String memberid = session.getAttribute("id").toString();
		
		
		
		NoticeDAO dao = new NoticeDAO();
		//공고설명
		JobAdvertisementDTO adto = dao.getNotice(seq);
		VwEnterPriseInfo idto = dao.getInfo(id);
		
		//조회수 증가
		if(session.getAttribute("isRead") == null || session.getAttribute("isRead").toString().equals("n")) {
			dao.addReadcount(seq);
			session.setAttribute("isRead", "y"); //f5 금지			
		}
		
		
		//성비
		ArrayList<CntGender> gcnt = dao.getGCnt(seq);				
		//학력
		ArrayList<CntEducation> ecnt = dao.getECnt(seq);		
		//경력
		ArrayList<Cntcareer> ccnt = dao.getCCnt(seq);
		
		//관심공고 여부
		int isinterest = dao.isInterest(seq,memberid);
		
		
		//마감공고의 경우
		String status = req.getParameter("status");
		if(req.getParameter("status")!=null && req.getParameter("status").equals("closed")) {
			//합격자 뭐시기..
			
			
			
			
			req.setAttribute("status", "closed");
			
		}
		
		
		req.setAttribute("adto", adto);
		req.setAttribute("idto", idto);
		req.setAttribute("gcnt", gcnt);			
		req.setAttribute("ecnt", ecnt);			
		req.setAttribute("ccnt", ccnt);		
		req.setAttribute("seq", seq); //공고 seq
		req.setAttribute("isinterest", isinterest);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/notice/view.jsp");
		dispatcher.forward(req, resp);
	}

}

