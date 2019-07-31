package desket.mypage.enterprise;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/enterprise/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Edit.java
		//1. 데이터 가져오기
		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		
		EnterpriseDAO dao = new EnterpriseDAO();
		
		ViewInfoDTO dto = dao.myViewInfo(id);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/enterprise/edit.jsp");
		dispatcher.forward(req, resp);

	}

}
