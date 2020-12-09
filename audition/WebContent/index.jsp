<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/index.css" rel="stylesheet">
</head>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	
	<%
		switch(section) {
			case "select_participant" : %>
				<%@ include file="page/select_participant.jsp" %> <%
			break;
			case "select_mento_point" : %>
				<%@ include file="page/select_mento_point.jsp" %> <%
			break;
			case "select_participant_rank" : %>
				<%@ include file="page/select_participant_rank.jsp" %> <%
			break;
			
			default: %> <%@ include file="static/index.jsp" %> <%
		};
	%>
		
	<%@ include file="static/footer.jsp" %>	
</body>
</html>