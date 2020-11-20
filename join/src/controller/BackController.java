package controller;

import java.util.ArrayList;

import dto.MemberDTO;
import service.Access;

public class BackController {
	private Access ac;
	
	public BackController() {	
		ac = new Access();
	}
	
	public String[] join(String[] userInfo) {
		// TODO Auto-generated method stub
		MemberDTO uib = new MemberDTO();
		uib.setUserId(userInfo[0]);
		uib.setUserPw(userInfo[1]);
		uib.setUserName(userInfo[2]);
		uib.setUserBirth(userInfo[3]);
		uib.setUserGender(userInfo[4]);
		uib.setUserEmail(userInfo[5]);
		
		if(ac.joinInfo(uib)) {
			userInfo[0] = uib.getUserId();
			userInfo[1] = uib.getUserName();
			userInfo[2] = uib.getUserGender();
			userInfo[3] = uib.getUserBirth();
			userInfo[4] = uib.getUserEmail();
		} else {userInfo[0]=null;}
		
		return userInfo;
	}

	public ArrayList<MemberDTO> getMemberList(ArrayList<MemberDTO> memberList) {
		// TODO Auto-generated method stub
		String[][] infoList =null;
		String[] record = null;
		
		ac.getMemberList(memberList);
		
//		infoList = new String[memberList.size()][];
//		for(int i=0;i<infoList.length;i++) {
//			record = new String[5];
//			record[0]=memberList.get(i).getUserId();
//			record[1]=memberList.get(i).getUserName();
//			record[2]=memberList.get(i).getUserGender();
//			record[3]=memberList.get(i).getUserBirth();
//			record[4]=memberList.get(i).getUserEmail();
//					
//			infoList[i]=record;
//					
//		}
		
		return memberList;
		
	}
	
	

}
