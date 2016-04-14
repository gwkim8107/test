<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/jsp/sample/include_header.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/sample/bootstrap-3.3.6-dist/css/bootstrap.css'/>" />
</head>
<body>
    <form id="frm">
   		<div class="form-group">
        <table>
            <colgroup>
                <col width="10%">
                <col width="*"/>
            </colgroup>
                <tr>
	                <th>ID</th>
                    <td>
                    	<input type="text" id="id" name="ID" class="form-control"></input>
                    </td>
                </tr>
	     
                <tr>
                	<th>CountryCode</th>
                    <td>
                        	<input type="text" class="form-control" title="CountryCode" id="CountryCode" name="CountryCode"></input>
                    </td>
                </tr>
                <tr>
                    <th>CountryName</th>
                    <td>
                        	<input type="text" class="form-control" title="CountryName" id="CountryName" name="CountryName"></input>
                    </td>
                </tr>
                <tr>
                    <th>ContinentCode</th>
                    <td>
                        	<input type="text" class="form-control" title="" id="" name="ContinentCode"></input>
                    </td>
                </tr>
        </table>
        </div>
        <div class="form-group">
        <div class = "col-sm-offset-1.5 col-sm-8">
	        <button type="submit" class="btn btn-default"><a href="#this" class="btn" id="write" >작성하기</a></button>
	        <button type="submit" class="btn btn-default"><a href="#this" class="btn" id="list" >목록으로</a></button>
	    </div>
        </div>
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