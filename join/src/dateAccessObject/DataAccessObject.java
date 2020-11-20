package dateAccessObject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MemberDTO;


public class DataAccessObject {

	private static DataAccessObject dao;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	

	public static DataAccessObject getInstance() {
		
		if(dao==null) {
			dao=new DataAccessObject();
		}
		
		return dao;
	}
	
	//setConnection ¸Å¼­µå
	public void setConnection(Connection con) {
		this.con = con;
	}

	public int putUserInfo(MemberDTO uib) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO USERINFO(USERID, USERPW, USERNAME, USERBIRTH, USERGENDER, USEREMAIL) VALUES( ? , ? , ? ,TO_DATE( ? ,'YYYY-MM-DD'), ? , ? )";
		
		int daoResult = 0;
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setNString(1, uib.getUserId());
			pstmt.setNString(2, uib.getUserPw());
			pstmt.setNString(3, uib.getUserName());
			pstmt.setNString(4, uib.getUserBirth());
			pstmt.setNString(5, uib.getUserGender());
			pstmt.setNString(6, uib.getUserEmail());
			
			daoResult=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return daoResult;
		
	}

	public void getMemberList(ArrayList<MemberDTO> memberList) {
		// TODO Auto-generated method stub
		String sql = "SELECT USERID AS ID, USERNAME AS NAME, USERBIRTH AS BIRTH, USERGENDER AS GENDER, USEREMAIL AS EMAIL FROM USERINFO ORDER BY USERNAME";

		try {
			pstmt = con.prepareStatement(sql);
//			query.setNString(1, uib.getStcode());
//			query.setNString(2, uib.getEmployeeCode());
//
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO user = new MemberDTO();
				user.setUserId(rs.getNString("ID"));
				user.setUserName(rs.getNString("NAME"));
				user.setUserBirth(rs.getNString("BIRTH"));
				user.setUserGender(rs.getNString("GENDER"));
				user.setUserEmail(rs.getNString("EMAIL"));
				
				memberList.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
