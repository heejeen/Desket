package desket.dto;

// 관리자회원
public class ManagerMemberDTO {
	
	private String seq;		// 번호(PK)
	private String id;		// 아이디
	private String pw;		// 비밀번호
	private String status;	// 상태
	
	
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
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
