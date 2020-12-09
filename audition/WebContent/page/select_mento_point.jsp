<%@page import="org.apache.jasper.JasperException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	page import="java.sql.ResultSet"%>
<%@ page import="audition.DB" %>  
    
<%
	String mento_query = "SELECT " +
		    "POINT.SERIAL_NO, " +
		    "ARTIST.ARTIST_ID, " +
		    "ARTIST.ARTIST_NAME, " + 
		    "ARTIST.ARTIST_BIRTH, " +
		    "POINT.POINT, " +
		    "MENTO.MENTO_NAME " + 
		"FROM " + 
		    "TBL_ARTIST_201905 ARTIST, " +
		    "TBL_MENTO_201905 MENTO, " +
		    "TBL_POINT_201905 POINT " +
		"WHERE " + 
		    "POINT.MENTO_ID = MENTO.MENTO_ID AND " +
		    "POINT.ARTIST_ID = ARTIST.ARTIST_ID " +
		"ORDER BY " +
		    "SERIAL_NO";

	try{
		ResultSet rs_mento = DB.fetch(mento_query);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<thead>
			<tr>
				<td>채점번호</td>
				<td>참가번호</td>
				<td>참가자명</td>
				<td>생년월일</td>
				<td>점수</td>
				<td>평점</td>
				<td>멘토</td>
			</tr>
		</thead>
		<tbody>
			<%
				while(rs_mento.next()) {
			%>
				<tr>
					<td><%=rs_mento.getInt(1) %></td>
					<td><%=rs_mento.getString(2) %></td>
					<td><%=rs_mento.getString(3) %></td>
					<td><%=rs_mento.getString(4) %></td>
					<td><%=rs_mento.getInt(5) %></td>
					<td><%
						if(rs_mento.getInt(5) >= 90) { %> <%="A"%> <% }
						else if(rs_mento.getInt(5) >= 80) {%> <%="B"%> <%}
						else if(rs_mento.getInt(5) >= 70) {%> <%="C"%> <% }
						else if(rs_mento.getInt(5) >= 60) {%> <%="D"%> <% }
						else if(rs_mento.getInt(5) < 60) {%> <%= "F" %><%};
					%></td>
					<td><%=rs_mento.getString(6) %></td>
				</tr>
			<%
				};
				
			rs_mento.close();			
		}catch(JasperException ignored) {};
			%>
		</tbody>
	</table>
</body>
</html>