<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="${path}/mainz">회사이름</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-expanded="false">
						${member.m_id }<br>마이페이지 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${path }/info">내정보</a>
						<a class="dropdown-item" href="${path }/logout">로그아웃</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${path}/set ">설정</a>
					</div></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron" >
		
	
			<table border="1" width ="400px">
			
 				<h2>내 정보 보기</h2>
  				<hr width = "400px" align="left"></hr>
		
				<tbody>
				
				<tr  height=30px>
					<td class="column1">아이디</td>
					<td class="con">${member.m_id}</td>
				</tr>
				<tr  height=30px>
					<td style="width: 30%;"> 비밀번호</td>
					<td>${member.m_pw}</td>
				</tr>
				<tr  height=30px>
					<td style="width: 30%;">이름</td>
					<td>${member.m_name}</td>
				</tr>
				<tr  height=30px>
					<td style="width: 30%;">소속</td>
					<td>${member.m_aff}</td>
					
				</tr>
				<tr  height=30px>
					<td style="width: 30%;">성별</td>
					<td>${member.m_gender}</td>
				</tr>
				<tr  height=30px>
					<td style="width: 30%;">이메일</td>
					<td>${member.m_email}</td>
				</tr>
				<tr  height=30px>
					<td style="width: 30%;"  >전화번호</td>
					<td>${member.m_tel}</td>
				</tr>
				<tr  height=30px>
					<td style="width: 30%;">주소</td>
					<td><span>${member.m_adr}</span></td>
				</tr>
				</tbody>
				
			</table>
			
			<c:if test="${m_id eq member.m_id }">
			<tr style="margin-top : 15px;">
				<td ><a href="./infochange?m_id=${member.m_id }" class="btn btn-success">수정</a></td>
			</tr>
			</c:if>
		 
	
	
		</div>
	</div>
	
	
	


	
	
	<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>