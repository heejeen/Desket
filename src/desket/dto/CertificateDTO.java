package desket.dto;

public class CertificateDTO {

	private String seq;					//번호(PK)
	private String certificateName;		//자격증명

	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getCertificateName() {
		return certificateName;
	}
	public void setCertificateName(String certificateName) {
		this.certificateName = certificateName;
	}
	
}
