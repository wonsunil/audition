<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<input type="radio">

	<form method="POST" action="action/insert_audition_data.jsp">
		<table border=1>
			<tr>
				<td>참가번호</td>
				<td><input name="artist_id">*참가번호는 (A000)4자리입니다</td>
			</tr>
			<tr>
				<td>참가자명</td>
				<td><input name="artist_name"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input name="year">년
					<input name="month">월
					<input name="day">일
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="M" style="background: black;">남성
					<input type="radio" name="gender" value="F">여성
				</td>
			</tr>
			<tr>
				<td>특기</td>
				<td>
					<select name="talent">
						<option>특기선택</option>
						<option>보컬</option>
						<option>댄스</option>
						<option>랩</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>소속사</td>
				<td><input name="agency"></td>
			</tr>
			<tr>
				<td>
					<button>오디션 등록</button>
					<button onclick="resetForm();">다시쓰기</button>
				</td>
			</tr>
		</table>
	</form>

<script>
	function resetForm() {
		document.forms[0].reset();
		document.forms[0].artist_id.focus();
		
		return alert("정보를 지우고 처음부터 다시 입력합니다!");
	};
	document.forms[0].addEventListener("submit", event => {
		return event.preventDefault();
	});

	document.querySelectorAll("button")[0].addEventListener("click", event => {
		if(document.forms[0].artist_id.value === "") {
			alert("참가번호칸이 입력되지 않았습니다!");
			
			return document.forms[0].artist_id.focus();
		};
		if(document.forms[0].artist_name.value === "") {
			alert("참가자명이 입력되지 않았습니다!");
			
			return document.forms[0].artist_name.focus();
		};
		if(document.forms[0].year.value === "") {
			alert("년도가 입력되지 않았습니다!");
			
			return document.forms[0].year.focus();
		};
		if(document.forms[0].month.value === "") {
			alert("월이 입력되지 않았습니다!");
			
			return document.forms[0].month.focus();
		};
		if(document.forms[0].day.value === "") {
			alert("일이 입력되지 않았습니다!");
			
			return document.forms[0].day.focus();
		};
		if(document.forms[0].gender.value === "") {
			return alert("성별이 선택되지 않았습니다!");
		};
		if(document.forms[0].talent.selectedIndex === 0) {
			return alert("특기가 선택되지 않았습니다");
		};
		if(document.forms[0].agency.value === "") {
			alert("소속사가 입력되지 않았습니다!");
			
			return document.forms[0].agency.focus();
		};
		
		alert("참가신청이 완료되었습니다");
		return document.forms[0].submit();
	});
</script>