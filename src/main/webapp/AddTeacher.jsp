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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="Links.jsp" />
<%
if(session.getAttribute("admn")!=null)
{
%>
<h3 style="text-align: center;" class="text-info">Add Teacher</h3>
	<hr />
	<div class="container-fluid">
	<div class="row">
<form method="post" action="AddTcher">
	<div class="card">
				<div class="card-header">
					<b style="text-align: center;"> Please add subjects below: </b>
				</div>
				<div class="card-body">
	<p style="text-align: center;">
		<input type="text"  name="txtTname" class="form-control" placeholder="Teacher Name" required />
		<br /><br />
		<select name="ddlGender" class="form-control">
		<option value="Female">Gender</option>
			<option value="Female">Female</option>
			<option value="Male">Male</option>
		</select>
		<br /><br />
		<input type="email"  name="txtEmail" class="form-control"  placeholder="Email" required />
		<br /><br />
		<input type="text"  name="txtPhoneNo" class="form-control"  placeholder="Contact Number" required />
		<br /><br />
		<textarea name="txtAdrs"  rows="5" cols="30" class="form-control" placeholder="Address"></textarea>
		<br /><br />
		<input type="text"  name="txtLocation" class="form-control"  placeholder="Location" required />
		<br /><br />
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

<%

	if(session.getAttribute("admn")!=null)
	{
		TeacherService ss = new TeacherService();
	List<Teacher>  tlist = ss.ShowAll();
	pageContext.setAttribute("sinfo", tlist);
%>


<hr>
<h4 style="text-align: center;" class="text-info">Teachers</h4>
<hr />
<div class="container-fluid">
<div class="row">
		<div class="card">
				<div class="card-header">
					<b>Review the selected subjects below: </b>
				</div>
				<div class="card-body">
				<br>
				<div class="container mt-3">
<table class="table" width="100%" border="1">
<tr>
<th>Number</th>
<th>Teacher Name</th>
<th>Gender</th>
<th>Address</th>
<th>Email</th>
<th>Contact Number</th>
<th>Location</th>
<th>Operations</th>
</tr>

<c:forEach var="std"  items="${sinfo }">

<c:url var="deleteteacher" value="DeleteTeacher.jsp">
	<c:param name="teacherID" value="${std.teacherID }"/>
</c:url>

<tr>
	<td>
		<c:out value="${std.teacherID }" />
	</td>
	<td>
		<c:out value="${std.teacherName }" />
	</td>
	<td>
		<c:out value="${std.gender }" />
	</td>
	<td>
		<c:out value="${std.address }" />
	</td>
	<td>
		<c:out value="${std.email }" />
	</td>
	<td>
		<c:out value="${std.phoneNo }" />
	</td>
	<td>
		<c:out value="${std.location }" />
	</td>
	<td>
		<a href="${deleteteacher }">Delete</a>
	</td>

</tr>
</c:forEach>

</table>
<%
	}
	else
		response.sendRedirect("Login.jsp");
%>
</div>
</div>
</div>
</div>
</div>
</body>
</html>