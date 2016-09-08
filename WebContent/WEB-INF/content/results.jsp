<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Results</title>
</head>
<body>
<s:form action="results" method="post">
<table border ="2">
	<tr>
		<td>OS</td>
		<td>OS Version</td>
		<td>Notes</td>
	</tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	String dbUrl = "jdbc:mysql://localhost/JiveTest?autoReconnect=true&useSSL=false";
	String username = "root";
	String password= "Delumpa1!";
	Connection conn = DriverManager.getConnection(dbUrl, username, password);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from OSInformation");
	while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString("OS") %></td>
		<td><%=rs.getString("OSVersion")%></td>
		<td><%=rs.getString("OSNotes") %></td>
		</tr>
		<% 
	}
%>
</table>	
<%
rs.close();
stmt.close();
conn.close();
}
catch(Exception e){
	e.printStackTrace();
}
%>		
</s:form>
<a href="<s:url action="main-page" />">Back To Main Page</a>
</body>

</html>