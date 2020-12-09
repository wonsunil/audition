<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="audition.DB" %>


<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("artist_id");
	String name = request.getParameter("artist_name");
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int day = Integer.parseInt(request.getParameter("day"));
	String gender = request.getParameter("gender");
	String talent = request.getParameter("talent");
	String agency = request.getParameter("agency");

	int talent_index = 0;

	String date = "";
	if(day < 10) date = Integer.toString(year)+Integer.toString(month)+"0"+Integer.toString(day);
	else date = Integer.toString(year)+Integer.toString(month)+Integer.toString(day);
	
	switch(talent) {
		case "보컬" : talent_index = 1;
		break;
		case "댄스" : talent_index = 2;
		break;
		case "랩" : talent_index = 3;
		break;
	};
	
	String query = "INSERT INTO TBL_ARTIST_201905 VALUES(?, ?, ?, ?, ?, ?)";
	String[] datas = {id, name, date, gender, String.valueOf(talent_index), agency};

	
	DB.execute(query, datas);

	response.sendRedirect("../index.jsp?section=select_participant");
%>