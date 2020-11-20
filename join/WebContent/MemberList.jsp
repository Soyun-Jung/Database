<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, tr, td, th {
	border: 1px solid black;
	border-collapse: collapse;
}

tr, td, th {
	padding: 5px;
}
</style>
</head>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>상세조회</th>
			<th>탈퇴</th>
		</tr>
		<c:forEach items="${List}" var="mem">
		<tr>
			<td>${mem.getUserId()}</td>
			<td>${mem.getUserName()}</td>
			<td>${mem.getUserGender()}</td>
			<td>${mem.getUserBirth().substring(0,10)}</td>
			<td>${mem.getUserEmail()}</td>
			<td>상세조회</td>
			<td>탈퇴</td>
		</tr>
		</c:forEach>
		<tr>
	</table>
	
	<a href="Main.jsp"><input type="button" value="메인으로"></a>
</body>
</html>