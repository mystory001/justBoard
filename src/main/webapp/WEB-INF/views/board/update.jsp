<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>게시 글 수정</h1>
<form action="${pageContext.request.contextPath }/board/updatePro" method="post">
<input type="hidden" name="no" value="${boardDTO.no }">
<input type="text" name="id" value="${sessionScope.id }" readonly="readonly"><br>
<input type="text" name="subject" value="${boardDTO.subject }"><br>
<textarea rows="10" cols="50" name="content">${boardDTO.content }</textarea><br>
<input type="submit" value="수정하기"> <a href="${pageContext.request.contextPath }/board/content?no=${boardDTO.no}"><input type="button" value="뒤로가기"></a>
</form>
</div> <%-- content영역 div --%>
<jsp:include page="../inc/footer.jsp" />
</div> <%-- container 영역 div --%>
</body>
</html>