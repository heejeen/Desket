package desket.dto;

// 입사인원수
public class JoinDTO {
	
	private String seq;				// 번호(PK)
	private int year;				// 년도
	private int firstQuarter;		// 1분기
	private int secondQuarter;		// 2분기
	private int thirdQuarter;		// 3분기
	private int fourthQuarter;		// 4분기
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getFirstQuarter() {
		return firstQuarter;
	}
	public void setFirstQuarter(int firstQuarter) {
		this.firstQuarter = firstQuarter;
	}
	public int getSecondQuarter() {
		return secondQuarter;
	}
	public void setSecondQuarter(int secondQuarter) {
		this.secondQuarter = secondQuarter;
	}
	public int getThirdQuarter() {
		return thirdQuarter;
	}
	public void setThirdQuarter(int thirdQuarter) {
		this.thirdQuarter = thirdQuarter;
	}
	public int getFourthQuarter() {
		return fourthQuarter;
	}
	public void setFourthQuarter(int fourthQuarter) {
		this.fourthQuarter = fourthQuarter;
	}

}
