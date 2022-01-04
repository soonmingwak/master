<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">

<meta charset="UTF-8">
<title>Room</title>
<style>
* {
	margin: 0;
	padding: 0;
}

.container {
	width: 500px;
	margin: 0 auto;
	padding: 25px
}

.container h1 {
	text-align: left;
	padding: 5px 5px 5px 15px;
	color: #FFBB00;
	border-left: 3px solid #FFBB00;
	margin-bottom: 20px;
}

.roomContainer1 {
	background-color: #ffffff;
	width: 370px;
	height: 500px;
	overflow: auto;
}
.roomContainer2 {
	background-color: #ffffff;
	width: 370px;
	height: 500px;
	overflow: auto;
}

.roomList {
	border: none;
}

.roomList th {
	border: 1px solid #4E4D51;
	background-color: #4E4D51;
;
	color: #F4FFFF;
	text-align: center;
	font-weight: bold
}

.roomList td {
	border: 1px solid #4E4D51;
	background-color: #4E4D51;
;
	text-align: left;
	color: #F4FFFF;
	font-weight: bold
}

.roomList .num {
	width: 75px;
	text-align: center;
}

.roomList .room {
	width: 350px;
}

.roomList .go {
	width: 71px;
	text-align: center;
}


.inputTable th {
	padding: 5px;
}

.inputTable input {
	width: 200px;
	height: 25px;
}
.inputTable2 input {
	width: 370px;
	height: 60px;
}
</style>
</head>

<script type="text/javascript">
	//채팅
	var ws;

	function wsOpen() {
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chating/"
				+ $("#roomNumber").val());
		wsEvt();
	}

	function wsEvt() {
		ws.onopen = function(data) {
			//소켓이 열리면 동작
		}

		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if (msg != null && msg.trim() != '') {
				var d = JSON.parse(msg);
				if (d.type == "getId") {
					var si = d.sessionId != null ? d.sessionId : "";
					if (si != '') {
						$("#sessionId").val(si);
					}
				} else if (d.type == "message") {
					if (d.sessionId == $("#sessionId").val()) {
						$("#chating").append(
								"<p class='me'>나 :" + d.msg + "</p>");
					} else {
						$("#chating").append(
								"<p class='others'>" + d.userName + " :"
										+ d.msg + "</p>");
					}

				} else {
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) { //enter press
				send();
			}
		});
	}

	function chatName() {
		var userName = $("#userName").val();
		if (userName == null || userName.trim() == "") {
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		} else {
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		var option = {
			type : "message",
			roomNumber : $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
	//채팅끝

	//채팅방
	window.onload = function() {
		getRoom();
		createRoom();
	}

	function getRoom() {
		commonAjax('/getRoom', "", 'post', function(result) {
			createChatingRoom(result);
		});
	}

	function createRoom() {
		$("#createRoom").click(function() {
			var roomName = prompt('채팅방 이름을 입력해주세요.', '');
			$('#roomName').val(roomName);
			var msg = {
				roomName : $('#roomName').val()
			};

			commonAjax('/createRoom', msg, 'post', function(result) {
				createChatingRoom(result);
			});

			$("#roomName").val("");
		});
	}

	function goRoom(number, name) {
		location.href = "/moveChating?roomName=" + name + "&" + "roomNumber="
				+ number;
	}

	function createChatingRoom(res) {
		if (res != null) {
			var tag = "<tr><th class='num'>순서</th><th class='room'>방 이름</th><th class='go'></th></tr>";
			res
					.forEach(function(d, idx) {
						var rn = d.roomName.trim();
						var roomNumber = d.roomNumber;
						tag += "<tr>"
								+ "<td class='num'>"
								+ (idx + 1)
								+ "</td>"
								+ "<td class='room'>"
								+ rn
								+ "</td>"
								+ "<td class='go'><button type='button' class='btn btn-dark font-weight-bold text-white' onclick='goRoom(\""
								+ roomNumber + "\", \"" + rn
								+ "\")'>참여</button></td>" + "</tr>";
					});
			$("#roomList").empty().append(tag);
		}
	}

	function commonAjax(url, parameter, type, calbak, contentType) {
		$.ajax({
			url : url,
			data : parameter,
			type : type,
			contentType : contentType != null ? contentType
					: 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(res) {
				calbak(res);
			},
			error : function(err) {
				console.log('error');
				calbak(err);
			}
		});
	}
	//채팅방 끝
</script>
<body>
	<jsp:include page="/WEB-INF/views/nav/mainNav.jsp" />
	<div class="container-filed"
		style="margin-top: 150px; margin-left: 600px;">
		<div class=row>
			<div class="col-lg-6">
			<h2><span class="badge badge-secondary">${roomName}</span></h2>
				<input type="hidden" id="sessionId" value=""> <input
					type="hidden" id="roomNumber" value="${roomNumber}">

				<div id="chating" class="border border-dark roomContainer1"></div>

				<div id="yourName">
<!-- 					<table class="inputTable"> -->
<!-- 						<tr> -->
<!-- 							<th><input type="text" name="userName" id="userName"></th> -->
<!-- 							<th><button type="button" class="btn btn-dark" onclick="chatName()" id="startBtn">이름 -->
<!-- 									등록</button></th> -->
<!-- 						</tr> -->
<!-- 					</table> -->
				</div>
				<div id="yourMsg">
					<table class="inputTable2">
						<tr>
							<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
							<th><button type="button" class="btn btn-dark" style="margin-top: 20px;" onclick="send()" id="sendBtn">보내기</button></th>
						</tr>
					</table>
				</div>
				</div>
				
				<div class="col-lg-6">
				
					<h2><span class="badge badge-secondary">채팅방</span><button type="button" class="btn btn-dark" style="margin-left: 200px; font-weight: bold;" id="createRoom">방 생성</button></h2>
					<div id="roomContainer" class="roomContainer2">
						<table id="roomList" class="roomList"></table>
					</div>
					<div>
						<table class="inputTable">
							<tr>
								<th><input type="hidden" name="roomName" id="roomName"></th>
								<th></th>
							</tr>
						</table>
					</div>
				</div>
		</div>
	</div>
</body>
</html>