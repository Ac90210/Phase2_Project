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
<jsp:include page="Links.jsp" />
<%
if(session.getAttribute("admn")!=null)
{
%>
<h1 style="text-align: center;">Add Classes</h1>
	<hr />
<form method="post" action="AddCls">
	<p style="text-align: center;">
		<input type="text"  name="txtCname"  placeholder="Class Name" required />
		<br /><br />
		
		<input type="submit"  value="Add" />
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
	ClassService cs = new ClassService();
	List<Class> sbj = cs.ShowAll();
    pageContext.setAttribute("sinfo", sbj);
%>

<h1 style="text-align: center;">Class Information</h1>
<hr />
<table width="100%" border="1">
<tr>
<th>Class Number</th>
<th>Class Name</th>
</tr>

<c:forEach var="std"  items="${sinfo }">

<c:url var="deletecourse" value="DeleteStd.jsp">
	<c:param name="classID" value="${std.classID }"/>
</c:url>

<tr>
	<td>
		<c:out value="${std.classID }" />
	</td>
	<td>
		<c:out value="${std.className }" />
	</td>
	<td>
		<a href="${deleteclass }">Delete</a>
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