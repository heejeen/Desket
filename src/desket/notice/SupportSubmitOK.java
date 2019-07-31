package desket.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/notice/supportsubmitok.do")
public class SupportSubmitOK extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		if(req.getParameter("processNum").equals("0")) {
			//MBTI
			int mOXCNum = Integer.parseInt(req.getParameter("mOXCNum"));
			int mCNum = Integer.parseInt(req.getParameter("mCNum"));
			
			ArrayList<String> mblist = new ArrayList<String>();
			String mOXChoice = "";
			String mChoice = "";
			
			for(int i=1; i<=mOXCNum; i++) {
				mOXChoice = req.getParameter("mOXChoice" + i);
				mChoice = req.getParameter("mChoice" + i);
				if(mOXChoice != null) {
	//				System.out.print(i + "ox : ");
	//				System.out.println(mOXChoice);
					mblist.add(mOXChoice);
				} 
				if(mChoice != null) {
	//				System.out.print(i + " : ");
	//				System.out.println(mChoice);
					mblist.add(mChoice);
				}
				
			}
			
	//		for(int i=1; i<mblist.size(); i++) {
	//			System.out.println(mblist.get(i));
	//			
	//		}
	//		System.out.println(mblist.size());
			
			
			
			NoticeDAO dao = new NoticeDAO();
			HttpSession session = req.getSession();
			String id = (String)session.getAttribute("id");
			
			//사전작업 1. 지원한 공고의 시험지번호 가져오기  ex)1 ~ 40 
			String advertisementNum = req.getParameter("advertisementNum");
			//String advertisementNum = "1";  								//임의의 공고번호   > 후에 req나 session으로 받아오기
			
			MBTITestPaperSeqDTO MBTITestPaperSeq = dao.getMBTITestPaperSeq(advertisementNum);
			
			//사전작업 1. 지원자(나)의 이력서번호 가져오기  (가장 최근에 등록된 이력서 번호)
			String resumeSeq = dao.getResumeSeq(id);
			
			System.out.println(id);
			System.out.println("----------2--------" + resumeSeq);
			
			
			
			//MBTI 검사 결과 추가
			int result = dao.addMBTIAnswer(MBTITestPaperSeq, resumeSeq, mblist);
			
			System.out.println("MBTI 결과 추가 되었나?? : " + result);
		}
		
		
		
		
		
		
		
		if(req.getParameter("processNum").equals("1")) {
			//Holland 
			int hoNum = Integer.parseInt(req.getParameter("hoNum"));
			
			ArrayList<String> holist = new ArrayList<String>();
			String hOXChoice = "";
			
			for(int i=1; i<=hoNum; i++) {
				hOXChoice = req.getParameter("hOXChoice" + i);
				if(hOXChoice != null) {
	//				System.out.print(i + "ox : ");
	//				System.out.println(mOXChoice);
					holist.add(hOXChoice);
				} 
			}
			
	//		for(int i=1; i<mblist.size(); i++) {
	//			System.out.println(mblist.get(i));
	//			
	//		}
	//		System.out.println(mblist.size());
			
			
			NoticeDAO dao = new NoticeDAO();
			HttpSession session = req.getSession();
			String id = (String)session.getAttribute("id");
			
			//사전작업 1. 지원한 공고의 시험지번호 가져오기  ex)1 ~ 40 
			String advertisementNum = req.getParameter("advertisementNum");
			//String advertisementNum = "1";  								//임의의 공고번호   > 후에 req나 session으로 받아오기
			
			HollandTestPaperSeqDTO hollandTestPaperSeq = dao.getHollandTestPaperSeq(advertisementNum);
			
			//사전작업 1. 지원자(나)의 이력서번호 가져오기  (가장 최근에 등록된 이력서 번호)
			String resumeSeq = dao.getResumeSeq(id);
			
			
			
			
			
			//Holland 검사 결과 추가
			int result = dao.addHollandAnswer(hollandTestPaperSeq, resumeSeq, holist);
			
			System.out.println("Holland 결과 추가 되었나?? : " + result);
		}
		
		
		
		
		
		
		
		if(req.getParameter("processNum").equals("2")) {
			//인적성 
			int huNum = Integer.parseInt(req.getParameter("huNum"));
			
			ArrayList<String> hulist = new ArrayList<String>();
			String huChoice = "";
			
			for(int i=1; i<=huNum; i++) {
				for(int j=1; j<=4; j++) {
					if(req.getParameter("huChoice" + j) != null) {
						huChoice = req.getParameter("huChoice" + j);
					}
				}
				
				if(huChoice != null) {
					//				System.out.print(i + "ox : ");
					//				System.out.println(mOXChoice);
					hulist.add(huChoice);
				} 
			}
			
			//		for(int i=1; i<mblist.size(); i++) {
			//			System.out.println(mblist.get(i));
			//			
			//		}
			//		System.out.println(mblist.size());
			
			
			NoticeDAO dao = new NoticeDAO();
			HttpSession session = req.getSession();
			String id = (String)session.getAttribute("id");
			
			//사전작업 1. 지원한 공고의 시험지번호 가져오기  ex)1 ~ 40 
			String advertisementNum = req.getParameter("advertisementNum");
			//String advertisementNum = "1";  								//임의의 공고번호   > 후에 req나 session으로 받아오기
			
			HumanityTestPaperSeqDTO humanityTestPaperSeq = dao.getHumanityTestPaperSeq(advertisementNum);
			
			//사전작업 1. 지원자(나)의 이력서번호 가져오기  (가장 최근에 등록된 이력서 번호)
			String resumeSeq = dao.getResumeSeq(id);
			
			
			
			
			
			
			
			//Holland 검사 결과 추가
			int result = dao.addHumanityAnswer(humanityTestPaperSeq, resumeSeq, hulist);
			
			System.out.println("인적성 결과 추가 되었나?? : " + result);
		}
		
		
		
		
		
		
		
		if(req.getParameter("processNum").equals("3")) {
			//기술 
			int skNum = Integer.parseInt(req.getParameter("skNum"));
			
			ArrayList<String> sklist = new ArrayList<String>();
			String skAnswer = "";
			
			for(int i=1; i<=skNum; i++) {
				skAnswer = req.getParameter("skAnswer" + i);
				if(skAnswer != null) {
					System.out.print(i + "skAnswer : ");
					System.out.println(skAnswer);
					sklist.add(skAnswer);
				} 
			}
			
			//		for(int i=1; i<mblist.size(); i++) {
			//			System.out.println(mblist.get(i));
			//			
			//		}
			//		System.out.println(mblist.size());
			
			
			NoticeDAO dao = new NoticeDAO();
			HttpSession session = req.getSession();
			String id = (String)session.getAttribute("id");
			
			//사전작업 1. 지원한 공고의 시험지번호 가져오기  ex)1 ~ 40 
			String advertisementNum = req.getParameter("advertisementNum");
			//String advertisementNum = "1";  								//임의의 공고번호   > 후에 req나 session으로 받아오기
			
			SkillTestPaperSeqDTO skillTestPaperSeq = dao.getSkillTestPaperSeq(advertisementNum);
			
			//사전작업 1. 지원자(나)의 이력서번호 가져오기  (가장 최근에 등록된 이력서 번호)
			String resumeSeq = dao.getResumeSeq(id);
			
			
			
			
			
			//Holland 검사 결과 추가
			int result = dao.addSkillAnswer(skillTestPaperSeq, resumeSeq, sklist);
			
			System.out.println("기술 결과 추가 되었나?? : " + result);
		}
		
	}
}

