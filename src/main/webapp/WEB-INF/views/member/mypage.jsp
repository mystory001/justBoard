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
<h1>내 정보</h1>
<input type="text" name="id" readonly="readonly"><br> <%-- 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능 --%>
<input type="password" name="pw" required="required" placeholder="비밀번호"><br> <%-- 영문 대/소문자, 숫자, 특수문자를 사용 --%>
<input type="password" required="required" placeholder="비밀번호재확인"><br> <%-- 비밀번호를 다시 입력 --%>
<input type="text" name="name" required="required" placeholder="이름"> <%-- 한글, 영문만 입력 가능 --%>
<button>수정</button><button>탈퇴</button>
</div> <%-- content영역 div --%>
<jsp:include page="../inc/footer.jsp" />
</div> <%-- container 영역 div --%>
</body>
</html>