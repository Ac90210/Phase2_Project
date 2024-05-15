<%@page import="com.entities.Student"%>
<%@page import="com.service.StudentService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page isELIgnored="false" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table{
marign-left:auto;
margin-right:auto;
width:100%;
border: solid;
}
</style>
</head>
<body>
<%

if(session.getAttribute("sname")!=null)
{
	String sname = (String)session.getAttribute("sname");
	int rno = (Integer)session.getAttribute("rno");
	StudentService  ss = new StudentService();
	Student std = ss.SearchStudent(rno);
	pageContext.setAttribute("sinfo", std);
%>
<jsp:include page="StdLinks.jsp" />
<h1>Welcome to : <%=sname %></h1>

<table >
	<tr>
		<td align="right"><b>Roll Number : </b> </td>
		<td> <c:out value="${sinfo.rollno }" /> </td>
	</tr>
	<tr>
		<td align="right"><b>Student Name  : </b> </td>
		<td> <c:out value="${sinfo.sname }" /> </td>
	</tr>
	<tr>
		<td align="right"><b>Student Course  : </b> </td>
		<td> <c:out value="${sinfo.course }" /> </td>
	</tr>
	<tr>
		<td align="right"><b>Course Fees  : </b> </td>
		<td> <c:out value="${sinfo.fees }" /> </td>
	</tr>
	<tr>
		<td align="right"><b>Student Email  : </b> </td>
		<td> <c:out value="${sinfo.email }" /> </td>
	</tr>
	<tr>
		<td align="right"><b>Password  : </b> </td>
		<td> <c:out value="${sinfo.pswd }" /> </td>
	</tr>
</table>
<%
}
else
	response.sendRedirect("Login.jsp");
%>
</body>
</html>