package desket.mypage.enterprise;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/enterprise/evaluationok.do")
public class EvaluationOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//EvaluationOk.java
		
		int result = 0;
		
		//1. 데이터 가져오기 
		String seq = req.getParameter("seq");
		
		String fmsize = req.getParameter("fmsize");
		String fhsize = req.getParameter("fhsize");
		String fhmsize = req.getParameter("fhmsize");
		String fssize = req.getParameter("fssize");
		
		EnterpriseDAO dao = new EnterpriseDAO();
		
		System.out.println(fmsize);
		
		//fm
		ArrayList<String> fmevQlist = new ArrayList<String>();
		ArrayList<String> fmevAlist = new ArrayList<String>();
		
		//fh
		ArrayList<String> fhevQlist = new ArrayList<String>();
		ArrayList<String> fhevAlist = new ArrayList<String>();
		
		//fhm
		ArrayList<String> fhmevQlist = new ArrayList<String>();
		ArrayList<String> fhmevAlist = new ArrayList<String>();
		
		//fs
		ArrayList<String> fsevQlist = new ArrayList<String>();
		ArrayList<String> fsevAlist = new ArrayList<String>();
		
		
		String evaluation = "";
		String mtSeq = "";
		String htSeq = "";
		String hutSeq = "";
		String stSeq = "";
		//String evSuccess = "";
		
		for (int i=0; i<Integer.parseInt(fmsize); i++) {
			evaluation = req.getParameter("fmevaluation" + (i + 1));
			mtSeq = req.getParameter("mtSeq" + (i + 1));
			
			fmevQlist.add(evaluation);
			fmevAlist.add(mtSeq);
			
			if (fmevQlist.get(i).equals("y")) {
				result = dao.fmevAupdate(fmevAlist.get(i));
				//evSuccess = "fin";
				if (result == 0) {
					//evSuccess = "no";
					break;
				}
			} else if (fmevQlist.get(i).equals("n")){
				//evSuccess = "fin";
				result = 1;
			}
			
		}//fmsize
		
		for (int i=0; i<Integer.parseInt(fhsize); i++) {
			evaluation = req.getParameter("fhevaluation" + (i + 1));
			htSeq = req.getParameter("htSeq" + (i + 1));
			
			fhevQlist.add(evaluation);
			fhevAlist.add(htSeq);
			
			if (fhevQlist.get(i).equals("y")) {
				result = dao.fhevAupdate(fhevAlist.get(i));
				//evSuccess = "fin";
				if (result == 0) {
					//evSuccess = "no";
					break;
				}
			} else if (fhevQlist.get(i).equals("n")){
				//evSuccess = "fin";
				result = 1;
			}
			
		}//fhsize
		
		for (int i=0; i<Integer.parseInt(fhmsize); i++) {
			evaluation = req.getParameter("fhmevaluation" + (i + 1));
			hutSeq = req.getParameter("hutSeq" + (i + 1));
			
			fhmevQlist.add(evaluation);
			fhmevAlist.add(hutSeq);
			
			if (fhmevQlist.get(i).equals("y")) {
				result = dao.fhmevAupdate(fhmevAlist.get(i));
				//evSuccess = "fin";
				if (result == 0) {
					//evSuccess = "no";
					break;
				}
			} else if (fhmevQlist.get(i).equals("n")){
				//evSuccess = "fin";
				result = 1;
			}
			
		}//fhmsize
		
		for (int i=0; i<Integer.parseInt(fssize); i++) {
			evaluation = req.getParameter("fsevaluation" + (i + 1));
			stSeq = req.getParameter("stSeq" + (i + 1));
			
			fsevQlist.add(evaluation);
			fsevAlist.add(stSeq);
			
			if (fsevQlist.get(i).equals("y")) {
				result = dao.fsevAupdate(fsevAlist.get(i));
				//evSuccess = "fin";
				if (result == 0) {
					//evSuccess = "no";
					break;
				}
			} else if (fsevQlist.get(i).equals("n")){
				//evSuccess = "fin";
				result = 1;
			}
			
		}//fssize
		
		if (result == 1) {
			dao.fStatusUpdate(seq);
		}
		
		
		req.setAttribute("result", result);
		req.setAttribute("seq", seq);
		//req.setAttribute("evSuccess", evSuccess);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/enterprise/evaluationok.jsp");
		dispatcher.forward(req, resp);

	}

}
