package desket.dto;

public class QuestionTypeDTO {

	private String seq;				//번호(PK)
	private String questionType;	//문제 유형
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	
}
