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
<title>Insert title here</title>
</head>
<body>

<jsp:include page="Links.jsp" />
<%
if(session.getAttribute("admn")!=null)
{
%>
<h3 style="text-align: center;" class="text-info">Student Registration</h3>
	<hr />
<div class="container-fluid">
<div class="row">
		
		<form method="post" action="AddStd">
		<div class="card">
				<div class="card-header">
					<b style="text-align: center;"> Please add student information below: </b>
				</div>
				<div class="card-body">
	<p style="text-align: center;">
		<input type="text"  name="txtSname" class="form-control"  placeholder="Student Name" required />
		<br /><br />
		<select name="ddlGender" class="form-control" placeholder="Gender">
		<option value="Female">Gender</option>
			<option value="Female">Female</option>
			<option value="Male">Male</option>
		</select>
		<br /><br />
		<input type="email"  name="txtEmail" class="form-control" placeholder="Email" required />
		<br /><br />
		<textarea name="txtAdrs" class="form-control" rows="5" cols="30" placeholder="Address"></textarea>
		<br /><br />
		<input type="text"  name="txtLocation" class="form-control" placeholder="Location" required />
		<br /><br />
		<select name="ddlClass" class="form-control">
			<option value="Class-I">Class-I</option>
			<option value="Class-II">Class-II</option>
			<option value="Class-III">Class-III</option>
			<option value="Class-IV">Class-IV</option>
			<option value="Class-V">Class-V</option>
		</select>
		<div class="row">
		
						<div class="col-lg-12"  style="text-align: center;">
					<input type="submit"  value="Add"  class="btn btn-info" />
					<input type="reset"  value="Clear"  class="btn btn-danger" />							
						</div>
					</div>
	</p>
	</div>
	</div>
</form>
</div>
</div>
<%
}
else
	response.sendRedirect("Login.jsp");
%>


<!-- Presenting db data using JSTL tag -->
<%

	if(session.getAttribute("admn")!=null)
	{
		StudentService ss = new StudentService();
	List<Student>  stdlist = ss.ShowAll();
	pageContext.setAttribute("sinfo", stdlist);
%>
<hr>
<h3 style="text-align: center;"class="text-info">Students Information</h3>
<hr>
<div class="container-fluid">
<div class="row">
		<form method="post" action="AddStd">
		<div class="card">
				<div class="card-header">
					<b>Review student information below: </b>
				</div>
				<div class="card-body">
				<br>
				<div class="container mt-3">
<table class="table" width="100%" border="1">

<tr>
<th>Number</th>
<th>Student Name</th>
<th>Gender</th>
<th>Address</th>
<th>Email</th>
<th>Location</th>
<th>Class Name</th>
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
</div>
</form>
</div>
</div>
</body>
</html>