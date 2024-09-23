<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그냥 게시판</title>
</head>
<style>
.formstyle{
	width : 400px;
	
}
.label{
	width : 200px;
}
.validation{
	widows: 200px;
	height: 30px;
}
</style>
<body>
<h1>회원가입</h1>
<form action="${pageContext.request.contextPath}/member/joinPro" method="post">
<div class="formstyle">
<input type="text" name="id" required="required" placeholder="아이디"><br> <%-- 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능 --%>
<input type="password" name="pw" required="required" placeholder="비밀번호"><br> <%-- 영문 대/소문자, 숫자, 특수문자를 사용 --%>
<input type="password" required="required" placeholder="비밀번호재확인"><br> <%-- 비밀번호를 다시 입력 --%>
<input type="text" name="name" required="required" placeholder="이름"> <%-- 한글, 영문만 입력 가능 --%>
</div>
<div class="validation"><b></b></div> <%-- 유효성 검사 시 유효성에 일치않을 때 --%>
<input type="submit" value="회원가입"> 
</form>
</body>
</html>