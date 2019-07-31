package desket.faq;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import desket.dto.FAQDTO;

@WebServlet("/faq/faq.do")
public class FAQ extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);
		
		FAQDAO dao = new FAQDAO();
		ArrayList<FAQDTO> list = dao.getFAQList();
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/faq/faq.jsp");
		dispatcher.forward(req, resp);

	}
}
