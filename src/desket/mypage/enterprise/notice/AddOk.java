package desket.mypage.enterprise.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import desket.dto.JobAdvertisementDTO;
import desket.dto.RequiredCertificateDTO;
import desket.dto.RequiredLanguageDTO;

@WebServlet("/mypage/enterprise/notice/addok.do") //주소관리 위해서는 webxml을 쓰는것이 더 좋음
public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
		//받아서 Add 하기
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		
		
					
		
		NoticeDAO dao = new NoticeDAO();
		JobAdvertisementDTO dto = new JobAdvertisementDTO();
		
				
		dto.setId(session.getAttribute("id").toString()); //id
		
	
		System.out.println(req.getParameter("xtitle"));
		
		dto.setTitle(req.getParameter("xtitle")); //공고제목
	
		
		 /* dto.setTime(req.getParameter("xtime").toString()); //근무일시
		  dto.setRegion(req.getParameter("xregion").toString()); //지역
		  dto.setEmploytype(req.getParameter("xemploytype").toString()); //근무 형태
		  dto.setDeadline(req.getParameter("xdeadline").toString()); //마감일
		  dto.setEducation(req.getParameter("xeducation").toString()); //학력
		  dto.setCareer(req.getParameter("xcareer").toString()); //경력
		  dto.setMinimumAnnualSalary(req.getParameter("xminimumannualsalary").toString(
		  )); //최소연봉
		  dto.setMaximumAnnualSalary(req.getParameter("xmaximumannualsalary").toString(
		  )); //최대연봉 dto.setMaximumAge(req.getParameter("xmaximumage").toString());
		  //최소나이 dto.setMinimumAge(req.getParameter("xminimumage").toString()); //최대나이
		 */
		
		int result = dao.addNotice(dto);
		
		RequiredCertificateDTO cdto = new RequiredCertificateDTO();
		RequiredLanguageDTO ldto = new RequiredLanguageDTO();
		
		int cresult = dao.addCert(cdto);
		int lresult = dao.addLan(ldto);
		
		
		
		
		req.setAttribute("result", result);
		
				
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/enterprise/notice/addok.jsp");
		dispatcher.forward(req, resp);
	}
	


}

