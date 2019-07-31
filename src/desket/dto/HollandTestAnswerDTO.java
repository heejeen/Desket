package desket.dto;

public class HollandTestAnswerDTO {
	
	private String seq;			//번호(PK)
	private String paperseq;	//홀랜드검사 문제지 번호(FK)
	private String resumeseq;	//이력서 번호(FK)
	private String answer;		//지원자 답변
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getPaperseq() {
		return paperseq;
	}
	public void setPaperseq(String paperseq) {
		this.paperseq = paperseq;
	}
	public String getResumeseq() {
		return resumeseq;
	}
	public void setResumeseq(String resumeseq) {
		this.resumeseq = resumeseq;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
