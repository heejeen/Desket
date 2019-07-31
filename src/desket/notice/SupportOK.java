package desket.notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.HollandTestDTO;
import desket.dto.MBTITestDTO;
import desket.dto.SkillTestDTO;

@WebServlet("/notice/supportok.do")
public class SupportOK extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String questionType = req.getParameter("questionType");
		
		if(questionType.equals("MBTI")) {

			String advertisementNum = "1";  								//임의의 공고번호   > 후에 req나 session으로 받아오기
			
			NoticeDAO dao = new NoticeDAO();
			ArrayList<MBTITestDTO> mblist = dao.MBTIQuestionList(advertisementNum);
			
//			HttpSession session = req.getSession();
			session.setAttribute("mblist", mblist);
			
			
			resp.setContentType("application/json"); //MIME type
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();
			
			writer.print("[");
			for(int i=0; i<mblist.size(); i++) {
				
				writer.print("{");
				//writer.printf("\"seq\":\"%s\",", mlist.get(i).getSeq());
				writer.printf("\"type\":\"%s\",", mblist.get(i).getType());
				writer.printf("\"question\":\"%s\"", mblist.get(i).getQuestion().replace("\"", "'"));
				//writer.printf("\"score\":\"%d\"", mlist.get(i).getScore());
				
				if(i == mblist.size()-1) {
					writer.print("}");
				} else {
					writer.print("},\r\n");
				}
			}
			writer.print("]");
			//System.out.println(mlist.get(mlist.size()-1).getSeq());
			
			writer.close();
			
		} 
		
		
		  if(questionType.equals("holland")) {
		  
			  String advertisementNum = "1";  								//임의의 공고번호   > 후에 req나 session으로 받아오기
			  
			  NoticeDAO dao = new NoticeDAO(); 
			  ArrayList<HollandTestDTO> holist = dao.hollandQuestionList(advertisementNum);
			  
	//		  HttpSession session = req.getSession(); 
			  session.setAttribute("holist", holist);
			  
			  
			  
			  resp.setContentType("application/json"); //MIME type
			  resp.setCharacterEncoding("UTF-8");
			  
			  PrintWriter writer = resp.getWriter();
			  
			  writer.print("["); 
			  for(int i=0; i<holist.size(); i++) {
			  
				  writer.print("{"); 
				  //writer.printf("\"seq\":\"%s\",", hlist.get(i).getSeq());
				  writer.printf("\"type\":\"%s\",", holist.get(i).getType());
				  writer.printf("\"question\":\"%s\"", holist.get(i).getQuestion().replace("\"", "'"));
				  //writer.printf("\"score\":\"%d\"", hlist.get(i).getScore());
				  
				  if(i == holist.size()-1) { 
					  writer.print("}"); 
				  } else {
					  writer.print("},\r\n"); 
				  }
			  } 
			  writer.print("]");
			  
			  writer.close();
		  
		  }
		  
		  
		  if(questionType.equals("humanity")) {
			  
			  String advertisementNum = "1";  								//임의의 공고번호   > 후에 req나 session으로 받아오기
			  
			  NoticeDAO dao = new NoticeDAO(); 
			  ArrayList<HumanityTestListDTO> hulist = dao.humanityQuestionList(advertisementNum);
			  
	//		  HttpSession session = req.getSession(); 
			  session.setAttribute("hulist", hulist);
			  
			  
			  
			  resp.setContentType("application/json"); //MIME type
			  resp.setCharacterEncoding("UTF-8");
			  
			  PrintWriter writer = resp.getWriter();
			  
			  writer.print("["); 
			  for(int i=0; i<hulist.size(); i++) {
			  
				  writer.print("{"); 
				  //writer.printf("\"seq\":\"%s\",", hlist.get(i).getSeq());
				  writer.printf("\"type\":\"%s\",", hulist.get(i).getType());
				  writer.printf("\"question\":\"%s\",", hulist.get(i).getQuestion().replace("\"", "'"));
				  writer.printf("\"choice1\":\"%s\",", hulist.get(i).getChoice1());
				  writer.printf("\"choice2\":\"%s\",", hulist.get(i).getChoice2());
				  writer.printf("\"choice3\":\"%s\",", hulist.get(i).getChoice3());
				  writer.printf("\"choice4\":\"%s\"", hulist.get(i).getChoice4());
				  
				  //writer.printf("\"score\":\"%d\"", hlist.get(i).getScore());
				  
				  if(i == hulist.size()-1) { 
					  writer.print("}"); 
				  } else {
					  writer.print("},\r\n"); 
				  } 
			  } 
			  writer.print("]");
			  
			  writer.close();
		  
		  }
		  
		  
		  
		  
		  
		  if(questionType.equals("skill")) {
			  
			  String advertisementNum = "1";  								//임의의 공고번호   > 후에 req나 session으로 받아오기
			  
			  NoticeDAO dao = new NoticeDAO(); 
			  ArrayList<SkillTestDTO> sklist = dao.skillQuestionList(advertisementNum);
			  
			  //		  HttpSession session = req.getSession(); 
			  session.setAttribute("sklist", sklist);
			  
			  
			  
			  resp.setContentType("application/json"); //MIME type
			  resp.setCharacterEncoding("UTF-8");
			  
			  PrintWriter writer = resp.getWriter();
			  
			  writer.print("["); 
			  for(int i=0; i<sklist.size(); i++) {
				  
				  writer.print("{"); 
				  //writer.printf("\"seq\":\"%s\",", hlist.get(i).getSeq());
				  writer.printf("\"typeSeq\":\"%s\",", sklist.get(i).getQuestionTypeSeq());
				  writer.printf("\"question\":\"%s\"", sklist.get(i).getQuestion().replace("\"", "'"));
				  
				  //writer.printf("\"score\":\"%d\"", hlist.get(i).getScore());
				  
				  if(i == sklist.size()-1) { 
					  writer.print("}"); 
				  } else {
					  writer.print("},\r\n"); 
				  } 
			  } 
			  writer.print("]");
			  
			  writer.close();
			  
		  }
		 
		

		

	}
}