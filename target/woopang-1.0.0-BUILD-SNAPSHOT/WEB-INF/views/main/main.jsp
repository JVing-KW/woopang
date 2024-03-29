<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>


<!-- hero섹션, 광고영역 -->
<div class="hero" style="height: 450px">
	<div class="tab-content container h100 p-0 position-relative" id="">

		<!-- tabCaller 버튼영역 -->
		<a class="tab-pane show active d-block" id="hero01" role="tabpanel"
			aria-labelledby="hero1"
			href="${contextPath}/goods/goodsDetail?goods_id=2"> <img
			src="${contextPath}/resources/img/main/hero1.jpg" class="today-image"
			data-log-props="" data-adsplatform=""
			style="display: block; z-index: 1; position: absolute;">
		</a> <a class="tab-pane" id="hero02" role="tabpanel"
			aria-labelledby="hero2"
			href="${contextPath}/goods/goodsDetail?goods_id=3"> <img
			src="${contextPath}/resources/img/main/hero2.jpg" class="today-image"
			data-log-props="" data-adsplatform=""
			style="display: block; z-index: 1; position: absolute;">
		</a> <a class="tab-pane" id="hero03" role="tabpanel"
			aria-labelledby="hero3"
			href="${contextPath}/goods/goodsDetail?goods_id=4"> <img
			src="${contextPath}/resources/img/main/hero3.jpg" class="today-image"
			data-log-props="" data-adsplatform=""
			style="display: block; z-index: 1; position: absolute;">
		</a> <a class="tab-pane" id="hero04" role="tabpanel"
			aria-labelledby="hero4"
			href="${contextPath}/goods/goodsDetail?goods_id=5"> <img
			src="${contextPath}/resources/img/main/hero4.jpg" class="today-image"
			data-log-props="" data-adsplatform=""
			style="display: block; z-index: 1; position: absolute;">
		</a> <a class="tab-pane" id="hero05" role="tabpanel"
			aria-labelledby="hero5"
			href="${contextPath}/goods/goodsDetail?goods_id=6"> <img
			src="${contextPath}/resources/img/main/hero5.jpg" class="today-image"
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
				src="${contextPath}/resources/img/main/tab1.jpg">
			</a> <a class="list-group-item list-group-item-action p-0" id="hero2"
				data-bs-toggle="list" href="#hero02" role="tab"
				aria-controls="hero02"> <img
				src="${contextPath}/resources/img/main/tab2.jpg">
			</a> <a class="list-group-item list-group-item-action p-0" id="hero3"
				data-bs-toggle="list" href="#hero03" role="tab"
				aria-controls="hero03"> <img
				src="${contextPath}/resources/img/main/tab3.jpg">
			</a> <a class="list-group-item list-group-item-action p-0" id="hero4"
				data-bs-toggle="list" href="#hero04" role="tab"
				aria-controls="hero04"> <img
				src="${contextPath}/resources/img/main/tab4.jpg">
			</a> <a class="list-group-item list-group-item-action p-0" id="hero5"
				data-bs-toggle="list" href="#hero05" role="tab"
				aria-controls="hero05"> <img
				src="${contextPath}/resources/img/main/tab5.jpg">
			</a>
		</div>
		<!-- tab본문영역, caller 선택시 id값에 맞는 tab이 표출된다. -->

	</div>
</div>
<!-- hero섹션, 광고영역 -->



