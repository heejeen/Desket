package desket.dto;

// 기업정보게시판
public class EnterpriseInfoBoardDTO {

	private String seq;					// 번호(PK)
	private String enterpriseinfoSeq;	// 기업정보번호(FK)
	private String enterpriseId;		// 기업아이디(FK)
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getEnterpriseinfoSeq() {
		return enterpriseinfoSeq;
	}
	public void setEnterpriseinfoSeq(String enterpriseinfoSeq) {
		this.enterpriseinfoSeq = enterpriseinfoSeq;
	}
	public String getEnterpriseId() {
		return enterpriseId;
	}
	public void setEnterpriseId(String enterpriseId) {
		this.enterpriseId = enterpriseId;
	}
	
}
