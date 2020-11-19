package service;

import java.sql.Connection;
import java.util.ArrayList;

import dao.Dao;
import dao.TeacherInfoBean;

import static dao.Dao.*;
import static db.JdbcUtil.*;

public class Service {

	public boolean controllDB(String ID, String PW, TeacherInfoBean tib) {
		Dao dao=Dao.getInstance();
		boolean svc = false;
		Connection con = db.JdbcUtil.getConnection();
		dao.setConnection(con);

		if(dao.checkID(ID,PW)) {
			// 패스워드 일치여부 요청
			if(dao.checkPW(ID,PW)){	
				dao.getteacherInfo(ID,PW, tib);
				dao.getUserInfo(tib);
				commit(con);
				svc=true;
				close(con);
			} else {
				close(con);
			}
		}

return svc;

	}
}

