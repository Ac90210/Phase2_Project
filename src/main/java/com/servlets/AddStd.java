package com.servlets;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entities.Class;
import com.entities.Student;
import com.service.StudentService;

/**
 * Servlet implementation class AddStd
 */
public class AddStd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studentName = request.getParameter("txtSname");
		String gender = request.getParameter("ddlGender");
		String address = request.getParameter("txtAdrs");
		String email = request.getParameter("txtEmail");
		String location = request.getParameter("txtLocation");
		String className = request.getParameter("ddlCname");
		
		
		Class classtbl = new Class();
		classtbl.setClassName(className);
		
		
		Student std = new Student();
		std.setStudentName(studentName);
		std.setGender(gender);
		std.setAddress(address);
		std.setEmail(email);
		std.setLocation(location);
		std.setClasstbl(classtbl);
		
		StudentService ss = new StudentService();
		ss.AddStudent(std);
		
		response.sendRedirect("AddStudent.jsp");
	}

}
