package desket.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/notice/interest.do") //주소관리 위해서는 webxml을 쓰는것이 더 좋음
public class Interest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		String id = session.getAttribute("id").toString();
		
				
		NoticeDAO dao = new NoticeDAO();
		dao.addInterest(seq,id);

		
	}

}

