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
<!--  ù ��° ����� ���������� ���ȴ�. -->
<%--  <c:set var="������" value="��" [scope="����"] /> --%>
<%--  <c:set var="������" [scope="����"]>��</c:set> --%>
<!--  var : ���� ������ EL ������ �̸� -->
<!--  value : ������ ���� �����Ѵ�. ǥ����, EL, ������ �ؽ�Ʈ�� ����Ͽ� ���� ������ �� �ִ�. -->
<!--  scope : ������ ������ ������ �����Ѵ�. (page, request, session, applicaion �⺻���� page) -->
<!--  value �Ӽ� ��� -->
<c:set var="name" value="Gz" scope="page" />
<c:set var="name" value="<%=m.get("") %>" scope="request" />
<c:set var="name" value="${ m.Name } ${ m.Age }" scope="request" />

<!--  �� ��° ����� ��ü�� ������Ƽ ���� ������ �� ���ȴ�. -->
<%--  <c:set target="���" property="������Ƽ�̸�" value="��" /> --%>
<%--  <c:set target="���" property="������Ƽ�̸�">��</c:set> --%>
<!--  target : ������Ƽ�� ���� ������ ��� ��ü, ǥ�����̳� EL������ �����Ѵ�. (�ڹٺ� ��ü�� Map) -->
<!--  property : ������ ������Ƽ �̸�, target�� �ڹٺ� ��ü�� ��� ������Ƽ �̸��� �ش��ϴ� set �޼��带 �������־�� �Ѵ�. Map�� ��� Map.put(������Ƽ�̸�, ��) -->
<!--  value : ������ ������Ƽ�� �� -->

<!-- �±��� ��ü�� ������ ��� -->
<c:set var="name">Gz</c:set>
<c:set var="name"><%= m.get("") %> <%= m.get("")%></c:set>
<c:set var="name">${ m.Name } ${ m.Age }</c:set>

<%--  �� ��° ����� #{��} ������ Deferred Expression�� ������ �����Ҷ� ���ȴ�. --%>
<%--  <c:set var="�̸�" value="#{��}" /> --%>
<!--  var : ���� ������ EL ������ �̸� -->
<!--  value : ������ ���� �����Ѵ�. ǥ����, EL, ������ �ؽ�Ʈ�� ����Ͽ� ���� ������ �� �ִ�. -->
<c:set var="pref" value="<%= m %>" />
	<c:set var="favorColor" value="#{ m.color }"/>
	
	�����ϴ� �� : ${ favorColor }
	
	<br>
	<br>
	
	<c:set target="${ m }" property="color" value="red" />
	
	���� ���� �����ϴ� �� : ${ favorColor }
</body>
</html>

<!-- 
	������
	
	�����ϴ� �� : 

	���� ���� �����ϴ� �� : red
 -->


</body>
</html>