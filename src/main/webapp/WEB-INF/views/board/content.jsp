<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그냥 게시판</title>
</head>
<style>
.container{
	align-content : center;
	width: 1200px;
	height: 600px;
}
.content{
	width: 1000px;
	height: 600px;
}
</style>
<body>
<div class="container"> <%-- container 영역 div --%>

<jsp:include page="../inc/top.jsp" />

<jsp:include page="../inc/sidebar.jsp" />

<div class="content"> <%-- content영역 div --%>
<h1>글 읽기</h1>
<table >
<tr><td>글번호</td><td>${boardDTO.no}</td></tr>
<tr><td>글쓴이</td><td>${boardDTO.id}</td></tr>
<tr><td>조회수</td><td>${boardDTO.readcount}</td></tr>
<tr><td>작성일</td><td>${boardDTO.writetime}</td></tr>
<tr><td>글제목</td><td>${boardDTO.subject}</td></tr>
<tr><td>글내용</td><td>${boardDTO.content}</td></tr>
</table>
<div style="display: center">
<c:if test="${!empty sessionScope.id }">
	<c:if test="${sessionScope.id eq boardDTO.id}">
<a href="${pageContext.request.contextPath}/board/update?no=${boardDTO.no}"><input type="button" value="글 수정"></a> <a href="${pageContext.request.contextPath}/board/delete?no=${boardDTO.no}"><input type="button" value="글 삭제"></a>
	</c:if>
</c:if>
<a href="${pageContext.request.contextPath}/board/list"><input type="button" value="글 목록"></a>
</div>
</div> <%-- content영역 div --%>
<jsp:include page="../inc/footer.jsp" />
</div> <%-- container 영역 div --%>
</body>
</html>