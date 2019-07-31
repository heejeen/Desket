package desket.question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import desket.DBUtil;
import desket.dto.HollandTestDTO;
import desket.dto.HumanityTestDTO;
import desket.dto.MBTITestDTO;
import desket.dto.SkillTestDTO;

public class adminDAO {
	
	private Connection conn;
	private PreparedStatement pstat;
	private ResultSet rs;

	public adminDAO() {
		DBUtil util = new DBUtil();
		conn = util.connect();

	}

	public ArrayList<MBTITestDTO> getMlist(HashMap<String, String> map) {
		
		try {
			
			ArrayList<MBTITestDTO> getMlist = new ArrayList<MBTITestDTO>();
			
			String sql = String.format("SELECT * FROM" + 
									"    (SELECT rownum as rnum ,a.* FROM" + 
									"        (SELECT * FROM tblMbtitest ORDER BY seq asc) a)" + 
									"            WHERE rnum BETWEEN %s AND %s"
															, map.get("begin")
															, map.get("end"));
//			System.out.println(map.get("begin"));
			

			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				
				MBTITestDTO dto = new MBTITestDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setType(rs.getString("type"));
				dto.setQuestion(rs.getString("question"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				
				getMlist.add(dto);
				
			}
			
			return getMlist;
			
		} catch (Exception e) {
			System.out.println("adminDAO.getMlist : " + e.toString());
		}
		
		return null;
	}

	public ArrayList<HollandTestDTO> getHlist() {
		
		try {

			ArrayList<HollandTestDTO> getHlist = new ArrayList<HollandTestDTO>();
			
			String sql = "SELECT * FROM tblHollandTest";

			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				
				HollandTestDTO dto = new HollandTestDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setType(rs.getString("type"));
				dto.setQuestion(rs.getString("question"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				
				getHlist.add(dto);
				
			}
			
			return getHlist;
			
		} catch (Exception e) {
			System.out.println("adminDAO.getHlist : " + e.toString());
		}
		
		return null;
	}

	public ArrayList<HumanityTestDTO> getHmlist() {
		
		try {

			ArrayList<HumanityTestDTO> getHmlist = new ArrayList<HumanityTestDTO>();
			
			String sql = "select * from tblhumanitytest ht" + 
						"    INNER JOIN tblhumanitytestchoice htc" + 
						"        ON ht.seq = htc.seq";

			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				
				HumanityTestDTO dto = new HumanityTestDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setQuestionTypeSeq(rs.getString("questionTypeSeq"));
				dto.setQuestion(rs.getString("question"));
				dto.setPic(rs.getString("pic"));
				dto.setAnswer(rs.getString("answer"));
				dto.setOne(rs.getString("one"));
				dto.setTwo(rs.getString("two"));
				dto.setThree(rs.getString("three"));
				dto.setFour(rs.getString("four"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				
				getHmlist.add(dto);
				
			}
			
			return getHmlist;
			
		} catch (Exception e) {
			System.out.println("adminDAO.getHmlist : " + e.toString());
		}
		
		return null;
	}

	public ArrayList<SkillTestDTO> getSlist() {
		
		try {

			ArrayList<SkillTestDTO> getSlist = new ArrayList<SkillTestDTO>();
			
			String sql = "SELECT * FROM tblSkillTest";

			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				
				SkillTestDTO dto = new SkillTestDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setQuestionTypeSeq(rs.getString("questionTypeSeq"));
				dto.setQuestion(rs.getString("question"));
				dto.setAnswer(rs.getString("answer"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				
				getSlist.add(dto);
				
			}
			
			return getSlist;
			
		} catch (Exception e) {
			System.out.println("adminDAO.getSlist : " + e.toString());
		}
		
		return null;
	}
	
	//페이징을 위한 DAO
	public int getTotalCount() {
		
		try {
			
			String sql = "SELECT count(*) as cnt FROM tblMbtiTest";
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println("BoardDAO.getTotalCount : " + e.toString());
		}
		
		return 0;
	}
	
}
