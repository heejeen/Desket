package desket.mypage.member.resume;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.ResumeDTO;

@WebServlet("/mypage/member/resume/resumelist.do")
public class ResumeList extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//list.java

		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);

		//세션 설정
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		//내 이력서 목록 가져오기
		String id = session.getAttribute("id").toString();
		
		ResumeDAO dao = new ResumeDAO();
		ArrayList<ResumeDTO> list = dao.getList(id);
		
		req.setAttribute("list", list);
		
		
		
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/member/resume/resumelist.jsp");
		dispatcher.forward(req, resp);
	}//doGet(req,resp)

}//class List




















