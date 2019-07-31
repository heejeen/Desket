package desket.mypage.enterprise.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import desket.DBUtil;
import desket.dto.JobAdvertisementDTO;
import desket.dto.RequiredCertificateDTO;
import desket.dto.RequiredLanguageDTO;


public class NoticeDAO {
		
		private Connection conn;
		private PreparedStatement stat;
		private ResultSet rs;

		public NoticeDAO() {
			DBUtil util = new DBUtil();
			conn = util.connect();

		}
	

	

	public ArrayList<VwNoticeList> getVwNoticeList(String id) {
		
		try {
		
		String sql = "select * from vwnoticelist where id = ?";
		
		stat = conn.prepareStatement(sql);
		stat.setString(1,id);
		rs = stat.executeQuery();
		
		ArrayList<VwNoticeList>list = new ArrayList<VwNoticeList>();
		
		while(rs.next()) {
			VwNoticeList dto = new VwNoticeList();
			
			dto.setCareer(rs.getString("career"));
			dto.setDeadline(rs.getString("deadline").substring(0, 10));
			dto.setFixedNumber(rs.getString("fixedNumber"));
			dto.setHolland(rs.getString("holland"));
			dto.setHumanityCutline(rs.getString("humanityCutline"));
			dto.setId(rs.getString("id"));
			dto.setJob(rs.getString("job"));
			dto.setMaximumAge(rs.getString("maximumAge"));
			dto.setMaximumAnnualSalary(rs.getString("maximumAnnualSalary"));
			dto.setMBTITypeSeq(rs.getString("MBTITypeSeq"));
			dto.setMinimumAge(rs.getString("minimumAge"));
			dto.setMinimumAnnualSalary(rs.getString("minimumAnnualSalary"));
			dto.setRegdate(rs.getString("regdate").substring(0, 10));
			dto.setRegion(rs.getString("region"));
			dto.setSeq(rs.getString("seq"));
			dto.setStorageStatus(rs.getString("storageStatus"));
			dto.setTechnicalCutline(rs.getString("technicalCutline"));
			dto.setTitle(rs.getString("title"));
			dto.setCount(rs.getString("count"));
			dto.setEducation(rs.getString("education"));
			dto.setRecnt(rs.getInt("recnt"));
			
			
			list.add(dto);		
			
		
		}
		
		return list;
		
	} catch (Exception e) {
		System.out.println("NoticeDAO.getVwNoticeList:"+ e.toString());
	}
		
				

		return null;
	}




	public int addNotice(JobAdvertisementDTO dto) {
		try {
			
			String sql = "insert into tblJobAdvertisement (seq,id,title,regdate,MBTITypeSeq,holland,technicalCutline,humanityCutline,minimumAnnualSalary,maximumAnnualSalary" + 
					",job,minimumAge,maximumAge,region,career,storageStatus,deadline,fixedNumber,tag,count,education)" + 
					"values(jobAdvertisement_seq.nextval,?,?,default,?,?,70,60,?,?,?,?,?,?,1,?,?,?,default,?)";
			stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getId());
			stat.setString(2, dto.getTitle());
			stat.setString(3, dto.getMbtiTypeSeq());
			stat.setString(4, dto.getHolland());
			stat.setString(5, dto.getMinimumAnnualSalary());
			stat.setString(6, dto.getMinimumAnnualSalary());
			stat.setString(7, dto.getJob());
			stat.setString(8, dto.getMinimumAge());
			stat.setString(9, dto.getRegion());
			stat.setString(10, dto.getCareer());
			stat.setString(11, dto.getDeadline());
			stat.setString(12, dto.getFixedNumber());
			stat.setString(13, dto.getEducation());
			
			return stat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("NoticeDAO.addNotice:"+ e.toString());
		}
		return 0;
	}




	public int addCert(RequiredCertificateDTO cdto) {
		
		try {
			
			String sql = "select max(seq) as max from tbladvertisement";
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			if(rs.next()) {
				sql = "insert into tblRequiredCertificate (seq,jobAdvertisementSeq,certificateSeq)" + 
						" values(RequiredCertificate_seq.nextval,?,?)";
				PreparedStatement tstat = conn.prepareStatement(sql);
				tstat.setString(1, rs.getString("max"));
				tstat.setString(2, cdto.getCertificateSeq());
				
				return  tstat.executeUpdate();
				
				
				
				
			}
		} catch (Exception e) {
			System.out.println("NoticeDAO.addCert:"+ e.toString());
		}
		
		
		return 0;
	}




	public int addLan(RequiredLanguageDTO ldto) {

		try {
			
			String sql = "select max(seq) as max from tbladvertisement";
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			if(rs.next()) {
				sql = "insert into tblRequiredLanguage (seq,jobAdvertisementSeq,langaugeSeq)" + 
						"    values(RequiredLanguage_seq.nextval,?,?)";
				PreparedStatement tstat = conn.prepareStatement(sql);
				tstat.setString(1, rs.getString("max"));
				tstat.setString(2, ldto.getLangaugeSeq());
				
				return  tstat.executeUpdate();
				
				
				
				
			}
		} catch (Exception e) {
			System.out.println("NoticeDAO.addCert:"+ e.toString());
		}
		
		
		return 0;
	}
	
	
	
	
	
	
	
}
