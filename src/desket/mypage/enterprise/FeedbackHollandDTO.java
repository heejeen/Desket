package desket.mypage.enterprise;

public class FeedbackHollandDTO {
	
	private String seq;
	private String htSeq;
	private String type;
	private String holland;
	private String question;
	private int score;
	private int confidence;
	private int passRate;
	private int complianceRate;
	private int allComplianceRate;
	
	
	
	public String getHtSeq() {
		return htSeq;
	}
	public void setHtSeq(String htSeq) {
		this.htSeq = htSeq;
	}
	public int getAllComplianceRate() {
		return allComplianceRate;
	}
	public void setAllComplianceRate(int allComplianceRate) {
		this.allComplianceRate = allComplianceRate;
	}
	public int getComplianceRate() {
		return complianceRate;
	}
	public void setComplianceRate(int complianceRate) {
		this.complianceRate = complianceRate;
	}
	public int getPassRate() {
		return passRate;
	}
	public void setPassRate(int passRate) {
		this.passRate = passRate;
	}
	public String getHolland() {
		return holland;
	}
	public void setHolland(String holland) {
		this.holland = holland;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getConfidence() {
		return confidence;
	}
	public void setConfidence(int confidence) {
		this.confidence = confidence;
	}
	
	
	
}
