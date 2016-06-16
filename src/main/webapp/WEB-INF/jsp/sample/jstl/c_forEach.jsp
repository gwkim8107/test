<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String[] sports = { "축구", "야구", "농구", "골프", "수영", "볼링"};

	HashMap map = new HashMap();
	map.put("name", "Gz");
	map.put("age", "25");
	map.put("tel", "010-1234-5678");
	map.put("date", new java.util.Date());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ic:forEach</title>
</head>
<body>
<!--  자바의 for, do-while 형태이다. -->
<!--  array, Collection, Map 에 저장되어 있는 값들을 순차적으로 처리할 때 사용할 수 있는 태그이다. -->
<%--  <c:forEach var="변수" items="아이템" begin="시작값" end="끝값" step="증가값"> ${ 변수 } </c:forEach> --%>
<!--  item : array, Collection, Map 등이 올수 있다. -->
<!--  begin : 초기값 -->
<!--  end  : 끝값 -->
<!--  step : 증가값 -->
<!--  단, Iterator, Enumeration, Map의 경우 삽입한 순서와 읽어오는 순서가 일치하지 않을 수 있기 때문에 begin, step, end 속성은 잘 쓰지 않는다. -->
<!--  varstatus : 루프 정보를 담는 LoopTagStatus 객체를 저장할 변수명을 값으로 갖는다. -->
<!--  index : 루프 실행에서 현재 인덱스 -->
<!--  count : 루프 실행 회수 -->
<!--  begin : begin 속성 값 -->
<!--  end : end 속성 값 -->
<!--  step : step 속성 값 -->
<!--  first : 현재 실행이 첫 번째 실행인 경우 true -->
<!--  last : 현재 실행이 루프의 마지막 실행인 경우 true -->
<!--  current : 컬렉션 중 현재 루프에서 사용할 객체 -->

	<h1>1부터 100까지의 홀수의 합 :
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="1" end="100" step="2">
		<c:set var="sum" value="${ sum + i }" />
	</c:forEach>
	${ sum }</h1>
	
	<hr><!-- ------------------------------------------------ -->
	
	<h1>구구단</h1>
	<c:forEach var="i" begin="1" end="9">
		<c:forEach var="j" begin="1" end="9">
			${ i } * ${ j } = ${ i * j }<br>
		</c:forEach>
		<br>
	</c:forEach>
	
	<hr><!-- ------------------------------------------------ -->
	
	<h1>스포츠 배열 2번째 값부터 3개만 출력</h1>
	<c:set var="sportsArray" value="<%= sports %>" />
	<c:forEach var="i" items="${ sportsArray }" begin="1" end="3" step="1" varStatus="status">
		i 값 : ${ i }<br>
		루프 실행 현재 인덱스 값 : ${ status.index }<br>
		루프 실행 횟수 : ${ status.count }<br>
		begin 값 : ${ status.begin }<br>
		end 값 : ${ status.end }<br>
		step 값 : ${ status.step }<br>
		<br>
	</c:forEach>
	
	<hr><!-- ------------------------------------------------ -->
	
	<h1>Map</h1>
	<c:set var="memberMap" value="<%= map %>" />
	<c:forEach var="i" items="${ memberMap }">
		${ i.key } : ${ i.value }<br>
	</c:forEach>
</body>
</html>

<!-- 
	실행결과
	
	1부터 100까지의 홀수의 합 : 2500

	---------------------------------------------------------

	구구단
	
	1 * 1 = 1
	1 * 2 = 2
	1 * 3 = 3
	1 * 4 = 4
	1 * 5 = 5
	1 * 6 = 6
	1 * 7 = 7
	1 * 8 = 8
	1 * 9 = 9
	
	2 * 1 = 2
	2 * 2 = 4
	2 * 3 = 6
	2 * 4 = 8
	2 * 5 = 10
	2 * 6 = 12
	2 * 7 = 14
	2 * 8 = 16
	2 * 9 = 18
	
	3 * 1 = 3
	3 * 2 = 6
	3 * 3 = 9
	3 * 4 = 12
	3 * 5 = 15
	3 * 6 = 18
	3 * 7 = 21
	3 * 8 = 24
	3 * 9 = 27
	
	. . .
	
	8 * 1 = 8
	8 * 2 = 16
	8 * 3 = 24
	8 * 4 = 32
	8 * 5 = 40
	8 * 6 = 48
	8 * 7 = 56
	8 * 8 = 64
	8 * 9 = 72
	
	9 * 1 = 9
	9 * 2 = 18
	9 * 3 = 27
	9 * 4 = 36
	9 * 5 = 45
	9 * 6 = 54
	9 * 7 = 63
	9 * 8 = 72
	9 * 9 = 81
	
	---------------------------------------------------------
	
	스포츠 배열 2번째 값부터 3개만 출력
	
	i 값 : 야구
	루프 실행 현재 인덱스 값 : 1
	루프 실행 횟수 : 1
	begin 값 : 1
	end 값 : 3
	step 값 : 1
	
	i 값 : 농구
	루프 실행 현재 인덱스 값 : 2
	루프 실행 횟수 : 2
	begin 값 : 1
	end 값 : 3
	step 값 : 1
	
	i 값 : 골프
	루프 실행 현재 인덱스 값 : 3
	루프 실행 횟수 : 3
	begin 값 : 1
	end 값 : 3
	step 값 : 1
	
	---------------------------------------------------------
	
	Map
	
	tel : 010-1234-5678
	age : 25
	name : Gz
	date : Wed Sep 25 17:10:45 KST 2013
 -->