<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="${path}/resources/js/join.js" charset="UTF-8"></script>
<script>


$(function(){
	$("#findBtn").click(function(){
		$.ajax({
			url : "/main/findpw",
			type : "POST",
			data : {
				m_id : $("#m_id").val(),
				m_email : $("#m_email").val()
			},
			success : function(result) {
				alert(result);
			},
		})
	});
})
</script>



<title></title>
<meta http-equiv="Conetent-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${path}/resources/js/bootstrap.js"></script>

</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand " href="${path}/findid">아이디찾기</a>
		<a class="navbar-brand" href="${path}/findpw">비밀번호찾기</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
	
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-2 col-md-offset-4"></div>
			<div class="col-md-8 col-md-offset-4">
				 <div class="jumbotron">
				 	<div class="panel-heading">
				 	<form method="POST" action="./findidAction">
				 		<h2 style ="text-align:center; border-bottom" >비밀번호 찾기</h2>
				 		<ul style="border-bottom:2px solid #ffffff; "></ul>
				 		<div style="margin-bottom: 10px;"
						class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_1" name="find_id" onclick="check(1)" checked="checked">
							<label class="custom-control-label font-weight-bold text-black"	for="search_1">휴대폰번호로 찾기</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_2" name="find_id" onclick="check(2)"> 
							<label class="custom-control-label font-weight-bold text-black" for="search_2">이메일주소로 찾기</label>
						</div>
				 	
				 		<div id="searchI">
				 		<h5>회원정보에 등록한 이메일로 인증</h5>
				 		<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<span style="font-family :Fantasy; ">아이디 :</span> 
								
							</div>
							<div class="form-group col-sm-5 col-md-5 col-lg-5">
								<input  type="text" class="form-control" id="m_id" name="m_id" placeholder="아이디를 입력하세요" >
							</div>
							<div class="form-group col-sm-4 col-md-4 col-lg-4" >
								
							</div>
						</div>
				 		
				 		
				 		<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<span style="font-family :Fantasy; ">이름:</span> 
								
							</div>
							<div class="form-group col-sm-5 col-md-5 col-lg-5">
								<input  type="text" class="form-control" id="m_name" name="m_name" placeholder="이름을 입력하세요 " >
							</div>
							
				
						</div>
						
							<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<span style="font-family :Fantasy; ">이메일:</span> 
								
							</div>
							<div class="form-group col-sm-5 col-md-5 col-lg-5">
								<input  type="text" class="form-control" id="m_email" name="m_email" placeholder="이메일을 입력하세요 " >
							</div>
							<div class="col-sm-4 col-md-4 col-lg-4" >
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#emailAuthModal" >인증받기</button>
							</div>
							
				
						</div>
						
						<!-- 제출 버튼 -->
						<div class="row">
							<div class="col-sm-4 col-md-4 col-lg-4" ></div>
							<div class="form-group col-sm-3 col-md-3 col-lg-3">
								<!--  <button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>-->
								<button type="button" id="findBtn" class ="btn btn-primary form-control">찾기</button>
								<a class="btn btn-danger btn-block"	href="${Path}">취소</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		</div>
	</div>
</div>
<!-- 이메일 인증 모달 -->
<div id="emailAuthModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">이메일 인증</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-8">
						<input type="email" class="form-control" id="user_mail_modal" placeholder="이메일" >
					</div>
					<div class="col-lg-4">
						<button type="button" class="btn btn-success btn-block" id="sendAuthBtn">인증번호 전송</button>
					</div>
				</div>
				<div class="row" id="authDiv" style="margin-top: 15px; display: none;">
					<div class="col-lg-4">
						<input type="text" class="form-control" id="auth_num" placeholder="인증번호">
					</div>
					<div class="col-lg-4">
						<button type="button" class="btn btn-primary btn-block" id="authMailBtn">인증</button>
					</div>
					<div class="col-lg-4"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 이메일 인증 모달 종료 --> 	




</body>
</html>