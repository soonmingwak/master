<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.sidebar {
	height: 100vh;
	background: linear-gradient(rgba(0, 0, 0, .7), rgba(0, 0, 0, 0.9));
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	box-shadow: 5px 7px 25px #999;
}

.bottom-border {
	border-bottom: 2px groove #eee;
}

.sidebar-link {
	transition: all .4s;
}

.sidebar-link:hover {
	background-color: #444;
	border-radius: 5px;
}
</style>


</head>
<body>
	<!-- nav 시작 -->
	<nav class="navbar navbar-expand-md navbar-light">
		<div class="collapse navbar-collapse" id="sidebar">
			<div class="container-fluid">
				<div class="row">
					<!-- sidbar 시작 -->
					<div class="col-lg-2 sidebar fixed-top">
						<a href="#"
							class="navbar-brand text-white text-center d-block mx-auto py-3 mb-4 bottom-border">KOREA
							IT 아카데미</a>
						<!-- 유저? -->
						<div class="bottom-border pb-3">
							<img src="" alt="" width="50" class="rounded-circle mr-3">
							<a href="#" class="text-white text-center d-block">이름</a>
						</div>
						<!-- 유저 -->
						<!-- 사이드바 메뉴 시작 -->
						<ul class="navbar-nav flex-column mt-4">
							<!-- 공백 -->
							<li class="nav-item"><a href="#" class="nav-link"></a></li>
							<!-- 공백 끝 -->
							<li class="nav-item"><a href="${path}/"
								class="nav-link text-white text-center  sidebar-link">멤버</a></li>
							<!-- 공백 -->
							<li class="nav-item"><a href="#" class="nav-link"></a></li>
							<li class="nav-item"><a href="#" class="nav-link"></a></li>
							<!-- 공백 끝 -->
							<!-- 채팅 -->
							<li class="nav-item"><a href="${path}/room"
								class="nav-link text-white text-center sidebar-link">채팅</a></li>
							<!-- 채팅끝 -->
							<!-- 공백 -->
							<li class="nav-item"><a href="#" class="nav-link"></a></li>
							<li class="nav-item"><a href="#" class="nav-link"></a></li>
							<!-- 공백 끝 -->
							<!-- 캘린더 -->
							<li class="nav-item"><a href="${path}/calender"
								class="nav-link text-white text-center sidebar-link">캘린더</a></li>
							<!-- 캘린더 끝 -->
							<!-- 공백  -->
							<li class="nav-item"><a href="#" class="nav-link"></a></li>
							<li class="nav-item"><a href="#" class="nav-link"></a></li>
							<!-- 공백 끝 -->
							<!-- 공지사항 -->
							<li class="nav-item"><a href="${path}/bbsList"
								class="nav-link text-white text-center sidebar-link">공지사항</a></li>
							<!-- 공지사항 끝 -->
							<!-- 공백  -->
							<li class="nav-item"><a href="#" class="nav-link"></a></li>
							<li class="nav-item"><a href="#" class="nav-link"></a></li>
							<!-- 공백 끝 -->
							<!-- 근태관리 -->
							<li class="nav-item"><a href="${path}/att"
								class="nav-link text-white text-center sidebar-link">근태관리</a></li>
							<!-- 근태관리 끝 -->
							<!-- 공백 -->
							<li class="nav-item"><a href="#" class="nav-link"></a></li>
							<li class="nav-item"><a href="#" class="nav-link"></a></li>
							<!-- 공백 끝 -->
							<!-- 조직도 -->
							<li class="nav-item"><a href="${path}/orgchart"
								class="nav-link text-white text-center sidebar-link">조직도</a></li>
							<!-- 조직도 끝 -->
						</ul>
						<!-- 사이드바 메뉴 끝 -->



					</div>
					<!-- sidbar 끝 -->
					<!-- top navbar 시작 -->
					<div class="col-lg-10 ml-auto bg-dark fixed-top py-3">
						<div class="row">
							<div class="col-md-5">
								<h4 class="text-light text-uppercase mb-0">Member</h4>
							</div>
							<div class="col-md-6"></div>
							<div class="col-md-1">
								<ul class="navbar-nav">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle text-white" href="#"
										id="navbardrop" data-toggle="dropdown">이름(조직)</a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">로그아웃</a> <a
												class="dropdown-item" href="#">설정</a>
										</div></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- top navbar 끝 -->
				</div>
			</div>
		</div>
	</nav>
	<!-- nav 끝 -->
</body>
</html>