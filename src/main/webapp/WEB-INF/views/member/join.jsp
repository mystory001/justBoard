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
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<body>
<div class="container"> <%-- container 영역 div --%>

<jsp:include page="../inc/top.jsp" />

<jsp:include page="../inc/sidebar.jsp" />

<div class="content"> <%-- content영역 div --%>
<h1>회원가입</h1>
<form action="${pageContext.request.contextPath}/member/joinPro" method="post" id="join" onsubmit="return formCheck()">
<div class="formstyle">
<input type="text" name="id" id="id" required="required" placeholder="아이디"><br> <%-- 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능 --%>
<input type="password" name="pw" id="pw" required="required" placeholder="비밀번호"><br> <%-- 영문 대/소문자, 숫자, 특수문자를 사용 --%>
<input type="password" id="pw2" required="required" placeholder="비밀번호재확인"><br> <%-- 비밀번호를 다시 입력 --%>
<input type="text" name="name" required="required" placeholder="이름"> <%-- 한글, 영문만 입력 가능 --%>
</div>
<div class="validation"><b></b></div> <%-- 유효성 검사 시 유효성에 일치않을 때 --%>
<input type="submit" value="회원가입"> 
</form>
</div> <%-- content영역 div --%>
<jsp:include page="../inc/footer.jsp" />
</div> <%-- container 영역 div --%>

<script type="text/javascript">
<%-- 비밀번호와 비밀번호 재확인 --%>
function passwordPass() {
    var pw = document.getElementById("pw");
    var pw2 = document.getElementById("pw2");

    if (pw && pw2) {
        var password = pw.value;
        var confirmPassword = pw2.value;

        if (password !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            pw2.focus(); // 비밀번호 재확인 필드에 포커스
            return false; // 검증 실패
        }
    }
    return true; // 검증 성공
}

<%-- 정규표현식(RegExp). RegExp() : 정규표현식 표시 함수. RegExp(/정규표현식내용/) --%>
function regExp() {
    var id = document.getElementById("id");
    var idRegExp = /^[a-z0-9]{2,20}$/; // 영소문자 + 숫자가 하나 이상 포함되며 2~20자

    if (!idRegExp.test(id.value)) {
        alert("아이디 형식은 영소문자, 숫자로만 가능하며 2~20자까지 가능");
        id.focus(); // 아이디 필드에 포커스
        return false; // 검증 실패
    }
    return true; // 검증 성공
}

function formCheck(){
    var validId = regExp();
    var validPw = passwordPass();

    if(validId && validPw) {
        return true; // 모든 검증 통과, 폼 제출
    } else {
        alert("형식에 맞게 작성해주세요");
        return false; // 검증 실패, 폼 제출 중지
    }
}
</script>
</body>
</html>