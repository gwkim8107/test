<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%-- <c:redirect> �±� --%>
<!--  response.sendRedirect() �޼���ó�� ������ �������� �����̷�Ʈ �����ִ� ������Ѵ�. -->
<%--  <c:redirect url="URL" context="���ؽ�Ʈ���"> <c:param name="�̸�" value="��"> </c:redirect> --%>
<!--  URL �Ӽ� ���� �����÷� ������ ��� ���ؽ�Ʈ ��ΰ� �߰��ȴ�. -->
<!--  �ٸ� ���ؽ�Ʈ ��η� �����̷��� �Ҷ��� context �Ӽ��� ���ؽ�Ʈ ��θ� ����Ѵ�. -->
<%--  <c:redirect> �±װ� ����Ǹ� �� ������ �±״� ������� �ʴ´�. --%>

<c:redirect url="http://gangzzang.tistory.com/" />

<c:redirect rul="http://search.daum.net/search">
	<c:param name="w" value="blog" />
	<c:param name="q"	 value="����" />
</c:redirect>
</body>
</html>