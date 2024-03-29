<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- 리턴받은 message가 있을 경우 -->
<c:if test='${not empty message }'>
	<script>
	 window.onload=function(){alert("아이디나  비밀번호가 틀립니다. 다시 입력해주세요.");}
	</script>
</c:if>
<!-- 리턴받은 message가 있을 경우 -->

</head>
<body>

	<form action="${contextPath}/member/login" method="post"
		id="loginForm">

		<!-- id, password 입력 -->
		<input class="form-control form-control-lg rounded-0 mb-3"
			name="member_id" type="text" placeholder="아이디" required> 
			
		<input
			class="form-control form-control-lg rounded-0 mb-3" name="member_pw"
			type="password" placeholder="비밀번호" required>
		<!-- id, password 입력 -->


		<!-- 정보를 입력하지않고 로그인을 요청한 경우 show -->
		<div
			class="allRequiredInputCheck invalid-feedback text-start fs-07 mb-3 d-none">모든
			정보를 입력해주세요.</div>
		<!-- 정보를 입력하지않고 로그인을 요청한 경우 show -->


		<button type="button" onClick="loginwoopang()"
			class="btn btn-main rounded-0 w-100 d-block fw-bold p-2 lh-lg mb-3">로그인</button>

		<a
			class="btn border-main rounded-0 w-100 d-block fw-bold p-2 lh-lg mb-3"
			href="${contextPath}/member/join">회원가입</a>
<%--		<%--%>
<%--			String clientId = "zgZxB9u91uBYdyiEmro_";//애플리케이션 클라이언트 아이디값";--%>
<%--			String redirectURI = URLEncoder.encode("http://3.21.82.151:8080/woopang-1.0.0-BUILD-SNAPSHOT/main/main", "UTF-8");--%>
<%--			SecureRandom random = new SecureRandom();--%>
<%--			String state = new BigInteger(130, random).toString();--%>
<%--			String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"--%>
<%--					+ "&client_id=" + clientId--%>
<%--					+ "&redirect_uri=" + redirectURI--%>
<%--					+ "&state=" + state;--%>
<%--			session.setAttribute("state", state);--%>
<%--		%>--%>
<%--		<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>--%>


	</form>

	<script>
	const form = document.getElementById("loginForm");
	const inputs = form.querySelectorAll("input[required]");
	var allRequiredInputCheck = document.querySelector('.allRequiredInputCheck');

	
	//로그인을 클릭한 경우
	function loginwoopang(){
		
	    let isValid = true;
	    //required인 input들을 모두 foreach
	    inputs.forEach(input => {
	    	//입력값이 없을때 유효하지 않은 입력을 표시하기 위해 스타일을 변경, is-invalid class add
	        if (!input.value) {
	          isValid = false;
	          input.classList.add("is-invalid");
	        } else {//외 의 경우 초기화.
	          input.classList.remove("is-invalid");
	          allRequiredInputCheck.classList.add('d-none');
	        }
	      });
	    
	 	//모든 입력이 유효하면 폼을 제출
	    if (isValid) {form.submit();}
	 	//외의 경우 안내글 show
	    else {allRequiredInputCheck.classList.remove('d-none');}
	 	
	}
	</script>

</body>
</html>