package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.entities.Class;
import com.entities.Student;
import com.entities.Subject;
import com.entities.Subject_Class_Mapping;
import com.service.ClassService;
import com.service.Subject_Class_MappingService;

import jakarta.persistence.TypedQuery;

/**
 * Servlet implementation class Subj_Cls_Mapp
 */
public class Subj_Cls_Mapp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Subj_Cls_Mapp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 int subjectID = Integer.parseInt(request.getParameter("subjectID"));
	     int classID = Integer.parseInt(request.getParameter("classID"));
	     
	     String className = request.getParameter("ddlCname");
	     String subjectName = request.getParameter("ddlSname");
		
	     Class classtbl = new Class();
		 classtbl.setClassName(className);
		 Subject subtbl = new Subject();
	     subtbl.setSubjectName(subjectName);
	     
		
		Subject_Class_Mapping ss = new Subject_Class_Mapping();
		ss.setSubjectID(subjectID);
		ss.setClassID(classID);
		
		Subject_Class_MappingService scm = new Subject_Class_MappingService();
		scm.AddSubj_Cls_Mapp(ss);
	
		
		response.sendRedirect("AddSubj_Cls_Mapp.jsp");
	}
	
	
	

}
