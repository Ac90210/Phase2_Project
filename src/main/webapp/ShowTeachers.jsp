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
<!-- Presenting db data using JSTL tag -->
<%

	if(session.getAttribute("admn")!=null)
	{
		TeacherService ss = new TeacherService();
	List<Teacher>  tlist = ss.ShowAll();
	pageContext.setAttribute("sinfo", tlist);
%>

<jsp:include page="Links.jsp" />
<h1 style="text-align: center;">Students Information</h1>
<hr />
<table width="100%" border="1">
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
</body>
</html>