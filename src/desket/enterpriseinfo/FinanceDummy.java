package desket.enterpriseinfo;

import java.util.Random;

public class FinanceDummy {
	
	public static void main(String[] args) {
		
		
		sales();
		
		//profit();
		
		//netincome();
		
		//totalasset();
		
	}
	
	

	private static void totalasset() {
		
		Random rnd = new Random();

		
		for (int i=1; i<=20; i++) {
			
			System.out.printf("INSERT INTO tblTotalAsset (seq, enterpriseinfo_seq, sixteenth, seventeenth, eighteenth, nineteenth) "
												+ "VALUES (totalAsset_seq.NEXTVAL, %d, %d.%04d, %d.%04d, %d.%04d, %d.%04d);\r\n"
																				, i
																				, rnd.nextInt(8) + 2 , rnd.nextInt(9999) + 1
																				, rnd.nextInt(5) + 5 , rnd.nextInt(9999) + 1
																				, rnd.nextInt(6) + 4 , rnd.nextInt(9999) + 1
																				, rnd.nextInt(3) + 7 , rnd.nextInt(9999) + 1);
		}		
	}



	private static void netincome() {
		
		Random rnd = new Random();

		
		for (int i=1; i<=20; i++) {
			
			System.out.printf("INSERT INTO tblNetIncome (seq, enterpriseinfo_seq, sixteenth, seventeenth, eighteenth, nineteenth) "
												+ "VALUES (netIncome_seq.NEXTVAL, %d, %d.%04d, %d.%04d, %d.%04d, %d.%04d);\r\n"
																				, i
																				, rnd.nextInt(9) + 1 , rnd.nextInt(9999) + 1
																				, rnd.nextInt(9) + 1 , rnd.nextInt(9999) + 1
																				, rnd.nextInt(9) + 1 , rnd.nextInt(9999) + 1
																				, rnd.nextInt(9) + 1 , rnd.nextInt(9999) + 1);
		}		
		
	}



	private static void profit() {
		
		Random rnd = new Random();

		
		for (int i=1; i<=20; i++) {
			
			System.out.printf("INSERT INTO tblProfit (seq, enterpriseinfo_seq, sixteenth, seventeenth, eighteenth, nineteenth) "
												+ "VALUES (profit_seq.NEXTVAL, %d, %d.%04d, %d.%04d, %d.%04d, %d.%04d);\r\n"
																				, i
																				, rnd.nextInt(9) + 1 , rnd.nextInt(9999) + 1
																				, rnd.nextInt(9) + 1 , rnd.nextInt(9999) + 1
																				, rnd.nextInt(9) + 1 , rnd.nextInt(9999) + 1
																				, rnd.nextInt(9) + 1 , rnd.nextInt(9999) + 1);
		}
		
	}



	private static void sales() {

		Random rnd = new Random();

		
		for (int i=1; i<=20; i++) {
			
			System.out.printf("INSERT INTO tblSales (seq, enterpriseinfo_seq, sixteenth, seventeenth, eighteenth, nineteenth) "
												+ "VALUES (sales_seq.NEXTVAL, %d, %d.%d, %d.%d, %d.%d, %d.%d);\r\n"
																				, i
																				, rnd.nextInt(120) + 80 , rnd.nextInt(9) + 1
																				, rnd.nextInt(100) + 100 , rnd.nextInt(9) + 1
																				, rnd.nextInt(130) + 70 , rnd.nextInt(9) + 1
																				, rnd.nextInt(100) + 100 , rnd.nextInt(9) + 1);
		}
		
	}

}
