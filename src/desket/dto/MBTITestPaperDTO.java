package desket.dto;

public class MBTITestPaperDTO {

	private String seq;					//번호(PK)   
	private String MBTITestSeq;			//MBTI 검사 번호(FK)
	private String jobAdvertisementSeq;	//공고번호(FK)
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getMBTITestSeq() {
		return MBTITestSeq;
	}
	public void setMBTITestSeq(String mBTITestSeq) {
		MBTITestSeq = mBTITestSeq;
	}
	public String getJobAdvertisementSeq() {
		return jobAdvertisementSeq;
	}
	public void setJobAdvertisementSeq(String jobAdvertisementSeq) {
		this.jobAdvertisementSeq = jobAdvertisementSeq;
	}
	
}
