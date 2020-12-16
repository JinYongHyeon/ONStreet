<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

		<div class="bitLog">
			<a href="${pageContext.request.contextPath}/home.do"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="log"></a>
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
		<%-- 비로그인 --%><%-- 
		<sec:authorize access="!hasRole('ROLE_MEMBER')">

			<span id="loginFormBtn">로그인</span>
			<a href="${pageContext.request.contextPath}/checkDocument.do">회원가입</a>
		</sec:authorize> --%>


	<div class="bitLogin">
		<%-- 로그인 --%>
		<sec:authorize access="hasRole('ROLE_MEMBER')">
			<form id="logoutForm" action="${pageContext.request.contextPath}/logout.do" method="post">
				<sec:csrfInput />
			</form>
			<a href="#" id="logout">로그아웃</a>
			<a href="${pageContext.request.contextPath}/mypageForm.do">마이페이지</a>

			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="${pageContext.request.contextPath}/adminPageForm.do">관리자페이지</a>
			</sec:authorize>
		</sec:authorize>
		</div>
	<div class="bitMainSearch">
			<svg id="asd"  viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
			  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
			</svg>
			
			<form action="${pageContext.request.contextPath}/getShowSearchList.do" method="get" id="searchForm">
				<input type="text" name="searchContent" required="required" placeholder="공연제목을 입력해주세요" maxlength="60"> <input type="submit" value="검색">
				<select name="kinds">
					<option value="공연">공연</option>
					<option value="아티스트">아티스트</option>
				</select>
			</form>
			
		</div>
	</div>
	<div class="mobileSearch">
		<form action="${pageContext.request.contextPath}/getShowSearchList.do" method="get" id="mobileSearchForm">
				<input type="text" name="searchContent" required="required" placeholder="공연제목을 입력해주세요" maxlength="60">
				<select name="kinds">
					<option value="공연">공연</option>
					<option value="아티스트">아티스트</option>
				</select>
				 <input type="submit" value="검색">
				 <svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" class="bi bi-forward" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M9.502 5.513a.144.144 0 0 0-.202.134V6.65a.5.5 0 0 1-.5.5H2.5v2.9h6.3a.5.5 0 0 1 .5.5v1.003c0 .108.11.176.202.134l3.984-2.933a.51.51 0 0 1 .042-.028.147.147 0 0 0 0-.252.51.51 0 0 1-.042-.028L9.502 5.513zM8.3 5.647a1.144 1.144 0 0 1 1.767-.96l3.994 2.94a1.147 1.147 0 0 1 0 1.946l-3.994 2.94a1.144 1.144 0 0 1-1.767-.96v-.503H2a.5.5 0 0 1-.5-.5v-3.9a.5.5 0 0 1 .5-.5h6.3v-.503z"/>
</svg>
			</form>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		/*데스크탑용 검색기능*/
		$(document).on("change",".bitMainSearch form select",function(){
		if($(this).val() ==="아티스트"){
			$(".bitMainSearch form").attr("action","${pageContext.request.contextPath}/getAristSearchList.do");
			$(".bitMainSearch form input[type=text]").attr("placeholder","아티스트 닉네임을 입력해주세요");
		}else if($(this).val() ==="공연"){
			$(".bitMainSearch form").attr("action","${pageContext.request.contextPath}/getShowSearchList.do");
			$(".bitMainSearch form input[type=text]").attr("placeholder","공연제목을 입력해주세요");
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
		/*모바일용 검색기능*/
		$(document).on("change",".mobileSearch #mobileSearchForm select",function(){
			if($(this).val() ==="아티스트"){
				$(".mobileSearch #mobileSearchForm").attr("action","${pageContext.request.contextPath}/getAristSearchList.do");
				$(".mobileSearch #mobileSearchForm input[type=text]").attr("placeholder","아티스트 닉네임을 입력해주세요");
			}else if($(this).val() ==="공연"){
				$(".mobileSearch #mobileSearchForm").attr("action","${pageContext.request.contextPath}/getShowSearchList.do");
				$(".mobileSearch #mobileSearchForm input[type=text]").attr("placeholder","공연제목을 입력해주세요");
			}
			});
			$(document).on("submit","#mobileSearchForm",function(){
				var content = $("#mobileSearchForm input[name=searchContent]").val();
				if(content.trim()===""){
					alert("공백은 검색이 제한됩니다. 다시 입력해 주십시오.");
					$("#mobileSearchForm input[name=searchContent]").val("");
					$("#mobileSearchForm input[name=searchContent]").focus();
					return false;
				}
			});
		/*모바일용 검색기능 닫기*/
		$(document).on("click","#header .navigation .mobileSearch #mobileSearchForm svg",function(){
			$("#header .navigation .mobileSearch").animate({
				right:"-100%"
			},1000,function(){
				
			});
		});
	});
</script>
