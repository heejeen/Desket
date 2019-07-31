package desket.dto;

public class HumanityTestPaperDTO {

	private String seq;					//번호(PK)   
	private String humanityTestSeq;		//인적성 검사 번호(FK)
	private String jobAdvertisementSeq;	//공고번호(FK)
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getHumanityTestSeq() {
		return humanityTestSeq;
	}
	public void setHumanityTestSeq(String humanityTestSeq) {
		this.humanityTestSeq = humanityTestSeq;
	}
	public String getJobAdvertisementSeq() {
		return jobAdvertisementSeq;
	}
	public void setJobAdvertisementSeq(String jobAdvertisementSeq) {
		this.jobAdvertisementSeq = jobAdvertisementSeq;
	}
	
}
