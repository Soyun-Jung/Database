<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="controlDB" method="POST">
        <fieldset>
            <legend>Log in</legend>
            <table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="sID"></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="sPW"></td>
                </tr>
            </table>
            
            <input type="submit" value="로그인">
        </fieldset>
    </form>	
</body>
</html>