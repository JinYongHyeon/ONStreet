<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<div class="container">
	<div id="todayShow">
		<div class="artistShowTitle">
		
		</div>
		<div class="artistShowLeftBtn">
		</div>
		<div class="artistShow">
		</div>
		<div class="artistShowRightBtn">
		</div>
	</div>
</div>
<div id="artist">

</div>


<form action="${pageContext.request.contextPath}/fileupload.do" method="post" enctype="multipart/form-data" >
	<sec:csrfInput/>
	<input type="file" name= "files" multiple="multiple">
</form>
