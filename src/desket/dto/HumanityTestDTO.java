package desket.dto;

public class HumanityTestDTO {

	private String seq;					//번호(PK)
	private String questionTypeSeq;		//유형번호(FK)
	private String question;			//문제
	private String pic;					//보기 그림  
	private String answer;				//정답
	private String one;					//객관식 번호
	private String two;
	private String three;
	private String four;
	private int score;					//평가 점수
	private int confidence;				//신뢰도
	
	
	public String getOne() {
		return one;
	}
	public void setOne(String one) {
		this.one = one;
	}
	public String getTwo() {
		return two;
	}
	public void setTwo(String two) {
		this.two = two;
	}
	public String getThree() {
		return three;
	}
	public void setThree(String three) {
		this.three = three;
	}
	public String getFour() {
		return four;
	}
	public void setFour(String four) {
		this.four = four;
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
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
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
