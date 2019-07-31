package desket.mypage.enterprise;

public class FeedbackMBTIDTO {
	
	private String seq;
	private String mtSeq;
	private String type;
	private String ei;
	private String sn;
	private String tf;
	private String jp;
	private String question;
	private int score;
	private int confidence;
	private int passRate;
	private int complianceRate;
	private int allComplianceRate;
	
	
	
	public String getMtSeq() {
		return mtSeq;
	}
	public void setMtSeq(String mtSeq) {
		this.mtSeq = mtSeq;
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
	public String getEi() {
		return ei;
	}
	public void setEi(String ei) {
		this.ei = ei;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public String getTf() {
		return tf;
	}
	public void setTf(String tf) {
		this.tf = tf;
	}
	public String getJp() {
		return jp;
	}
	public void setJp(String jp) {
		this.jp = jp;
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
