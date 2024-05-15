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
<h1 style="text-align: center;">Subject_Class</h1>
	<hr />
<form method="post" action="Subj_Cls_Mapp">
	<p style="text-align: center;">
		<br /><br />
		<label>Class</label><br />
		<select name="ddlClass">
			<option value="Class-I">Class-I</option>
			<option value="Class-II">Class-II</option>
			<option value="Class-III">Class-III</option>
			<option value="Class-IV">Class-IV</option>
			<option value="Class-V">Class-V</option>
		</select>
		<br /><br />
		<label>Subject</label><br />
		<select name="ddlSubject">
			<option value="Life Science">Life Science</option>
			<option value="Maths">Maths</option>
			<option value="Geography">Geography</option>
			<option value="English">English</option>
		</select>
		<br /><br />
		
		<input type="submit"  value="Add Here" />
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
		//Subject_Class_MappingService ss = new Subject_Class_MappingService();
	//List<Subject_Class_Mapping>  stdlist = ss.ShowAll();
	//pageContext.setAttribute("sinfo", stdlist);
	
%>


<h1 style="text-align: center;"> Information</h1>
<hr />
<table width="100%" border="1">
<tr>
<th>Number</th>
<th>Class Name</th>
<th>Subject Name</th>

</tr>
<%
for(Subject_Class_Mapping e : (List<Subject_Class_Mapping>) pageContext.getAttribute("sinfo"))
{	
	
%>

<tr>
<td><%=e.getid %>  </td>
<td><%=e.getClass().getClassName() %>  </td>
<td><%=e.getSubject().getSubjectName() %>  </td>
<td><%=e.getTeacher().getTeacherName() %>  </td>

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
</body>
</html>