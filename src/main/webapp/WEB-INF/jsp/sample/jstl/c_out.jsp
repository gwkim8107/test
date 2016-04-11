<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>c:out</title>
</head>
<body>
<%--  <c:out> 태그 --%>
<!-- - JspWriter에 데이터를 출력할 때 사용한다. -->
<%-- - <c:out value="값" escapeXml="boolean" default="기본값" /> --%>
<%-- - <c:out value="값" escapeXml="boolean" > 기본 값 </c:out> --%>
<!-- - value 속성은 출력할 값을 나타낸다. 문자열을 주로 값으로 쓴다. 값이 java.io.Reader의 한 종류라면 out 태그는 Reader로 읽어와 출력한다. -->
<!-- - default 속성에는 value 속성에 값이 존재하지 않을 때 기본값을 지정한다. -->
<!-- - escapeXml 속성이 true일 경우 아래 표에 해당하는 문자를 이스케이프 시퀀스로 변경한다. 생략할 경우 기본값은 true이다. -->
<!-- 이스케이프 시퀀스 -->
<!-- < => &lt; -->
<!-- > => &gt; -->
<!-- & => &amp; -->
<!-- ' => &#039; -->
<!-- " => &#034; -->

	<c:out value="<font size=7>갱짱</body>폰트 태그의 출력" escapeXml="true"/>
	<br>
	<br>
	<c:out value="<font size=7>갱짱</body>" escapeXml="false" />
</body>
</html>


<!-- 
	실행결과
	
	<font size=7>갱짱</body>폰트 태그의 출력 

	갱짱
 -->