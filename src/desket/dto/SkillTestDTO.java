package desket.dto;

public class SkillTestDTO {

	private String seq;					//번호(PK)
	private String questionTypeSeq;		//유형번호(FK)
	private String question;			//문제
	private String answer;				//정답
	private int score;					//평가 점수
	private int confidence;				//신뢰도
	
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
