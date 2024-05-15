package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entities.Student;
import com.service.StudentService;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("txtUser");
		String pwd = request.getParameter("txtPass");
		
		System.out.println(user + "  " + pwd);
		
		HttpSession session = request.getSession();
		
		if(user.equals("Admin") && pwd.equals("admin@123"))
		{
			session.setAttribute("admn", user);
			response.sendRedirect("ShowStudents.jsp");
		}
		else
		{
			StudentService ss = new StudentService();
			Student std = ss.UserCheck(user, pwd);
			if(std!=null)
			{
				session.setAttribute("studentID", std.getStudentID());
				session.setAttribute("studeName", std.getStudentName());
				response.sendRedirect("StudentHome.jsp");
			}
			else
			{
				response.sendRedirect("Error.jsp");
			}
		}
	}

}
