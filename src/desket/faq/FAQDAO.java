package desket.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import desket.DBUtil;
import desket.dto.FAQDTO;
import desket.dto.OneInquiryDTO;

public class FAQDAO {

	private Connection conn;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public FAQDAO() {
		
		DBUtil util = new DBUtil();
		conn = util.connect();
	}

	
	/**
	 * FAQ 게시글 목록 불러오기
	 * @return
	 */
	public ArrayList<FAQDTO> getFAQList() {

		try {
			
			String sql = "select * from tblFAQ order by seq desc";
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			ArrayList<FAQDTO> list = new ArrayList<FAQDTO>();
			
			while(rs.next()) {
				
				FAQDTO dto = new FAQDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				
				list.add(dto);
			}
			
			
			return list;
			
			
			
		} catch (Exception e) {
			System.out.println("FAQDAO.getFAQList : " + e.toString());
		}
		
		return null;
	}

	
	/**
	 * 1대1문의 게시글 목록 불러오기
	 * @param id 
	 * @return
	 */
	public ArrayList<OneInquiryDTO> getOneInquriyList(String id) {

		try {
			
			String sql = "select * from tblOneInquiry where id = ? order by seq desc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			ArrayList<OneInquiryDTO> list = new ArrayList<OneInquiryDTO>();
			
			while(rs.next()) {
				
				OneInquiryDTO dto = new OneInquiryDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setQuestionTitle(rs.getString("questionTitle"));
				dto.setQuestionContent(rs.getString("questionContent"));
				dto.setQuestionDate(rs.getString("questionDate"));
				dto.setAnswerTitle(rs.getString("answerTitle"));
				dto.setAnswerContent(rs.getString("answerContent"));
				dto.setAnswerDate(rs.getString("answerDate"));
				dto.setManagerSeq(rs.getString("managerSeq"));
				
				list.add(dto);
			}
			
			
			return list;
			
			
			
		} catch (Exception e) {
			System.out.println("FAQDAO.getOneInquriyList : " + e.toString());
		}

		return null;
	}


	/**
	 * 특정 번호의 1대1 문의 게시글 불러오기
	 * @param oiSeq : 1대1문의 게시글 번호
	 * @return
	 */
	public OneInquiryDTO getOneInquriyView(String oiSeq) {
		
		try {
			
			String sql = "select * from tblOneInquiry where seq = ? order by seq desc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, oiSeq);
			
			rs = pstat.executeQuery();
			
			OneInquiryDTO dto = new OneInquiryDTO();
			
			while(rs.next()) {
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setQuestionTitle(rs.getString("questionTitle"));
				dto.setQuestionContent(rs.getString("questionContent"));
				dto.setQuestionDate(rs.getString("questionDate"));
				dto.setAnswerTitle(rs.getString("answerTitle"));
				dto.setAnswerContent(rs.getString("answerContent"));
				dto.setAnswerDate(rs.getString("answerDate"));
				dto.setManagerSeq(rs.getString("managerSeq"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("FAQDAO.getOneInquriyView : " + e.toString());
		}
		
		
		return null;
	}


	public ArrayList<OneInquiryDTO> getAllOneInquriyList() {
		
		try {
			
			String sql = "select * from tblOneInquiry";
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			ArrayList<OneInquiryDTO> list = new ArrayList<OneInquiryDTO>();
			
			while(rs.next()) {
				
				OneInquiryDTO dto = new OneInquiryDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setQuestionTitle(rs.getString("questionTitle"));
				dto.setQuestionContent(rs.getString("questionContent"));
				dto.setQuestionDate(rs.getString("questionDate"));
				dto.setAnswerTitle(rs.getString("answerTitle"));
				dto.setAnswerContent(rs.getString("answerContent"));
				dto.setAnswerDate(rs.getString("answerDate"));
				dto.setManagerSeq(rs.getString("managerSeq"));
				
				list.add(dto);
			}
			
			
			return list;
			
			
			
		} catch (Exception e) {
			System.out.println("FAQDAO.getAllOneInquriyList : " + e.toString());
		}

		return null;
	}
	
	
	
}
