package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.StudentService;

/**
 * Servlet implementation class ChangePwd
 */
public class ChangePwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int rno = (Integer)session.getAttribute("rno");
		String npwd = request.getParameter("txtNpwd");
		String cnpwd = request.getParameter("txtCNpwd");
		
		if(npwd.equals(cnpwd))
		{
			StudentService  ss = new StudentService();
			ss.ChangePassword(rno, cnpwd);
			response.sendRedirect("StdLogout.jsp");
		}
	}

}
