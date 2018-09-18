<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>회원관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- index 입장에서의 파일첨부-->
<link href="css/bootstrap.min.css"  rel="stylesheet">
<link href="css/starter-template.css" rel="stylesheet">
<!-- 스크립트 순서 중요함   -->
<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
$(function(){
	$('.nav-item a').filter(function(){
		return this.href==location.href
		}).parent().addClass('active').siblings().removeClass('active');		
});
</script>
</head>
<body>
    <!-- Fixed navbar -->
      <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="index.jsp">
        	<img src="img/icons8-launch-box-48.png">
        </a>
        
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="view/joinForm.jsp">Register</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="view/loginForm.jsp">Login</a>
            </li>
          </ul>          
        </div>
      </nav>
      <main role="main" class="container">



