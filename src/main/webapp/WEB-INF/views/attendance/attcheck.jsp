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
	<jsp:include page="/WEB-INF/views/nav/mainNav.jsp" />
	<div class="container" style="margin-top: 170px;">
		<div class="container">
			<table class="table table-light text-center">
				<tr>
					<td></td>
					<td></td>
					<td class="text-dark font-weight-bold ">출.퇴근 현황</td>
					<td></td>
					<td></td>

				</tr>
				<tbody>
					<tr>
						<td>이름</td>
						<td>직급</td>
						<td>출근 시간</td>
						<td>퇴근 시간</td>
						<td>현황</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>