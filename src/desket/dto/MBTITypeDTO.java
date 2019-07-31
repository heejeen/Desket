package desket.dto;

// MBTI유형
public class MBTITypeDTO {
	
	private String seq;		// 번호(PK)
	private String EI;
	private String SN;
	private String TF;
	private String JP;
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getEI() {
		return EI;
	}
	public void setEI(String eI) {
		EI = eI;
	}
	public String getSN() {
		return SN;
	}
	public void setSN(String sN) {
		SN = sN;
	}
	public String getTF() {
		return TF;
	}
	public void setTF(String tF) {
		TF = tF;
	}
	public String getJP() {
		return JP;
	}
	public void setJP(String jP) {
		JP = jP;
	}
	
}
