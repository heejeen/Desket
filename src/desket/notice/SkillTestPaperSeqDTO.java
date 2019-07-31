package desket.notice;

public class SkillTestPaperSeqDTO {

	private int minSeq;		//특정 공고의 기술검사 문제의 가장 작은 번호
	private int maxSeq;		//특정 공고의 기술검사 문제의 가장 큰 번호

	public int getMinSeq() {
		return minSeq;
	}
	public void setMinSeq(int minSeq) {
		this.minSeq = minSeq;
	}
	public int getMaxSeq() {
		return maxSeq;
	}
	public void setMaxSeq(int maxSeq) {
		this.maxSeq = maxSeq;
	}
	
}
