package desket.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import desket.DBUtil;
import desket.dto.HollandTestDTO;
import desket.dto.JobAdvertisementDTO;
import desket.dto.MBTITestDTO;
import desket.dto.SkillTestDTO;

public class NoticeDAO {
	
	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;

	public NoticeDAO() {
		DBUtil util = new DBUtil();
		conn = util.connect();

	}

	public ArrayList<JobAdvertisementDTO> getList() {
		try {
			
			String sql = "select * from tbljobadvertisement where storagestatus=1 and deadline>sysdate";
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			ArrayList<JobAdvertisementDTO> list = new ArrayList<JobAdvertisementDTO>();
			
			while(rs.next()) {
				JobAdvertisementDTO dto = new JobAdvertisementDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				dto.setMaximumAge(rs.getString("maximumAge"));
				dto.setMinimumAge(rs.getString("minimumAge"));
				dto.setMaximumAnnualSalary(rs.getString("maximumAnnualSalary"));
				dto.setMinimumAnnualSalary(rs.getString("minimumAnnualSalary"));
				dto.setJob(rs.getString("job"));
				dto.setRegion(rs.getString("region"));
				dto.setCareer(rs.getString("career"));
				dto.setDeadline(rs.getString("deadline").substring(0,10));
				dto.setFixedNumber(rs.getString("fixedNumber"));
				dto.setCount(rs.getInt("count"));
				dto.setEducation(rs.getString("education"));
				
				list.add(dto);				
			}
			return list;
			
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getList:"+ e.toString());
		}
		
		
		
		return null;
	}

	public int getTotalCount(HashMap<String, String> map) {

		try {
			String where ="";
			
			
			
			String sql = String.format("select count(*) as cnt from VwNoticeList %s", where);
			stat = conn.prepareStatement(sql);
			rs =stat.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
			
		} catch (Exception e) {
			System.out.println("BoardDAO.getTotalCount:"+ e.toString());
		}
		
		
		return 0;		
		
	}

	public JobAdvertisementDTO getNotice(String seq) {

		try {
			
			String sql = "select * from tbljobadvertisement where seq = ?";
			stat = conn.prepareStatement(sql);
			stat.setString(1,seq);
			rs=stat.executeQuery();
			
			
			if(rs.next()) {
				JobAdvertisementDTO dto = new JobAdvertisementDTO();
				dto.setSeq(rs.getInt("seq")+"");
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				dto.setMaximumAge(rs.getInt("maximumAge")+"");
				dto.setMinimumAge(rs.getInt("minimumAge")+"");
				dto.setMaximumAnnualSalary(rs.getString("maximumAnnualSalary"));
				dto.setMinimumAnnualSalary(rs.getString("minimumAnnualSalary"));
				dto.setJob(rs.getString("job"));
				dto.setRegion(rs.getString("region"));
				dto.setCareer(rs.getString("career"));
				dto.setDeadline(rs.getString("deadline").substring(0,10));
				dto.setFixedNumber(rs.getInt("fixedNumber")+"");
				dto.setCount(rs.getInt("count"));
				dto.setEducation(rs.getString("education"));
				dto.setStorageStatus(rs.getString("storageStatus"));
				dto.setFeedbackStatus(rs.getString("feedbackStatus"));
				
			
			
				return dto;
				
			}
			
			
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getNotice:"+ e.toString());
		}
		
		return null;
	}

