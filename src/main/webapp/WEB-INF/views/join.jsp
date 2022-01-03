<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
</head>
<body>

	
	<!-- 메인 컨텐츠 -->
	
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-md-offset-4"></div>
			<div class="col-md-6 col-md-offset-4">
				 <div class="jumbotron">
				 	<div class="panel-heading">
				 	<form method="POST" action="./joinAction">
				 		<h3 style ="text-align:center">회원가입</h3>
				 		<!-- 아이디 입력칸 -->
				 		<div class="row">
				 			<div class="form-group col-sm-9 col-md-9 col-lg-9">
				 				<span style="font-family :Fantasy;">아이디 :</span> 
				 				<input type="text" class="form-control" autocomplete="off" name="m_id" >
							</div>
							<div class="col-sm-3 col-md-3 col-lg-3" style="margin-bottom: 15px;">
							<button type="button" class="btn btn-primary btn-block" id="id_check"  style="margin-top: 23px;">중복체크</button>
							</div>
						</div>
						<!-- 비밀번호 입력칸 -->
						<div class="form-group">
				 			<span style="font-family :Fantasy;">비밀번호 :</span> 
				 			<input type="text" class="form-control" autocomplete="off" name="m_pw" >
						</div>
						<!--  비밀번호 확인 -->
						<div class="form-group">
				 			<span style="font-family :Fantasy;">비밀번호확인 :</span> 
				 			<input type="text" class="form-control" autocomplete="off" name="m_pw2" >
						</div>
						<!-- 비밀번호 체크에 대한 공간 할당 -->
						<div class="row">
							<div class="col-sm-12 col-md-12 col-lg-12">
							<h6 id="diff_pw" class="text-danger" style="display: none;">비밀번호가 서로 다릅니다.</h6>
							<h6 id="equal_pw" class="text-success" style="display: none;">확인되었습니다.</h6>
							</div>
						</div>
						<!--  이릅 입력칸 -->
						<div class="form-group">
				 			<span style="font-family :Fantasy;">이름입력 :</span> 
				 			<input type="text" class="form-control" autocomplete="off" name="m_name" >
						</div>
						<!--  소속 입력칸 -->
						<div class="form-group">
				 			<span style="font-family :Fantasy;">소속입력 :</span> 
				 			<input type="text" class="form-control" autocomplete="off" name="m_aff" >
						</div>
			
						<!-- 성별 선택 -->
							<div class="form-group" style="text-align: center;">
								<div  style="align:center;" class="btn-group" data-toggle="buttons">
								<!-- label : UI 요소에 라벨을 정의하는 HTML 태그 -->
									<label class="btn btn-primary active" >
										<input type="radio" name="m_gender" autocomplete="off" value="m" checked>남자
									</label>
									<label class="btn btn-primary" >
										<input type="radio" name="m_gender" autocomplete="off" value="w">여자
									</label>
								</div>
							</div>
						<!-- 이메일 입력 -->
						<div class="row">
							<div class="form-group col-sm-8 col-md-8 col-lg-8" >
								<span style="font-family :Fantasy;">이메일입력 :</span> 
								<input  type="email" class="form-control" id="m_email" name="m_email" >
							</div>
							<div class="col-sm-4 col-md-4 col-lg-4" >
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#emailAuthModal" style="margin-top: 23px;" >인증메일발송</button>
							</div>
						</div>
						<!-- 전화번호 입력 -->
						<div class="form-group">
							<span style="font-family :Fantasy;">전화번호 :</span> 
							<input type="text" class="form-control" autocomplete="off" name="m_tel" placeholder="-제외 숫자만입력" >
						</div>
						
						<!-- 주소 입력에대한 공간 할당 -->
						
							<!-- 우편번호 입력 -->
							<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<span style="font-family :Fantasy;">우편번호 :</span>
							</div>
							<div class="col-sm-4 col-md-4 col-lg-4" >
								<input type="text" class="form-control" id="m_addr1" name="m_addr1" >
							</div>
						
							<div class="col-sm-4 col-md-4 col-lg-4" >
								<button type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#addrModal">주소검색</button>
							
							</div>
							</div>
						
						
						
						<!-- 주소 입력 -->
						<div class="row">
						
							<div class="form-group col-sm-12 col-md-12 col-lg-12">
								<span style="font-family :Fantasy;">주소입력 :</span> 
								<input type="text" class="form-control" id="m_addr2" name="m_addr2" placeholder="주소" >
							</div>
						</div>
				
						<!-- 상세주소 입력에 대한 공간 할당 -->
						<div class="row">
							<!-- 상세주소 입력 -->
							<div class="form-group col-sm-12 col-md-12 col-lg-12">
								<input type="text" class="form-control" id="m_addr3" name="m_addr3" placeholder="상세주소">
							</div>
						</div>
				
						<!-- 제출 버튼 -->
						<div class="form-group">
							<input type="submit" class="btn btn-primary form-control" value="회원가입">
						</div>
						</form>
				 	</div>
				 </div>
			</div>	 
			<div class="col-md-3 col-md-offset-4"></div>
		
		</div>
	
	</div>
	
	
</body>
</html>