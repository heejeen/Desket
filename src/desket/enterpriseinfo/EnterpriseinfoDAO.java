package desket.enterpriseinfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import desket.DBUtil;
import desket.dto.EnterpriseInfoCommentDTO;

public class EnterpriseinfoDAO {
	
	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;
	
	public EnterpriseinfoDAO() {
		
		DBUtil util = new DBUtil();
		conn = util.connect();		
	}

	
	
	public ArrayList<EnterpriseListDTO> eiList() {

		try {

			String sql = "SELECT seq, logo, name, field, scale, establishyear, years FROM vwEnterpriseList";
			
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			
			ArrayList<EnterpriseListDTO> list = new ArrayList<EnterpriseListDTO>();
			
			while (rs.next()) {
				
				EnterpriseListDTO dto = new EnterpriseListDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setLogo(rs.getString("logo"));
				dto.setName(rs.getString("name"));
				dto.setField(rs.getString("field"));
				dto.setScale(rs.getString("scale"));
				dto.setEstablishyear(rs.getString("establishyear"));
				dto.setYears(rs.getString("years"));
				
				list.add(dto);
			}
			
			return list;

		} catch (Exception e) {

			System.out.println("EnterpirseinfoDAO.eiList : " + e.toString());
		}
		
		return null;
	}
	


	public EnterpriseViewDTO eiView(String seq) {
		
		try {

			String sql = "SELECT seq, logo, name, field, scale, establishyear, introduction, homepage, employeenumber, address, tel, lat, lng, years FROM vwEnterpriseInfoView WHERE seq = ?";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, seq);
			rs = stat.executeQuery();
			
			if (rs.next()) {
				
				EnterpriseViewDTO dto = new EnterpriseViewDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setLogo(rs.getString("logo"));
				dto.setName(rs.getString("name"));
				dto.setField(rs.getString("field"));
				dto.setScale(rs.getString("scale"));
				dto.setEstablishyear(rs.getString("establishyear"));
				dto.setIntroduction(rs.getString("introduction"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setEmployeenumber(rs.getString("employeenumber"));
				dto.setAddress(rs.getString("address"));
				dto.setTel(rs.getString("tel"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setYears(rs.getString("years"));
				
				return dto;
			}
			
			return null;
			
		} catch (Exception e) {

			System.out.println("EnterpriseinfoDAO.java.eiView : " + e.toString());
		}
		
		return null;
	}



	public ArrayList<EnterpriseInfoCommentDTO> eiComment(String seq) {

		try {

			String sql = "SELECT seq, enterpriseinfoseq, content, writer, regdate FROM tblEnterpriseInfoComment WHERE enterpriseinfoseq = ? ORDER BY regdate DESC";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			rs = stat.executeQuery();
			
			ArrayList<EnterpriseInfoCommentDTO> list = new ArrayList<EnterpriseInfoCommentDTO>();
			
			while (rs.next()) {
				
				EnterpriseInfoCommentDTO dto = new EnterpriseInfoCommentDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setEnterpriseinfoseq(rs.getString("enterpriseinfoseq"));
				dto.setContent(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setRegdate(rs.getString("regdate").substring(0, 16));
				
				list.add(dto);
			}
			
			return list;
			

		} catch (Exception e) {

			System.out.println("EnterpriseinfoDAO.java.eiComment : " + e.toString());
		}
		
		return null;
	}



	public int addComment(EnterpriseInfoCommentDTO dto) {
		
		try {

			String sql = "INSERT INTO tblEnterpriseInfoComment (seq, enterpriseinfoseq, content, writer, regdate) "
							+ "VALUES (enterpriseInfoComment_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getEnterpriseinfoseq());
			stat.setString(2, dto.getContent());
			stat.setString(3, dto.getWriter());
			
			return stat.executeUpdate();

		} catch (Exception e) {

			System.out.println("EnterpriseinfoDAO.addComment : " + e.toString());
		}
		
		return 0;
	}



	public FinanceDTO finance(String seq, String table) {
		
		try {

			String sql = "SELECT fifteenth, sixteenth, seventeenth, eighteenth FROM "+ table +" WHERE enterpriseinfo_seq = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			rs = stat.executeQuery();
			
			if (rs.next()) {
				
				FinanceDTO dto = new FinanceDTO();
				
				dto.setFifteenth(rs.getFloat("fifteenth"));
				dto.setSixteenth(rs.getFloat("sixteenth"));
				dto.setSeventeenth(rs.getFloat("seventeenth"));
				dto.setEighteenth(rs.getFloat("eighteenth"));
				
				return dto;
			}
			
			return null;

		} catch (Exception e) {

			System.out.println("EnterpriseinfoDAO.finance : " + e.toString());
		}
		
		return null;
	}



	public int delComment(String seq) {
		
		try {

			String sql = "DELETE FROM tblEnterpriseInfoComment WHERE seq = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			return stat.executeUpdate();

		} catch (Exception e) {

			System.out.println("EnterpriseinfoDAO.delComment : " + e.toString());
		}
				
		return 0;
	}



	public int editComment(EnterpriseInfoCommentDTO dto) {

		try {

			String sql = "UPDATE tblEnterpriseInfoComment SET content = ? WHERE seq = ?";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getContent());
			stat.setString(2, dto.getSeq());
			
			return stat.executeUpdate();

		} catch (Exception e) {

			System.out.println("EnterpriseinfoDAO.editComment : " + e.toString());
		}
		
		return 0;
	}
	
}
