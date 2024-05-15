<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align: center;">Student App - Login Here</h1>
	<hr />
<form method="post" action="Login">
	<p style="text-align: center;">
		<input type="text"  name="txtUser"  placeholder="Username " required />
		<br /><br />
		<input type="password"  name="txtPass"  placeholder="Password " required />
		<br /><br />
		<input type="submit"  value="Login Here" />
	</p>
</form>
</body>
</html>