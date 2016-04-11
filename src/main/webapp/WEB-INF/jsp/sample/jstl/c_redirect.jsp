<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%-- <c:redirect> 태그 --%>
<!--  response.sendRedirect() 메서드처럼 지정한 페이지로 리다이렉트 시켜주는 기능을한다. -->
<%--  <c:redirect url="URL" context="컨텍스트경로"> <c:param name="이름" value="값"> </c:redirect> --%>
<!--  URL 속성 값이 슬래시로 시작할 경우 컨텍스트 경로가 추가된다. -->
<!--  다른 컨텍스트 경로로 리다이렉르 할때는 context 속성에 컨텍스트 경로를 명시한다. -->
<%--  <c:redirect> 태그가 실행되면 그 이후의 태그는 실행되지 않는다. --%>

<c:redirect url="http://gangzzang.tistory.com/" />

<c:redirect rul="http://search.daum.net/search">
	<c:param name="w" value="blog" />
	<c:param name="q"	 value="독도" />
</c:redirect>
</body>
</html>