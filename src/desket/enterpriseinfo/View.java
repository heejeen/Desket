package desket.enterpriseinfo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import desket.dto.EnterpriseInfoCommentDTO;

// View.java.java

@WebServlet("/enterpriseinfo/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String where = req.getParameter("where");
		
		String seq = req.getParameter("seq");
		
		String loginid;
		
		if (session.getAttribute("id") == null) {
			
			loginid = "";
			
		} else {
		
			loginid = session.getAttribute("id").toString();
		}
		
		
		EnterpriseinfoDAO dao = new EnterpriseinfoDAO();
		
		EnterpriseViewDTO eidto = dao.eiView(seq);
		ArrayList<EnterpriseInfoCommentDTO> eiclist = dao.eiComment(eidto.getSeq());

		req.setAttribute("eidto", eidto);
		req.setAttribute("eiclist", eiclist);
		req.setAttribute("loginid", loginid);

		
		FinanceDTO sdto = dao.finance(seq, "tblSales");
		FinanceDTO pdto = dao.finance(seq, "tblProfit");
		FinanceDTO nidto = dao.finance(seq, "tblNetIncome");
		FinanceDTO tadto = dao.finance(seq, "tblTotalAsset");
		
		float scomp = Float.parseFloat(String.format("%.2f", (sdto.getEighteenth() / sdto.getSeventeenth() - 1) * 100));
		float pcomp = Float.parseFloat(String.format("%.2f", (pdto.getEighteenth() / pdto.getSeventeenth() - 1) * 100));
		float nicomp = Float.parseFloat(String.format("%.2f", (nidto.getEighteenth() / nidto.getSeventeenth() - 1) * 100));
		float tacomp = Float.parseFloat(String.format("%.2f", (tadto.getEighteenth() / tadto.getSeventeenth() - 1) * 100));
		
		req.setAttribute("sdto", sdto);
		req.setAttribute("pdto", pdto);
		req.setAttribute("nidto", nidto);
		req.setAttribute("tadto", tadto);
		
		req.setAttribute("scomp", scomp);
		req.setAttribute("pcomp", pcomp);
		req.setAttribute("nicomp", nicomp);
		req.setAttribute("tacomp", tacomp);
		
		req.setAttribute("enterpriseinfoseq", seq);
		req.setAttribute("where", where);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/enterpriseinfo/view.jsp");
		dispatcher.forward(req, resp);

	}

}
