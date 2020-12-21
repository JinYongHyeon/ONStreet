<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ONStreet</title>
<style>
#routeError{
	width:800px;
	position: absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	text-align: center;
}
#routeError img{
	width:100%;
}
#routeError h1{
	margin:0;
}
#routeError button{
	border:none;
	background-color:#d03535;
	width:50%;
	height: 45px;
	color:#fff;
	margin-top:25px;
}

@media screen and (max-width:480px){
	#routeError{
		width:350px;		
	}
	#routeError h1{
		font-size:24px;
	}
	#routeError button{
		width:83%;
	} 
}

</style>
</head>
<body>
<%-- <h1>야~ error 다~~~~~~</h1>
<div class="error-img">
 <img alt="" src="${pageContext.request.contextPath}/resources/img/errorimg.jpg" width="600" height="600"> 
 </div> --%>
 <div id="routeError">
 	<img src="${pageContext.request.contextPath}/resources/img/logo.png">
 	<h1>페이지를 찾을 수 없습니다.</h1>
 	<button type="button" onclick="location.href='${pageContext.request.contextPath}/home.do'">홈으로 가기</button>
 </div>
</body>
</html>