package desket.mypage.enterprise.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.JobAdvertisementDTO;

@WebServlet("/mypage/enterprise/notice/list.do") //주소관리 위해서는 webxml을 쓰는것이 더 좋음
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//기업인지 확인 
		
		
		//나의 공고 정보 가져오기
		
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		
		String id = session.getAttribute("id").toString();
		
		NoticeDAO dao = new NoticeDAO();
				
		ArrayList<VwNoticeList> list = new ArrayList<VwNoticeList>();
		list = dao.getVwNoticeList(id);
		
		
		req.setAttribute("list", list);		
				
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/enterprise/notice/list.jsp");
		dispatcher.forward(req, resp);
	}

}

