package desket.mypage.enterprise;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage/enterprise/viewinfo.do")
public class ViewInfo extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//ViewInfo.java
		
		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);
		
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		String id = session.getAttribute("id").toString();
		String star = "*";
		
		EnterpriseDAO dao = new EnterpriseDAO();
		
		ViewInfoDTO dto = dao.myViewInfo(id);
		
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("star", star);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/enterprise/viewinfo.jsp");
		dispatcher.forward(req, resp);

	}

}
