<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String text = "축구,야구,농구,배구,골프,수영";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>c:forTokens</title>
</head>
<body>
<!--  자바의 Tokenizer와 같은 기능을 제공하는 태그이다. -->
<%--  <c:forTokens var="token" items="문자열" delims="구분자"> ${ token } </c:forTokens> --%>
<!--  item 속성으로 전달받은 문자열을 delims에 구분자를 이용해서 나눈뒤 var 변수에 저장한다. -->

	<c:set var="text" value="<%= text %>"/>
	
	<c:forTokens var="sports" items="${ text }" delims=",">
		${ sports } &nbsp;
	</c:forTokens>
	
	<hr><!-- ---------------------------------------------------- -->
	
	<c:forTokens var="fruit" items="토마토^귤^포도^오렌지^복숭아" delims="^">
		${ fruit } &nbsp;
	</c:forTokens>
</body>
</html>

<!-- 
	실행결과
	 
	축구   야구   농구   배구   골프   수영  
	--------------------------------------------
	토마토   귤   포도   오렌지   복숭아  
 -->