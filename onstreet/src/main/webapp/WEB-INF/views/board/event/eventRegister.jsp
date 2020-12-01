<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
</head>
<body>
<form action="addEvent.do" method="post">
<sec:csrfInput />
제목 : <input type="text" name="eventTitle" placeholder="제목을 입력하세요" required="required"> <br>
이벤트 내용 : <input type="text" name="eventContent" required="required"> <br>
이벤트 날짜 : <input type="date" name="eventDate" required="required"> <br>
배너 사진 : <input type="text" name="eventImage" required="required"><br>
<input type="submit" value="등록하기">
</form>
</body>
</html>