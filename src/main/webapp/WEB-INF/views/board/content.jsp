<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	height: 550px;
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
<tr><td>작성일</td><td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${boardDTO.writetime}"/></td></tr>
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
<hr>
<c:if test="${empty sessionScope.id }">
<p><b>댓글은 회원만 작성 및 확인 할 수 있습니다. 확인을 위해서 회원 가입해주세요.</b></p><br>
</c:if>
<c:if test="${!empty sessionScope.id }">
댓글<br>
<form action="${pageContext.request.contextPath}/board/replyInsertPro" method="post">
<input type="hidden" name="no" value="${boardDTO.no }">
<input type="hidden" name="id" value="${sessionScope.id }">
<input type="text" value="${sessionScope.id }" readonly="readonly"><br>
<textarea rows="5" cols="30" style="width: 792px; height: 35px" placeholder="내용을 작성해주세요." name="replyContent"></textarea><br>
<span style="float: right;"><input type="submit" value="작성"></span>
</form>
댓글 목록 <sub></sub><br>
    <c:if test="${empty replyList}">
        작성된 댓글이 없습니다.
    </c:if>
    <c:if test="${!empty replyList}">
        <table>
            <c:forEach var="replyDTO" items="${replyList}">
                <tr>
                  <td style="width: 1600px">내용: ${replyDTO.replyContent}</td>
                  <td style="width: 600px">작성시간: <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${replyDTO.replyWriteTime}" /></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
	    <div style="float: right;">
	    	<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	    		<a href="${pageContext.request.contextPath}/board/content?no=${boardDTO.no}&pageNum=${replyPageDTO.startPage - replyPageDTO.pageBlock}">Prev</a>
			</c:if>
	
			<c:forEach var="i" begin="${replyPageDTO.startPage}" end="${replyPageDTO.endPage}" step="1">
	    		<a href="${pageContext.request.contextPath}/board/content?no=${boardDTO.no}&pageNum=${i}">${i} </a>
			</c:forEach>
			<c:if test="${replyPageDTO.endPage < replyPageDTO.pageCount}">
		    	<a href="${pageContext.request.contextPath}/board/content?no=${boardDTO.no}&pageNum=${replyPageDTO.startPage + replyPageDTO.pageBlock}">Next</a>
			</c:if>
	    </div>
</c:if>

</div> <%-- content영역 div --%>
<jsp:include page="../inc/footer.jsp" />
</div> <%-- container 영역 div --%>
</body>
</html>