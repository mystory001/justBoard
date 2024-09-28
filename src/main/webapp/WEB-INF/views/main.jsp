<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<jsp:include page="inc/top.jsp" />

<jsp:include page="inc/sidebar.jsp" />

<div class="content"> <%-- content영역 div --%>
<h1>게시물 목록</h1>
<table border="1">
<tr>
	<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
</tr>
<%-- 게시글 목록 --%>
</table>
<%-- 로그인이 되어 있을 때만 버튼이 보이게--%>
<c:if test="${! empty sessionScope.id }">
	<a href="${pageContext.request.contextPath }/board/insert"><button>글쓰기</button></a>
</c:if>
<%-- 페이지 목록 10개씩 10개의 페이지 --%>
<form method="get">
 <input type="text" name="search" value="검색">
 <input type="submit" value="검색하기">
 </form>

</div> <%-- content영역 div --%>
<jsp:include page="inc/footer.jsp" />
</div> <%-- container 영역 div --%>
</body>
</html>