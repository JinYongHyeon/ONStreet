<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript">


function check(){
	var flag = false;
	var checkBox = document.getElementsByName("checkboxBtn");
	for(var i=0;i<checkBox.length;i++){
		if(checkBox[i].checked){
			flag=true;
			break;
		}
	} 
	
		if(flag===true){
			return confirm("정말삭제하시겠습니까?");
		}
}

	$(function(){
		//전체 체크박스 클릭 이벤트
		$(document).on("click","#checkboxBtn2",function(){
			var flag =false;
			var checkBox = document.getElementsByName("checkboxBtn");
			var allCheckBox = document.getElementById("checkboxBtn2");
			var btn =document.getElementById("deleteEventBtn");
			var flag = false;
			for(i=0; i<checkBox.length; i++){
				checkBox[i].checked = allCheckBox.checked;
				flag = checkBox[i].checked;
			}
			
			if(flag===true){
				$("#deleteEventBtn").css("display","block");
				$("#deleteEventBtn").animate({
					opacity:1
				},500);

			}else{
				$("#deleteEventBtn").css({"display":"none","opacity":0});
			}
		});
		
		//체크박스 클릭 이벤트
		$(document).on("click","#checkboxBtn",function(){
			var flag=false;
			var checkBox = document.getElementsByName("checkboxBtn");
			for(i=0; i<checkBox.length; i++){
				if(checkBox[i].checked){
				flag=true;
				break;
				}
			}
			
			if(flag===true){
				$("#deleteEventBtn").css("display","block");
				$("#deleteEventBtn").animate({
					opacity : 1
				},500);
				
			}else{
			
				$("#deleteEventBtn").css("display","none");	
				$("#deleteEventBtn").css("opacity","0");	
				
				$("#checkboxBtn").prop('checked', false);	
			}
			
		});//function2
	});//function1
//삭제 버튼id명  deleteEventBtn



</script>




<div class="container">
  <span id="eventCheckTitle">이벤트승인현황</span>
  


<table class=" table artistCheckEventTable">
<thead>
<tr>
	<th>이벤트번호</th>
	<th>이벤트제목</th>
	<th>이벤트날짜</th>
	<th>승인상태  <input type="checkbox" id="checkboxBtn2"/></th>
</tr>
</thead>

<tbody>
<form action="${pageContext.request.contextPath}/deleteEvent2.do?deleteEvent=${evtlist.eventNo}" method="post" onsubmit="return check()" name="form">
<div>
<p class="evetext">*반려상태인 이벤트만 삭제 가능합니다.</p>            
<input type="submit" style="display:none; opacity: 0" id="deleteEventBtn" class="btn btn-danger confirm_delete" value="삭제하기" data-original-title>
</div>
<sec:csrfInput/>
<c:forEach var="evtlist" items="${requestScope.eventVO.eventList}">
<tr>
	<td>${evtlist.eventNo}</td>
	<td><a href="getEventDetail.do?eventNo=${evtlist.eventNo}"><span id="checkEventTitle">${evtlist.eventTitle}</span></a></td>
	<td>${evtlist.eventDate}</td>
<!-- null이 아니면 승인 아니면 미승인 -->
<td>
<c:set var="eventCheckDate" value="${evtlist.eventCheckDate}"/>
<c:choose>
<c:when test="${!empty eventCheckDate && eventCheckDate!='0001-01-02'}">
승인
</c:when> 
<c:when test="${eventCheckDate  == '0001-01-02'}">

반려  <input type="checkbox" name="checkboxBtn" value="${evtlist.eventNo}" id="checkboxBtn">
</c:when>
<c:otherwise>
미승인
</c:otherwise>
</c:choose>
</td>
</tr>
</c:forEach>
</form>
</tbody> 
</table>


<c:set var="pb" value="${requestScope.eventVO.pagingBean}" />
<div class="pagingInfo">
   <ul class="pagination">
   <c:if test="${pb.previousPageGroup}">   
   <li><a href="${pageContext.request.contextPath}/artistCheckEventList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
   </c:if>
   <c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
   end="${pb.endPageOfPageGroup}">
   <c:choose>
   <c:when test="${pb.nowPage!=i}">
   <li><a href="${pageContext.request.contextPath}/artistCheckEventList.do?pageNo=${i}">${i}</a></li> 
   </c:when>
   <c:otherwise>
   <li class="active"><a href="#">${i}</a></li>
   </c:otherwise>
   </c:choose>
   </c:forEach>
   <c:if test="${pb.nextPageGroup}">   
   <li><a href="${pageContext.request.contextPath}/artistCheckEventList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
   </c:if>
   </ul>          
   </div>  
   </div>
