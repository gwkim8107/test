<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>c:choose</title>
</head>
<body>
<!--  자바에서의 switch 구문과 if - else 블록을 혼합한 형태이다. -->
<%-- <c:choose> --%>
<%-- <c:when test="조건1"> --%>
<!-- 로직 수행 -->
<%-- </c:when> --%>
<%-- <c:when test="조건2"> --%>
<!-- 로직 수행 -->
<%-- </c:when> --%>
<%-- <c:when test="조건3"> --%>
<!-- 로직 수행 -->
<%-- </c:when> --%>
<%-- <c:otherwise> --%>
<!-- 로직 수행 -->
<%-- </c:otherwise> --%>
<%-- </c:choose> --%>
<%-- - <c:when> 태그의 test 속성의 결과값이 true인 첫번째 태그의 내부 블럭을 수행하고 그 이후의 <c:when> 태그는 실행되지 않는다. --%>
<%-- - <c:when> 태그의 test 결과 값이 false면 <c:otherwise> 태그가 실행된다. <c:otherwise> 태그는 필수는 아니다. --%>
	<ul>
	<c:choose>
		<c:when test="${ param.flag == 0 }">
			<li>파라미터 flag 의 값은 0 입니다.
		</c:when>
		<c:when test="${ param.flag == 1 }">
			<li>파라미터 flag 의 값은 1 입니다.
		</c:when>
		<c:when test="${ param.flag == 2 }">
			<li>파라미터 flag 의 값은 2 입니다.
		</c:when>
		<c:otherwise>
			<li>파라미터 flag 의 값은 0,1,2 중에 하나를 입력해주세요.
		</c:otherwise>
	</c:choose>
	</ul>
</body>
</html>

<!-- 
	/c_choose.jsp?flag=0 실행결과
	
	파라미터 flag 의 값은 0 입니다.
 -->
 
<!-- 
	/c_choose.jsp?flag=1 실행결과
	
	파라미터 flag 의 값은 1 입니다.
 -->
 
<!-- 
	/c_choose.jsp?flag=2 실행결과
	
	파라미터 flag 의 값은 2 입니다.
 -->
 
<!-- 
	/c_choose.jsp 실행결과 or 그 외에 flag 값 실행결과
	
	파라미터 flag 의 값은 0,1,2 중에 하나를 입력해주세요.
 -->