<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<hr>
	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">${bname }</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="/">Home</a>
				</p>
			</div>
		</div>
		<c:if test="${bplist.size()==0 }">
			<h3 style="text-align: center;">상품이 존재하지 않습니다.</h3>
		</c:if>
	</div>
	<!-- Page Header End -->
	<!-- Shop Start -->
	<div id="my-container" class="container-fluid pt-5">
		<!-- Shop Product Start -->
		<div class="col-lg-9 col-md-12">
			<div class="row pb-3">
				<c:forEach var="bplist" items="${bplist }">
					<c:if test="${bplist.discountrate == 0 }">
						<div class="col-lg-4 col-md-6 col-sm-12 pb-1">
							<div class="card product-item border-0 mb-4">
								<div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
									<a href='/product/productDetail?num=<c:out value="${bplist.num }"/>&pname=${bplist.pname}'>
										<img class="img-fluid w-100" style="height: 240px" src="<c:url value='/resources/img/${bplist.imgUrl}'/>" alt="">
									</a>
								</div>
								<div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
									<h6 class="mb-3">${bplist.pname}</h6>
									<div class="d-flex justify-content-center">
										<%-- 통화 단위 지정 --%>
										<h6>
											<fmt:formatNumber value="${Integer.parseInt(bplist.price)}" pattern="₩###,###" />
										</h6>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<!-- Shop Product End -->
	</div>
	<!-- Shop End -->
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>