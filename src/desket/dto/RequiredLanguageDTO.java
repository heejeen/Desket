package desket.dto;

public class RequiredLanguageDTO {

	private String seq;						//번호(PK)
	private String jobAdvertisementSeq;		//공고 번호(FK)
	private String langaugeSeq;				//언어 번호(FK)
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getJobAdvertisementSeq() {
		return jobAdvertisementSeq;
	}
	public void setJobAdvertisementSeq(String jobAdvertisementSeq) {
		this.jobAdvertisementSeq = jobAdvertisementSeq;
	}
	public String getLangaugeSeq() {
		return langaugeSeq;
	}
	public void setLangaugeSeq(String langaugeSeq) {
		this.langaugeSeq = langaugeSeq;
	}
	
}
