package desket.dto;

// 쪽지함
public class MessageBoxDTO {

	private String seq;					// 번호(PK)
	private String title;				// 제목
	private String content;				// 내용
	private String regdate;				// 작성일
	private String isCheck;				// 확인여부
	private String memberId;			// 받는사람(일반회원FK)
	private String enterpriseMemberId;	// 받는사람(기업회원FK)
	private String managerSeq;			// 관리자번호(FK)
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getIsCheck() {
		return isCheck;
	}
	public void setIsCheck(String isCheck) {
		this.isCheck = isCheck;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getEnterpriseMemberId() {
		return enterpriseMemberId;
	}
	public void setEnterpriseMemberId(String enterpriseMemberId) {
		this.enterpriseMemberId = enterpriseMemberId;
	}
	public String getManagerSeq() {
		return managerSeq;
	}
	public void setManagerSeq(String managerSeq) {
		this.managerSeq = managerSeq;
	}
	
}
