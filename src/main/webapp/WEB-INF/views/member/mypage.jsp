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
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<body>
<div class="container"> <%-- container 영역 div --%>

<jsp:include page="../inc/top.jsp" />

<jsp:include page="../inc/sidebar.jsp" />

<div class="content"> <%-- content영역 div --%>
<h1>내 정보</h1>
<form method="post">
<input type="text" name="id" value="${sessionScope.id }" readonly="readonly"><br> <%-- 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능 --%>
<input type="password" name="pw" id="pw" required="required" placeholder="비밀번호"><br> <%-- 영문 대/소문자, 숫자, 특수문자를 사용 --%>
<input type="password" id="pw2" required="required" placeholder="비밀번호재확인"><br> <%-- 비밀번호를 다시 입력 --%>
<input type="text" name="name" value="${sessionScope.name}" required="required"><br> <%-- 한글, 영문만 입력 가능 --%>
<sub>회원 수정은 비밀번호를 바꿀 수 있습니다.<br>
'비밀번호'를 변경하기 위해서는 변경할 비밀번호와 변경할 비밀번호 재확인을 입력해주길 바랍니다.</sub><br>
<button type="submit" onclick="return passwordPass()" formaction="${pageContext.request.contextPath }/member/updatePro">수정</button>
<button type="submit" onclick="return passwordPass()" formaction="${pageContext.request.contextPath }/member/deletePro">탈퇴</button>
</form>
<a href="${pageContext.request.contextPath }/"><button>돌아가기</button></a>
</div> <%-- content영역 div --%>
<jsp:include page="../inc/footer.jsp" />
</div> <%-- container 영역 div --%>
<script type="text/javascript">
function passwordPass(){
	var pw = document.getElementById("pw");
	var pw2 = document.getElementById("pw2");
	
	if(pw && pw2){
		var pass = pw.value;
		var passConfirm = pw2.value;
		
		if(pass !== passConfirm){
			alert("비밀번호가 일치하지 않습니다.");
			pw.focus();
			return false;
		}
	}
	return true;
}
</script>
</body>
</html>