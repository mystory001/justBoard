<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.header{
	float : right;
	width: 1200px;
	height: 0px;
}
</style>
<body>
<div class="header"> <%-- header 영역 div --%>
<form method="post" action="${pageContext.request.contextPath}/loginPro">  <%-- post방식 --%>
<span style="float: right;">
아이디 : <input type="text" name="id">
비밀번호 : <input type="password" name="pw">
<button type="submit">로그인 </button><a href="${pageContext.request.contextPath}/member/join"><button type="button">회원가입</button></a>
</span>
</form>
</div><%-- header 영역 div --%><br>
<hr>
</body>
</html>