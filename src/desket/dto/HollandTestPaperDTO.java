package desket.dto;

public class HollandTestPaperDTO {

	private String seq;						//번호(PK)  
	private String hollandTestSeq;			//홀랜드 검사 번호(FK)
	private String jobAdvertisementSeq;		//공고번호(FK)
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getHollandTestSeq() {
		return hollandTestSeq;
	}
	public void setHollandTestSeq(String hollandTestSeq) {
		this.hollandTestSeq = hollandTestSeq;
	}
	public String getJobAdvertisementSeq() {
		return jobAdvertisementSeq;
	}
	public void setJobAdvertisementSeq(String jobAdvertisementSeq) {
		this.jobAdvertisementSeq = jobAdvertisementSeq;
	}
	
}
