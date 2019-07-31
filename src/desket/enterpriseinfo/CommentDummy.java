package desket.enterpriseinfo;

import java.util.Calendar;
import java.util.Random;

public class CommentDummy {
	
	public static void main(String[] args) {
		
		Random rnd = new Random();
		
		String[] id = {"qkrgjswjd100", "dkanro100", "rlfehd95", "dbsk100", "thdgml100", "yechan100", "wnduq100", "tkdals100", "gmlwls100", "gkska100", "qudgus100", "tpgns100", "dnwls100", "tjdwls100", "guscjf100", "ekgus100", "alsgml100", "ehdtjd100", "tkdgus100", "wjddk100", "wldus100"};
		
		Calendar c = Calendar.getInstance();
		c.set(Calendar.DATE, -30);
		
		
		for (int i=0; i<100; i++) {
		
		
		String result = String.format("INSERT INTO tblEnterpriseInfoComment (seq, enterpriseinfoseq, content, writer, regdate) " 
											+ "VALUES (enterpriseInfoComment_seq.NEXTVAL, %d, '%s', '%s', TO_DATE('%s %s', 'YYYY-MM-DD HH24:MI:SS'));"
														, rnd.nextInt(20) + 1
														, "내용"
														, id[rnd.nextInt(20)]
														, String.format("%tF", c)
														, String.format("%d:%d:%d", rnd.nextInt(24)+1, rnd.nextInt(60), rnd.nextInt(60)));
		c.add(Calendar.DATE, 1);
		
		System.out.println(result);
		}
		
		
		
	}

}
