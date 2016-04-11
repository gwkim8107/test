<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!--  특정 URL의 결과를 읽어와 현재 위치에 삽입하거나 EL 변수에 저장할때 사용한다. -->
<!--  동일한 웹 어플리케이션 뿐만 아니라 외부의 다른 자원을 읽어와 포함시킨다. -->
<%--  <c:import url="URL" var="변수명" scope="영역" charEncoding="캐릭터셋"></c:import> --%>
<!--  var 속성을 명시하면 해당 URL에서 읽어온 데이터를 scope에 지정된 영역의 var 속성에 명시한 EL변수에 저장한다. -->
<!--  var 속성을 지정하지 않으면 태그의 위치에 URL로부터 읽어온 데이터 결과를 출력한다. -->
<!--  url 속성은 절대URL(완전한 URL) 또는 상대URL(웹 어플리케이션 내에서의 절대 경로 또는 현재 JSP에 대한 상대 경로)을 입력할 수 있다. -->
<!--  절대URL -->
<!--  java.net.URL 그리고 java.net.URLCOnnection 을 이용해서 데이터를 읽어온다. -->
<!--  charEndoing 속성 값을 지정했다면 명시된 캐릭터 인코딩 이용 -->
<!--  URLConnection.getContentType() 메서드가 리턴한 값이 인코딩을 포함하고 있으면 이용 -->
<!--  그렇지 않다면 ISO-8859-1 을 이용 -->
<!--  상대URL -->
<%--  <jsp:include> 액션 태그와 동일한 방식으로 동작한다. --%>
<%--  <jsp:include> 액션 태그와는 달리 웹 어플리케이션에 속한 자원의 결과를 변수에 보관한 뒤 필요에 따라 처리를 할 수 있다. --%>
<%--  요청 파라미터는 URL에 직접 입력 또는 <c:param> 태그를 이용하는 방식이 있다. --%>
<c:choose>
	<c:when test="${ param.type == 'java' }">
		<c:import url="http://gangzzang.tistory.com/category/Java/Java%20SE" />
	</c:when>
	
	<c:when test="${ param.type == 'jsp' }">
		<c:import url="http://gangzzang.tistory.com/category/Java/Java%20EE" />
	</c:when>
	
	<c:when test="${ param.type == 'youtube' }">
		<c:import url="http://www.youtube.com/results">
			<c:param name="search_query" value="독도" />
		</c:import>
	</c:when>
	
	<c:otherwise>
		<c:import url="c_import_help.jsp">
			<c:param name="message" value="파라미터 값을 붙여주세요~!" />
		</c:import>
	</c:otherwise>
</c:choose>