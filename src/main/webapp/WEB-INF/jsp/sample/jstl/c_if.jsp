<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>c:if</title>
</head>
<body>
 
<%-- <c:if> 태그 --%>
<!-- 	 자바에서의 if 문과 비슷한 기능을 제공한다. -->
<%-- 	 <c:if test="조건"> . . . </c:if> --%>
<%-- 	 test 속성에는 true나 false를 리턴하는 조건문이 오고 true일 경우 <c:if>태그의 몸체 내용이 처리된다. true 또는 false 그리고 EL 또는 정적 문자열을 가질 수 있다. --%>
<%-- 	 <c:if test="조건" var="결과를 저장할 변수명" /> --%>
<!-- 	 var 속성에 지정한 변수에 test 속성에 계산 결과를 저장할 수 있다. -->

	<c:if test="true">
		항상 실행된다.<br>
	</c:if>
	
	<c:if test="false">
		항상 실행되지않는다.<br>
	</c:if>
	
	<c:if test="ture 나 false 값이 아닌 텍스트">
		항상 실행되지않는다.<br>
	</c:if>
	
	<c:if test="${ param.name == 'bk' }">
		EL 결과 값이 true 일 때 실행된다.<br>
		name 파라미터의 값 : ${ param.name}<br>
	</c:if>
	
	<% Boolean flag = true; %>
	<c:if test="<%= flag %>">
		표현식 결과값이 true 인 경우 실행된다.<br>
	</c:if>
</body>
</html>

<!-- 
	실행결과
	
	항상 실행된다.
	표현식 결과값이 true 인 경우 실행된다.
 -->
 
 <!-- 
 	파라미터 값 추가 /c_if.jsp?name=bk
 	
 	실행결과
 	
 	항상 실행된다.
	EL 결과 값이 true 일 때 실행된다.
	name 파라미터의 값 : bk
	표현식 결과값이 true 인 경우 실행된다.
  -->