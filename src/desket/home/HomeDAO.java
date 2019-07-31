package desket.home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import desket.DBUtil;
import desket.dto.EnterpriseMemberDTO;
import desket.dto.MemberDTO;

public class HomeDAO {
	
	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;

	public HomeDAO() {
		DBUtil util = new DBUtil();
		conn = util.connect();

	}

	public EnterpriseMemberDTO getEnterprise(String id, String pw) {
		
		try {
			
			String sql = "select * from tblEnterpriseMember where id=? and pw=?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			stat.setString(2, pw);
			
			rs = stat.executeQuery();
			
			
			if(rs.next()) {
				EnterpriseMemberDTO dto = new EnterpriseMemberDTO();
				
				dto.setBusinessNumber(rs.getString("businessNumber"));
				dto.setEnterpriseName(rs.getString("enterpriseName"));
				dto.setId(rs.getString("id"));
				dto.setPic(rs.getString("pic"));
				dto.setPw(rs.getString("pw"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setStatus(rs.getString("status"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.getmember:"+ e.toString());
		}
		
		
		
		return null;
	}

	public MemberDTO getMember(String id, String pw) {
		
		try {
			
			String sql = "select * from tblmember where id=? and pw=?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			stat.setString(2, pw);
			
			rs = stat.executeQuery();
			
			
			if(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setAddress(rs.getString("address"));
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPic(rs.getString("pic"));
				dto.setPw(rs.getString("pw"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setStatus(rs.getString("status"));
				dto.setTel(rs.getString("tel"));
				
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("EnterpriseDAO.getmember:"+ e.toString());
		}
		
		
		
		
		return null;
	}
}
