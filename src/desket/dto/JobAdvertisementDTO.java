package desket.dto;

//공고
public class JobAdvertisementDTO {

	private String seq;					//번호(PK)				
	private String id;					//아이디(FK)
	private String title;				//제목
	private String regdate;				//등록날짜
	private String mbtiTypeSeq;			//MBTI유형번호(FK) 수정 => MBTI유형번호 대신
	private String mbti;				//MBTI 유형
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
	private int count;
	private String education;
	private String feedbackStatus; 		//피드백상태
	
	
	
	public String getFeedbackStatus() {
		return feedbackStatus;
	}
	public void setFeedbackStatus(String feedbackStatus) {
		this.feedbackStatus = feedbackStatus;
	}
	public String getMbtiTypeSeq() {
		return mbtiTypeSeq;
	}
	public void setMbtiTypeSeq(String mbtiTypeSeq) {
		this.mbtiTypeSeq = mbtiTypeSeq;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getMbti() {
		return mbti;
	}
	public void setMbti(String mbti) {
		this.mbti = mbti;
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
	
	
}//class JobAdvertisementDTO
