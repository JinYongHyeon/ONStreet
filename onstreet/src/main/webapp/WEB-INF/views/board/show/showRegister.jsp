<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/editor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
   var oEditors = [];
   $(function(){
      nhn.husky.EZCreator.createInIFrame({
         oAppRef: oEditors,
         elPlaceHolder: "showContent", //text area id 
         //SmartEditor2Skin.html 파일이 존재하는 경로
         sSkinURI: "${pageContext.request.contextPath}/resources/editor/SmartEditor2Skin.html",  
         htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,         
            fOnBeforeUnload : function(){}
         }, 
         fOnAppLoad : function(){
         //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
         //oEditors.getById["PostContent"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
         },
         fCreator: "createSEditor2"
      });
         
      //저장버튼 클릭시 form 전송
      $("#postWrite").click(function(){
         if($("#postTitle").val()==""){
             alert("게시글 제목을 입력하세요.");
             return;
         }
         
         oEditors.getById["showContent"].exec("UPDATE_CONTENTS_FIELD", []);
         
         if($("#showContent").val()==""){
            alert("게시글 내용을 입력하세요.");
            return;
         }
      
         $("#frm").submit();
      });
   });
   
</script>
<div class="col-sm-2"></div>
<div class="col-sm-8">

	<form method="post" action="addShow.do" id="frm">
		<sec:csrfInput />
		<table border="1">
			<tr>
				<td>공연제목</td>
				<td><input type="text" name="showTitle"></td>
			</tr>
			<tr>
				<td>공연내용</td>
				<td style="width:1300px"><textarea rows="25" cols="100" name="showContent" id="showContent"></textarea></td>
			</tr>
			<tr>
				<td>공연날짜</td>
				<td><input type="date" name="showDate" required="required"></td>
			</tr>
		</table>
		<input type="button" id="postWrite" class="btn btn-primary" value="등록하기"/>
	</form>
</div>
<div class="col-sm-2"></div>