<!-- woopang추천 광고영역 -->
<div class="container">
	<div class="row">
		<div class="d-flex p-0 align-items-center gap-3 mt-5">
			<p class="fs-3 fw-bold">오늘의 발</p>
			<p class="fs-6">| 오늘 소팡이 엄선한 가장 HOT한 상품!</p>
		</div>
	</div>
	<div class="row border p-3">
		<div class="d-flex p-0 align-items-center gap-3 flex-wrap bestseller">
			<c:set var="goods_count" value="0" />
			<!-- goodsMap 상품리스트 중, goods_status의 값이  bestseller로 지정된 리스트만 추출해 뿌린다.  -->
			<c:forEach var="item" items="${goodsMap.bestseller}">
				<c:set var="goods_count" value="${goods_count+1 }" />
				<a class="back_eee position-relative"
					href="${contextPath}/goods/goodsDetail?goods_id=${item.goods_id }">
					<img class="position-absolute top-50 start-50 translate-middle"
					src="${contextPath}/download?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
				</a>
			</c:forEach>
			<!-- goodsMap 상품리스트 중, goods_status의 값이  bestseller로 지정된 리스트만 추출해 뿌린다.  -->
		</div>
	</div>
</div>
<!-- woopang추천 광고영역 -->



<!-- woopang 카테고리 광고영역 -->
<div class="container">
	<div class="row">
		<div class="p-0 align-items-center gap-3 mt-5">
			<p class="fs-6 mb-1">HOT! TREND</p>
			<p class="fs-3 fw-bold">카테고리별 추천상품</p>
		</div>
	</div>

	<div class="row position-relative">


		<!-- tab Caller -->
		<div
			class="list-group position-absolute bottom-0 start-0 z-2 rounded-0 mb-4"
			role="tablist" style="width: 150px">
			<a
				class="list-group-item list-group-item-action active btn mb-2 rounded-0 border-main samll"
				id="trend1" data-bs-toggle="list" href="#trend01" role="tab"
				aria-controls="trend01"># 디지털</a> <a
				class="list-group-item list-group-item-action btn mb-2 rounded-0 border-main samll"
				id="trend2" data-bs-toggle="list" href="#trend02" role="tab"
				aria-controls="trend02"># 도서</a> <a
				class="list-group-item list-group-item-action btn mb-2 rounded-0 border-main samll"
				id="trend3" data-bs-toggle="list" href="#trend03" role="tab"
				aria-controls="trend03"># 건강기능식품</a> <a
				class="list-group-item list-group-item-action btn mb-2 rounded-0 border-main samll"
				id="trend4" data-bs-toggle="list" href="#trend04" role="tab"
				aria-controls="trend04"># 생활용품</a>
		</div>
		<!-- tab Caller -->


		<!-- tab 본문영역 -->
		<div class="tab-content border-top border-main border-2 p-0">

			<!-- 디지털 -->
			<div class="tab-pane fade show active" id="trend01" role="tabpanel"
				aria-labelledby="trend1">

				<div class="d-flex justify-content-between">

					<div class="pt-4 pe-5 flex-grow-1 box-sixing-content"
						style="width: 200px">
						<a href="${contextPath}/goods/menuGoods?menuGoods=디지털"
							class="text-decoration-none">
							<p class="fw-bold fs-4 mb-1">디지털</p> <span class="small">바로가기
								> </span>
						</a>
					</div>

					<div class="position-relative">
						<img src="${contextPath}/resources/img/main/hot1.jpg"> <a
							href="${contextPath}/goods/menuGoods?menuGoods=디지털"
							class="btn btn-main rounded-0 position-absolute bottom-0 start-50 translate-middle z-2 rounded-0 py-3 w100 d-block"
							style="width: 80%">
							<p class="mb-0 fw-bold">디지털</p> <span class="small">woopang이
								필요한것들만 모아놨다!</span>
						</a>
					</div>

					<div
						class="d-flex p-4 pe-0 pb-0 categoryTabGoodList align-items-start flex-wrap"
						style="gap: 1.8rem !important;">
						<c:forEach var="item" items="${goodsMap.cate_digital}" end="5">
							<c:set var="goods_count" value="${goods_count+1 }" />
							<div>
								<a class="text-decoration-none"
									href="${contextPath}/goods/goodsDetail?goods_id=${item.goods_id }">
									<div class="back_eee">
										<img
											src="${contextPath}/download?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
									</div>
									<p class="mt-2 mb-1 text-truncate">${item.goods_title}</p>
									<p>
										<span class="fw-bold">
										<fmt:formatNumber value="${item.goods_sales_price}" pattern="#,###" />
										</span>원
									</p>
								</a>
							</div>
						</c:forEach>
					</div>

				</div>

			</div>
			<!-- 디지털 -->


			<!-- 도서 -->
			<div class="tab-pane fade" id="trend02" role="tabpanel"
				aria-labelledby="trend2">

				<div class="d-flex justify-content-between">

					<div class="pt-4 pe-5 flex-grow-1 box-sixing-content"
						style="width: 200px">
						<a href="${contextPath}/goods/menuGoods?menuGoods=도서"
							class="text-decoration-none">
							<p class="fw-bold fs-4 mb-1">도서</p> <span class="small">바로가기
								> </span>
						</a>
					</div>

					<div class="position-relative">
						<img src="${contextPath}/resources/img/main/hot2.jpg"> <a
							href="${contextPath}/goods/menuGoods?menuGoods=도서"
							class="btn btn-main rounded-0 position-absolute bottom-0 start-50 translate-middle z-2 rounded-0 py-3 w100 d-block"
							style="width: 80%">
							<p class="mb-0 fw-bold">도서</p> <span class="small">woopang이
								필요한것들만 모아놨다!</span>
						</a>
					</div>


					<div
						class="d-flex p-4 pe-0 pb-0 categoryTabGoodList align-items-start flex-wrap"
						style="gap: 1.8rem !important;">
						<c:forEach var="item" items="${goodsMap.cate_book}" end="5">
							<c:set var="goods_count" value="${goods_count+1 }" />
							<div>
								<a class="text-decoration-none"
									href="${contextPath}/goods/goodsDetail?goods_id=${item.goods_id }">
									<div class="back_eee">
										<img
											src="${contextPath}/download?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
									</div>
									<p class="mt-2 mb-1 text-truncate">${item.goods_title}</p>
									<p>
										<span class="fw-bold">
										<fmt:formatNumber value="${item.goods_sales_price}" pattern="#,###" />
										</span>원
									</p>
								</a>
							</div>
						</c:forEach>
					</div>

				</div>

			</div>
			<!-- 도서 -->


			<!-- 건강기능식품 -->
			<div class="tab-pane fade" id="trend03" role="tabpanel"
				aria-labelledby="trend3">

				<div class="d-flex justify-content-between">

					<div class="pt-4 pe-5 flex-grow-1 box-sixing-content"
						style="width: 200px">
						<a href="${contextPath}/goods/menuGoods?menuGoods=건강기능식품"
							class="text-decoration-none">
							<p class="fw-bold fs-4 mb-1">건강기능식품</p> <span class="small">바로가기
								> </span>
						</a>
					</div>

					<div class="position-relative">
						<img src="${contextPath}/resources/img/main/hot3.jpg"> <a
							href="${contextPath}/goods/menuGoods?menuGoods=건강기능식품"
							class="btn btn-main rounded-0 position-absolute bottom-0 start-50 translate-middle z-2 rounded-0 py-3 w100 d-block"
							style="width: 80%">
							<p class="mb-0 fw-bold">건강기능식품</p> <span class="small">woopang이
								필요한것들만 모아놨다!</span>
						</a>
					</div>


					<div
						class="d-flex p-4 pe-0 pb-0 categoryTabGoodList align-items-start flex-wrap"
						style="gap: 1.8rem !important;">
						<c:forEach var="item" items="${goodsMap.cate_health}" end="5">
							<c:set var="goods_count" value="${goods_count+1 }" />
							<div>
								<a class="text-decoration-none"
									href="${contextPath}/goods/goodsDetail?goods_id=${item.goods_id }">
									<div class="back_eee">
										<img
											src="${contextPath}/download?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
									</div>
									<p class="mt-2 mb-1 text-truncate">${item.goods_title}</p>
									<p>
										<span class="fw-bold">
											<fmt:formatNumber value="${item.goods_sales_price}" pattern="#,###" />
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
						<a href="${contextPath}/goods/menuGoods?menuGoods=생활용품"
							class="text-decoration-none">
							<p class="fw-bold fs-4 mb-1">생활용품</p> <span class="small">바로가기
								> </span>
						</a>
					</div>

					<div class="position-relative">
						<img src="${contextPath}/resources/img/main/hot4.jpg"> <a
							href="${contextPath}/goods/menuGoods?menuGoods=생활용품"
							class="btn btn-main rounded-0 position-absolute bottom-0 start-50 translate-middle z-2 rounded-0 py-3 w100 d-block"
							style="width: 80%">
							<p class="mb-0 fw-bold">생활용품</p> <span class="small">woopang이
								필요한것들만 모아놨다!</span>
						</a>
					</div>


					<div
						class="d-flex p-4 pe-0 pb-0 categoryTabGoodList align-items-start flex-wrap"
						style="gap: 1.8rem !important;">
						<c:forEach var="item" items="${goodsMap.cate_daily}" end="5">
							<c:set var="goods_count" value="${goods_count+1 }" />
							<div>
								<a class="text-decoration-none"
									href="${contextPath}/goods/goodsDetail?goods_id=${item.goods_id }">
									<div class="back_eee">
										<img
											src="${contextPath}/download?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
									</div>
									<p class="mt-2 mb-1 text-truncate">${item.goods_title}</p>
									<p>
										<span class="fw-bold">
										<fmt:formatNumber value="${item.goods_sales_price}" pattern="#,###" />
										</span>원
									</p>
								</a>
							</div>
						</c:forEach>
					</div>

				</div>

			</div>
			<!-- 생활용품 -->


		</div>
	</div>
