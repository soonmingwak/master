<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">


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
				 		<h2 style ="text-align:center; border-bottom" >아이디 검색결과</h2>
				 		<ul style="border-bottom:2px solid #ffffff; "></ul>
				 		
				 	
				 		<div >
				 		<h5>아이디검색결과</h5>
				 		<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<div class="form-control">
									<p3>${id}</p3>
								</div>
							
							</div>
							
							
						</div>
				 		
				 		
				 		
						
						<!-- 제출 버튼 -->
						<div class="row">
							<div class="col-sm-4 col-md-4 col-lg-4" ></div>
							<div class="form-group ">
								
								<a class="btn btn-primary"	href="${Path}/">로그인하기</a>
								<a class="btn btn-primary"	href="${Path}/findpw">비밀번호찾기</a>
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