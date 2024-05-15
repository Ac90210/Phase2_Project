package com.servlets;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ClassService;
import com.entities.Class;




/**
 * Servlet implementation class AddCls
 */
public class AddCls extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCls() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String className = request.getParameter("txtCname");
		
		Class cl = new Class();
		cl.setClassName(className);
	
		ClassService ss = new ClassService();
		ss.AddClass(cl);
		
		response.sendRedirect("AddClass.jsp");
	}

}
