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
<jsp:include page="Links.jsp" />  
<div class="container-fluid">
<%
if(session.getAttribute("admn")!=null)
{
%>
<h3 style="text-align: center;" class="text-info">Add Subject</h3>
	<hr />
	<div class="container-fluid">
<div class="row">
<form method="post" action="AddSbj">
<div class="card">
				<div class="card-header">
					<b style="text-align: center;"> Please add subjects below: </b>
				</div>
				<div class="card-body">
	<p style="text-align: center;">
		<input type="text"  name="txtSbjname" class="form-control" placeholder="Subject Name" required />
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
	</div>
<%
}
else
	response.sendRedirect("Login.jsp");
%>

<%

if(session.getAttribute("admn")!=null)
{
	SubjectService ss = new SubjectService();
	List<Subject> sbj = ss.ShowAll();
    pageContext.setAttribute("sinfo", sbj);
%>

<hr>
<h4 style="text-align: center;" class="text-info">Subjects</h4>
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
<th>Subject Number</th>
<th>Subject Name</th>
</tr>

<c:forEach var="std"  items="${sinfo }">

<c:url var="deletesubject" value="DeleteSubject.jsp">
	<c:param name="subjectID" value="${std.subjectID }"/>
</c:url>

<tr>
	<td>
		<c:out value="${std.subjectID }" />
	</td>
	<td>
		<c:out value="${std.subjectName }" />
	</td>
	<td>
		<a href="${deletesubject }">Delete</a>
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