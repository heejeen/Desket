package desket.home;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthCheck {
	
	private HttpSession session;
	private HttpServletResponse resp;

	public AuthCheck(HttpSession session, HttpServletResponse resp) {
		this.session = session;
		this.resp = resp;
	}
	
	public void allow() {
		
		if (session.getAttribute("id") == null) {
			//로그인 안한 사람 > 쫓아내버리기
			
			try {
				
				resp.setCharacterEncoding("UTF-8");
				PrintWriter writer = resp.getWriter();
				
				writer.println("<html>");
				writer.println("<meta charset='utf-8'>");
				writer.println("<body>");
				writer.println("<script>");
				writer.println("alert('회원만 접근 가능합니다.');");
				writer.println("location.href='/desket/home/login.do';");
				writer.println("</script>");
				writer.println("</body>");
				writer.println("</html>");
				
				writer.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}// allow()
	
	
}
