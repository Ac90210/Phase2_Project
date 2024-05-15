package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entities.Student;
import com.entities.Teacher;
import com.service.StudentService;
import com.service.TeacherService;

/**
 * Servlet implementation class AddTcher
 */
public class AddTcher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTcher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String teacherName = request.getParameter("txtTname");
		String gender = request.getParameter("ddlGender");
		String address = request.getParameter("txtAdrs");
		String email = request.getParameter("txtEmail");
		String phoneNo = request.getParameter("txtPhoneNo");
		String location = request.getParameter("txtLocation");
		
		Teacher teacher = new Teacher();
		teacher.setTeacherName(teacherName);
		teacher.setGender(gender);
		teacher.setAddress(address);
		teacher.setEmail(email);
		teacher.setPhoneNo(phoneNo);
		teacher.setLocation(location);
		
		
		TeacherService ss = new TeacherService();
		ss.AddTeacher(teacher);
		
		response.sendRedirect("AddTeacher.jsp");
	}

}
