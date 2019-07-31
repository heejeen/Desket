package desket.mypage.enterprise;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/enterprise/editok.do")
public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//EditOk.java
		//1. 데이터 가져오기
		//2. DB작업
		//3. 결과반환 + JSP 호출
		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		String enterpriseName = req.getParameter("enterpriseName");
		String pw = req.getParameter("pw");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String scale = req.getParameter("scale");
		String field = req.getParameter("field");
		String introduction = req.getParameter("introduction");
		String businessNumber = req.getParameter("businessNumber");
		String establishYear = req.getParameter("establishYear");
		
		
		EnterpriseDAO dao = new EnterpriseDAO();
		
		ViewInfoDTO dto = new ViewInfoDTO();
		dto.setId(id);
		dto.setEnterpriseName(enterpriseName);
		dto.setPw(pw);
		dto.setTel(tel);
		dto.setAddress(address);
		dto.setScale(scale);
		dto.setField(field);
		dto.setIntroduction(introduction);
		dto.setEstablishYear(establishYear);
		dto.setBusinessNumber(businessNumber);
		
		int result = dao.myViewUpdate(dto);
		
		System.out.println(id);
		System.out.println("result : " + result);
		
		req.setAttribute("result", result);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/enterprise/editok.jsp");
		dispatcher.forward(req, resp);

	}

}
