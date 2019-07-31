package desket.dto;

//기업정보
public class EnterpriseInfoDTO {

	private String seq;				//번호(PK)
	private String id;				//아이디(FK)
	private String tel;				//전화번호
	private String address;			//주소
	private String field;			//업종
	private String scale;			//규모
	private String introduction;	//기업소개
	private String employeeNumber;	//종사자수
	private String establishYear;	//설립년도
	private String hompage;			//홈페이지
	
	
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getEmployeeNumber() {
		return employeeNumber;
	}
	public void setEmployeeNumber(String employeeNumber) {
		this.employeeNumber = employeeNumber;
	}
	public String getEstablishYear() {
		return establishYear;
	}
	public void setEstablishYear(String establishYear) {
		this.establishYear = establishYear;
	}
	public String getHompage() {
		return hompage;
	}
	public void setHompage(String hompage) {
		this.hompage = hompage;
	}
	
	
	
}
