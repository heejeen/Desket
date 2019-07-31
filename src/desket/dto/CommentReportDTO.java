package desket.dto;

// 댓글신고내역
public class CommentReportDTO {

	private String seq;				// 번호(PK)
	private String regdate;			// 등록일
	private String id;				// 신고자아이디(FK)
	private String reason;			// 신고사유
	private String commentSeq;		// 댓글번호(FK)
	private String status;			// 처리여부
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getCommentSeq() {
		return commentSeq;
	}
	public void setCommentSeq(String commentSeq) {
		this.commentSeq = commentSeq;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
