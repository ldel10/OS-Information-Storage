<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Enter OS</title>
</head>
<body>
<h1>Enter OS/Version/Notes</h1>

<s:form action="main-page" validate="true">
	<s:textfield name="enteredOS" label="OS" placeholder="required" />
	<s:textfield name="enteredVersion" label="OS Version" placeholder="required" />
	<s:textfield name="enteredNotes" label="Notes"/>
	<s:submit type="submit" value="Submit"/>
</s:form>
</body>
</html>