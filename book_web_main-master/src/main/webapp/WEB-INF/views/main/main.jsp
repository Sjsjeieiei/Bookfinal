<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
    <style>
.bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(document).ready(function() {
		// 슬라이드 기능을 위한 탭 버튼을 선택합니다.
		var tabButtons = $('.hero .tab-content .tab-pane');

		// 첫 번째 탭 버튼을 활성화합니다.
		tabButtons.first().addClass('show active');

		// 탭 버튼들을 순환하여 일정 간격으로 활성화/비활성화합니다.
		var currentTabIndex = 0;
		var interval = 1000; // 각 슬라이드가 보여지는 시간 (1초)

		function activateNextTab() {
			tabButtons.eq(currentTabIndex).removeClass('show active');
			currentTabIndex = (currentTabIndex + 1) % tabButtons.length;
			tabButtons.eq(currentTabIndex).addClass('show active');
		}

		// 슬라이드 탭을 일정 간격으로 변경합니다.
		var slideInterval = setInterval(activateNextTab, interval);

		// 마우스 오버 시 슬라이드가 멈추도록 합니다.
		$('.hero').on('mouseenter', function() {
			clearInterval(slideInterval);
		}).on('mouseleave', function() {
			slideInterval = setInterval(activateNextTab, interval);
		});
	});
</script>

<!-- hero섹션, 광고영역 -->
<div class="hero" style="height: 450px">
	<div class="tab-content container h100 p-0 position-relative" id="">

		<!-- tabCaller 버튼영역 -->
		<a class="tab-pane show active d-block" id="hero01" role="tabpanel"
			aria-labelledby="hero1"
			href="${contextPath}/goods/goodsDetail.do?goods_id=1500"> <img
			src="${contextPath}/resources/img/hero/1.png" class="today-image"
			data-log-props="" data-adsplatform=""
			style="display: block; z-index: 1; position: absolute;">
		</a> <a class="tab-pane" id="hero02" role="tabpanel"
			aria-labelledby="hero2"
			href="${contextPath}/goods/goodsDetail.do?goods_id=1100"> <img
			src="${contextPath}/resources/img/hero/2.jpg" class="today-image"
			data-log-props="" data-adsplatform=""
			style="display: block; z-index: 1; position: absolute;">
		</a> <a class="tab-pane" id="hero03" role="tabpanel"
			aria-labelledby="hero3"
			href="${contextPath}/goods/goodsDetail.do?goods_id=200"> <img
			src="${contextPath}/resources/img/hero/3.jpg" class="today-image"
			data-log-props="" data-adsplatform=""
			style="display: block; z-index: 1; position: absolute;">
		</a> <a class="tab-pane" id="hero04" role="tabpanel"
			aria-labelledby="hero4"
			href="${contextPath}/goods/goodsDetail.do?goods_id=1300"> <img
			src="${contextPath}/resources/img/hero/4.jpg" class="today-image"
			data-log-props="" data-adsplatform=""
			style="display: block; z-index: 1; position: absolute;">
		</a> <a class="tab-pane" id="hero05" role="tabpanel"
			aria-labelledby="hero5"
			href="${contextPath}/goods/goodsDetail.do?goods_id=1600"> <img
			src="${contextPath}/resources/img/hero/5.png" class="today-image"
			data-log-props="" data-adsplatform=""
			style="display: block; z-index: 1; position: absolute;">
		</a>
		<!-- tabCaller 버튼영역 -->



		<!-- tab본문영역, caller 선택시 id값에 맞는 tab이 표출된다. -->
		<div
			class="list-group position-absolute top-50 end-0 translate-middle-y z-2 me-5 rounded-0"
			role="tablist">
			<a class="list-group-item list-group-item-action p-0 active"
				id="hero1" data-bs-toggle="list" href="#hero01" role="tab"
				aria-controls="hero01"> <img
				src="${contextPath}/resources/img/cate/1.png">
			</a> <a class="list-group-item list-group-item-action p-0" id="hero2"
				data-bs-toggle="list" href="#hero02" role="tab"
				aria-controls="hero02"> <img
				src="${contextPath}/resources/img/cate/2.png">
			</a> <a class="list-group-item list-group-item-action p-0" id="hero3"
				data-bs-toggle="list" href="#hero03" role="tab"
				aria-controls="hero03"> <img
				src="${contextPath}/resources/img/cate/3.png">
			</a> <a class="list-group-item list-group-item-action p-0" id="hero4"
				data-bs-toggle="list" href="#hero04" role="tab"
				aria-controls="hero04"> <img
				src="${contextPath}/resources/img/cate/4.png">
			</a> <a class="list-group-item list-group-item-action p-0" id="hero5"
				data-bs-toggle="list" href="#hero05" role="tab"
				aria-controls="hero05"> <img
				src="${contextPath}/resources/img/cate/5.png">
			</a>
		</div>
		<!-- tab본문영역, caller 선택시 id값에 맞는 tab이 표출된다. -->

	</div>
