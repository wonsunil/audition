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
