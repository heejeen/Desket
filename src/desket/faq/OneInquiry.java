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

@WebServlet("/faq/oneinquiry.do")
public class OneInquiry extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		FAQDAO dao = new FAQDAO();
		
		//관리자가 볼 1:1문의게시글 리스트 
		ArrayList<OneInquiryDTO> aList = dao.getAllOneInquriyList();
		
		//회원이 볼 1:1문의게시글 리스트
		ArrayList<OneInquiryDTO> mList = dao.getOneInquriyList(id);
		
		
		req.setAttribute("aList", aList);
		req.setAttribute("mList", mList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/faq/oneinquiry.jsp");
		dispatcher.forward(req, resp);

	}
}