</div>
<!-- hero섹션, 광고영역 -->



<!-- sopang추천 광고영역 -->
<div class="container">
	<div class="row">
		<div class="d-flex p-0 align-items-center gap-3 mt-5">
			<p class="fs-3 fw-bold">오늘의 책</p>
			<p class="fs-6">| 오늘 북숍이 엄선한 베스트셀러 상품!</p>
		</div>
	</div>
	<div class="row border p-3">
		<div class="d-flex p-0 align-items-center gap-3 flex-wrap bestseller">
			<c:set var="goods_count" value="0" />
			<!-- goodsMap 상품리스트 중, goods_status의 값이  bestseller로 지정된 리스트만 추출해 뿌린다.  -->
			<c:forEach var="item" items="${goodsMap.bestseller}">
				<c:set var="goods_count" value="${goods_count+1 }" />
				<a class="back_eee position-relative"
					href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
					<img class="position-absolute top-50 start-50 translate-middle"
					src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
				</a>
			</c:forEach>
			<!-- goodsMap 상품리스트 중, goods_status의 값이  bestseller로 지정된 리스트만 추출해 뿌린다.  -->
		</div>
	</div>
</div>
<!-- sopang추천 광고영역 -->



<!-- sopang 카테고리 광고영역 -->
<div class="container">
	<div class="row">
		<div class="p-0 align-items-center gap-3 mt-5">
			<p class="fs-6 mb-1">HOT! TREND</p>
			<p class="fs-3 fw-bold">카테고리별 추천상품</p>
		</div>
	</div>

	<div class="row position-relative">


	<!-- <!-- 	tab Caller
 	<div
			class="list-group position-absolute bottom-0 start-0 z-2 rounded-0 mb-4"
			role="tablist" style="width: 150px">
			<a
				class="list-group-item list-group-item-action active btn mb-2 rounded-0 border-main samll"
				id="trend1" data-bs-toggle="list" href="#trend01" role="tab"
				aria-controls="trend01">문학</a> <a
				class="list-group-item list-group-item-action btn mb-2 rounded-0 border-main samll"
				id="trend2" data-bs-toggle="list" href="#trend02" role="tab"
				aria-controls="trend02">it</a> <a
				class="list-group-item list-group-item-action btn mb-2 rounded-0 border-main samll"
				id="trend3" data-bs-toggle="list" href="#trend03" role="tab"
				aria-controls="trend03">만화</a> <a
				class="list-group-item list-group-item-action btn mb-2 rounded-0 border-main samll"
				id="trend4" data-bs-toggle="list" href="#trend04" role="tab"
				aria-controls="trend04">웹툰</a>
		</div> -->

		<!-- tab 본문영역 -->
		<div class="tab-content border-top border-main border-2 p-0">









			<!-- 문학 -->
			<div class="tab-pane fade show active" id="trend01" role="tabpanel"
				aria-labelledby="trend1">
				<div class="d-flex justify-content-between">
					<div class="pt-4 pe-5 flex-grow-1 box-sixing-content"
						style="width: 200px">
						<a href="${contextPath}/goods/menuGoods.do?goodsSort=문학"
							class="text-decoration-none">
							<p class="fw-bold fs-4 mb-1">전체상품</p> <span class="small">보러가기
								> </span>
						</a>
					</div>
					<div class="position-relative">
						<img src="${contextPath}/resources/img/book.png"> <a
							href="${contextPath}/goods/menuGoods.do?goodsSort=it"
							class="btn btn-main rounded-0 position-absolute bottom-0 start-50 translate-middle z-2 rounded-0 py-3 w100 d-block"
							style="width: 80%">
							<p class="mb-0 fw-bold">추천상품</p> 
						</a>
					</div>
					<div
						class="d-flex p-4 pe-0 pb-0 categoryTabGoodList align-items-start flex-wrap"
						style="gap: 1.8rem !important;">
						<c:forEach var="item" items="${goodsMap.cate_mun}" end="5">
							<c:set var="goods_count" value="${goods_count+1}" />
							<div>
								<a class="text-decoration-none"
									href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}">
									<div class="back_eee">
										<img
											src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
									</div>
									<p class="mt-2 mb-1 text-truncate">${item.goods_title}</p>
									<p>
										<span class="fw-bold"> <fmt:formatNumber
												value="${item.goods_price}" pattern="#,###" />
										</span>원
									</p>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- 문학 -->









