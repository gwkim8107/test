<%@page import="com.fasterxml.jackson.databind.jsonFormatVisitors.JsonAnyFormatVisitor"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSON PARSING 테스트</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/sample/bootstrap-3.3.6-dist/css/bootstrap-theme.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/sample/bootstrap-3.3.6-dist/css/bootstrap.css'/>" />
<!-- <script src="/sample/js/jquery-1.11.3.js"></script> -->
<script src="https://code.jquery.com/jquery-1.9.1.js"   integrity="sha256-e9gNBsAcA0DBuRWbm0oZfbiCyhjLrI6bmqAl5o+ZjUA="   crossorigin="anonymous"></script>
<script src="<c:url value='/sample/js/xml2json.js'/>" charset="utf-8"></script>
</head>
<body>
<%

%>

<c:set var="jsonRes" value="#{json.get(0)}"/>
<h1>XML2JSON TEST</h1>

    <button id="convertToJsonBtn">XML => JSON</button>
    <button id="convertToXmlBtn">JSON => XML</button>
    <div>
         <h4>XML:</h4>

        <textarea id="xmlArea" cols="55" rows="15"></textarea>
    </div>
    <div>
         <h4>JSON:</h4>

        <textarea id="jsonArea" cols="55" rows="15"></textarea>
    </div>
    
     	<h4>To String</h4>
	<button id="getJson">JSON -> String </button>
	<div id="jsondiv">
	 Test
	</div>
	
<script type="text/javascript"> 
var x2js = new X2JS();

function convertXml2JSon() {
    $("#jsonArea").val(JSON.stringify(x2js.xml_str2json($("#xmlArea").val())));
    var jarea = $("#jsonArea").val(JSON.stringify(x2js.xml_str2json($("#xmlArea").val())));
}

function convertJSon2XML() {
    $("#xmlArea").val(x2js.json2xml_str($.parseJSON($("#jsonArea").val())));
}

$(document).ready(function(){
	//var jarea = $.parseJSON('${jsonRes}');
	var xml2json = JSON.stringify(x2js.xml_str2json('${jsonRes}'));
	var jarea = $.parseJSON(xml2json);
	console.log(jarea.Envelope.Body.GA_HotelResRS.HotelReservations.HotelReservation.Comments.Comment.Text);
	$('#getJson').click(function(){
			$('#jsondiv').empty();
			var ReservationCommnet = jarea.Envelope.Body.GA_HotelResRS.HotelReservations.HotelReservation.Comments.Comment.Text;
			var html = '<div class="entry">';
			html += '<h3 class="Comment">'+ReservationCommnet+'</h3>';
			$('#jsondiv').append(html);
		return false;
	});
});

$("#xmlArea").val('${jsonRes}');

convertXml2JSon();
convertJSon2XML();
$("#convertToJsonBtn").click(convertXml2JSon);
$("#convertToXmlBtn").click(convertJSon2XML);

</script>

</body>
</html>