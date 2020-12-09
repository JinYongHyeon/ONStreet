<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#removeBtn").click(function(){
		if(confirm("정말탈퇴하시겠습니까?")){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/removeMember.do",
				dataType:"text", 
				data:"password="+$("#removePass").val(),
				beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(event){
					if(event==="0"){
						alert("비밀번호가 일치하지 않습니다");
						$('#removePass').val('');
						 $('#removePass').focus();
					}else{
						alert("성공적으로 탈퇴되었습니다");						
						$("#logoutForm").submit();					
						
				}
			}
		
				});//ajax end
			}//if end
		});//removeBtn click end 
	});//ready end
	
	function target(){
		return confirm("정말 탈퇴하시겠습니까?");
	};
</script>


<sec:csrfInput />
<h2 class="font_ctb">회원탈퇴</h2>
<div class="remove-member">
<fieldset>
<table>
	<tr>
		<td>아이디</td>
		<td><sec:authentication property="principal.memberVO.id" /></td>
	</tr>

	<tr>
		<td>비밀번호</td>
		<td><input type="password" id="removePass" name="password" autofocus></td>
	</tr>
	
</table>
<input type="button" value="탈퇴하기" class="removBtn" id="removeBtn">
</fieldset>
</div>
