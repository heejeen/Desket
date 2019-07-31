package desket.dto;

// 자기소개서
public class LetterDTO {
	
	private String seq;			// 번호(PK)
	private String title;
	private String content;		// 내용
	private String resumeSeq;	// 이력서번호(FK)
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
	
}
