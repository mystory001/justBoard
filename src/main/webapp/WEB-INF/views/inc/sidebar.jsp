<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.sidebar{
	float : left;
	width: 200px;
	height: 500px;
}
</style>
<body>
<div class="sidebar"> <%-- sidebar 영역 div --%>
<ul>
<li><a href="${pageContext.request.contextPath }/">홈 화면</a></li> 
<li><a href="${pageContext.request.contextPath }/board/list">글 목록</a></li> 
</ul>
</div> <%-- sidebar 영역 div --%>
</body>
</html>