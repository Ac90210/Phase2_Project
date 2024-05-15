<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("sname")!=null)
{
	String sname = (String)session.getAttribute("sname");
%>
<jsp:include page="StdLinks.jsp" />
<h1>Welcome to : <%=sname %></h1>
<hr />
<form method="POST" action="ChangePwd">
	<p style="text-align:center;width:100%">
		<label>New Password</label>
		<br />
		<input type="text" name="txtNpwd" />
		<br /><br />
		<label>Confirm New Password</label>
		<br />
		<input type="text" name="txtCNpwd" />
		<br /><br />
		<input type="submit" value="Change Password" />
	</p>
</form>
<%
}
else
	response.sendRedirect("Login.jsp");
%>
</body>
</html>