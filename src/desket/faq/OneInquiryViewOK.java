package desket.faq;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/faq/oneinquiryviewok.do")
public class OneInquiryViewOK extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("Hi ~~~ ");

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/faq/oneinquiryviewok.jsp");
		dispatcher.forward(req, resp);

	}
}
