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
<h1>게시 글 작성</h1>
<form>
제목 : <input type="text" name="subject"><br>
내용 : <textarea rows="10" cols="100" ></textarea><br>
<input type="submit" value="작성하기">
</form>
</div> <%-- content영역 div --%>
<jsp:include page="../inc/footer.jsp" />
</div> <%-- container 영역 div --%>
</body>
</html>