<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<table border=1>
	<tr>
		<td>피자코드</td>
		<td>피자명</td>
		<td>가격</td>
		<td>가격</td>
		<td>가격</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = conn.createStatement();
		String query = "SELECT * FROM TBL_SALELIST_01";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
		%>
			<tr>
				<td><% out.println(rs.getInt(1)); %></td>
				<td><% out.println(rs.getString(2)); %></td>
				<td><% out.println(rs.getString(3)); %></td>
				<td><% out.println(rs.getString(4)); %></td>
				<td><% out.println(rs.getInt(5)); %></td>
			</tr>
		<%
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>