<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<div class="container">
	<div class="row ms-5 ps-5">
		<div class="mt-5 p-0 ps-5 align-items-center">
			<div class="ps-4">
				<p class="fs-5 fw-bold mb-2">주문상품</p>

				<!-- 주문정보 표시 영역 -->
				<div class="border-top border-main border-2 mt-2">

					<c:choose>
						<c:when test="${empty myOrderHistList }">
							<!-- 주문상품이 없을때 -->
							<div class="shadow-sm p-4 mt-3 rounded border border-light">
								<p class="my-5 text-center">주문한 상품이 없습니다.</p>
							</div>
							<!-- 주문상품이 없을때 -->
						</c:when>

						<c:otherwise>
							<!-- 주문상품이 있을때 for문 -->
							<c:forEach var="item" items="${myOrderHistList }" varStatus="i">

								<!-- 주문상품 -->
								<c:choose>
									<c:when test="${item.order_id != pre_order_id }">
										<c:set var="pre_order_id" value="${item.order_id }" />
										<div class="shadow-sm p-4 mt-3 rounded border border-light">

											<!-- 주문일자/시간 정보  -->
											<p class="fw-bold mb-0">${item.pay_order_time }주문</p>
											<!-- 주문일자/시간 정보  -->

											<div
													class="shadow-sm p-4 mt-3 rounded border border-light d-flex justify-content-between">
												<div class="d-flex flex-column gap-4">
													<p class="text-secondary fw-bold mb-0">
														<!-- 배송정보에 따른 표시 -->
														<c:choose>
															<c:when
																	test="${item.delivery_state=='delivery_prepared' }">배송준비중</c:when>
															<c:when test="${item.delivery_state=='delivering' }">배송중</c:when>
															<c:when
																	test="${item.delivery_state=='finished_delivering' }">배송완료</c:when>
															<c:when test="${item.delivery_state=='cancel_order' }">주문취소</c:when>
															<c:when test="${item.delivery_state=='returning_goods' }">반품중</c:when>
															<c:when test="${item.delivery_state=='exchange_goods' }">교환중</c:when>
														</c:choose>
														<!-- 배송정보에 따른 표시 -->
													</p>
													<c:forEach var="item2" items="${myOrderHistList}"
															   varStatus="j">
														<c:if test="${item.order_id ==item2.order_id}">
															<div class="d-flex">
																<!-- 상품이미지 -->
																<img
																		src="${contextPath}/thumbnails?goods_id=${item2.goods_id}&fileName=${item2.goods_fileName}"
																		style="width: 64px; height: 64px">
																<!-- 상품이미지 -->

																<div class="ms-3">
																	<p class="mb-1 mt-1 small">

																		<!-- 상품명 -->
																		<a class="text-decoration-none"
																		   href="${contextPath}/goods/goodsDetail?goods_id=${item2.goods_id }">${item2.goods_title}</a>
																		<!-- 상품명 -->

																	</p>
																	<p class="mb-0 text-secondary">

																		<!-- 주문갯수 -->
																		<span>${item2.order_goods_qty}</span>개
																		<span> · </span> <span>

																		<!-- 상품가격 * 갯수 : 총 구매가격 -->
																		<fmt:formatNumber value="${item2.goods_sales_price*item2.order_goods_qty}" pattern="#,###" />
																			</span> 원
																	</p>
																</div>
															</div>
														</c:if>
													</c:forEach>
												</div>
												<!-- 주문취소, 교환, 반품, 배송중에는 사용자가  배송관련 정보를 수정할 수없다. -->
												<c:choose>


													<c:when test="${item.delivery_state=='cancel_order'}">
													</c:when>
													<c:when test="${item.delivery_state=='returning_goods'}">
													</c:when>
													<c:when test="${item.delivery_state=='exchange_goods'}">
													</c:when>
													<c:when test="${item.delivery_state=='delivering'}">
													</c:when>

													<c:otherwise>
														<div
																class="border-start ps-4 align-self-center align-self-stretch d-flex align-items-center">
															<div>
																<c:choose>

																	<c:when
																			test="${item.delivery_state=='delivery_prepared'}">
																		<!-- 배송준비완료일때 -->
																		<button
																				class="btn btn-sm border-main rounded-0 small d-block my-2"
																				onClick="fn_edit_order('${item.order_id}','cancel')"
																				style="width: 150px;">주문취소</button>
																		<!-- 배송준비완료일때 -->
																	</c:when>

																	<c:when
																			test="${item.delivery_state=='finished_delivering' }">
																		<!-- 배송완료 일때 -->
																		<button
																				class="btn btn-sm border-main rounded-0 small d-block my-2"
																				onClick="fn_edit_order('${item.order_id}', 'exchange')"
																				style="width: 150px;">교환신청</button>
																		<button
																				class="btn btn-sm border-main rounded-0 small d-block my-2"
																				onClick="fn_edit_order('${item.order_id}','return')"
																				style="width: 150px;">반품신청</button>
																		<!-- 배송완료 일때 -->
																	</c:when>

																</c:choose>
															</div>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</c:when>
								</c:choose>
								<!-- 주문상품 -->

							</c:forEach>
							<!-- 주문상품이 있을때 for문 -->
						</c:otherwise>

					</c:choose>

				</div>
				<!-- 주문정보 표시 영역 -->

			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row ms-5 ps-5">
		<div class="mt-5 p-0 ps-5 align-items-center">
			<div class="ps-4">


	<DIV class="clear"></DIV>
<form  name="form_order">
	<br>
	<br>
	<p class="fs-3 fw-bold">배송지 정보</p>
	<DIV class="detail_table">

		<TABLE class="table border-top mb-0 small fw-light">
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">받으실 분</TD>
					<TD>
					${myOrderInfo.receiver_name }
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">연락처</TD>
					<TD>
					  ${myOrderInfo.receiver_hp1}-${myOrderInfo.receiver_hp2}-${myOrderInfo.receiver_hp3}</TD>
				  </TR>


				<TR class="dot_line">
					<TD class="fixed_join">받는주소</TD>
					<td>
					   ${myOrderInfo.delivery_address}
					</td>>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">배송요청사항</TD>
					<TD>
					${myOrderInfo.delivery_message}
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		
	</DIV>

	<DIV class="clear"></DIV>
	<br>
	<br>
	<br>
	<p class="fs-3 fw-bold">결제 정보</p>
	<DIV class="detail_table">
		<TABLE class="table border-top mb-0 small fw-light" >
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">결제방법</TD>
					<TD>
					   ${myOrderInfo.pay_method }
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">결제카드</TD>
					<TD>
					   ${myOrderInfo.card_com_name}
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">할부기간</TD>
					<TD>
					   ${myOrderInfo.card_pay_month }
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">결제금액</TD>
					<TD>
						${myOrderInfo }
					</TD>
				</TR>
			</TBODY>
		</table>
	</DIV>
</form>
    <DIV class="clear"></DIV>
	<br>
	<br>
	<br>
		<a href="${contextPath}/main/main">
			<IMG width="75" alt="" src="${contextPath}/resources/image/btn_shoping_continue.png">
		</a>
		</div>
		</div>
	</div>
	</div>
</div>
<br>
<br>
<DIV class="clear"></DIV>

	
			
			
			