<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="JoinController" method="POST">
		<table>
			<legend>회원가입</legend><br>
			
			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="userId"
					placeholder="15자 이내로 입력하세요."></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" name="userPw"
					placeholder="15자 이내로 입력하세요."></td>
			</tr>
			<tr>
				<td>이 름 :</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td>생년월일 :</td>
				<td><input type="date" name="userBirth"></td>
			</tr>
			<tr>
				<td>성별 :</td>
				<td>여자 <input type="radio" name="userGender" value="여자">
					남자 <input type="radio" name="userGender" value="남자"></td>
			</tr>
			<tr>
				<td>이메일 :</td>
				<td><input type="email" name="userEmail" placeholder="@ 꼭 포함"></td>
			</tr>
		</table>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>