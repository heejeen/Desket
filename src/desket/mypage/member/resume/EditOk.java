package desket.mypage.member.resume;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/member/resume/editok.do")
public class EditOk extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//EditOk.java
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/member/resume/editok.jsp");
		dispatcher.forward(req, resp);
	}//doGet(req,resp)

}//class EditOk























