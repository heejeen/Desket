package desket.dto;

public class OwnedCertificateDTO {

	private String seq;				//번호(PK)
	private String resumeSeq;		//이력서 번호(FK)
	private String certificateSeq;	//자격증 번호(FK)

	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
	public String getCertificateSeq() {
		return certificateSeq;
	}
	public void setCertificateSeq(String certificateSeq) {
		this.certificateSeq = certificateSeq;
	}
	
}
