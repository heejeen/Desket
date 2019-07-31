package desket.dto;

public class SkillTestPaperDTO {

	private String seq;					//번호(PK) 
	private String skillTestSeq;		//기술 검사 번호(FK)
	private String jobAdvertisementSeq;	//공고번호(FK)
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSkillTestSeq() {
		return skillTestSeq;
	}
	public void setSkillTestSeq(String skillTestSeq) {
		this.skillTestSeq = skillTestSeq;
	}
	public String getJobAdvertisementSeq() {
		return jobAdvertisementSeq;
	}
	public void setJobAdvertisementSeq(String jobAdvertisementSeq) {
		this.jobAdvertisementSeq = jobAdvertisementSeq;
	}
	
}
