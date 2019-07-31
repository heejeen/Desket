package desket.dto;

//관심공고
public class NoticeinterestDTO {

	private String seq;			//번호(PK)
	private String id;			//일반회원 아이디(FK)
	private String noticeSeq;	//공고번호(FK)
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNoticeSeq() {
		return noticeSeq;
	}
	public void setNoticeSeq(String noticeSeq) {
		this.noticeSeq = noticeSeq;
	}
	
	
}//class NoticeinterestDTO
