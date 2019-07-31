package desket.mypage.enterprise;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.JobAdvertisementDTO;

@WebServlet("/mypage/enterprise/addok.do")
public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AddOk.java
		//1. 데이터 가져오기
		//2. DB작업 > DAO위임 (insert)
		//3. 결과 반환 + JSP 호출
		
		
		
		//1. 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		//사이드바 선택메뉴 표시
		String menuid = req.getParameter("menuid");
		req.setAttribute("menuid", menuid);

		String id = session.getAttribute("id").toString();
		
		System.out.println(id);
		
		String title = req.getParameter("title");
		String job = req.getParameter("job");
		String region = req.getParameter("region");
		String education = req.getParameter("education");
		String minimumAnnualSalary = req.getParameter("minimumAnnualSalary");
		String maximumAnnualSalary = req.getParameter("maximumAnnualSalary");
		String minimumAge = req.getParameter("minimumAge");
		String maximumAge = req.getParameter("maximumAge");
		String career = req.getParameter("career");
		String mbtiTypeSeq = req.getParameter("mbtiTypeSeq");
		String holland = req.getParameter("holland");
		String humanityCutline = req.getParameter("humanityCutline");
		String technicalCutline = req.getParameter("technicalCutline");
		String fixedNumber = req.getParameter("fixedNumber");
		String deadline = req.getParameter("deadline");
		
		//2.
		JobAdvertisementDTO dto = new JobAdvertisementDTO();
		
		dto.setId(id);
		dto.setTitle(title);
		dto.setJob(job);
		dto.setRegion(region);
		dto.setEducation(education);
		dto.setMinimumAnnualSalary(minimumAnnualSalary);
		dto.setMaximumAnnualSalary(maximumAnnualSalary);
		dto.setMinimumAge(minimumAge);
		dto.setMaximumAge(maximumAge);
		dto.setCareer(career);
		dto.setMbtiTypeSeq(mbtiTypeSeq);
		dto.setHolland(holland);
		dto.setHumanityCutline(humanityCutline);
		dto.setTechnicalCutline(technicalCutline);
		dto.setFixedNumber(fixedNumber);
		dto.setDeadline(deadline);
		
		EnterpriseDAO dao = new EnterpriseDAO();
		
		int result = dao.add(dto);
		
		req.setAttribute("result", result);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/enterprise/addok.jsp");
		dispatcher.forward(req, resp);

	}

}
