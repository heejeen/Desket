package desket.enterpriseinfo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// DelComment.java

@WebServlet("/enterpriseinfo/delcomment.do")
public class DelComment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String cseq = req.getParameter("cseq");
		String eiseq = req.getParameter("eiseq");

		EnterpriseinfoDAO dao = new EnterpriseinfoDAO();
		
		int result = dao.delComment(cseq);
		
		req.setAttribute("result", result);
		req.setAttribute("eiseq", eiseq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/enterpriseinfo/delcomment.jsp");
		dispatcher.forward(req, resp);

	}

}
