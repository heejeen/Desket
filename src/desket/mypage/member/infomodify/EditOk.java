package desket.mypage.member.infomodify;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.MemberDTO;

@WebServlet("/mypage/member/infomodify/editok.do")
public class EditOk extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//EditOk.java
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		//세션에서 아이디 받아오기
		String id = session.getAttribute("id").toString();
		
		//수정된 기본정보 넘겨받기
		String name = req.getParameter("infoName");
		String birth = req.getParameter("infoBirth");
		String gender = req.getParameter("infoGender");
		String tel = req.getParameter("infoTel");
		String email = req.getParameter("infoEmail");
		String address = req.getParameter("infoAddress");
		String pic = req.getParameter("infoPic");

		//멤버dto에 넘겨받은값 포장하기
		MemberDTO dto = new MemberDTO();
		
		dto.setName(name);
		dto.setBirth(birth);
		dto.setGender(gender);
		dto.setTel(tel);
		dto.setEmail(email);
		dto.setAddress(address);
		dto.setPic(pic);
		
		//DB 업데이트 및 결과 반환
		InfoModifyDAO dao = new InfoModifyDAO();
		int result = dao.editInfo(dto, id);
		
		//결과값 넘겨주기
		req.setAttribute("result", result);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/member/infomodify/editok.jsp");
		dispatcher.forward(req, resp);
	}//doGet(req,resp)

}//class EditOk
























