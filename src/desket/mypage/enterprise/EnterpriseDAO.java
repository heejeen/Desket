package desket.mypage.enterprise;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import desket.DBUtil;
import desket.dto.HollandTestDTO;
import desket.dto.HumanityTestDTO;
import desket.dto.JobAdvertisementDTO;
import desket.dto.MBTITestDTO;
import desket.dto.SkillTestDTO;

public class EnterpriseDAO {

	private Connection conn;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public EnterpriseDAO() {
		DBUtil util = new DBUtil();
		conn = util.connect();
	}
	
//------------------------------------------------------------------------------------------------------------------------------------------------------------
//	여기부터 진짜 피드백 DAO 구현. 위에껀 약식(참고자료) -- 제거
	
	public ArrayList<FeedbackMBTIDTO> fmlist(String seq) {
		
		try {
			
			ArrayList<FeedbackMBTIDTO> fmlist = new ArrayList<FeedbackMBTIDTO>();
			
			String sql = "SELECT " + 
					"    ja.seq," + 
					"    mt.seq as mtSeq," + 
					"    mt.type, " + 
					"    m.ei, " + 
					"    m.sn, " + 
					"    m.tf, " + 
					"    m.jp, " + 
					"    mt.question, " + 
					"    mt.compliancerate, " + 
					"    (SELECT round(avg(compliancerate), 1) FROM tbljobadvertisement ja " + 
					"        INNER JOIN tblmbtitestpaper mp ON ja.seq = mp.jobadvertisementseq " + 
					"            INNER JOIN tblMbtitest mt ON mp.mbtitestseq = mt.seq WHERE ja.seq=?) as allcompliancerate, " + 
					"    mt.score, " + 
					"    mt.confidence, " + 
					"    pr.passrate " + 
					"    FROM tbljobadvertisement ja " + 
					"        INNER JOIN tblMbtitestpaper mp " + 
					"            ON ja.seq = mp.jobadvertisementseq " + 
					"                INNER JOIN tblMbtitest mt " + 
					"                    ON mp.mbtitestseq = mt.seq " + 
					"                        INNER JOIN tblmbtitype m " + 
					"                            ON m.seq = ja.mbtitypeseq " + 
					"                                INNER JOIN tblPassRate pr " + 
					"                                    ON pr.jobadvertisementseq = ja.seq " + 
					"                                        WHERE ja.seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.setString(2, seq);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				FeedbackMBTIDTO dto = new FeedbackMBTIDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setMtSeq(rs.getString("mtSeq"));
				dto.setType(rs.getString("type"));
				dto.setEi(rs.getString("ei"));
				dto.setSn(rs.getString("sn"));
				dto.setTf(rs.getString("tf"));
				dto.setJp(rs.getString("jp"));
				dto.setQuestion(rs.getString("question"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				dto.setPassRate(rs.getInt("passRate"));
				dto.setComplianceRate(rs.getInt("complianceRate"));
				dto.setAllComplianceRate(rs.getInt("allComplianceRate"));
				
				fmlist.add(dto);
			}
			
			
			return fmlist;

		} catch (Exception e) {
			System.out.println("enterpriseDAO.fmlist : " + e.toString());
		}
		
		return null;
	} // MBTI 문제 피드백
	
	public ArrayList<FeedbackHollandDTO> fhlist(String seq) {
		
		try {
			
			ArrayList<FeedbackHollandDTO> fhlist = new ArrayList<FeedbackHollandDTO>();
			
			String sql = "SELECT  " + 
					"    ja.seq, " + 
					"    ht.seq as htSeq, " + 
					"    ht.type, " + 
					"    ja.Holland, " + 
					"    ht.question, " + 
					"    ht.compliancerate, " + 
					"    (SELECT round(avg(compliancerate), 1) FROM tbljobadvertisement ja " + 
					"        INNER JOIN tblhollandtestpaper hp ON ja.seq = hp.jobadvertisementseq " + 
					"            INNER JOIN tblHollandtest ht ON hp.hollandtestseq = ht.seq WHERE ja.seq=?) as allcompliancerate, " + 
					"    ht.score, " + 
					"    ht.confidence, " + 
					"    pr.passrate " + 
					"    FROM tbljobadvertisement ja " + 
					"        INNER JOIN tblHollandtestpaper hp " + 
					"            ON ja.seq = hp.jobadvertisementseq " + 
					"                INNER JOIN tblHollandtest ht " + 
					"                    ON hp.hollandtestseq = ht.seq " + 
					"                        INNER JOIN tblPassRate pr " + 
					"                            ON pr.jobadvertisementseq = ja.seq " + 
					"                                WHERE ja.seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.setString(2, seq);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				FeedbackHollandDTO dto = new FeedbackHollandDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setHtSeq(rs.getString("htSeq"));
				dto.setType(rs.getString("type"));
				dto.setHolland(rs.getString("holland"));
				dto.setQuestion(rs.getString("question"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				dto.setPassRate(rs.getInt("passRate"));
				dto.setComplianceRate(rs.getInt("complianceRate"));
				dto.setAllComplianceRate(rs.getInt("allComplianceRate"));
				
				fhlist.add(dto);
				
			}
			
			
			return fhlist;

		} catch (Exception e) {
			System.out.println("enterpriseDAO.fhlist : " + e.toString());
		}
		
		return null;
	} //홀랜드 문제피드백
	

	public ArrayList<FeedbackHumanityDTO> fhmlist(String seq) {
		
		try {
			ArrayList<FeedbackHumanityDTO> fhmlist = new ArrayList<FeedbackHumanityDTO>();
			
			String sql = "SELECT  " + 
					"    ja.seq, " + 
					"    ht.seq as hutSeq, " + 
					"    ht.questiontypeseq, " + 
					"    ja.humanitycutline, " + 
					"    ht.question, " + 
					"    htc.one, " + 
					"    htc.two, " + 
					"    htc.three, " + 
					"    htc.four, " + 
					"    ht.pic, " + 
					"    ht.answer, " + 
					"    ht.answerRate, " + 
					"    (SELECT round(avg(answerrate), 1) FROM tbljobadvertisement ja " + 
					"        INNER JOIN tblhumanitytestpaper hp ON ja.seq = hp.jobadvertisementseq " + 
					"            INNER JOIN tblhumanitytest ht ON hp.humanitytestseq = ht.seq WHERE ja.seq=?) as allanswerrate, " + 
					"    ht.score, " + 
					"    ht.confidence, " + 
					"    pr.passrate " + 
					"    FROM tbljobadvertisement ja " + 
					"        INNER JOIN tblhumanitytestpaper hp " + 
					"            ON ja.seq = hp.jobadvertisementseq " + 
					"                INNER JOIN tblhumanitytest ht " + 
					"                    ON hp.humanitytestseq = ht.seq " + 
					"                        INNER JOIN tblhumanitytestchoice htc " + 
					"                            ON htc.seq = ht.seq      " + 
					"                                INNER JOIN tblPassRate pr " + 
					"                                    ON pr.jobadvertisementseq = ja.seq " + 
					"                                        WHERE ja.seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.setString(2, seq);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				FeedbackHumanityDTO dto = new FeedbackHumanityDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setHutSeq(rs.getString("hutSeq"));
				dto.setQuestionTypeSeq(rs.getString("questionTypeSeq"));
				dto.setHumanityCutline(rs.getString("humanityCutline"));
				dto.setQuestion(rs.getString("question"));
				dto.setOne(rs.getString("one"));
				dto.setTwo(rs.getString("two"));
				dto.setThree(rs.getString("three"));
				dto.setFour(rs.getString("four"));
				dto.setPic(rs.getString("pic"));
				dto.setAnswer(rs.getString("answer"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				dto.setPassRate(rs.getInt("passRate"));
				dto.setAnswerRate(rs.getInt("answerRate"));
				dto.setAllAnswerRate(rs.getInt("allAnswerRate"));
				
				fhmlist.add(dto);
			}
			
			
			return fhmlist;
			
		} catch (Exception e) {
			System.out.println("enterpriseDAO.fhmlist : " + e.toString());
		}
		
		return null;
	} // 인적성 문제

	public ArrayList<FeedbackSkillDTO> fslist(String seq) {
		
		try {
			ArrayList<FeedbackSkillDTO> fslist = new ArrayList<FeedbackSkillDTO>();
			
			String sql = "SELECT  " + 
					"    ja.seq, " + 
					"    st.seq as stSeq, " + 
					"    st.questiontypeseq, " + 
					"    ja.technicalcutline, " + 
					"    st.question, " + 
					"    st.answer, " + 
					"    st.answerRate, " + 
					"    (SELECT round(avg(answerrate), 1) FROM tbljobadvertisement ja " + 
					"        INNER JOIN tblskilltestpaper sp ON ja.seq = sp.jobadvertisementseq " + 
					"            INNER JOIN tblskilltest st ON sp.skilltestseq = st.seq WHERE ja.seq=?) as allanswerrate, " + 
					"    st.score, " + 
					"    st.confidence, " + 
					"    pr.passrate     " + 
					"FROM tbljobadvertisement ja " + 
					"    INNER JOIN tblskilltestpaper sp " + 
					"        ON ja.seq = sp.jobadvertisementseq " + 
					"            INNER JOIN tblskilltest st " + 
					"                ON sp.skilltestseq = st.seq " + 
					"                    INNER JOIN tblPassRate pr " + 
					"                        ON pr.jobadvertisementseq = ja.seq " + 
					"                            WHERE ja.seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.setString(2, seq);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				FeedbackSkillDTO dto = new FeedbackSkillDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setStSeq(rs.getString("stSeq"));
				dto.setQuestionTypeSeq(rs.getString("questionTypeSeq"));
				dto.setTechnicalCutline(rs.getString("technicalCutline"));
				dto.setQuestion(rs.getString("question"));
				dto.setAnswer(rs.getString("answer"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				dto.setPassRate(rs.getInt("passRate"));
				dto.setAnswerRate(rs.getInt("answerRate"));
				dto.setAllAnswerRate(rs.getInt("allAnswerRate"));
				
				fslist.add(dto);
			}
			
			
			return fslist;
			
		} catch (Exception e) {
			System.out.println("enterpriseDAO.fslist : " + e.toString());
		}
		
		return null;
	} // 기술문제

	public int fmUpdate(String seq) {
		
		try {
			
			//MBTI 10개의 문제의 신뢰도를 자동으로 수정한다. > result 성공시 10
			String sql = "UPDATE tblMbtiTest SET confidence = confidence - 1" + 
						"    WHERE seq IN (SELECT seq FROM tblmbtitest where seq IN (SELECT mtSeq FROM" + 
						"        (SELECT * FROM vwFeedbackMBTI WHERE seq = ? ORDER BY compliancerate asc) WHERE rownum <= 10))";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			int p = pstat.executeUpdate();
			
			//MBTI 10개의 문제의 신뢰도를 자동으로 수정한다. > result 성공시 10
			String sql2 = "UPDATE tblmbtitest SET confidence = confidence + 1" + 
						"    WHERE seq IN (SELECT seq FROM tblmbtitest where seq IN (SELECT mtSeq FROM" + 
						"        (SELECT * FROM vwFeedbackMBTI WHERE seq = ? ORDER BY complianceRate desc) WHERE rownum <= 10))";
			
			pstat = conn.prepareStatement(sql2);
			pstat.setString(1, seq);
			
			int p2 = pstat.executeUpdate();
			
			return p + p2; // 20
			
		} catch (Exception e) {
			System.out.println("enterpriseDAO.fmUpdateList : " + e.toString());
		}
		
		return 0;
	}//MBTI 피드백 신뢰도 업데이트
	
	public int fhUpdate(String seq) {
		
		try {
			
			//홀랜드 15개의 문제의 신뢰도를 자동으로 수정한다 > result2 성공시 15
			String sql = "UPDATE tblHollandTest SET confidence = confidence - 1" + 
						"    WHERE seq IN (SELECT seq FROM tblmbtitest where seq IN (SELECT htSeq FROM" + 
						"        (SELECT * FROM vwFeedbackHolland WHERE seq = ? ORDER BY compliancerate asc) WHERE rownum <= 15))";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			int p = pstat.executeUpdate();
			
			//홀랜드 15개의 문제의 신뢰도를 자동으로 수정한다 > result2 성공시 15
			String sql2 = "UPDATE tblHollandTest SET confidence = confidence + 1" + 
						"    WHERE seq IN (SELECT seq FROM tblHollandTest where seq IN (SELECT htSeq FROM" + 
						"        (SELECT * FROM vwFeedbackHolland WHERE seq = ? ORDER BY complianceRate desc) WHERE rownum <= 15))";
			
			pstat = conn.prepareStatement(sql2);
			pstat.setString(1, seq);
			
			int p2 = pstat.executeUpdate();
			
			return p + p2; //30
			
		} catch (Exception e) {
			System.out.println("enterpriseDAO.fhupdatelist : " + e.toString());
		}
		
		return 0;
	}//홀랜드 피드백 신뢰도 업데이트
	
	
	public int fhmUpdate(String seq) {
		
		try {
			
			//인적성 3개의 문제의 신뢰도를 자동으로 수정한다 > result3 성공시 3
			String sql = "UPDATE tblhumanitytest SET confidence = confidence - 1 " + 
						"    WHERE seq IN (SELECT seq FROM tblhumanitytest where seq IN (SELECT hutSeq FROM" + 
						"        (SELECT * FROM vwFeedbackHumanity WHERE seq = ? ORDER BY answerRate desc) WHERE rownum <= 3))";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			int p = pstat.executeUpdate();
			
			//인적성 3개의 문제의 신뢰도를 자동으로 수정한다 > result3 성공시 3
			String sql2 = "UPDATE tblhumanitytest SET confidence = confidence + 1" + 
						"    WHERE seq IN (SELECT seq FROM tblhumanitytest where seq IN (SELECT hutSeq FROM" + 
						"        (SELECT * FROM vwFeedbackHumanity WHERE seq = ? ORDER BY answerRate asc) WHERE rownum <= 3))";

			pstat = conn.prepareStatement(sql2);
			pstat.setString(1, seq);
			
			int p2 = pstat.executeUpdate();
			
			return p + p2; //6
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fhmUpdate : " + e.toString());
		}
		
		return 0;
	}//인적성 피드백 신뢰도 업데이트
	
	
	public int fsUpdate(String seq) {
		
		try {
			
			//기술 4개의 문제의 신뢰도를 자동으로 수정한다. > result4 성공시 4
			String sql = "UPDATE tblSkillTest SET confidence = confidence - 1" + 
						"    WHERE seq IN (SELECT seq FROM tblSkillTest where seq IN (SELECT stSeq FROM" + 
						"        (SELECT * FROM vwfeedbackskill WHERE seq = ? ORDER BY answerRate desc) WHERE rownum <= 4))";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			int p = pstat.executeUpdate();
			
			//기술 4개의 문제의 신뢰도를 자동으로 수정한다. > result4 성공시 4
			String sql2 = "UPDATE tblSkillTest SET confidence = confidence + 1" + 
						"    WHERE seq IN (SELECT seq FROM tblSkillTest where seq IN (SELECT stSeq FROM" + 
						"        (SELECT * FROM vwfeedbackskill WHERE seq = ? ORDER BY answerRate asc) WHERE rownum <= 4))";
		
			pstat = conn.prepareStatement(sql2);
			pstat.setString(1, seq);
			
			int p2 = pstat.executeUpdate();
			
			return p+p2; //result4에 8을 반환한다.
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fsUpdate : " + e.toString());
		}
		
		return 0;
	}// 기술 피드백 신뢰도 업데이트
	
	
	public ArrayList<FeedbackMBTIDTO> fmUpdateList(String seq) {
		
		try {
			
			ArrayList<FeedbackMBTIDTO> fmUpdateList = new ArrayList<FeedbackMBTIDTO>();
			
			String sql = "SELECT * FROM" + 
						"    (SELECT * FROM vwFeedbackMBTI where seq = ? order by confidence desc) WHERE rownum <= 30";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				FeedbackMBTIDTO dto = new FeedbackMBTIDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setMtSeq(rs.getString("mtSeq"));
				dto.setType(rs.getString("type"));
				dto.setEi(rs.getString("ei"));
				dto.setSn(rs.getString("sn"));
				dto.setTf(rs.getString("tf"));
				dto.setJp(rs.getString("jp"));
				dto.setQuestion(rs.getString("question"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				dto.setPassRate(rs.getInt("passRate"));
				dto.setComplianceRate(rs.getInt("complianceRate"));
				dto.setAllComplianceRate(rs.getInt("allComplianceRate"));
				
				fmUpdateList.add(dto);
				
			}
			
			return fmUpdateList;
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fmUpdateList : " + e.toString());
		}
		
		return null;
	}//MBTI 기존 리스트

	public ArrayList<MBTITestDTO> fmNewList(String seq) {
		
		try {

			ArrayList<MBTITestDTO> fmNewList = new ArrayList<MBTITestDTO>();
			
			String sql = "SELECT * FROM" + 
						"    (SELECT * FROM tblmbtitest order by confidence desc) where rownum <= 10";
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				MBTITestDTO dto = new MBTITestDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setType(rs.getString("type"));
				dto.setQuestion(rs.getString("question"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				
				fmNewList.add(dto);
				
			}
			
			return fmNewList;
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fmNewList : " + e.toString());
		}
		
		return null;
	}// MBTI 새로운 질문리스트

	public ArrayList<FeedbackHollandDTO> fhUpdateList(String seq) {
		
		try {
			
			//홀랜드 문제의 기존 45개의 문제를 가져온다.
			ArrayList<FeedbackHollandDTO> fhUpdateList = new ArrayList<FeedbackHollandDTO>();
			
			String sql = "SELECT * FROM" + 
						"    (SELECT * FROM vwFeedbackHolland where seq = ? order by confidence desc) WHERE rownum <= 45";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				FeedbackHollandDTO dto = new FeedbackHollandDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setHtSeq(rs.getString("htSeq"));
				dto.setType(rs.getString("type"));
				dto.setHolland(rs.getString("holland"));
				dto.setQuestion(rs.getString("question"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				dto.setPassRate(rs.getInt("passRate"));
				dto.setComplianceRate(rs.getInt("complianceRate"));
				dto.setAllComplianceRate(rs.getInt("allComplianceRate"));
				
				fhUpdateList.add(dto);
				
			}
			
			return fhUpdateList;
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fhUpdateList : " + e.toString());
		}
		
		return null;
	}

	public ArrayList<HollandTestDTO> fhNewList(String seq) {
		
		try {

			ArrayList<HollandTestDTO> fhNewList = new ArrayList<HollandTestDTO>();
			
			String sql = "SELECT * FROM" + 
						"    (SELECT * FROM tblHollandTest order by confidence desc) where rownum <= 15";
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				HollandTestDTO dto = new HollandTestDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setType(rs.getString("type"));
				dto.setQuestion(rs.getString("question"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				
				fhNewList.add(dto);
				
			}
			
			return fhNewList;
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fmNewList : " + e.toString());
		}
		
		return null;
	}//홀랜드 새로운 질문리스트

	public ArrayList<FeedbackHumanityDTO> fhmUpdateList(String seq) {
		
		try {
			
			ArrayList<FeedbackHumanityDTO> fhmUpdateList = new ArrayList<FeedbackHumanityDTO>();
			
			//인적성 기존문제 7개를 가져온다.
			String sql = "SELECT * FROM" + 
						"    (SELECT * FROM vwFeedbackHumanity where seq = ? order by confidence desc) WHERE rownum <= 7";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				FeedbackHumanityDTO dto = new FeedbackHumanityDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setHutSeq(rs.getString("hutSeq"));
				dto.setQuestionTypeSeq(rs.getString("questionTypeSeq"));
				dto.setHumanityCutline(rs.getString("humanityCutline"));
				dto.setQuestion(rs.getString("question"));
				dto.setOne(rs.getString("one"));
				dto.setTwo(rs.getString("two"));
				dto.setThree(rs.getString("three"));
				dto.setFour(rs.getString("four"));
				dto.setPic(rs.getString("pic"));
				dto.setAnswer(rs.getString("answer"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				dto.setPassRate(rs.getInt("passRate"));
				dto.setAnswerRate(rs.getInt("answerRate"));
				dto.setAllAnswerRate(rs.getInt("allAnswerRate"));
				
				fhmUpdateList.add(dto);
				
			}
			
			return fhmUpdateList;
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fhmUpdateList : " + e.toString());
		}
		
		return null;
	}

	public ArrayList<HumanityTestDTO> fhmNewList(String seq) {
		
		try {
			
			ArrayList<HumanityTestDTO> fhmNewList = new ArrayList<HumanityTestDTO>();
			
			String sql = "SELECT * FROM" + 
						"    (SELECT * FROM tblhumanitytest ht" + 
						"        INNER JOIN tblhumanitytestchoice htc" + 
						"            ON ht.seq = htc.seq" + 
						"                order by confidence desc) WHERE rownum <= 3";
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				HumanityTestDTO dto = new HumanityTestDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setQuestionTypeSeq(rs.getString("questionTypeSeq"));
				dto.setQuestion(rs.getString("question"));
				dto.setOne(rs.getString("one"));
				dto.setTwo(rs.getString("two"));
				dto.setThree(rs.getString("three"));
				dto.setFour(rs.getString("four"));
				dto.setPic(rs.getString("pic"));
				dto.setAnswer(rs.getString("answer"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				
				fhmNewList.add(dto);
			}
			
			return fhmNewList;

		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fhmNewList : " + e.toString());
		}
		
		return null;
	}

	public ArrayList<FeedbackSkillDTO> fsUpdateList(String seq) {
		
		try {
			
			ArrayList<FeedbackSkillDTO> fsUpdateList = new ArrayList<FeedbackSkillDTO>();
			
			//기술 기존문제 11개를 가져온다.
			String sql = "SELECT * FROM" + 
						"    (SELECT * FROM vwfeedbackskill where seq = ? order by confidence desc) WHERE rownum <= 11";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				FeedbackSkillDTO dto = new FeedbackSkillDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setStSeq(rs.getString("stSeq"));
				dto.setQuestionTypeSeq(rs.getString("questionTypeSeq"));
				dto.setTechnicalCutline(rs.getString("technicalCutline"));
				dto.setQuestion(rs.getString("question"));
				dto.setAnswer(rs.getString("answer"));
				dto.setScore(rs.getInt("score"));
				dto.setConfidence(rs.getInt("confidence"));
				dto.setPassRate(rs.getInt("passRate"));
				dto.setAnswerRate(rs.getInt("answerRate"));
				dto.setAllAnswerRate(rs.getInt("allAnswerRate"));
				
				fsUpdateList.add(dto);
				
			}
			
			return fsUpdateList;
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fsUpdateList : " + e.toString());
		}
		
		return null;
	}

	public ArrayList<SkillTestDTO> fsNewList(String seq) {

		try {
			
			ArrayList<SkillTestDTO> fsNewList = new ArrayList<SkillTestDTO>();
			
			String sql = "SELECT * FROM" + 
						"    (SELECT * FROM tblSkillTest order by confidence desc) where rownum <= 4";
			
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
				
				fsNewList.add(dto);
			}
			
			return fsNewList;

		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fsNewList : " + e.toString());
		}
		
		return null;
	}
	
	
	public int fmevAupdate(String string) {
		
		try {

			String sql = "UPDATE tblMbtiTest SET confidence = confidence + 1 WHERE seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, string);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fmevAupdate : " + e.toString());
		}
		
		return 0;
		
	}//MBTI 피드백에서 평가받은 문제 1개를 신뢰도 업데이트를 해준다.

	public int fhevAupdate(String string) {
		
		try {

			String sql = "UPDATE tblHollandTest SET confidence = confidence + 1 WHERE seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, string);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fmevAupdate : " + e.toString());
		}
		
		return 0;
	}//홀랜드 피드백에서 평가받은 문제 1개를 신뢰도 업데이트를 해준다.

	public int fhmevAupdate(String string) {
		
		try {

			String sql = "UPDATE tblHumanityTest SET confidence = confidence + 1 WHERE seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, string);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fmevAupdate : " + e.toString());
		}
		
		return 0;
	}//인적성 피드백에서 평가받은 문제 1개를 신뢰도 업데이트를 해준다.

	public int fsevAupdate(String string) {
		
		try {

			String sql = "UPDATE tblSkillTest SET confidence = confidence + 1 WHERE seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, string);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fmevAupdate : " + e.toString());
		}
		
		return 0;
	}//기술 피드백에서 평가받은 문제 1개를 신뢰도 업데이트를 해준다.
	
	

//	============================================================================= 피드백선
	
	
	public ArrayList<JobAdvertisementDTO> jobList(String id) {
		
		try {
			
			String sql = "SELECT seq, id, title, (regdate ||' ~ '|| deadline) as regdate, storageStatus FROM tbljobadvertisement where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			ArrayList<JobAdvertisementDTO> jobList = new ArrayList<JobAdvertisementDTO>();
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				JobAdvertisementDTO dto = new JobAdvertisementDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setStorageStatus(rs.getString("storageStatus"));
				
				jobList.add(dto);
			}
			
			return jobList;
			
		} catch (Exception e) {
			System.out.println("enterpriseDAO.fhupdatelist : " + e.toString());
		}
		
		return null;
	}

	public JobAdvertisementDTO get(String seq) {
		
		try {

			JobAdvertisementDTO dto = new JobAdvertisementDTO();
			
			String sql = "select ja.*, l.language as requiredLanguage,mt.ei || mt.sn || mt.tf || mt.jp as mbti" + 
						"    from tbljobadvertisement ja" + 
						"        INNER JOIN tblmbtitype mt" + 
						"            ON ja.mbtitypeseq = mt.seq" + 
						"                INNER JOIN tblrequiredlanguage rl" + 
						"                    ON ja.seq = rl.jobadvertisementseq" + 
						"                        INNER JOIN tblLanguage l" + 
						"                            ON l.seq = rl.langaugeseq" + 
						"                                WHERE ja.seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setMbti(rs.getString("mbti"));
				dto.setHolland(rs.getString("holland"));
				dto.setTechnicalCutline(rs.getString("technicalCutline"));
				dto.setHumanityCutline(rs.getString("humanityCutline"));
				dto.setRequiredLanguage(rs.getString("requiredLanguage")); //requiredLanguage
				dto.setMinimumAnnualSalary(rs.getString("minimumAnnualSalary"));
				dto.setMaximumAnnualSalary(rs.getString("maximumAnnualSalary"));
				dto.setJob(rs.getString("job"));
				dto.setMinimumAge(rs.getString("minimumAge"));
				dto.setMaximumAge(rs.getString("maximumAge"));
				dto.setRegion(rs.getString("region"));
				dto.setCareer(rs.getString("career"));
				dto.setStorageStatus(rs.getString("storageStatus"));
				dto.setDeadline(rs.getString("deadline"));
				dto.setFixedNumber(rs.getString("fixedNumber"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.get : " + e.toString());
		}
		
		return null;
	}

	public void close() {
		try {

			conn.close();
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.close : " + e.toString());
		}
		
		
	}
// ==================================================================================================================

	
	public int add(JobAdvertisementDTO dto) {
		
		try {
			
			String sql = "INSERT INTO tblJobAdvertisement (seq, id, title, regdate, MBTITypeSeq, holland, "
							+ "technicalCutline, humanityCutline, minimumAnnualSalary, maximumAnnualSalary, "
							+ "job, minimumAge, maximumAge, region, career, storageStatus, deadline, fixedNumber, tag, count, education)"
							+ " VALUES (jobAdvertisement_seq.nextVal, ?, ?, default, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, ?, ?, 'y', 10, ?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getTitle());
			pstat.setString(3, dto.getMbtiTypeSeq());
			pstat.setString(4, dto.getHolland());
			pstat.setString(5, dto.getTechnicalCutline());
			pstat.setString(6, dto.getHumanityCutline());
			pstat.setString(7, dto.getMinimumAnnualSalary());
			pstat.setString(8, dto.getMaximumAnnualSalary());
			pstat.setString(9, dto.getJob());
			pstat.setString(10, dto.getMinimumAge());
			pstat.setString(11, dto.getMaximumAge());
			pstat.setString(12, dto.getRegion());
			pstat.setString(13, dto.getCareer());
			pstat.setString(14, dto.getDeadline());
			pstat.setString(15, dto.getFixedNumber());
			pstat.setString(16, dto.getEducation());
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.add : " + e.toString());
		}
		
		return 0;
	}//공고추가

	public int del(String seq) {
		
		try {

			String sql = "DELETE FROM tbljobAdvertisement WHERE seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("EnterpriseDAO.del : " + e.toString());
		}
		
		return 0;
	}//공고 삭제

	public String getFeedbackStatus(String seq) {

		try {

			String feedbackStatus = "";
			
			String sql = "SELECT feedbackStatus FROM tblJobAdvertisement WHERE seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				feedbackStatus = rs.getString("feedbackStatus");
				
			}
			
			return feedbackStatus;
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.getFeedbackStatus : " + e.toString());
		}
		
		return null;
	}

	public void fStatusUpdate(String seq) {
		
		try {

			//공고 테이블 피드백상태 바꾸기 탑승
			String sql = "UPDATE tblJobAdvertisement SET feedbackStatus = 'yes' WHERE seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("EnterpriseDAO.fStatusUpdate : " + e.toString());
		}
		
	}

	public ViewInfoDTO myViewInfo(String id) {
		
		try {
			ViewInfoDTO dto = new ViewInfoDTO();
			
			String sql = "select * from tblenterpriseinfo ei" + 
						"    INNER JOIN tblenterprisemember em" + 
						"        ON ei.id = em.id" + 
						"            WHERE em.id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setTel(rs.getString("tel"));
				dto.setEnterpriseName(rs.getString("enterpriseName"));
				dto.setBusinessNumber(rs.getString("businessNumber"));
				dto.setAddress(rs.getString("address"));
				dto.setField(rs.getString("field"));
				dto.setScale(rs.getString("scale"));
				dto.setEstablishYear(rs.getString("establishYear"));
				dto.setIntroduction(rs.getString("introduction"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.myViewInfo : " + e.toString());
		}
		
		return null;
	}//기업이 자신의 정보확인

	public int myViewUpdate(ViewInfoDTO dto) {
		
		try {

			String sql = "UPDATE tblenterpriseinfo SET tel = ?, address = ?, field = ?, scale = ?, introduction = ? WHERE id = ? ";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getTel());
			pstat.setString(2, dto.getAddress());
			pstat.setString(3, dto.getField());
			pstat.setString(4, dto.getScale());
			pstat.setString(5, dto.getIntroduction());
			pstat.setString(6, dto.getId());
			
			int result1 = pstat.executeUpdate();
			
			String sql2 = "UPDATE tblenterprisemember SET enterpriseName = ?, pw = ? WHERE id = ?";
			
			pstat = conn.prepareStatement(sql2);
			pstat.setString(1, dto.getEnterpriseName());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getId());
			
			int result2 = pstat.executeUpdate();
			System.out.println("result1 : " + result1);
			System.out.println("result2 : " + result2);
			
			return result1 + result2;
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.myViewUpdate : " + e.toString());
		}
		
		return 0;
	}
	
	
	
	
}
