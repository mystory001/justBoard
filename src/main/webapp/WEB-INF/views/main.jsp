<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- 반응형 웹 viewport → head태그 사이에 작성 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>그냥 게시판</title>
</head>
<style>
.container{
	align-content : center;
	width: 1200px;
	height: 600px;
}

.header{
	float : right;
	width: 1200px;
	height: 0px;
}

.sidebar{
	float : left;
	width: 200px;
	height: 500px;

}

.content{
	width: 1000px;
	height: 600px;
}

.footer{
	float : right;
	width: 1200px;
	height: 0px;
}
</style>
<body>
<div class="container"> <%-- container 영역 div --%>

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

<div class="sidebar"> <%-- sidebar 영역 div --%>
<ul>
<li><a href="#">게시판</a></li> 
<li><a href="#">내 정보</a></li>
</ul>
</div> <%-- sidebar 영역 div --%>

<div class="content"> <%-- content영역 div --%>
 내용은 여기에
</div> <%-- content영역 div --%>
<hr>
<div class="footer"> <%-- footer 영역 div --%>
<span style="float: right;">시작 날짜 : 2024.09.19 / 끝낸 날짜 : 2024.?.? / 만든이 : 001cloudid</span>
</div> <%-- footer 영역 div --%>
</div> <%-- container 영역 div --%>
</body>
</html>