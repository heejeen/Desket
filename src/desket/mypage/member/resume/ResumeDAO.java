package desket.mypage.member.resume;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import desket.DBUtil;
import desket.dto.CertificateDTO;
import desket.dto.LanguageDTO;
import desket.dto.LetterDTO;
import desket.dto.ResumeDTO;

public class ResumeDAO {

	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;
	
	public ResumeDAO() {
		DBUtil util = new DBUtil();
		conn = util.connect();
	}//ResumeDAO()

	
//------------------------------------------------------------------------------------------------------------------	
	//내 이력서 목록 가져오기
	public ArrayList<ResumeDTO> getList(String id) {

		try {	
			
			String sql = "select * from tblResume where id = ? order by regdate desc";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			rs = stat.executeQuery();
			
			ArrayList<ResumeDTO> list = new ArrayList<ResumeDTO>();
			
			while (rs.next()) {
				ResumeDTO dto = new ResumeDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setTask(rs.getString("task"));
				dto.setSalary(rs.getString("salary"));
				dto.setStorageStatus(rs.getString("storagestatus"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			System.out.println("ResumeDAO.getList : " + e.toString());
		}
		return null;
	}//getList(id)


//------------------------------------------------------------------------------------------------------------------
	//이력서 등록하기
	public String addResume(ResumeDTO dto, String id) {

		try {

			//이력서 등록
			String sql = "insert into tblResume (seq, pic, title, task, nationality, education, major, graduation, grades, career, salary, portfolio, storageStatus, regdate, id) values (resume_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, sysdate, ?)";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getPic());
			stat.setString(2, dto.getTitle());
			stat.setString(3, dto.getTask());
			stat.setString(4, dto.getNationality());
			stat.setString(5, dto.getEducation());
			stat.setString(6, dto.getMajor());
			stat.setString(7, dto.getGraduation());
			stat.setString(8, dto.getGrades());
			stat.setString(9, dto.getCareer());
			stat.setString(10, dto.getSalary());
			stat.setString(11, dto.getPortfolio());
			stat.setString(12, id);
			
			stat.executeUpdate();
			

			//등록한 이력서 seq 불러오기
			String sql2 = "select seq from (select * from tblResume where id = ? order by seq desc) where rownum = 1"; 
			
			stat = conn.prepareStatement(sql2);
			stat.setString(1, id);
			rs = stat.executeQuery();
			
			if (rs.next()) {
				return rs.getString("seq");
			}
			
		} catch (Exception e) {
			System.out.println("ResumeDAO.addResume : " + e.toString());
		}
		return null;
	}//addResume(dto, id)
//------------------------------------------------------------------------------------------------------------------	
	//이력서 상세보기
	public ResumeDTO getView(String seq) {

		try {	
			
			String sql = "select * from tblResume where seq = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			rs = stat.executeQuery();
			
			ResumeDTO dto = new ResumeDTO();

			if(rs.next()) {
				
				dto.setCareer(rs.getString("career"));
				dto.setEducation(rs.getString("education"));
				dto.setGrades(rs.getString("grades"));
				dto.setGraduation(rs.getString("graduation"));
				dto.setId(rs.getString("id"));
				dto.setMajor(rs.getString("major"));
				dto.setNationality(rs.getString("nationality"));
				dto.setPic(rs.getString("pic"));
				dto.setPortfolio(rs.getString("portfolio"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSalary(rs.getString("salary"));
				dto.setSeq(rs.getString("seq"));
				dto.setStorageStatus(rs.getString("storagestatus"));
				dto.setTask(rs.getString("task"));
				dto.setTitle(rs.getString("title"));
				
				return dto; 
			}
			
		} catch (Exception e) {
			System.out.println("ResumeDAO.getView : " + e.toString());
		}
		return null;
	}//getView(seq);


	
//------------------------------------------------------------------------------------------------------------------	
	//소유자격증 불러오기
	public ArrayList<String> getCertificate(String id, String seq) {
		
		try {	
			
			String sql = "select c.certificateName as certificateName from tblCertificate c" 		+ 
						"    inner join tblOwnedCertificate oc" 									+ 
						"        on c.seq = oc.certificateseq" 										+ 
						"            inner join tblResume r" 										+ 
						"                on oc.resumeseq = r.seq" 									+ 
						"                    inner join tblMember m"								+ 
						"                        on r.id = m.id" 									+ 
						"                            where m.id = ? and r.seq = ?" 								+ 
						"                                group by c.certificatename";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			stat.setString(2, seq);
			rs = stat.executeQuery();
			
			ArrayList<String> certificate = new ArrayList<String>();
			
			while (rs.next()) {
				certificate.add(rs.getString("certificateName"));
			}
			
			return certificate;
			
		} catch (Exception e) {
			System.out.println("ResumeDAO.getCertificate : " + e.toString());
		}
		return null;
	}//getCertificate(id)


//------------------------------------------------------------------------------------------------------------------	
	//이력서 가능언어 불러오기
	public ArrayList<String> getLanguage(String id, String seq) {

		try {	
			
			String sql = "select l.language as language from tblLanguage l" 		+ 
						"    inner join tblAvailableLanguages a" 					+ 
						"        on l.seq = a.languageseq"							+ 
						"            inner join tblResume r" 						+ 
						"                on a.resumeseq = r.seq" 					+ 
						"                    inner join tblMember m" 				+ 
						"                        on r.id = m.id" 					+ 
						"                            where m.id = ?  and r.seq = ?"	+ 
						"                                group by l.language";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			stat.setString(2, seq);
			rs = stat.executeQuery();
			
			ArrayList<String> language = new ArrayList<String>();
			
			while (rs.next()) {
				language.add(rs.getString("language"));
			}
			
			return language;
			
		} catch (Exception e) {
			System.out.println("ResumeDAO.getLanguage : " + e.toString());
		}
		return null;
	}//getLanguage(id)

//------------------------------------------------------------------------------------------------------------------	
	//이력서 가능언어 seq 가져오기
	public ArrayList<String> getLanguageSeq(String seq) {

		try {

			String sql = "select languageSeq from tblAvailableLanguages where resumeSeq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			rs = stat.executeQuery();
			
			ArrayList<String> languageSeq = new ArrayList<String>();
			
			while (rs.next()) {
				languageSeq.add(rs.getString("languageseq"));
			}
			
			return languageSeq;
			
		} catch (Exception e) {
			System.out.println("ResumeDAO.getLanguageSeq : " + e.toString());
		}
		return null;
	}//getLanguageSeq(id)

//------------------------------------------------------------------------------------------------------------------	
	//자소서 가져오기
	public ArrayList<LetterDTO> getLetter(String id, String seq) {

		try {	
			
			String sql = "select l.title as title, l.content as content from tblLetter l" 	+ 
						"    inner join tblResume r"										+ 
						"        on l.resumeseq = r.seq" 									+ 
						"            inner join tblMember m" 								+ 
						"                on r.id = m.id" 									+ 
						"                    where m.id = ? and r.seq = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			stat.setString(2, seq);
			rs = stat.executeQuery();
			
			ArrayList<LetterDTO> letter = new ArrayList<LetterDTO>();

			while (rs.next()) {
				LetterDTO dto = new LetterDTO();
				
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				
				letter.add(dto);
			}
			
			return letter;
			
		} catch (Exception e) {
			System.out.println("ResumeDAO.getLetter : " + e.toString());
		}
		return null;
	}//getLetter(id, seq)



	
//------------------------------------------------------------------------------------------------------------------	
	//자소서 등록하기
	public int addLetter(String letterTitle, String letterContent, String seq) {
		
		try {

			String sql = "insert into tblLetter (seq, title, content, resumeseq) values (letter_seq.nextval, ?, ?, ?)";

			stat = conn.prepareStatement(sql);
			stat.setString(1, letterTitle);
			stat.setString(2, letterContent);
			stat.setString(3, seq);
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("ResumeDAO.addLetter : " + e.toString());
		}
		return 0;
	}//addLetter(letterTitle, letterContent)


//------------------------------------------------------------------------------------------------------------------	
	//언어리스트 불러오기
	public ArrayList<LanguageDTO> getLanguageList() {

		try {

			String sql = "select * from tblLanguage";
			
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			ArrayList<LanguageDTO> languageList = new ArrayList<LanguageDTO>();
			
			while (rs.next()) {
				LanguageDTO dto = new LanguageDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setLanguage(rs.getString("language"));
				
				languageList.add(dto);
			}
			
			return languageList;

		} catch (Exception e) {
			System.out.println("ResumeDAO.getLanguage : " + e.toString());
		}
		return null;
	}//getLanguage()


//------------------------------------------------------------------------------------------------------------------	
	//가능언어 등록하기
	public int addLanguage(String language, String seq) {

		try {

			String sql = "insert into tblAvailableLanguages (seq, resumeSeq, languageSeq) values (availableLanguages_seq.nextval, ?, ?)";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			stat.setString(2, language);
			
			return stat.executeUpdate();

		} catch (Exception e) {
			System.out.println("ResumeDAO.addLanguage : " + e.toString());
		}
		return 0;
	}//addLanguage(language, seq)


//------------------------------------------------------------------------------------------------------------------	
	//자격증 리스트 불러오기
	public ArrayList<CertificateDTO> getCertificateList() {
		
		try {

			String sql = "select * from tblCertificate";
			
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			ArrayList<CertificateDTO> list = new ArrayList<CertificateDTO>();
			while(rs.next()) {
				CertificateDTO dto = new CertificateDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setCertificateName(rs.getString("certificatename"));
				
				list.add(dto);
			}
			
			return list;

		} catch (Exception e) {
			System.out.println("ResumeDAO.getCertificateList : " + e.toString());
		}
		return null;
	}//getCertificateList()


//------------------------------------------------------------------------------------------------------------------
	//소유자격증 등록하기
	public int addCertificate(String certificate, String seq) {

		try {

			String sql = "insert into tblOwnedCertificate (seq, resumeSeq, certificateSeq) values (ownedCertificate_seq.nextval, ?, ?)";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			stat.setString(2, certificate);
			
			return stat.executeUpdate();

		} catch (Exception e) {
			System.out.println("ResumeDAO.addCertificate : " + e.toString());
		}
		return 0;
	}//addCertificate(certificate, seq)


//------------------------------------------------------------------------------------------------------------------	
	//이력서 - 소유자격증 seq 불러오기
	public ArrayList<String> getCertificateSeq(String seq) {

		try {

			String sql = "select certificateSeq from tblOwnedCertificate where resumeSeq = ?";

			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			rs = stat.executeQuery();
			
			ArrayList<String> certificateSeq = new ArrayList<String>();
			
			while (rs.next()) {
				certificateSeq.add(rs.getString("certificateseq"));
			}
			
			return certificateSeq;
			
		} catch (Exception e) {
			System.out.println("ResumeDAO.getCertificateSeq : " + e.toString());
		}
		return null;
	}//getCertificateSeq(seq)


//------------------------------------------------------------------------------------------------------------------	
	//이력서 지우기
	public int delResume(String seq) {

		try {

			String sql = "update tblResume set storagestatus = 2 where seq = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			return stat.executeUpdate();

		} catch (Exception e) {
			System.out.println("ResumeDAO.delResume : " + e.toString());
		}
		return 0;
	}//delResume(seq)
//------------------------------------------------------------------------------------------------------------------	
	//자소서 지우기
	public int delLetter(String seq) {

		try {

			String sql = "delete from tblLetter where resumeseq = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			return stat.executeUpdate();

		} catch (Exception e) {
			System.out.println("ResumeDAO.delLetter : " + e.toString());
		}
		return 0;
	}//delLetter(seq)
//------------------------------------------------------------------------------------------------------------------	
	//소유 자격증 지우기
	public int delCertificate(String seq) {
		
		try {

			String sql = "delete from tblOwnedCertificate where resumeseq = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			return stat.executeUpdate();

		} catch (Exception e) {
			System.out.println("ResumeDAO.delCertificate : " + e.toString());
		}
		return 0;
	}//delCertificate(seq)


//------------------------------------------------------------------------------------------------------------------	
	//소유 언어 지우기
	public int delLanguageResult(String seq) {

		try {

			String sql = "delete from tblAvailableLanguages where resumeseq = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			return stat.executeUpdate();

		} catch (Exception e) {
			System.out.println("ResumeDAO.delLanguageResult : " + e.toString());
		}
		return 0;
	}//delLanguageResult(seq)






	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//------------------------------------------------------------------------------------------------------------------	
	
	
	
	
	
	
	
}//class Resume DAO







































