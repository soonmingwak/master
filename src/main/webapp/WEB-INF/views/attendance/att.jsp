<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<script src="${path}/resources/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function() {
	$('#go_btn').click(function(){
		$.ajax({
			type : 'POST',
			url : './go_action',
			dataType : 'text',
			success : function(data) {
				if(data == 0) {
					$('#status').text('출근');
				}
				else {
					alert('이미 출근상태 입니다.');
				}
			}
		});
	});
});
$(document).ready(function() {
	$('#off_btn').click(function(){
		$.ajax({
			type : 'POST',
			url : './off_action',
			dataType : 'text',
			success : function(data) {
				if(data == 0) {
					$('#status').text('퇴근');
				}
				else {
					alert('이미 퇴근상태 입니다.');
				}
			}
		});
	});
});
</script>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/nav/mainNav.jsp" />
	<div class="container-fluid">
 			<table class="table table-secondary" style="width: 350px; height: 100px; margin-top: 200px; margin-left: 900px;">
				<thead class="thead-dark">
					<tr>
						<th class="font-weight-bold text-center" style=><h2>출.퇴근 체크</h2></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="height: 100px; text-align: center;"><h2 id="status">${commute.com_type }</h2></td>
					</tr>
					<tr>
						<td style="height: 50px;" >
							<button type="button" class="btn btn-success" id="go_btn">출근</button>
							<button type="button" class="btn btn-danger" id="off_btn">퇴근</button>
							<a href="${path}/attcheck" class="btn btn-info" style="margin-left: 86px;">출.퇴근 현황</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
</body>
</html>