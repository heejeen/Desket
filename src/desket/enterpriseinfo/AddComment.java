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

// CommentAdd.java

@WebServlet("/enterpriseinfo/addcomment.do")
public class AddComment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String ccontent = req.getParameter("ccontent");
		String enterpriseinfoseq = req.getParameter("enterpriseinfoseq");

		EnterpriseinfoDAO dao = new EnterpriseinfoDAO();
		
		HttpSession session = req.getSession();
		
		EnterpriseInfoCommentDTO dto = new EnterpriseInfoCommentDTO();
		
		dto.setWriter(session.getAttribute("id").toString());
		dto.setContent(ccontent);
		dto.setEnterpriseinfoseq(enterpriseinfoseq);
		
		int result = dao.addComment(dto);
		
		req.setAttribute("result", result);
		req.setAttribute("enterpriseinfoseq", enterpriseinfoseq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/enterpriseinfo/addcomment.jsp");
		dispatcher.forward(req, resp);

	}

}
