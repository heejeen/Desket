package desket.mypage.enterprise;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/enterprise/feedbackstatus.do")
public class FeedbackStatus extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//FeedbackStatus.java
		String seq = req.getParameter("seq");
		
		EnterpriseDAO dao = new EnterpriseDAO();
		
		String feedbackStatus = dao.getFeedbackStatus(seq);

		
		resp.setContentType("application/json"); //MIME type
        
        PrintWriter writer = resp.getWriter();
        
        writer.print("["); 
        writer.print("{");   
        writer.printf("\"feedbackStatus\":\"%s\"", feedbackStatus);
        writer.print("}");
        writer.print("]");
        
        writer.close();
     
		
	}

}
