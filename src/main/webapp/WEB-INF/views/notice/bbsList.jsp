<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<script src="${path}/resources/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
</head>
<body>

	<script>
		$(document).ready(function() {
			var msg = '${msg}';
			if (msg != null && msg != '')
				alert(msg);
		});
	</script>
           <jsp:include page="/WEB-INF/views/nav/mainNav.jsp" />
        <div class="container" style="margin-top: 100px;">
	<div class="row">
	<div class="col-lg-10">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #bbbbbb">
				<thead>
					<tr>
						<th style="background-color: #dddddd; text-align: center;">번호</th>
						<th style="background-color: #dddddd; text-align: center;">제목</th>
						<th style="background-color: #dddddd; text-align: center;">조회수</th>
						<th style="background-color: #dddddd; text-align: center;">작성자</th>
						<th style="background-color: #dddddd; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="boarder" items="${map.list }">
						<tr>
							<td>${boarder.boarder_id }</td>
							<td><a
								href="${path}/view?boarder_id=${boarder.boarder_id}">${boarder.title }</a></td>
							<td>${boarder.count }</td>
							<td>${boarder.writer }</td>
							<td>${boarder.reg_date }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<ul class="pagination">

				<c:if test="${map.paging.pageNumber > 5 }">

					<li class="page-item"><a class="page-link" href="./bbsList?pageNumber=${map.paging.before }"><span
							class="glyphicon glyphicon-triangle-left"></span></a></li>

				</c:if>

				<c:forEach var="i" begin="${map.paging.minPage }"
					end="${map.paging.maxPage }">

					<c:if test="${i == map.paging.pageNumber }">
						<li class="page-item active"><a class="page-link"  href="#">${i }</a></li>
					</c:if>
					<c:if test="${i != map.paging.pageNumber }">
						<li class="page-item"><a class="page-link" href="./bbsList?pageNumber=${i }">${i }</a></li>
					</c:if>

				</c:forEach>

				<c:if test="${map.paging.next }">

					<li class="page-item"><a class="page-link" href="./bbsList?pageNumber=${map.paging.forward }"><span
							class="glyphicon glyphicon-triangle-right"></span></a></li>

				</c:if>

			</ul>
			<a href="${path}/write" class="btn btn-info">글쓰기</a>
		</div>
		</div>
		</div>
</body>
</html>