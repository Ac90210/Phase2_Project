package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entities.Class;
import com.entities.Subject;
import com.service.ClassService;
import com.service.SubjectService;

/**
 * Servlet implementation class AddSbj
 */
public class AddSbj extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSbj() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
      String subjectName = request.getParameter("txtSbjname");
		
		Subject sbj = new Subject();
		sbj.setSubjectName(subjectName);
	
		SubjectService ss = new SubjectService();
		ss.AddSubject(sbj);
		
		response.sendRedirect("AddSubject.jsp");
	}

}
