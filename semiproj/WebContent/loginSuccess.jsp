<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="again" method="POST">
	이름 : <%= request.getAttribute("name") %> <br>
	과목 : <%= request.getAttribute("subject") %><br>
	레벨 : <%= request.getAttribute("level") %><br>
	학년 : <%= request.getAttribute("grade") %><br>
	반 : <%= request.getAttribute("class") %><br>
	학생수 : <%= request.getAttribute("num") %><br>
<input type="submit" value = "로그아웃">
</form>
</body>
</html>