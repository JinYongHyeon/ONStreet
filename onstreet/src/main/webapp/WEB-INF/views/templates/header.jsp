<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

		<div class="bitLog">
			<a href="${pageContext.request.contextPath}/home.do"><img src="${pageContext.request.contextPath}/resources/img/profile/default image-2.png" alt="log"></a>
		</div>

<div class="navigation">
		<nav>
			<ul>
				<li><a href="${pageContext.request.contextPath}/getShowList.do">공연</a></li>
				<li><a href="${pageContext.request.contextPath}/getArtistList.do">아티스트</a></li>
				<li><a href="${pageContext.request.contextPath}/getEventList.do">이벤트</a></li>
				<li><a href="${pageContext.request.contextPath}/getNoticeList.do">공지사항</a></li>
			</ul>
		</nav>
	<div class="loginbar">
		<%-- 비로그인 --%>
		<sec:authorize access="!hasRole('ROLE_MEMBER')">

			<a href="#" id="loginFormBtn">로그인</a>
			<a href="${pageContext.request.contextPath}/checkDocument.do">회원가입</a>
		</sec:authorize>

		<%-- 로그인 --%>
		<sec:authorize access="hasRole('ROLE_MEMBER')">
			<form id="logoutForm" action="${pageContext.request.contextPath}/logout.do" method="post">
				<sec:csrfInput />
			</form>
			<a href="#" id="logout">로그아웃</a>
			<a href="${pageContext.request.contextPath}/mypageForm.do">마이페이지</a>

		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<a href="${pageContext.request.contextPath}/adminPageForm.do">관리자페이지</a>
		</sec:authorize>

	</div>
		<div class="bitMainSearch">
			<form action="${pageContext.request.contextPath}/getShowSearchList.do" method="get" id="searchForm">
				<input type="text" name="searchContent" required="required"> <input type="submit" value="검색">
				<select name="kinds">
					<option value="공연">공연</option>
					<option value="아티스트">아티스트</option>
				</select>
			</form>
		</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		
		$(document).on("change",".bitMainSearch form select",function(){
		if($(this).val() ==="아티스트"){
			$(".bitMainSearch form").attr("action","${pageContext.request.contextPath}/getAristSearchList.do");
		}else if($(this).val() ==="공연"){
			$(".bitMainSearch form").attr("action","${pageContext.request.contextPath}/getShowSearchList.do");
		}
		});
		$(document).on("submit","#searchForm",function(){
			var content = $("#searchForm input[name=searchContent]").val();
			if(content.trim()===""){
				alert("공백은 검색이 제한됩니다. 다시 입력해 주십시오.");
				$("#searchForm input[name=searchContent]").val("");
				$("#searchForm input[name=searchContent]").focus();
				return false;
			}
		});
	});
</script>
