package desket.dto;

public class RequiredCertificateDTO {

	private String seq;						//번호
	private String jobAdvertisementSeq;		//공고 번호(FK)
	private String certificateSeq;			//자격증 번호(FK)
	
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
	public String getCertificateSeq() {
		return certificateSeq;
	}
	public void setCertificateSeq(String certificateSeq) {
		this.certificateSeq = certificateSeq;
	}
	
}
