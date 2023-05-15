<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../resources/js/cart.js"></script>
</head>
<style>
td .delhidden {
	width: 100px
}

.delhide:hover .delhidden {
	display: block;
}

.delhide .delhidden {
	display: none;
}
</style>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="/">Home</a>
				</p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<!-- Cart Start -->
	<form name="cart" action="DBServlet" method="post">
		<input type="hidden" name="command" value="Check_out">
		<!--<input type="hidden" value="delete_cart" name="command">-->
		<div class="container-fluid pt-5">
			<div class="row px-xl-5">
				<div class="col-lg-8 table-responsive mb-5">
					<table class="table table-bordered text-center mb-0" id="cartTable">
						<thead class="bg-secondary text-dark">
							<tr>
								<th>Products</th>
								<th>Size</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Total</th>
								<!-- 								<th>Remove</th> -->
							</tr>
						</thead>
						<tbody class="align-middle">
							<c:choose>
								<c:when test="${clist.size()==0}">
									<tr>
										<td class="align-middle" colspan="7">
											<h3>장바구니가 비었습니다.</h3>
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="cart" items="${clist}">
										<!-- 장바구니 cartVO -->
										<tr class="delhide">
											<c:forEach var="product" items="${plist }">
												<!-- 상품리스트 -->
												<!--<td><input type="button" style="width: 35px; height: 35px; align-items: center; align-self: center;" class="btn btn-primary px-3 delhidden" value="D" onclick=""></td>
													  -->
												<c:if test="${cart.num == product.num}">
													<!--상품리스트품번과 장바구니 번호가 일치할 때  -->
													<td class="align-middle">
														<div class="d-flex align-items-center">
															<img src="../resources/img/${product.imgUrl}" alt="productImg" style="width: 55px; margin-right: 5px;">
															<div class="text-left">
																<a href='/product/productDetail?num=${product.num}&pname=${product.pname}'>${product.pname}</a>
															</div>
														</div>
													</td>
													<td class="align-middle"><c:choose>
															<c:when test='${cart.psize  =="S" }'>S</c:when>
															<c:when test='${cart.psize  =="M" }'>M</c:when>
															<c:when test='${cart.psize  =="L" }'>L</c:when>
															<c:when test='${cart.psize  =="XL" }'>XL</c:when>
															<c:when test='${cart.psize  =="XS" }'>XS</c:when>
															<c:when test='${cart.psize  =="XXL" }'>XXL</c:when>
															<c:when test='${cart.psize  =="Free" }'>Free</c:when>
														</c:choose></td>
													<td class="align-middle"><fmt:setLocale value="ko_KR" /> <fmt:formatNumber type="currency" value="${cart.price}" currencySymbol="₩" /></td>
													<td class="align-middle">
														<div class="input-group quantity mx-auto" style="width: 100px;">
															<div class="input-group-btn"></div>
															<input type="text" name="purchasednum" class="form-control form-control-sm bg-secondary text-center" value="${cart.quantity}" id="quantity-${cart.cartnum}" readonly>
															<div class="input-group-btn"></div>
															<c:set var="totalPrice" value="${cart.price * cart.quantity}" />
															<c:set var="subprice" value="${subprice + totalPrice}" />
														</div>
													</td>
													<td class="align-middle"><fmt:setLocale value="ko_KR" /> <fmt:formatNumber type="currency" value="${cart.price * cart.quantity}" currencySymbol="₩" /></td>
												</c:if>
											</c:forEach>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<div class="col-lg-4">
					<div class="card border-secondary mb-5">
						<div class="card-header bg-secondary border-0">
							<h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
						</div>
						<div class="card-body">
							<div class="d-flex justify-content-between mb-3 pt-1">
								<h6 class="font-weight-medium">Subtotal</h6>
								<h6 class="font-weight-medium" id="subPrice">
									<fmt:setLocale value="ko_KR" />
									<fmt:formatNumber type="currency" value="${subprice}" currencySymbol="₩" />
								</h6>
							</div>
							<div class="d-flex justify-content-between">
								<h6 class="font-weight-medium">Shipping</h6>
								<h6 class="font-weight-medium">
									<strong style="font-size: 20px">Free</strong>
								</h6>
							</div>
						</div>
						<div class="card-footer border-secondary bg-transparent">
							<div class="d-flex justify-content-between mt-2">
								<h5 class="font-weight-bold">Total</h5>
								<h5 class="font-weight-bold" id="subPrice">
									<fmt:setLocale value="ko_KR" />
									<fmt:formatNumber type="currency" value="${subprice}" currencySymbol="₩" />
								</h5>
							</div>
							<input type="submit" class="btn btn-block btn-primary my-3 py-3" value="Proceed To Checkout">
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- Cart End -->
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>