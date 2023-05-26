<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>유저 관리 페이지</title>
<style>
.table {
	width: 70%;
	border: none;
	table-layout: auto;
	overflow: hidden; /* 넘치는 부분 감추기 */
	text-overflow: ellipsis;


}
.row{
	width:80%;
	margin: 0 auto;
}
th {
	border: solid 1px gray;
	border-collapse: collapse;
	text-align: center;
}

td {
	border: solid 1px #0e0e0e;
	border-collapse: collapse;
	width: 100px;
	white-space: nowrap; /* 줄바꿈 방지 */
	text-align: center;
}


.hiddentd {

	width: 100px;
	border: none;
	text-align: center;
}

.hiddenbutton {
	display: none;
}

.button:hover {
	background-color: pink;
	font-weight: 600;
}

tr:hover .hiddenbutton {
	display: block;
}

tr:hover .hiddentd {
	background-color: white;
}


tr:hover .hiddenbutton {
	display: block;
}

tr:hover .hiddentd {
	background-color: white;
}

.point {
	width: 10px;
}
</style>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<hr>
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">회원 관리</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="index.jsp">Home</a>
				</p>
			</div>
		</div>
	</div>
	<div style="height: 550px; width: 90%; margin: 0 auto;">
		<div class="row">
			<table class="table" style=" text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">아이디</th>
						<th style="background-color: #eeeeee; text-align: center;">이름</th>
						<th style="background-color: #eeeeee; text-align: center;">성별</th>
						<th style="background-color: #eeeeee; text-align: center; width: 40%;">이메일</th>
						<th style="background-color: #eeeeee; text-align: center;">주소</th>
						<th style="background-color: #eeeeee; text-align: center;">상세주소</th>
						<th style="background-color: #eeeeee; text-align: center;">우편번호</th>
						<th style="background-color: #eeeeee; text-align: center;">전화번호</th>
						<th style="background-color: #eeeeee; text-align: center;">등급</th>
						<th style="background-color: #eeeeee; text-align: center;">포인트</th>
						<th style="background-color: #eeeeee; text-align: center;">가입일자</th>
						<td style="border: none; color: white;">b u t t o n</td>
					</tr>
				</thead>
				<c:forEach var="list" items="${list }">
					<tr class="button">
						<td>${list.userid }</td>
						<td>${list.name }</td>
						<c:choose>
							<c:when test="${list.gender==1}">
								<td>남자</td>
							</c:when>
							<c:when test="${list.gender==2}">
								<td>여자</td>
							</c:when>
						</c:choose>
						<td>${list.email }</td>
						<td>${list.address3 }</td>
						<td>${list.address2 }</td>
						<td>${list.address1 }</td>
						<td>${list.phone }</td>
						<c:choose>
							<c:when test="${list.grade == 0 }">
								<td>브론즈</td>
							</c:when>
							<c:when test="${list.grade == 1 }">
								<td>관리자</td>
							</c:when>
							<c:when test="${list.grade == 2 }">
								<td>골드</td>
							</c:when>
							<c:when test="${list.grade == 3 }">
								<td>플래티넘</td>
							</c:when>
							<c:when test="${list.grade == 4 }">
								<td>VIP</td>
							</c:when>
							<c:when test="${list.grade == 5 }">
								<td>VVIP</td>
							</c:when>
							<c:otherwise>
								<td>관리자</td>
							</c:otherwise>
						</c:choose>
						<td>${list.point }</td>
						<td>
							<fmt:formatDate value="${list.enter }" />
						</td>

						<td class="hiddentd">
							<input type="button" class="btn-primary px-3 hiddenbutton" value="수정" onclick="open_win('/admin/userManagementEdit?userid=${list.userid }')">
							<input type="button" class="btn-primary px-3 delete hiddenbutton" value="삭제" onclick="location.href='/admin/userDelete?shopUserid=${list.userid }'">
						</td>


					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="search_wrap">
		<div class="search_area" style="margin-left: 500px;">
			<select name="type">
				<option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
				<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>유저 아이디</option>
				<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>전화번호</option>
				<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>이름</option>
			</select>
			<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
			<button class="btn btn-primary pull-right">Search</button>
		</div>
	</div>
	<!-- 페이징 -->
	<div class="col-12 pb-1">
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<nav aria-label="Page navigation">
					<ul id="pageInfo" class="pagination justify-content-center mb-3">
						<!-- 이전 페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="page-item">
								<a class="page-link" href="${pageMaker.startPage-1}" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
								</a>
							</li>
						</c:if>
						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
								<a class="page-link" href="${num}">${num}</a>
							</li>
						</c:forEach>
						<!-- 다음 페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="page-item">
								<a class="page-link" href="${pageMaker.endPage + 1}" aria-label="Next">
									<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
								</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			<input type="hidden" name="type" value="${pageMaker.cri.type}">
			<input type="hidden" name="category" value="${pageMaker.cri.category}">
		</form>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>

	<script>
		function open_win(url) {
			// 새 창의 속성들을 설정하는 문자열입니다.
			var specs = "width=900,height=500,left=200,top=200";

			// 새 창을 엽니다.
			window.open(url, "_blank", specs);
		}

		//페이징 스크립트
		let moveForm = $("#moveForm");

	
		$("#pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/admin/userManagementPage");
			moveForm.submit();

		});

		$(".search_area button").on("click", function(e) {
			e.preventDefault();

			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();
			let category = $("input[name='category']").val();

			if (!type) {
				alert("검색 종류를 선택하세요.");
				return false;
			}

			if (!keyword) {
				alert("키워드를 입력하세요.");
				return false;
			}

			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='category']").val(category);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
	</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
