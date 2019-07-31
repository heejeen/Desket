package desket.dto;

public class AvailableLanguagesDTO {

	private String seq;				//번호(PK)
	private String resumeSeq;		//이력서 번호(FK)
	private String languageSeq;		//언어 번호(FK)
	
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
	public String getLanguageSeq() {
		return languageSeq;
	}
	public void setLanguageSeq(String languageSeq) {
		this.languageSeq = languageSeq;
	}
	
}
