package desket.notice;

public class RecomandList {
	private String seq;					//번호(PK)				
	private String id;					//아이디(FK)
	private String regdate;				//등록날짜
	private String MBTITypeSeq;			//MBTI유형번호(FK)
	private String holland;				//홀랜드유형
	private String technicalCutline;	//기술커트라인
	private String requiredLanguage;	//사용언어
	private String humanityCutline;		//인적성커트라인
	private String minimumAnnualSalary;	//최소연봉
	private String maximumAnnualSalary;	//최대연봉
	private String job;					//직무
	private String minimumAge;			//최소나이
	private String maximumAge;			//최대나이
	private String region;				//지역
	private String career;				//경력
	private String storageStatus;		//저장상태
	private String deadline;			//마감일
	private String fixedNumber;			//모집인원
	private String title;				//제목
	private String education;			//학력
	private int count;					//조회수
	private String time; 				//근무일시
	private String employtype;			//근무 형태
	private String scale;				//규모
	
	
	
	
	
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public String getEmploytype() {
		return employtype;
	}
	public void setEmploytype(String employtype) {
		this.employtype = employtype;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getMBTITypeSeq() {
		return MBTITypeSeq;
	}
	public void setMBTITypeSeq(String mBTITypeSeq) {
		MBTITypeSeq = mBTITypeSeq;
	}
	public String getHolland() {
		return holland;
	}
	public void setHolland(String holland) {
		this.holland = holland;
	}
	public String getTechnicalCutline() {
		return technicalCutline;
	}
	public void setTechnicalCutline(String technicalCutline) {
		this.technicalCutline = technicalCutline;
	}
	public String getRequiredLanguage() {
		return requiredLanguage;
	}
	public void setRequiredLanguage(String requiredLanguage) {
		this.requiredLanguage = requiredLanguage;
	}
	public String getHumanityCutline() {
		return humanityCutline;
	}
	public void setHumanityCutline(String humanityCutline) {
		this.humanityCutline = humanityCutline;
	}
	public String getMinimumAnnualSalary() {
		return minimumAnnualSalary;
	}
	public void setMinimumAnnualSalary(String minimumAnnualSalary) {
		this.minimumAnnualSalary = minimumAnnualSalary;
	}
	public String getMaximumAnnualSalary() {
		return maximumAnnualSalary;
	}
	public void setMaximumAnnualSalary(String maximumAnnualSalary) {
		this.maximumAnnualSalary = maximumAnnualSalary;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getMinimumAge() {
		return minimumAge;
	}
	public void setMinimumAge(String minimumAge) {
		this.minimumAge = minimumAge;
	}
	public String getMaximumAge() {
		return maximumAge;
	}
	public void setMaximumAge(String maximumAge) {
		this.maximumAge = maximumAge;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getStorageStatus() {
		return storageStatus;
	}
	public void setStorageStatus(String storageStatus) {
		this.storageStatus = storageStatus;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getFixedNumber() {
		return fixedNumber;
	}
	public void setFixedNumber(String fixedNumber) {
		this.fixedNumber = fixedNumber;
	}
}
