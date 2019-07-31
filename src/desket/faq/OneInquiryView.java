package desket.faq;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.OneInquiryDTO;

@WebServlet("/faq/oneinquiryview.do")
public class OneInquiryView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 /*
		  req.setCharacterEncoding("utf-8"); 
		  HttpSession session = req.getSession();
		  String loginType = (String)session.getAttribute("logintype");
		 */
		
		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);
		
		String oiSeq = req.getParameter("seq"); //1대1문의 게시글번호
		
		FAQDAO dao = new FAQDAO();
		OneInquiryDTO dto = dao.getOneInquriyView(oiSeq);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/faq/oneinquiryview.jsp");
		dispatcher.forward(req, resp);

	}
}
