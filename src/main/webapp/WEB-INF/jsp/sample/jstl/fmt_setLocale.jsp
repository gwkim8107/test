<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fmt:setLocale</title>
</head>
<body>
<%-- <fmt:setLocale> 태그 --%>
<%--  <fmt:setLocale> : 국제화 태그들이 사용할 로케일을 지정한다. --%>
<%--  <fmt:setLocale value="언어코드_국가코드" scope="영역" /> --%>
<!--  value : 언어코드_국가코드 형식으로 지정하되 언어코드는 필수이고, 국가코드는 추가지정할 수 있다. 사이에 구분은 바(-) 또는 언더바(_)로 구분한다. -->
<!--  scope : 영역을 설정한다. 기본값은 page이다. -->
<%--  웹 브라우저는 Accept-Language 헤더에 수용 가능한 언어 목록을 전송한다. 이 헤더 값을 이용해서 메시지를 출력해주기 때문에 <fmt:setLocale> 태그는 거의 사용되지 않는다. --%>

	<c:set var="now" value="<%= new java.util.Date() %>" />
	<h1>대한민국</h1>
	금액 : <fmt:formatNumber value="1000000" type="currency" /><br>
	일시 : <fmt:formatDate value="${ now }" type="both" dateStyle="full" timeStyle="full"/>
	<hr><!-- --------------------------------------------------------------------------------------- -->
	<h1>미국</h1>
	<fmt:setLocale value="en_us"/>
	금액 : <fmt:formatNumber value="1000000" type="currency" /><br>
	일시 : <fmt:formatDate value="${ now }" type="both" dateStyle="full" timeStyle="full"/>
	<hr><!-- --------------------------------------------------------------------------------------- -->
	<h1>일본</h1>
	<fmt:setLocale value="ja_jp"/>
	금액 : <fmt:formatNumber value="1000000" type="currency" /><br>
	일시 : <fmt:formatDate value="${ now }" type="both" dateStyle="full" timeStyle="full"/>
	<hr><!-- --------------------------------------------------------------------------------------- -->
</body>
</html>

<!-- 
	실행결과
	
	대한민국

	금액 : ￦1,000,000
	일시 : 2013년 9월 30일 월요일 오후 4시 22분 45초 KST
	---------------------------------------------------------------------------------------
	미국
	
	금액 : $1,000,000.00
	일시 : Monday, September 30, 2013 4:22:45 PM KST
	---------------------------------------------------------------------------------------
	일본
	
	금액 : ￥1,000,000
	일시 : 2013年9月30日 16時22分45秒 KST
 -->