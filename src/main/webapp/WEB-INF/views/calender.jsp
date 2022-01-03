<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='kr'>
  <head>
    <meta charset='utf-8' />
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link href='${path}/resources/fullcalendar-5.10.1/lib/main.css' rel='stylesheet' />
<script src='${path}/resources/fullcalendar-5.10.1/lib/main.js'></script>
<script type='text/javascript'>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyDSjFnT0mRTgkR1xvhwlen9SqdCd9m0YGw',
    eventSources: [
    {
          googleCalendarId: 'tjdrhs464@google.com',
          className: '김성곤',
          color: '#be5683', //rgb,#ffffff 등의 형식으로 할 수 있어요.
          //textColor: 'black' 
        },
      {
          googleCalendarId: 'addressbook#contacts@group.v.calendar.google.com',
          className: '생일',
            color: '#204051',
            //textColor: 'black' 
        }
   
    ]
  });
  calendar.render();
});
</script>
<style>
#calendar{
   width:60%;
   margin:20px auto;
}
</style>
  </head>
  <body>
  <%
String id = (String) session.getAttribute("m_id");
if(id == null) response.sendRedirect("/main/chatlogin");
%>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="${path}/main">회사이름</a>
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
						${m_id}<br>마이페이지 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${path}/info">내정보</a>
						<a class="dropdown-item" href="${path}/logout">로그아웃</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${path}/set ">설정</a>
					</div></li>
			</ul>
		</div>
	</nav>
  
  
    <div id='calendar'></div>
  </body>
</html>