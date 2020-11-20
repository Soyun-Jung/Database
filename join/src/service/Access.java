package service;

import java.sql.Connection;
import java.util.ArrayList;

import dateAccessObject.DataAccessObject;
import dateAccessObject.DataAccessObject.*;
import dto.MemberDTO;
import static dataBase.JdbcUtil.*;
public class Access {

	DataAccessObject dao = DataAccessObject.getInstance();
	Connection con = dataBase.JdbcUtil.getConnection();
	
	public Access() {
	}
	
	public boolean joinInfo(MemberDTO uib) {
		// TODO Auto-generated method stub
		
		boolean svc = false;
		
		dao.setConnection(con);
		
		if(dao.putUserInfo(uib)>0) {
			commit(con);
			svc=true;
			close(con);
		} else {
			close(con);
		}
		
		return svc;
	}

	public ArrayList<MemberDTO> getMemberList(ArrayList<MemberDTO> memberList) {
		// TODO Auto-generated method stub
		boolean svc = false;
		
		dao.setConnection(con);
		
		dao.getMemberList(memberList);
		
		return memberList;
	}

}
