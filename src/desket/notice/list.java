package desket.notice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.JobAdvertisementDTO;

@WebServlet("/notice/list.do") //주소관리 위해서는 webxml을 쓰는것이 더 좋음
public class list extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);
		
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		session.setAttribute("isRead", "n");
	
			
					
			//모든 공고 가져오기
			
			NoticeDAO dao = new NoticeDAO();			
		
			
			ArrayList<JobAdvertisementDTO> alist = dao.getList();
			ArrayList<RecomandList> rlist = dao.getrList();
			
			
			req.setAttribute("alist", alist);
			req.setAttribute("rlist", rlist);
			
			
		
						
		if(session.getAttribute("logintype")!=null && session.getAttribute("logintype").toString().equals("member")) {
			//멤버 로그인
			
			//관심 공고
			
			String id = session.getAttribute("id").toString();
			ArrayList<VwInterestList> ilist = dao.getIlist(id);
			
			
			req.setAttribute("ilist", ilist); 
			
			
		}else if(session.getAttribute("logintype")!=null && session.getAttribute("logintype").toString().equals("enterprise")) {
			//기업 로그인
			
			//마감공고
			
			String id = session.getAttribute("id").toString();
			ArrayList<VwClosedList> clist = dao.getCList(id);
			
			req.setAttribute("clist", clist);
			
		}
			
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/notice/list.jsp");
		dispatcher.forward(req, resp);
	}

}

