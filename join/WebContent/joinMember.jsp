<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h3><%=request.getAttribute("userName") %>님 회원가입 축하드립니다:)
	</h3>

	<table>
		<tr>
			<td>아이디 :</td>
			<td><%=request.getAttribute("userId") %></td>
		</tr>
		<tr>
			<td>성별 :</td>
			<td><%=request.getAttribute("userGender") %></td>
		</tr>
		<tr>
			<td>생년월일 :</td>
			<td><%=request.getAttribute("userBirth") %></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><%=request.getAttribute("userEmail") %></td>
		</tr>
	</table>
	
	<a href="Main.jsp"><input type="button" value="메인으로"></a>

</body>
</html>