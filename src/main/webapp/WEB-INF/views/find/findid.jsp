<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>


$(document).ready(function() {
	
	//확인버튼 입력시 실행
	$('#searchBtn').click(function() {
		$('#background_modal').show();
	});
	
	$('.close').on('click', function() {
		$('#background_modal').hide();
	});
	// 3. 모달창 위도우 클릭 시 닫기
	$(window).on('click', function() {
		if (event.target == $('#background_modal').get(0)) {
            $('#background_modal').hide();
         }
	});

});
var idV = "";
// 아이디 값 받고 출력하는 ajax
var idSearch_click = function(){
	$.ajax({
		type:"POST",
		url:"${path}/main/userSearch?m_tel="
				+$('#m_name').val()+"&m_tel="+$('#m_tel').val(),
		success:function(data){
			if(data == 0){
				$('#id_value').text("회원 정보를 확인해주세요!");	
			} else {
				$('#id_value').text(data);
				// 아이디값 별도로 저장
				idV = data;
			}
		}
	});
}


//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
function check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";	
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}







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
				 		<h2 style ="text-align:center; border-bottom" >아이디 찾기</h2>
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
				 		<h5>회원정보에 등록한 휴대폰번호로 인증</h5>
				 		<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<span style="font-family :Fantasy; ">이름 :</span> 
								
							</div>
							<div class="form-group col-sm-5 col-md-5 col-lg-5">
								<input  type="text" class="form-control" id="m_name" name="m_name" placeholder="ex)김강준" >
							</div>
							<div class="form-group col-sm-4 col-md-4 col-lg-4" >
								
							</div>
						</div>
				 		
				 		
				 		<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<span style="font-family :Fantasy; ">번호입력:</span> 
								
							</div>
							<div class="form-group col-sm-5 col-md-5 col-lg-5">
								<input  type="text" class="form-control" id="m_tel" name="m_tel" placeholder="ex)01012341234 " >
							</div>
							
				
						</div>
						
						<!-- 제출 버튼 -->
						<div class="row">
							<div class="col-sm-4 col-md-4 col-lg-4" ></div>
							<div class="form-group col-sm-3 col-md-3 col-lg-3">
								<!--  <button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>-->
								<input type="submit" class="btn btn-primary form-control" value="확인">
								<a class="btn btn-danger btn-block"	href="${Path}">취소</a>
							</div>
						</div>
						</div>
						
						</form>
						<form method="POST" action="./findidAction">
				 		<div id="searchP" style="display: none;">
				 		<h5>회원정보에 등록한 이메일로 인증</h5>
				 		<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<span style="font-family :Fantasy; ">이름 :</span> 
								
							</div>
							<div class="form-group col-sm-5 col-md-5 col-lg-5">
								<input  type="text" class="form-control" id="m_name" name="m_name" placeholder="ex)김강준" >
							</div>
							<div class="form-group col-sm-4 col-md-4 col-lg-4" >
								
							</div>
						</div>
				 		
				 		
				 		<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<span style="font-family :Fantasy; ">이메일입력 :</span> 
								
							</div>
							<div class="form-group col-sm-5 col-md-5 col-lg-5">
								<input  type="email" class="form-control" id="m_email" name="m_email" placeholder="ex)abc@abc.com" >
							</div>
							
							<div class="col-sm-4 col-md-4 col-lg-4" >
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#emailAuthModal" >인증받기</button>
							</div>
						</div>
						
					
						
						<!-- 제출 버튼 -->
						<div class="row">
							<div class="col-sm-4 col-md-4 col-lg-4" ></div>
							<div class="form-group col-sm-3 col-md-3 col-lg-3">
								<input type="submit" class="btn btn-primary form-control" value="확인">
								<a class="btn btn-danger btn-block"	href="${path}">취소</a>

							</div>
						</div>
				 		</div>
				 	
				 		
	
				 	</form>
				 	</div>
				 </div>
			</div>
				<div class="col-md-2 col-md-offset-4"></div>
		</div>
	</div>
				




</body>
</html>