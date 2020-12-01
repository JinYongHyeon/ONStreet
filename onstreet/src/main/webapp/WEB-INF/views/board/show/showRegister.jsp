<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<div class="col-sm-2"></div>
<div class="col-sm-8">
	<form method="post" action="addShow.do">
		<sec:csrfInput />
		<table border="1">
			<tr>
				<td>공연제목</td>
				<td><input type="text" name="showTitle"></td>
			</tr>
			<tr>
				<td>포스터</td>
				<td><input type="text" name="showImg"></td>
			</tr>
			<tr>
				<td>공연내용</td>
				<td><input type="text" name="showContent"></td>
			</tr>
			<tr>
				<td>공연날짜</td>
				<td><input type="date" name="showDate" required="required"></td>
			</tr>
		</table>
		<input type="submit" class="btn btn-primary" value="등록하기"/>
	</form>
</div>
<div class="col-sm-2"></div>