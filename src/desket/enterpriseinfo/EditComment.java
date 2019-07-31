package desket.enterpriseinfo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.EnterpriseInfoCommentDTO;

// EditComment.java

@WebServlet("/enterpriseinfo/editcomment.do")
public class EditComment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String cseq = req.getParameter("cseq");
		String ccontent = req.getParameter("ccontent");
		String eiseq = req.getParameter("eiseq");

		EnterpriseinfoDAO dao = new EnterpriseinfoDAO();
		
		EnterpriseInfoCommentDTO dto = new EnterpriseInfoCommentDTO();
		
		dto.setContent(ccontent);
		dto.setSeq(cseq);
		
		int result = dao.editComment(dto);
		
		req.setAttribute("result", result);
		req.setAttribute("eiseq", eiseq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/enterpriseinfo/editcomment.jsp");
		dispatcher.forward(req, resp);

	}

}
