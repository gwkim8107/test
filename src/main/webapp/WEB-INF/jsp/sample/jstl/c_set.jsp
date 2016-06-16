<%@page import="hrs.common.common.CommandMap"%>
<%@page import="org.springframework.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
CommandMap m = new CommandMap();
%>
<!--  첫 번째 사용방법 변수생성에 사용된다. -->
<%--  <c:set var="변수명" value="값" [scope="영역"] /> --%>
<%--  <c:set var="변수명" [scope="영역"]>값</c:set> --%>
<!--  var : 값을 지정할 EL 변수의 이름 -->
<!--  value : 변수의 값을 지정한다. 표현식, EL, 정적인 텍스트를 사용하여 값을 지정할 수 있다. -->
<!--  scope : 변수를 저장할 영역을 지정한다. (page, request, session, applicaion 기본값은 page) -->
<!--  value 속성 사용 -->
<c:set var="name" value="Gz" scope="page" />
<c:set var="name" value="<%=m.get("") %>" scope="request" />
<c:set var="name" value="${ m.Name } ${ m.Age }" scope="request" />

<!--  두 번째 사용방법 객체의 프로퍼티 값을 설정할 때 사용된다. -->
<%--  <c:set target="대상" property="프로퍼티이름" value="값" /> --%>
<%--  <c:set target="대상" property="프로퍼티이름">값</c:set> --%>
<!--  target : 프로퍼티의 값을 설정할 대상 객체, 표현식이나 EL변수를 지정한다. (자바빈 객체나 Map) -->
<!--  property : 설정할 프로퍼티 이름, target이 자바빈 객체인 경우 프로퍼티 이름에 해당하는 set 메서드를 제공해주어야 한다. Map인 경우 Map.put(프로퍼티이름, 값) -->
<!--  value : 설장할 프로퍼티의 값 -->

<!-- 태그의 몸체를 값으로 사용 -->
<c:set var="name">Gz</c:set>
<c:set var="name"><%= m.get("") %> <%= m.get("")%></c:set>
<c:set var="name">${ m.Name } ${ m.Age }</c:set>

<%--  세 번째 사용방법 #{식} 형식의 Deferred Expression을 값으로 설정할때 사용된다. --%>
<%--  <c:set var="이름" value="#{식}" /> --%>
<!--  var : 값을 지정할 EL 변수의 이름 -->
<!--  value : 변수의 값을 지정한다. 표현식, EL, 정적인 텍스트를 사용하여 값을 지정할 수 있다. -->
<c:set var="pref" value="<%= m %>" />
	<c:set var="favorColor" value="#{ m.color }"/>
	
	좋아하는 색 : ${ favorColor }
	
	<br>
	<br>
	
	<c:set target="${ m }" property="color" value="red" />
	
	설정 이후 좋아하는 색 : ${ favorColor }
</body>
</html>

<!-- 
	실행결과
	
	좋아하는 색 : 

	설정 이후 좋아하는 색 : red
 -->


</body>
</html>