	public VwEnterPriseInfo getInfo(String id) {
		
		try {
			
			String sql = "select * from VwEnterPriseInfo where id = ?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			rs = stat.executeQuery();
			
			if(rs.next()) {
				VwEnterPriseInfo dto = new VwEnterPriseInfo();
				dto.setAddress(rs.getString("address"));
				dto.setEmployeeNumber(rs.getInt("employeeNumber"));				
				dto.setEstablishYear(rs.getInt("establishYear"));
				dto.setField(rs.getString("field"));
				dto.setHompage(rs.getString("homepage"));
				dto.setId(rs.getString("id"));
				dto.setIntroduction(rs.getString("introduction"));
				dto.setScale(rs.getString("scale")); dto.setSeq(rs.getString("seq"));
				dto.setTel(rs.getString("tel"));
				dto.setPic(rs.getString("pic"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				 
				return dto;
				
			}
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getInfo:"+ e.toString());
		}
		
		
		return null;
	}

	public ArrayList<RecomandList> getrList() {

		try {
			
			String sql = "select * from vwrecomandlist";
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			ArrayList<RecomandList> list = new ArrayList<RecomandList>();
			
			while(rs.next()) {
				RecomandList dto = new RecomandList();
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				dto.setMaximumAge(rs.getString("maximumAge"));
				dto.setMinimumAge(rs.getString("minimumAge"));
				dto.setMaximumAnnualSalary(rs.getString("maximumAnnualSalary"));
				dto.setMinimumAnnualSalary(rs.getString("minimumAnnualSalary"));
				dto.setJob(rs.getString("job"));
				dto.setRegion(rs.getString("region"));
				dto.setCareer(rs.getString("career"));
				dto.setDeadline(rs.getString("deadline").substring(0,10));
				dto.setFixedNumber(rs.getString("fixedNumber"));
				dto.setCount(rs.getInt("count"));
				dto.setEducation(rs.getString("education"));
				dto.setScale(rs.getString("scale"));
				
				list.add(dto);				
			}
			return list;
			
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getrList:"+ e.toString());
		}
		
		
		return null;
	}

	public ArrayList<VwInterestList> getIlist(String id) {

		try {
			
			String sql = "select * from vwinterestlist where memberid = ?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			rs = stat.executeQuery();
			
			ArrayList<VwInterestList> list = new ArrayList<VwInterestList>();
			
			while(rs.next()) {
				VwInterestList dto = new VwInterestList();
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				dto.setMaximumAge(rs.getString("maximumAge"));
				dto.setMinimumAge(rs.getString("minimumAge"));
				dto.setMaximumAnnualSalary(rs.getString("maximumAnnualSalary"));
				dto.setMinimumAnnualSalary(rs.getString("minimumAnnualSalary"));
				dto.setJob(rs.getString("job"));
				dto.setRegion(rs.getString("region"));
				dto.setCareer(rs.getString("career"));
				dto.setDeadline(rs.getString("deadline").substring(0,10));
				dto.setFixedNumber(rs.getString("fixedNumber"));
				dto.setCount(rs.getInt("count"));
				dto.setEducation(rs.getString("education"));
				
				
				list.add(dto);				
			}
			return list;
			
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getIList:"+ e.toString());
		}
		
		return null;
	}

	public void addReadcount(String seq) {
		try {
			
			String sql = "update tbljobadvertisement set count = count+1 where seq = ? ";
			stat=conn.prepareStatement(sql);
			stat.setString(1, seq);
			stat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.addReadcount:"+ e.toString());
		}
		
		
		
	}

	public ArrayList<CntGender> getGCnt(String seq) {
		try {
			
			String sql = "select gender,count(*) as cnt from vwgraph where seq = ? group by gender order by gender";
			stat=conn.prepareStatement(sql);
			stat.setString(1, seq);
			rs = stat.executeQuery();
			
			ArrayList<CntGender> list = new ArrayList<CntGender>();
			
			while(rs.next()) {
				
				CntGender dto = new CntGender();
				dto.setGender(rs.getString("gender"));
				dto.setCnt(rs.getInt("cnt"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getGCnt:"+ e.toString());
		}
		
		
		
		return null;
	}

	public ArrayList<CntEducation> getECnt(String seq) {
		try {
			
			String sql = "select education,count(*) as cnt from vwgraph where seq = ? group by education order by education";
			stat=conn.prepareStatement(sql);
			stat.setString(1, seq);
			rs = stat.executeQuery();
			
			ArrayList<CntEducation> list = new ArrayList<CntEducation>();
			
			while(rs.next()) {
				
				CntEducation dto = new CntEducation();
				dto.setEducation(rs.getString("education"));
				dto.setCnt(rs.getInt("cnt"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getECnt:"+ e.toString());
		}
		return null;
	}

	public ArrayList<Cntcareer> getCCnt(String seq) {
		try {
			
			String sql = "select career,count(*) as cnt from vwgraph where seq = ? group by career order by career";
			stat=conn.prepareStatement(sql);
			stat.setString(1, seq);
			rs = stat.executeQuery();
			
			ArrayList<Cntcareer> list = new ArrayList<Cntcareer>();
			
			while(rs.next()) {
				
				Cntcareer dto = new Cntcareer();
				dto.setCareer(rs.getInt("career")+"");
				dto.setCnt(rs.getInt("cnt"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getCCnt:"+ e.toString());
		}
		return null;
				
		
		
	}

	public void addInterest(String seq, String id) {
		try {
			
			int result=2;
			//이미 있는지 확인 필요
			String sql = "delete from tbljobadvertisementinterest where id=? and noticeseq =?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			stat.setString(2, seq);
			result = stat.executeUpdate();
			
			if(result==0 || result==2) {
				sql = "insert into tbljobadvertisementinterest values(JobAdinterest_seq.nextval,?,?)";
				PreparedStatement pstat;
				pstat=conn.prepareStatement(sql);
				pstat.setString(1, id);
				pstat.setString(2, seq);
				pstat.executeUpdate();
			}
		
			
			
			
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.addInterest:"+ e.toString());
		}
		
	}

	public int isInterest(String seq, String memberid) {

		try {
			
			String sql = "select * from tbljobadvertisementinterest where id=? and noticeseq=?";
			
			stat=conn.prepareStatement(sql);
			stat.setString(1, memberid);
			stat.setString(2, seq);
			
			rs= stat.executeQuery();
			
			int cnt=0;
			if(rs.next()) {
				cnt++;
			}
			return cnt;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.isInterest:"+ e.toString());
		}
		
		
		return 0;
	}

	public ArrayList<VwClosedList> getCList(String id) {
		
		try {
			
			String sql = "select * from vwclosedlist where id = ?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			rs = stat.executeQuery();
			
			ArrayList<VwClosedList> list = new ArrayList<VwClosedList>();
			
			while(rs.next()) {
				VwClosedList dto = new VwClosedList();
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				dto.setMaximumAge(rs.getString("maximumAge"));
				dto.setMinimumAge(rs.getString("minimumAge"));
				dto.setMaximumAnnualSalary(rs.getString("maximumAnnualSalary"));
				dto.setMinimumAnnualSalary(rs.getString("minimumAnnualSalary"));
				dto.setJob(rs.getString("job"));
				dto.setRegion(rs.getString("region"));
				dto.setCareer(rs.getString("career"));
				dto.setDeadline(rs.getString("deadline").substring(0,10));
				dto.setFixedNumber(rs.getString("fixedNumber"));
				dto.setCount(rs.getInt("count"));
				dto.setEducation(rs.getString("education"));
				
				
				list.add(dto);				
			}
			
			return list;
			
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getCList:"+ e.toString());
		}
		
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * MBTI문제 가져오기
	 * @param advertisementNum : 공고번호
	 * @return
	 */
	public ArrayList<MBTITestDTO> MBTIQuestionList(String advertisementNum) {

		try {
			String sql = "select mt.type as type, mt.question as question from tblmbtitestpaper mtp" + 
					"    inner join tblmbtitest mt" + 
					"        on mtp.mbtitestseq = mt.seq" + 
					"            where mtp.jobadvertisementseq = ?";	
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, advertisementNum);
			
			rs = stat.executeQuery();
			
			ArrayList<MBTITestDTO> list = new ArrayList<MBTITestDTO>();
			
			while(rs.next()) {
				MBTITestDTO dto = new MBTITestDTO();
				//dto.setSeq(rs.getString("seq"));
				dto.setType(rs.getString("type"));
				dto.setQuestion(rs.getString("question"));
				//dto.setScore(rs.getInt("score"));
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.MBTIQuestionList : " + e.toString());
		}
		return null;
	}

	
	/**
	 * Holland문제 가져오기
	 * @param advertisementNum : 공고번호
	 * @return
	 */
	public ArrayList<HollandTestDTO> hollandQuestionList(String advertisementNum) {
		try {
			String sql = "select ht.type as type, ht.question as question from tblhollandtestpaper htp" + 
					"    inner join tblhollandtest ht" + 
					"        on htp.hollandtestseq = ht.seq" + 
					"            where htp.jobadvertisementseq = ?";	
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, advertisementNum);
			
			rs = stat.executeQuery();
			
			ArrayList<HollandTestDTO> list = new ArrayList<HollandTestDTO>();
			
			while(rs.next()) {
				HollandTestDTO dto = new HollandTestDTO();
				//dto.setSeq(rs.getString("seq"));
				dto.setType(rs.getString("type"));
				dto.setQuestion(rs.getString("question"));
				//dto.setScore(rs.getInt("score"));
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.hollandQuestionList : " + e.toString());
		}
		return null;
	}

	
	
	
	/**
	 * 특정 회원(로그인한 회원)의 이력서 번호 가져오기 (가장 최근에 작성한 이력서 번호)
	 * @param id : 회원 아이디
	 * @return
	 */
	public String getResumeSeq(String id) {

		try {
			
			String sql = "select seq from tblResume where id = ?" + 
					"                            		and regdate = (select max(regdate) from tblResume where id = ?)" + 
					"                            		and seq = (select max(seq) from tblResume where id = ?)";	
			System.out.println(id);
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			stat.setString(2, id);
			stat.setString(3, id);
			
			rs = stat.executeQuery();
			
			String seq = "";
			
			if(rs.next()) {
				seq = rs.getString("seq");
			}
			
			System.out.println("----------1--------" + seq);
			return seq;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getResumeSeq : " + e.toString());
		}
		return null;
	}

	
	/**
	 * 특정 공고의 MBTI검사지 번호 가져오기
	 * @param advertisementNum : 공고 번호
	 * @return
	 */
	public MBTITestPaperSeqDTO getMBTITestPaperSeq(String advertisementNum) {

		try {
			
			String sql = "select min(seq) as minSeq, max(seq) as maxSeq from tblmbtitestpaper where jobadvertisementseq = ?";	

			stat = conn.prepareStatement(sql);
			stat.setString(1, advertisementNum);
			
			rs = stat.executeQuery();
			
			MBTITestPaperSeqDTO dto = new MBTITestPaperSeqDTO();
			
			if(rs.next()) {
				
				dto.setMinSeq(rs.getInt("minSeq"));
				dto.setMaxSeq(rs.getInt("maxSeq"));
				
			}
			
			return dto;
			
			
			
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getMBTITestPaperSeq : " + e.toString());
		}
		return null;
	}
	
	
	/**
	 * 특정 공고에 지원한 특정 회원(로그인한 회원)이 제출한 MBTI검사 결과 > insert
	 * @param MBTITestPaperSeq : MBTI검사페이지 번호
	 * @param resumeSeq : 이력서 번호
	 * @param list : 제출한 답 리스트
	 * @return
	 */
	public int addMBTIAnswer(MBTITestPaperSeqDTO MBTITestPaperSeq, String resumeSeq, ArrayList<String> mblist) {

		try {
			
			String sql = "insert into tblmbtitestanswer (seq, paperseq, resumeseq, answer)" + 
					"    values (MBTITestAnswer_seq.nextval, ?, ?, ?)";	
			int j = 0;
			
								//1							40
			for(int i=MBTITestPaperSeq.getMinSeq(); i<=MBTITestPaperSeq.getMaxSeq(); i++) {
				
				System.out.println("paperseq : " + i);
				System.out.println("resumeSeq : " + resumeSeq);
				System.out.println("answer : " + mblist.get(j));
				
				stat = conn.prepareStatement(sql);
				
				stat.setInt(1, i);
				stat.setString(2, resumeSeq);
				
				if(j != mblist.size()) {
					stat.setString(3, mblist.get(j));
					j++;
				}
				
				stat.executeUpdate();
			}
			
			return 1;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.addMBTIAnswer : " + e.toString());
		}
		return 0;
	}

	
	/**
	 * 특정 공고의 Holland검사지 번호 가져오기
	 * @param advertisementNum : 공고 번호
	 * @return
	 */
	public HollandTestPaperSeqDTO getHollandTestPaperSeq(String advertisementNum) {
		
		try {
			
			String sql = "select min(seq) as minSeq, max(seq) as maxSeq from tblhollandtestpaper where jobadvertisementseq = ?";	

			stat = conn.prepareStatement(sql);
			stat.setString(1, advertisementNum);
			
			rs = stat.executeQuery();
			
			HollandTestPaperSeqDTO dto = new HollandTestPaperSeqDTO();
			
			if(rs.next()) {
				
				dto.setMinSeq(rs.getInt("minSeq"));
				dto.setMaxSeq(rs.getInt("maxSeq"));
				
			}
			
			return dto;
			
			
			
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getHollandTestPaperSeq : " + e.toString());
		}

		return null;
	}

	
	
	/**
	 * 특정 공고에 지원한 특정 회원(로그인한 회원)이 제출한 Holland검사 결과 > insert
	 * @param hollandPaperSeq : Holland검사 페이지 번호
	 * @param resumeSeq : 이력서 번호
	 * @param list : 제출한 답 리스트
	 * @return
	 */
	public int addHollandAnswer(HollandTestPaperSeqDTO hollandTestPaperSeq, String resumeSeq,
			ArrayList<String> holist) {
		
		try {
			
			String sql = "insert into tblhollandtestanswer (seq, paperseq, resumeseq, answer)" + 
					"    values (HollandTestAnswer_seq.nextval, ?, ?, ?)";	
			int j = 0;
			
			for(int i=hollandTestPaperSeq.getMinSeq(); i<=hollandTestPaperSeq.getMaxSeq(); i++) {
				
				System.out.println("paperseq : " + i);
				System.out.println("resumeSeq : " + resumeSeq);
				System.out.println("answer : " + holist.get(j));
				
				stat = conn.prepareStatement(sql);
				
				stat.setInt(1, i);
				stat.setString(2, resumeSeq);
				
				if(j != holist.size()) {
					stat.setString(3, holist.get(j));
					j++;
				}
				
				stat.executeUpdate();
			}
			
			return 1;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.addHollandAnswer : " + e.toString());
		}
		
		
		return 0;
	}

	
	/**
	 * Humanity 문제
	 * @param advertisementNum : 공고번호
	 * @return
	 */
	public ArrayList<HumanityTestListDTO> humanityQuestionList(String advertisementNum) {

		try {
			String sql = "select " + 
						"    qt.questiontype as type, " + 
						"    ht.question as question ," + 
						"    htc.one as choice1," + 
						"    htc.two as choice2," + 
						"    htc.three as choice3," + 
						"    htc.four as choice4" + 
						" from tblHumanityTestPaper htp" + 
						"    inner join tblHumanityTest ht" + 
						"        on htp.humanitytestseq = ht.seq" + 
						"            inner join tblQuestionType qt" + 
						"                on ht.questiontypeseq = qt.seq" + 
						"                    inner join tblHumanityTestChoice htc" + 
						"                        on ht.seq = htc.seq" + 
						"                            where htp.jobadvertisementseq = ?";	
				
			stat = conn.prepareStatement(sql);
			stat.setString(1, advertisementNum);
			
			rs = stat.executeQuery();
			
			ArrayList<HumanityTestListDTO> list = new ArrayList<HumanityTestListDTO>();
			
			while(rs.next()) {
				HumanityTestListDTO dto = new HumanityTestListDTO();
				//dto.setSeq(rs.getString("seq"));
				dto.setType(rs.getString("type"));
				dto.setQuestion(rs.getString("question"));
				dto.setChoice1(rs.getString("choice1"));
				dto.setChoice2(rs.getString("choice2"));
				dto.setChoice3(rs.getString("choice3"));
				dto.setChoice4(rs.getString("choice4"));
				//dto.setScore(rs.getInt("score"));
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.humanityQuestionList : " + e.toString());
		}
		
		
		
		return null;
	}

	
	/**
	 * 특정 공고의 인적성검사지 번호 가져오기
	 * @param advertisementNum : 공고 번호
	 * @return
	 */
	public HumanityTestPaperSeqDTO getHumanityTestPaperSeq(String advertisementNum) {

		try {
			
			String sql = "select min(seq) as minSeq, max(seq) as maxSeq from tblhumanitytestpaper where jobadvertisementseq = ?";	

			stat = conn.prepareStatement(sql);
			stat.setString(1, advertisementNum);
			
			rs = stat.executeQuery();
			
			HumanityTestPaperSeqDTO dto = new HumanityTestPaperSeqDTO();
			
			if(rs.next()) {
				
				dto.setMinSeq(rs.getInt("minSeq"));
				dto.setMaxSeq(rs.getInt("maxSeq"));
				
			}
			
			return dto;
			
			
			
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getHumanityTestPaperSeq : " + e.toString());
		}
		return null;
	}

	
	/**
	 * 특정 공고에 지원한 특정 회원(로그인한 회원)이 제출한 인적성검사 결과 > insert
	 * @param humanityTestPaperSeq : 인적성검사 페이지 번호
	 * @param resumeSeq : 이력서 번호
	 * @param list : 제출한 답 리스트
	 * @return
	 */
	public int addHumanityAnswer(HumanityTestPaperSeqDTO humanityTestPaperSeq, String resumeSeq,
			ArrayList<String> hulist) {
		
		try {
			
			String sql = "insert into tblhumanitytestanswer (seq, paperseq, resumeseq, answer)" + 
						"    values (HumanityTestAnswer_seq.nextval, ?, ?, ?)";	
			int j = 0;
			
			for(int i=humanityTestPaperSeq.getMinSeq(); i<=humanityTestPaperSeq.getMaxSeq(); i++) {
				
				System.out.println("paperseq : " + i);
				System.out.println("resumeSeq : " + resumeSeq);
				System.out.println("answer : " + hulist.get(j));
				
				stat = conn.prepareStatement(sql);
				
				stat.setInt(1, i);
				stat.setString(2, resumeSeq);
				
				if(j != hulist.size()) {
					stat.setString(3, hulist.get(j));
					j++;
				}
				
				stat.executeUpdate();
			}
			
			return 1;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.addHumanityAnswer : " + e.toString());
		}
		
		return 0;
	}

	
	
	
	
	/**
	 * 기술 문제
	 * @param advertisementNum : 공고번호
	 * @return
	 */
	public ArrayList<SkillTestDTO> skillQuestionList(String advertisementNum) {
		
		try {
			String sql = "select st.questiontypeseq as typeSeq, st.question as question from tblskilltestpaper stp" + 
					"    inner join tblskilltest st" + 
					"        on stp.skilltestseq = st.seq" + 
					"            where stp.jobadvertisementseq = ?";	
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, advertisementNum);
			
			rs = stat.executeQuery();
			
			ArrayList<SkillTestDTO> list = new ArrayList<SkillTestDTO>();
			
			while(rs.next()) {
				SkillTestDTO dto = new SkillTestDTO();
				//dto.setSeq(rs.getString("seq"));
				dto.setQuestionTypeSeq(rs.getString("typeSeq"));
				dto.setQuestion(rs.getString("question"));
				//dto.setScore(rs.getInt("score"));
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.skillQuestionList : " + e.toString());
		}
		
		
		
		return null;
	}

	
	/**
	 * 특정 공고의 기술검사지 번호 가져오기
	 * @param advertisementNum : 공고 번호
	 * @return
	 */
	public SkillTestPaperSeqDTO getSkillTestPaperSeq(String advertisementNum) {
		
		try {
			
			String sql = "select min(seq) as minSeq, max(seq) as maxSeq from tblskilltestpaper where jobadvertisementseq = ?";	

			stat = conn.prepareStatement(sql);
			stat.setString(1, advertisementNum);
			
			rs = stat.executeQuery();
			
			SkillTestPaperSeqDTO dto = new SkillTestPaperSeqDTO();
			
			if(rs.next()) {
				
				dto.setMinSeq(rs.getInt("minSeq"));
				dto.setMaxSeq(rs.getInt("maxSeq"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.getSkillTestPaperSeq : " + e.toString());
		}
		return null;
	}

	
	
	/**
	 * 특정 공고에 지원한 특정 회원(로그인한 회원)이 제출한 기술검사 결과 > insert
	 * @param skillTestPaperSeq : 기술검사 페이지 번호
	 * @param resumeSeq : 이력서 번호
	 * @param list : 제출한 답 리스트
	 * @return
	 */
	public int addSkillAnswer(SkillTestPaperSeqDTO skillTestPaperSeq, String resumeSeq, ArrayList<String> sklist) {
		
		try {
			
			String sql = "insert into tblskilltestanswer (seq, paperseq, resumeseq, answer)" + 
						"    values (SkillTestAnswer_seq.nextval, ?, ?, ?)";	
			int j = 0;
			
			for(int i=skillTestPaperSeq.getMinSeq(); i<=skillTestPaperSeq.getMaxSeq(); i++) {
				
				System.out.println("paperseq : " + i);
				System.out.println("resumeSeq : " + resumeSeq);
				System.out.println("answer : " + sklist.get(j));
				
				stat = conn.prepareStatement(sql);
				
				stat.setInt(1, i);
				stat.setString(2, resumeSeq);
				
				if(j != sklist.size()) {
					stat.setString(3, sklist.get(j));
					j++;
				}
				
				stat.executeUpdate();
			}
			
			return 1;
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.addHumanityAnswer : " + e.toString());
		}
		
		return 0;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
