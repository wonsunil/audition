<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="audition.DB" %>

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
				<td>참가번호</td>
				<td>참가자명</td>
				<td>생년월일</td>
				<td>성별</td>
				<td>특기</td>
				<td>소속사</td>
			</tr>
		</thead>
		<tbody>
	<%	
		String participant_query = "SELECT ARTIST_ID, ARTIST_NAME, TO_DATE(ARTIST_BIRTH, 'YYYY/MM/DD'), ARTIST_GENDER, TALENT, AGENCY FROM TBL_ARTIST_201905";
		ResultSet rs = DB.fetch(participant_query);
	
		while(rs.next()) {
	%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td>
				<%=rs.getString(3).substring(0, 4) + "년"
				 + rs.getString(3).substring(5, 7) + "월"
				 + rs.getString(3).substring(8, 10) + "일" %>
			</td>
			<td><%=rs.getString(4).equals("F") ? "여자" : "남자" %></td>
			<td>
				<%
					switch(rs.getString(5)) {
						case "1": %> <%="보컬"%> <%
						break;
						case "2" : %> <%="댄스"%> <%
						break;
						case "3" : %> <%="랩"%> <%
						break;
					};
				%>
			</td>
			<td><%=rs.getString(6) %></td>
		</tr>
	<%
		};
	
		rs.close();
	%>
		</tbody>
	</table>
</body>
</html>