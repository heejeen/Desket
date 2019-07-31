package desket.dto;

// 일대일문의
public class OneInquiryDTO {

	private String seq;				// 번호(PK)
	private String id;				// 아이디(FK)
	private String questionTitle;	// 질문제목
	private String questionContent;	// 질문내용
	private String questionDate;	// 질문날짜
	private String answerTitle;		// 답변제목
	private String answerContent;	// 답변내용
	private String answerDate;		// 답변날짜
	private String managerSeq;		// 관리자아이디(FK)
	
	
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
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public String getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(String questionDate) {
		this.questionDate = questionDate;
	}
	public String getAnswerTitle() {
		return answerTitle;
	}
	public void setAnswerTitle(String answerTitle) {
		this.answerTitle = answerTitle;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public String getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	public String getManagerSeq() {
		return managerSeq;
	}
	public void setManagerSeq(String managerSeq) {
		this.managerSeq = managerSeq;
	}
	
}
