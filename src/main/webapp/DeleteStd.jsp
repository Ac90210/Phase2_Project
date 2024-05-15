<%@page import="com.service.StudentService"%>

<%

	String studentID = request.getParameter("studentID");

StudentService ss = new StudentService();
	ss.DeleteStudent(Integer.parseInt(studentID));

	response.sendRedirect("ShowStudents.jsp");
%>