<%--	<%--%>
<%--		String clientId = "zgZxB9u91uBYdyiEmro_";//애플리케이션 클라이언트 아이디값";--%>
<%--		String clientSecret = "cKAwYCLNjg";//애플리케이션 클라이언트 시크릿값";--%>
<%--		String code = request.getParameter("code");--%>
<%--		String state = request.getParameter("state");--%>
<%--		String redirectURI = URLEncoder.encode("http://3.21.82.151:8080/woopang-1.0.0-BUILD-SNAPSHOT/main/main", "UTF-8");--%>
<%--		String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"--%>
<%--				+ "&client_id=" + clientId--%>
<%--				+ "&client_secret=" + clientSecret--%>
<%--				+ "&redirect_uri=" + redirectURI--%>
<%--				+ "&code=" + code--%>
<%--				+ "&state=" + state;--%>
<%--		String accessToken = "";--%>
<%--		String refresh_token = "";--%>
<%--		try {--%>
<%--			URL url = new URL(apiURL);--%>
<%--			HttpURLConnection con = (HttpURLConnection)url.openConnection();--%>
<%--			con.setRequestMethod("GET");--%>
<%--			int responseCode = con.getResponseCode();--%>
<%--			BufferedReader br;--%>
<%--			if (responseCode == 200) { // 정상 호출--%>
<%--				br = new BufferedReader(new InputStreamReader(con.getInputStream()));--%>
<%--			} else {  // 에러 발생--%>
<%--				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));--%>
<%--			}--%>
<%--			String inputLine;--%>
<%--			StringBuilder res = new StringBuilder();--%>
<%--			while ((inputLine = br.readLine()) != null) {--%>
<%--				res.append(inputLine);--%>
<%--			}--%>
<%--			br.close();--%>
<%--			if (responseCode == 200) {--%>
<%--				out.println(res.toString());--%>
<%--			}--%>
<%--		} catch (Exception e) {--%>
<%--			// Exception 로깅--%>
<%--		}--%>
<%--	%>--%>
<%--	<!-- tab 본문영역 -->--%>


</div>
<!-- woopang 카테고리 광고영역 -->





