<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>functions</title>
</head>
<body>
	<%
		HashMap map = new HashMap();
		map.put("1", "1");
		map.put("2", "2");
		map.put("3", "3");
		map.put("4", "4");
		map.put("5", "5");
	%>	
	<c:set var="map" value="<%= map %>" />
	<c:set var="str1" value="갱짱(Gz) 블로그, http://gangzzang.tistory.com/"/>
	<c:set var="str2" value="블로그" />
	<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10" />
	
	<h1>Function 태그</h1>
	length(map) : ${ fn:length(map) }<br>
	length(str1) : ${ fn:length(str1) }<br>
	toUpperCase(str1) : ${ fn:toUpperCase(str1) }<br>
	toLowerCase(str1) : ${ fn:toLowerCase(str1) }<br>
	substring(str1, 19, 40) : ${ fn:substring(str1, 19, 40) }<br>
	substringAfter(str1, str2) : ${ fn:substringAfter(str1, str2) }<br>
	substringBefore(str1, str2) : ${ fn:substringBefore(str1, str2) }<br>
	replace(str1, src, dest) : ${ fn:replace(str1, " ", "^") }<br>
	indexOf(str1, str2) : ${ fn:indexOf(str1, str2) }<br>
	startsWith(str1, str2) : ${ fn:startsWith(str1, '갱짱') }<br>
	endsWith(str1, str2) : ${ fn:endsWith(str1, '/') }<br>
	contains(str1, str2) : ${ fn:contains(str1, str2) }<br>
	containsIgnoreCase(str1, str2) : ${ fn:containsIgnoreCase(str1, str2) }<br>
	<c:set var="array" value="${ fn:split(tokens, ',') }" />
	join(array, "-") : ${ fn:join(array, "-") }<br>
	escapeXml(str1) : ${ fn:escapeXml(str1) }
</body>
</html>

<!-- 
	실행결과
	
	Function 태그

	length(map) : 5
	length(str1) : 41
	toUpperCase(str1) : 갱짱(GZ) 블로그, HTTP://GANGZZANG.TISTORY.COM/
	toLowerCase(str1) : 갱짱(gz) 블로그, http://gangzzang.tistory.com/
	substring(str1, 19, 40) : gangzzang.tistory.com
	substringAfter(str1, str2) : , http://gangzzang.tistory.com/
	substringBefore(str1, str2) : 갱짱(Gz) 
	replace(str1, src, dest) : 갱짱(Gz)^블로그,^http://gangzzang.tistory.com/
	indexOf(str1, str2) : 7
	startsWith(str1, str2) : true
	endsWith(str1, str2) : false
	contains(str1, str2) : true
	containsIgnoreCase(str1, str2) : true
	join(array, "-") : 1-2-3-4-5-6-7-8-9-10
	escapeXml(str1) : 갱짱(Gz) 블로그, http://gangzzang.tistory.com/
 -->