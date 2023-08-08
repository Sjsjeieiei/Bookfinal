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

	
    <main class="form-signin w-300 m-auto" style="max-width: 300px;">
        <form name="member_id" method="post" id="memberForm" action="${contextPath}/member/login.do" method="post">
            <img class="mb-4" src="${contextPath}/resources/img/book1.png" alt="" width="72" height="57">
            <h1 class="h3 mb-3 fw-normal">로그인페이지</h1>

            <div class="form-floating mb-3">
                <input type="text" name="member_id" class="form-control" id="floatingInput" placeholder="아이디">
                <label for="floatingInput">아이디</label>
            </div>

            <div class="form-floating mb-3">
                <input type="password" name="member_pw" class="form-control" id="floatingPassword" placeholder="비밀번호">
                <label for="floatingPassword">비밀번호</label>
            </div>

            <div class="allRequiredInputCheck invalid-feedback text-start fs-07 mb-3 d-none">
                모든 정보를 입력해주세요.
            </div>

            <div class="d-flex justify-content-between">
                <button type="submit" name="loginButton" class="btn btn-main rounded-0 w-100 d-block fw-bold p-2 lh-lg mb-3">로그인</button>
            </div>

            <div class="mb-3"></div>

            <div class="d-flex justify-content-between">
                <button class="btn btn-main rounded-0 w-100 d-block fw-bold p-2 lh-lg mb-3" type="reset">다시입력</button>
                <button class="btn btn-main rounded-0 w-100 d-block fw-bold p-2 lh-lg mb-3">
                    <a style="color: white; text-decoration: none;" href="${contextPath}/member/memberForm.do">회원가입</a>
                </button>
            </div>
        </form>
    </main>
</body>
</html>
