<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<h1><b>EVENT</b></h1>
<br>
<div>
제목 : ${requestScope.eventVO.eventTitle} <br>
작성자 : ${requestScope.eventVO.artistVO.memberVO.nickName} <br>
${requestScope.eventVO.eventContent} <br>
</div>