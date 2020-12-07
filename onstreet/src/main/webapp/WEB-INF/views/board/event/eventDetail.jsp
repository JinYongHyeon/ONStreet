<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<h3>EVENT</h3>

<div class="col-sm-2"></div>
<div class="col-sm-8">
<span id="eventName">${requestScope.eventVO.eventTitle}</span><br><br>
이벤트 날짜 : ${requestScope.eventVO.eventDate}<hr>
${requestScope.eventVO.eventContent} <br>
</div>
<div class="col-sm-2"></div>