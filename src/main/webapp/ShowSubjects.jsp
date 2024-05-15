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
	SubjectService ss = new SubjectService();
	List<Subject> sbj = ss.ShowAll();
    pageContext.setAttribute("sinfo", sbj);
%>

<jsp:include page="Links.jsp" />
<h1 style="text-align: center;">Subjects Information</h1>
<hr />
<table width="100%" border="1">
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
</body>
</html>