<%-- 


			<!-- it서적 -->
			<div class="tab-pane fade" id="trend02" role="tabpanel"
				aria-labelledby="trend2">
				<div class="d-flex justify-content-between">
					<div class="pt-4 pe-5 flex-grow-1 box-sixing-content"
						style="width: 200px">
						<a href="${contextPath}/goods/menuGoods.do?goodsSort=만화"
							class="text-decoration-none">
							<p class="fw-bold fs-4 mb-1">만화</p> <span class="small">바로가기
								> </span>
						</a>
					</div>
					<div class="position-relative">
						<img src="${contextPath}/resources/img/main/hot2.jpg"> <a
							href="${contextPath}/goods/menuGoods.do?goodsSort=웹툰"
							class="btn btn-main rounded-0 position-absolute bottom-0 start-50 translate-middle z-2 rounded-0 py-3 w100 d-block"
							style="width: 80%">
							<p class="mb-0 fw-bold">웹툰</p> <span class="small">북숍이
								필요한것들만 모아놨다!</span>
						</a>
					</div>
					<div
						class="d-flex p-4 pe-0 pb-0 categoryTabGoodList align-items-start flex-wrap"
						style="gap: 1.8rem !important;">
						<c:forEach var="item" items="${goodsMap.cate_it}" end="5">
							<c:set var="goods_count" value="${goods_count+1}" />
							<div>
								<a class="text-decoration-none"
									href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}">
									<div class="back_eee">
										<img
											src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
									</div>
									<p class="mt-2 mb-1 text-truncate">${item.goods_title}</p>
									<p>
										<span class="fw-bold"> <fmt:formatNumber
												value="${item.goods_price}" pattern="#,###" />
										</span>원
									</p>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- it 서적 -->














			<!-- 만화 -->
			<div class="tab-pane fade" id="trend03" role="tabpanel"
				aria-labelledby="trend3">
				<div class="d-flex justify-content-between">
					<div class="pt-4 pe-5 flex-grow-1 box-sixing-content"
						style="width: 200px">
						<a href="${contextPath}/goods/menuGoods.do?goodsSort=만화"
							class="text-decoration-none">
							<p class="fw-bold fs-4 mb-1">만화</p> <span class="small">바로가기
								> </span>
						</a>
					</div>
					<div class="position-relative">
						<img src="${contextPath}/resources/img/main/hot3.jpg"> <a
							href="${contextPath}/goods/menuGoods.do?goodsSort=it서적"
							class="btn btn-main rounded-0 position-absolute bottom-0 start-50 translate-middle z-2 rounded-0 py-3 w100 d-block"
							style="width: 80%">
							<p class="mb-0 fw-bold">만화</p> <span class="small">sopang이
								필요한것들만 모아놨다!</span>
						</a>
					</div>
					<div
						class="d-flex p-4 pe-0 pb-0 categoryTabGoodList align-items-start flex-wrap"
						style="gap: 1.8rem !important;">
						<c:forEach var="item" items="${goodsMap.cate_it}" end="5">
							<c:set var="goods_count" value="${goods_count+1}" />
							<div>
								<a class="text-decoration-none"
									href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}">
									<div class="back_eee">
										<img
											src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
									</div>
									<p class="mt-2 mb-1 text-truncate">${item.goods_title}</p>
									<p>
										<span class="fw-bold"> <fmt:formatNumber
												value="${item.goods_price}" pattern="#,###" />
										</span>원
									</p>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- 만화 -->

			<!-- 웹툰 -->
			<div class="tab-pane fade" id="trend04" role="tabpanel"
				aria-labelledby="trend4">
				<div class="d-flex justify-content-between">
					<div class="pt-4 pe-5 flex-grow-1 box-sixing-content"
						style="width: 200px">
						<a href="${contextPath}/goods/menuGoods.do?goodsSort=웹툰"
							class="text-decoration-none">
							<p class="fw-bold fs-4 mb-1">웹툰</p> <span class="small">바로가기
								> </span>
						</a>
					</div>
					<div class="position-relative">
						<img src="${contextPath}/resources/img/main/hot4.jpg"> <a
							href="${contextPath}/goods/menuGoods.do?goodsSort=웹툰"
							class="btn btn-main rounded-0 position-absolute bottom-0 start-50 translate-middle z-2 rounded-0 py-3 w100 d-block"
							style="width: 80%">
							<p class="mb-0 fw-bold">웹툰</p> <span class="small">sopang이
								필요한것들만 모아놨다!</span>
						</a>
					</div>
					<div
						class="d-flex p-4 pe-0 pb-0 categoryTabGoodList align-items-start flex-wrap"
						style="gap: 1.8rem !important;">
						<c:forEach var="item" items="${goodsMap.cate_web}" end="5">
							<c:set var="goods_count" value="${goods_count+1}" />
							<div>
								<a class="text-decoration-none"
									href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}">
									<div class="back_eee">
										<img
											src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
									</div>
									<p class="mt-2 mb-1 text-truncate">${item.goods_title}</p>
									<p>
										<span class="fw-bold"> <fmt:formatNumber
												value="${item.goods_price}" pattern="#,###" />
										</span>원
									</p>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<div
				class="d-flex p-4 pe-0 pb-0 categoryTabGoodList align-items-start flex-wrap"
				style="gap: 1.8rem !important;">
				<c:forEach var="item" items="${goodsMap.cate_web}" end="5">
					<c:set var="goods_count" value="${goods_count+1 }" />
					<div>
						<a class="text-decoration-none"
							href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
							<div class="back_eee">
								<img
									src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
							</div>
							<p class="mt-2 mb-1 text-truncate">${item.goods_title}</p>
							<p>
								<span class="fw-bold"> <fmt:formatNumber
										value="${item.goods_price}" pattern="#,###" />
								</span>원
							</p>
						</a>
					</div>
				</c:forEach>
			</div>

		</div>

	</div>
	<!-- 건강기능식품 -->


	<!-- 생활용품 -->
	<div class="tab-pane fade" id="trend04" role="tabpanel"
		aria-labelledby="trend4">

		<div class="d-flex justify-content-between">

			<div class="pt-4 pe-5 flex-grow-1 box-sixing-content"
				style="width: 200px">
				<a href="${contextPath}/goods/menuGoods.do?menuGoods=웹툰"
					class="text-decoration-none">
					<p class="fw-bold fs-4 mb-1">문학</p> <span class="small">바로가기
						> </span>
				</a>
			</div>

			<div class="position-relative">
				<img src="${contextPath}/resources/img/main/hot4.jpg"> <a
					href="${contextPath}/goods/menuGoods.do?menuGoods=웹툰"
					class="btn btn-main rounded-0 position-absolute bottom-0 start-50 translate-middle z-2 rounded-0 py-3 w100 d-block"
					style="width: 80%">
					<p class="mb-0 fw-bold">it</p> <span class="small">북숍에서 모든책을</span>
				</a>
			</div>


			<div
				class="d-flex p-4 pe-0 pb-0 categoryTabGoodList align-items-start flex-wrap"
				style="gap: 1.8rem !important;">
				<c:forEach var="item" items="${goodsMap.cate_web}" end="6">
					<c:set var="goods_count" value="${goods_count+1 }" />
					<div>
						<a class="text-decoration-none"
							href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
							<div class="back_eee">
								<img
									src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
							</div>
							<p class="mt-2 mb-1 text-truncate">${item.goods_title}</p>
							<p>
								<span class="fw-bold"> <fmt:formatNumber
										value="${item.goods_price}" pattern="#,###" />
								</span>원
							</p>
						</a>
					</div>
				</c:forEach>
			</div>

		</div>

	</div> --%>
	
	

	
	
	

  <div class="px-4 pt-5 my-5 text-center border-bottom">
    <h1 class="display-4 fw-bold">오늘의 한권</h1>
    <div class="col-lg-6 mx-auto">
      <p class="lead mb-4">오늘의 한권</p>
      <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
        <button type="button" class="btn btn-primary btn-lg px-4 me-sm-3">장바구니</button>
        <button type="button" class="btn btn-outline-secondary btn-lg px-4">바로구매하기</button>
      </div>
    </div>
    <div class="overflow-hidden" style="max-height: 30vh;">
      <div class="container px-5">
        <img src="https://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2023/07/25/46403/h2.jpg" class="img-fluid border rounded-3 shadow-lg mb-4" alt="Example image" width="700" height="500" loading="lazy">
      </div>
    </div>
  </div>
	
	
	
	
	
	