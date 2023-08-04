<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>Signin Template · Bootstrap v5.2</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/sign-in/">

<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.form-signin {
	max-width: 330px;
	padding: 15px;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>



<script>
		const form = document.getElementById("memberForm");
		const inputs = form.querySelectorAll("input[required]");
		var allRequiredInputCheck = document.querySelector('.allRequiredInputCheck');

		function login() {
			let isValid = true;
			inputs.forEach(input => {
				if (!input.value) {
					isValid = false;
					input.classList.add("is-invalid");
				} else {
					input.classList.remove("is-invalid");
					allRequiredInputCheck.classList.add('d-none');
				}
			});

			if (isValid) {
				form.submit();
			} else {
				allRequiredInputCheck.classList.remove('d-none');
			}
		}
	</script>
<c:if test='${not empty message }'>
	<script>
			window.onload = function() {
				alert("아이디나 비밀번호가 틀립니다. 다시 로그인해주세요");
			}
		</script>
</c:if>
</head>
<body class="text-center">

	<main class="form-signin w-100 m-auto">
		<form name="member_id" method="post" id="memberForm"
			action="${contextPath}/member/login.do" method="post">
			<img class="mb-4" src="${contextPath}/resources/img/Main.jpg" alt=""
				width="72" height="57">
			<h1 class="h3 mb-3 fw-normal">로그인페이지</h1>

			<div class="form-floating">
				<input type="text" name="member_id" class="form-control"
					id="floatingInput" placeholder="아이디"> <label
					for="floatingInput">아이디</label>
			</div>

			<div class="mb-3"></div>

			<div class="form-floating">
				<input type="password" name="member_pw" class="form-control"
					id="floatingPassword" placeholder="비밀번호"> <label
					for="floatingPassword">비밀번호</label>
			</div>

			<div
				class="allRequiredInputCheck invalid-feedback text-start fs-07 mb-3 d-none">
				모든 정보를 입력해주세요.</div>

			<div class="d-flex justify-content-between">
				<!-- 			<button class="w-100 btn btn-lg btn-primary" type="button" onclick="login()">로그인</button> -->
				<button type="submit" name="loginButton"
					class="w-100 btn btn-lg btn-primary" type="button">로그인</button>
			</div>

			<div class="mb-3"></div>

			<div class="d-flex justify-content-between">
				<button class="w-50 btn btn-lg btn-primary" type="reset">다시입력</button>
				<button class="w-50 btn btn-lg btn-primary">
					<a style="color: white; text-decoration: none;"
						href="${contextPath}/member/memberForm.do">회원가입</a>
				</button>
<%-- 	<button class="w-50 btn btn-lg btn-primary">
					<a style="color: white; text-decoration: none;"
						href="${contextPath}/member/naverlogin.do">네이버로그인</a>
				</button> --%>

			</div>
		</form>
	</main>
</body>
</html>
