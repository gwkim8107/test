<!-- c.catch.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>c:catch</title>
</head>
<body>
<%--  <c:catch> 태그 --%>
<!--  발생된 익셉션을 EL 변수에 저장할 때 사용된다. -->
<%--  <c:catch var="변수명"> . . . 익셉션이 발생할 수 있는 코드 . . . </c:catch> ${ 변수명 }  --%>
	<c:catch var="exception">
		name 파라미터 값 : <%= request.getParameter("name") %><br>
		<%
			if (request.getParameter("name").equals("test")) {
		%>
				${ param.name }은 test 입니다.
		<%
			}
		%>
	</c:catch>
		<hr>
		<c:if test="${ exception != null }">
			익셉션이 발생하였습니다.<br>
			${ exception }
		</c:if>
</body>
</html>

<!-- 
	실행결과
	
	name 파라미터 값 : null
	---------------------------------------------
	익셉션이 발생하였습니다.
	java.lang.NullPointerException
 -->