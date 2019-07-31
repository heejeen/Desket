package desket.mypage.member.noticeinterest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.notice.NoticeDAO;
import desket.notice.VwInterestList;

@WebServlet("/mypage/member/noticeinterest/noticeinterestlist.do")
public class NoticeInterestList extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//NoticeInterest.java
		
		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);

		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		
		NoticeDAO dao = new NoticeDAO();
		
		if(session.getAttribute("logintype")!=null && session.getAttribute("logintype").toString().equals("member")) {
			//멤버 로그인
			
			//관심 공고
			
			String id = session.getAttribute("id").toString();
			ArrayList<VwInterestList> ilist = dao.getIlist(id);
			
			
			req.setAttribute("ilist", ilist); 
		}
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/member/noticeinterest/noticeinterestlist.jsp");
		dispatcher.forward(req, resp);
	}//doGet(req,resp)

}//class NoticeInterest