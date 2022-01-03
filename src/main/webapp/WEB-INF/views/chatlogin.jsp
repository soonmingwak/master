<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<title></title>
<meta http-equiv="Conetent-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${path}/resources/js/bootstrap.js"></script>

</head>

<body>



<h2><c:out value="${error}" /></h2>
	<h2><c:out value="${logout }"/></h2>
	
    <div class="container">
        <div class="row">
         <div class=" col-md-3 col-md-offset-4"></div>
            <div class=" col-md-5 col-md-offset-4">
                <div class="jumbotron">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="text-align:center;">로그인</h3>
                    </div>
                    <div class="panel-body">	
						<form role="form" method="post" action="/loginAction">
							<div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="아이디를 입력해주세요" name="m_id" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호를 입력해주세요" name="m_pw" type="password" value="">
                                   <a href = "${path}/findid">아이디 ,</a> <a href = "${path}/findpw" >비밀번호를 잊어버리셨나요?</a>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember-me" type="checkbox">아이디 기억하기
                                    </label>
                                </div>
                              
                                <div class="form-group">
									<input type="submit" class="btn btn-success form-control" value="로그인">
								</div>
                                <a href = "${path}/join" class="btn btn-primary form-control" >회원가입</a><p style="text-align:center; ">계정이 필요하신가요?</p>
                            </div>
                            
                            <!-- csrf라는 이름으로 처리되는 csrf토큰 -->		
							<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class=" col-md-3 col-md-offset-4"></div>
    </div>
  
    <!-- jQuery -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/dist/js/sb-admin-2.js"></script>

<script>
$(".btn-success").on("click", function(e){
	e.preventDefault();
	$("form").submit();
})

$(document).ready(function(){
	var msg = '${msg}';
	if(msg != null && msg != '') alert(msg);
});
</script>

</body>

	
</html>