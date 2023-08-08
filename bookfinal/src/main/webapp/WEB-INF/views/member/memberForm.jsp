<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">

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



<script type="text/javascript">
  // Function to check for duplicated memberId using AJAX
  function fn_overlapped() {
    var memberId = $("#memberId").val();
    if (memberId === '') {
      return;
    }

    $.ajax({
      type: "post",
      async: false,
      url: "${contextPath}/member/overlapped.do",
      dataType: "text",
      data: { memberId: memberId }, // Corrected variable name here
      success: function (data, textStatus) {
        if (data === 'false') {
          $('#memberId').addClass("is-valid");
          $('#memberId').removeClass("is-invalid");
          $('.memberId-feedback.valid-feedback').removeClass("d-none");
          $('#memberId').val(memberId); // Corrected variable name here
        } else {
          $('#memberId').removeClass("is-valid");
          $('#memberId').addClass("is-invalid");
          $('.memberId-feedback.invalid-feedback').removeClass("d-none");
        }
      },
      error: function (data, textStatus) {
        alert("정보를 입력해주세요.");
      },
      complete: function (data, textStatus) {}
    });
  }

  // Function to check if the passwords match
  function memberPwChecking() {
    let memberPwWrite = $('.memberPwWrite');
    let memberPwCheck = $('.memberPwCheck');
    let memberPw_feedback = $('.memberPw-feedback.invalid-feedback');
    let memberPw_feedback_valid = $('.memberPw-feedback.valid-feedback');

    if (memberPwWrite.val() === "" || memberPwCheck.val() === "") {
      console.log("아무것도 입력되지 않음");
    } else {
      if (memberPwWrite.val() !== memberPwCheck.val()) {
        memberPwWrite.removeClass("is-valid").addClass("is-invalid");
        memberPwCheck.removeClass("is-valid").addClass("is-invalid");
        memberPw_feedback.removeClass("d-none").addClass("d-block");
        memberPw_feedback_valid.removeClass("d-block").addClass("d-none");
      } else {
        memberPwWrite.removeClass("is-invalid").addClass("is-valid");
        memberPwCheck.removeClass("is-invalid").addClass("is-valid");
        memberPw_feedback.addClass("d-none").removeClass("d-block");
        memberPw_feedback_valid.addClass("d-block").removeClass("d-none");
      }
    }
  }

  // Function to handle blur event on name and phone input fields
   function etcInput() {
    if ($(this).val() !== "") {
      $('.nameAndH1').removeClass("is-invalid");
      $('.allRequiredInputCheck').addClass('d-none');
    }
  }

  // Function to handle form submission
  function memberForm() {
    let isValid = true;

    // Check if all required inputs have a value
    $("input[required]").each(function () {
      if (!$(this).val()) {
        isValid = false;
        $(this).addClass("is-invalid");
      } else {
        $(this).removeClass("is-invalid");
        $('.allRequiredInputCheck').addClass('d-none');
      }
    });

    // Submit the form if all inputs are valid, else show an error message
    if (isValid) {
      $('#memberForm').submit();
    } else {
      $('.allRequiredInputCheck').removeClass('d-none');
    }
  }

  // Attach event listeners
  $(document).ready(function () {
    $('#memberId').on('blur', fn_overlapped);
    $('.memberPwWrite, .memberPwCheck').on('blur', memberPwChecking);
    $('.nameAndH1').on('blur', etcInput);
    $('#memberForm').on('submit', memberForm);
  });
</script>
</head>
<body class="text-center">

   <main class="form-signin w-100 m-auto">
      <form name="frmLogin" method="post" id="memberForm" action="${contextPath}/member/addMember.do">
         <img class="mb-4"
            src="${contextPath}/resources/img/Main.jpg" alt=""
            width="72" height="57">
         <h1 class="h3 mb-3 fw-normal">회원가입페이지</h1>
         
         <!-- 아이디  -->
         <div class="form-floating">
            <input name="member_id" type="text" class="form-control" minlength="3"
               id="floatingInput" placeholder="아이디" onblur="fn_overlapped()" required > 
            <label for="floatingInput">아이디</label>
            <div class="memberId-feedback valid-feedback text-start fs-07 d-none">
               사용가능한 아이디 입니다.</div>
            <div class="memberId-feedback invalid-feedback text-start fs-07 d-none">
               사용중인 아이디 입니다.</div>
            <div class="mb-3"></div>
         </div>
         <!-- 아이디  -->
         
         
         <!-- 비밀번호  -->
         <div class="form-floating">
            <input name="member_pw" type="text" class="form-control memberPwWrite" minlength="4"
               id="floatingPassword" placeholder="비밀번호" onblur="memberPwChecking()" required > 
            <label for="floatingPassword">비밀번호</label>
         </div>
         <div class="mb-3"></div>
         <div class="form-floating">
            <input name="member_pw1" type="text" class="form-control memberPwCheck" minlength="4"
               id="floatingPasswordConfirm" placeholder="비밀번호확인" onblur="memberPwChecking()" required > 
            <label for="floatingPasswordConfirm">비밀번호확인</label>
         </div>
         <div class="memberPw-feedback valid-feedback text-start fs-07 d-none">
            비밀번호가 일치합니다.</div>
         <div class="memberPw-feedback invalid-feedback text-start fs-07 d-none">
            비밀번호가 일치하지않습니다.</div>
         <!-- 비밀번호  -->
         
         <div class="mb-3"></div>
         
         
         <!-- 이름 -->
         <div class="form-floating">
            <input name="member_name" type="text" class="form-control" id="floatingInput"
               placeholder="이름" required oninput="etcInptut()"> 
            <label for="floatingInput">이름</label>
         </div>
         <!-- 이름 -->
         
         <div class="mb-3"></div>
         
         <!-- 휴대폰번호 -->
         <div class="form-floating">
            <input name="hp1" type="text" class="form-control" id="floatingInput" minlength="11" 
               placeholder="휴대폰번호" required oninput="etcInptut()">
            <label for="floatingInput">휴대폰번호</label>
         </div>
         <!-- 휴대폰번호 -->
         
         <div class="mb-3"></div>
         


         <div class="d-flex justify-content-between">
            <button class="w-100 btn btn-lg btn-primary" type="submit" onClick="memberForm()">회원가입</button>
         </div>
      </form>
   </main>
</body>
</html>