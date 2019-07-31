package desket.mypage.enterprise;

public class FeedbackSkillDTO {

	private String seq;
	private String stSeq;
	private String questionTypeSeq;
	private String technicalCutline;
	private String question;
	private String answer;
	private int score;
	private int confidence;
	private int passRate;
	private int answerRate;
	private int allAnswerRate;
	
	
	
	public String getStSeq() {
		return stSeq;
	}
	public void setStSeq(String stSeq) {
		this.stSeq = stSeq;
	}
	public int getAllAnswerRate() {
		return allAnswerRate;
	}
	public void setAllAnswerRate(int allAnswerRate) {
		this.allAnswerRate = allAnswerRate;
	}
	public int getAnswerRate() {
		return answerRate;
	}
	public void setAnswerRate(int answerRate) {
		this.answerRate = answerRate;
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
	public String getQuestionTypeSeq() {
		return questionTypeSeq;
	}
	public void setQuestionTypeSeq(String questionTypeSeq) {
		this.questionTypeSeq = questionTypeSeq;
	}
	public String getTechnicalCutline() {
		return technicalCutline;
	}
	public void setTechnicalCutline(String technicalCutline) {
		this.technicalCutline = technicalCutline;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
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
