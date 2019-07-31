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

import desket.dto.JobAdvertisementDTO;

@WebServlet("/mypage/enterprise/announcelist.do") //주소관리 위해서는 webxml을 쓰는것이 더 좋음
public class AnnounceList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		
		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);
		
		
		
		EnterpriseDAO dao = new EnterpriseDAO();
		
		ArrayList<JobAdvertisementDTO> jobList = dao.jobList(id); 
		
		
		req.setAttribute("jobList", jobList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/enterprise/announcelist.jsp");
		dispatcher.forward(req, resp);
	}

}

