package desket.mypage.member.infomodify;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import desket.DBUtil;
import desket.dto.MemberDTO;

public class InfoModifyDAO {

	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;
	
	public InfoModifyDAO() {
		DBUtil util = new DBUtil();
		conn = util.connect();
	}//InfoModifyDAO()

	
//---------------------------------------------------------------------------------------------------------------	
	//수정정보 업데이트
	public int editInfo(MemberDTO dto, String id) {
		
		try {

			String sql = "update tblMember set name = ?, birth = ?, gender = ?, tel = ?, email = ?, address = ?, pic = ? where id = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getName());
			stat.setString(2, dto.getBirth());
			stat.setString(3, dto.getGender());
			stat.setString(4, dto.getTel());
			stat.setString(5, dto.getEmail());
			stat.setString(6, dto.getAddress());
			stat.setString(7, dto.getPic());
			stat.setString(8, id);
				
			return stat.executeUpdate();

		} catch (Exception e) {
			System.out.println("InfoModifyDAO.editInfo : " + e.toString());
		}
		return 0;
	}//editInfo(dto)
//---------------------------------------------------------------------------------------------------------------	
	
	
	
	
	
	
	
	
	
	
}//class InfoModifyDAO





























