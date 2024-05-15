<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
       <%@ page isELIgnored="false" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%@ page import="com.entities.*" %>
    <%@ page import="com.connections.*" %>
    <%@ page import="com.service.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Information</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<jsp:include page="Links.jsp" />  
<body class="text-bg-primary">
<div class="container-fluid">

<%
if(session.getAttribute("admn")!=null)
{
%>

<h4 style="text-align: center;">Student Registration</h4>
	<hr />
     <form method="post" action="AddStd">
	<p style="text-align: center;">
		<input type="text"  name="txtSname"  placeholder="Student Name" required />
		<br /><br />
		<label>Gender</label><br />
		<select name="ddlGender">
			<option value="Female">Female</option>
			<option value="Male">Male</option>
		</select>
		<br /><br />
		<input type="email"  name="txtEmail"  placeholder="Email" required />
		<br /><br />
		<textarea name="txtAdrs"  rows="5" cols="30" placeholder="Address"></textarea>
		<br /><br />
		<input type="text"  name="txtLocation"  placeholder="Location" required />
		<br /><br />
		<select name="ddlCname">
			<option value="Class-I">Class-I</option>
			<option value="Class-II">Class-II</option>
		</select>
		<br /><br />
		<input type="submit"  value="Register Here" />
	</p>
</form>
<%
}
else
	response.sendRedirect("Login.jsp");
%>

<%

	if(session.getAttribute("admn")!=null)
	{
		StudentService ss = new StudentService();
	List<Student>  stdlist = ss.ShowAll();
	pageContext.setAttribute("sinfo", stdlist);
%>

<div class="container mt-3">
  <h2>Striped Rows</h2>
 
  <table class="table table-striped">
    <thead>
<tr>
<th>Number</th>
<th>Student Name</th>
<th>Gender</th>
<th>Address</th>
<th>Email</th>
<th>Location</th>
<th>Class Name</th>
<th>Operations</th>
</tr>

<%
for(Student e : stdlist)
{	
%>

<tr>
<td><%=e.getStudentID() %>  </td>
<td><%=e.getStudentName() %>  </td>
<td><%=e.getGender() %>  </td>
<td><%=e.getAddress() %>  </td>
<td><%=e.getEmail() %>  </td>
<td><%=e.getLocation() %>  </td>
<td><%=e.getClasstbl().getClassName() %>  </td>
</tr>

<%
} 
%>
</table>

<%
	}
	else
		response.sendRedirect("Login.jsp");

%>
</div>
</body>
</html>