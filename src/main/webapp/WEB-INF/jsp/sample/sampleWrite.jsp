<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/jsp/sample/include_header.jsp" %>
</head>
<body>
    <form id="frm">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>Sample</caption>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
                </tr>
                <tr>
                    <td colspan="2" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
         
        <a href="#this" class="btn" id="write" >작성하기</a>
        <a href="#this" class="btn" id="list" >목록으로</a>
    </form>
     
    <%@ include file="/WEB-INF/jsp/sample/include_bottom.jsp" %>
    <script type="text/javascript">
	    $(document).ready(function(){
	        $("#list").on("click", function(e){ //목록으로 버튼
	            e.preventDefault();
	            fn_openSampleList();
	        });
	         
	        $("#write").on("click", function(e){ //작성하기 버튼
	            e.preventDefault();
	            fn_insert()();
	        });
	    });
	     
	    function fn_openSampleList(){
	        var comSubmit = new ComSubmit();
	        comSubmit.setUrl("<c:url value='/sample/sampleList.do' />");
	        comSubmit.submit();
	    }
	     
	    function fn_insert(){
	        var comSubmit = new ComSubmit("frm");
	        comSubmit.setUrl("<c:url value='/sample/insertSampleList.do' />");
	        comSubmit.submit();
	    }
    </script>
</body>
</html>