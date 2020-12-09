<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="audition.DB" %>
<%@ page import="java.sql.ResultSet" %>

<%

	String rank_query = "SELECT " +
		    "ARTIST.ARTIST_ID, " +
		    "ARTIST.ARTIST_NAME, " +
		    "SUM(POINT) TOTAL, " +
		    "AVG(POINT), " + 
		    "ROW_NUMBER() OVER(ORDER BY SUM(POINT) DESC)" +
		"FROM " +
		    "TBL_ARTIST_201905 ARTIST, " +
		    "TBL_POINT_201905 POINT " +
		"WHERE " +
		    "ARTIST.ARTIST_ID = POINT.ARTIST_ID " +
		"GROUP BY " +
		    "ARTIST.ARTIST_ID, " +
		    "ARTIST.ARTIST_NAME " +
		"ORDER BY " +
		    "TOTAL DESC";

	try{
		ResultSet rs_rank = DB.fetch(rank_query);
	

%>

	<table border=1>
		<thead>
			<tr>
				<td>참가번호</td>
				<td>참가자명</td>
				<td>총점</td>
				<td>평균</td>
				<td>등수</td>
			</tr>	
		</thead>
		<tbody>
	<%
		while(rs_rank.next()) {
	%>
			<tr>
				<td><%=rs_rank.getString(1) %></td>
				<td><%=rs_rank.getString(2) %></td>
				<td><%=rs_rank.getInt(3) %></td>
				<td><%=String.format("%.2f", rs_rank.getDouble(4)) %></td>
				<td><%=rs_rank.getInt(5) %></td>
			</tr>
	<%
		};
	
		rs_rank.close();	
	}catch(Exception ignored) {};
	%>
		</tbody>
	</table>