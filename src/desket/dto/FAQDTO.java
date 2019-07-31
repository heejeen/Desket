package desket.dto;

// FAQ
public class FAQDTO {
	
	private String seq;			// 번호(PK)
	private String title;		// 제목
	private String content;		// 내용
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
