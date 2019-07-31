package desket.questionmanage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import desket.dto.HollandTestDTO;
import desket.dto.HumanityTestDTO;
import desket.dto.MBTITestDTO;
import desket.dto.SkillTestDTO;

@WebServlet("/question/questionManage.do")
public class QuestionManage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//QuestionManage.java
		//1. DB작업
		
		adminDAO dao = new adminDAO();
		
//		MBTITestDTO mdto = new MBTITestDTO();
//		HollandTestDTO hdto = new HollandTestDTO();
//		HumanityTestDTO hmdto = new HumanityTestDTO();
//		SkillTestDTO sdto = new SkillTestDTO();
		
		//페이징을 위한 해시맵
		HashMap<String, String> map = new HashMap<String, String>();
		
		//====================================================================================================
		//페이징 + 페이지바 관련된 변수
		
		int nowPage = 0;		// 현재 페이지 번호
		int totalCount = 0;		// 총 게시물
		int pageSize = 10;		// 한 페이지당 출력 게시물 수
		int totalPage = 0;		// 총 페이지
		int begin = 0;			// where 절
		int end = 0;			// where 절
		int n = 0;				// 페이지 바 제작
		int loop = 0;			// 페이지 바 제작
		int blockSize = 10;		// 페이지 바 제작
		
		
		// list.do > list.do?page=1
		// list.do?page=3
		
		String page = req.getParameter("page");
		
		if (page == null || page == "") { nowPage = 1; }
		else { nowPage = Integer.parseInt(page); }
		
		System.out.println(page);
		System.out.println(nowPage);
		
		//nowPage : 현재 보게될 페이지 번호 + 연산
		//1page -> where rnum between 1 and 10
		//2page -> where rnum between 11 and 20
		//3page -> where rnum between 21 and 30
		begin = ((nowPage - 1) * pageSize) + 1; // ((1-1) * 10) + 1 = 1, ((2-1) * 10) + 1 = 11, .....		
		end = begin + pageSize - 1;
		
		System.out.println(begin);
		System.out.println(end);
		
		map.put("begin", begin + ""); //밸류값이 스트링이라 문자열변환(위 해시맵에 선언되잇음)
		map.put("end", end + "");
		
		
		//총 게시물 수 알아내기
		totalCount = dao.getTotalCount();
		
		//총 페이지 수 알아내기
		//246 / 10  = 24.6 > 25
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		
		//페이지 바 제작
		String pagebar = ""; //JSP 돌려줄 페이지 바 태그
		
		
		loop = 1; //루프 변수
		
		// 페이지 바 생성
		n = ((nowPage - 1) / blockSize) * blockSize + 1;
		
		pagebar += "<nav>\r\n" + 
				"		  <ul class=\"pagination\">";
		
		if (n == 1) {
			pagebar += String.format("<li>" + 
					"		      <a href='#' aria-label='Previous'>" + 
					"		        <span aria-hidden='true'>&laquo;이전</span>" + 
					"		      </a>" + 
					"		    </li>");
		} else {
			pagebar += String.format("<li>" + 
					"		      <a href='/desket/question/questionManage.do?page=%d' aria-label='Previous'>" + 
					"		        <span aria-hidden='true'>&laquo;이전</span>" + 
					"		      </a>" + 
					"		    </li>", n-1);
		}
		
		while (!(loop > blockSize || n > totalPage)) {
			
			 if(n == nowPage) { 
				 pagebar += String.format("<li class='active'><a href='#'>%d</a></li>", n); 
			 } else { 
				 pagebar += String.format("<li><a href='/desket/question/questionManage.do?page=%d'>%d</a></li>", n, n);
			 }
			 
			 loop++;
			 n++;
			 
		}
		
		if (n > totalPage) {
			pagebar += String.format("<li>" + 
					"		      <a href='#' aria-label='Next'>" + 
					"		        <span aria-hidden='true'>다음&raquo;</span>" + 
					"		      </a>" + 
					"		    </li>");
		} else {
			pagebar += String.format("<li>" + 
					"		      <a href='/desket/question/questionManage.do?page=%d' aria-label='Next'>" + 
					"		        <span aria-hidden='true'>다음&raquo;</span>" + 
					"		      </a>" + 
					"		    </li>", n);
		}
		
		
		pagebar += "</ul>\r\n" + 
				"		</nav> ";
		
		
		//====================================================================================================
		
		ArrayList<MBTITestDTO> mlist = dao.getMlist(map);
		
		ArrayList<HollandTestDTO> hlist = dao.getHlist();
		
		ArrayList<HumanityTestDTO> hmlist = dao.getHmlist();
		
		ArrayList<SkillTestDTO> slist = dao.getSlist();
		
		
		req.setAttribute("pagebar", pagebar);
		
		//게시물 총 수를 jsp에게 넘긴다.
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		
		req.setAttribute("mlist", mlist);
		req.setAttribute("hlist", hlist);
		req.setAttribute("hmlist", hmlist);
		req.setAttribute("slist", slist);
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/question/questionManage.jsp");
		dispatcher.forward(req, resp);

	}

}
