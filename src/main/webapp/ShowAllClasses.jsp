<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@ page isELIgnored="false" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%@ page import="com.entities.*" %>
    <%@ page import="com.connections.*" %>
    <%@ page import="com.service.*" %>
    <%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Presenting db data using JSTL tag -->
<%

	if(session.getAttribute("admn")!=null)
	{
		ClassService cs = new ClassService();
		List<Class> std = cs.ShowAll();
	    pageContext.setAttribute("sinfo", std);
%>

<jsp:include page="Links.jsp" />
<h1 style="text-align: center;">Students Information</h1>
<hr />
<table width="100%" border="1">
<tr>
<th>Class Number</th>
<th>Class Name</th>
</tr>

<c:forEach var="std"  items="${sinfo }">

<c:url var="deletecourse" value="DeleteStd.jsp">
	<c:param name="courseID" value="${std.courseID }"/>
</c:url>

<tr>
	<td>
		<c:out value="${std.courseID }" />
	</td>
	<td>
		<c:out value="${std.courseName }" />
	</td>
	<td>
		<a href="${deletecourse }">Delete</a>
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