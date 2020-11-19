package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Dao {
	
	private static Dao dao;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	

	public static Dao getInstance() {
		
		if(dao==null) {
			dao=new Dao();
		}
		
		return dao;
	}

	public void setConnection(Connection con) {
		this.con = con;
		
	}

	public boolean checkID(String ID, String PW) {
		
		boolean isEmployee = false;
		String sql = "SELECT COUNT(*) AS ISTECODE FROM TE WHERE TE_CODE = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, ID);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				isEmployee = (rs.getInt("ISTECODE") == 1)? true : false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isEmployee;
	}

	public boolean checkPW(String iD, String pW) {
		boolean isAccess = false;
		String sql = "SELECT COUNT(*) AS ISACCESS FROM TE WHERE TE_CODE = ? AND TE_PWD = ? ";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, iD);
			pstmt.setNString(2, pW);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				isAccess = (rs.getInt("ISACCESS") == 1)? true : false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isAccess;
	}

	public void getUserInfo(TeacherInfoBean tib) {
		
		String sql = "SELECT TE_NAME AS TENAME, SU_NAME AS SUNAME, TE_LEVEL AS TELEVEL, TE_GRCODE AS GRCODE, TE_CLCODE AS CLCODE, COUNT(ST_CLCODE) AS CLNUM FROM TE INNER JOIN SU ON TE_SUCODE=SU_CODE INNER JOIN ST ON TE_GRCODE=ST_GRCODE AND TE_CLCODE=ST_CLCODE WHERE TE_GRCODE = ? AND TE_CLCODE=? GROUP BY TE_NAME, SU_NAME,TE_LEVEL,TE_GRCODE,TE_CLCODE,ST_CLCODE";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tib.getTeGrade());
			pstmt.setInt(2, tib.getTeClass());

			rs = pstmt.executeQuery();
			while(rs.next()) {
				tib.setTeName(rs.getNString("TENAME"));
				tib.setTeSub(rs.getNString("SUNAME"));
				tib.setTeLevel(rs.getNString("TELEVEL"));
				tib.setTeGrade(rs.getInt("GRCODE"));
				tib.setTeClass(rs.getInt("CLCODE"));
				tib.setClNum(rs.getInt("CLNUM"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	public void getteacherInfo(String iD, String pW, TeacherInfoBean tib2) {
		
		String sql = "select te_grcode as GRCODE, te_clcode as CLCODE from te where te_code=? and te_PWD=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, iD);
			pstmt.setNString(2, pW);

			rs = pstmt.executeQuery();

			while(rs.next()) {
			tib2.setTeGrade(rs.getInt("GRCODE"));
			tib2.setTeClass(rs.getInt("CLCODE"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
