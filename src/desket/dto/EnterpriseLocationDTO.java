package desket.dto;

// 기업위치
public class EnterpriseLocationDTO {
	
	private String seq;					// 번호(PK)
	private String enterpriseInfoSeq;	// 기업정보번호(FK)
	private String lat;					// 위도
	private String lng;					// 경도
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getEnterpriseInfoSeq() {
		return enterpriseInfoSeq;
	}
	public void setEnterpriseInfoSeq(String enterpriseInfoSeq) {
		this.enterpriseInfoSeq = enterpriseInfoSeq;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}

}
