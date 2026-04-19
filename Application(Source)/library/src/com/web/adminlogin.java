package com.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDao;
import com.metier.Admin;
import com.metier.User;


/**
 * Servlet implementation class adminlogin
 */
@WebServlet("/adminlogin")
public class adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String adminemail=request.getParameter("email");
		 String adminepassword=request.getParameter("password");

		 Admin admin=AdminDao.selectAdmin(adminemail);
		 if(admin==null || !admin.getPassword().equals(adminepassword) ){ 
			 request.setAttribute("admin", admin);
		     String referrer = request.getHeader("referer");
			 RequestDispatcher dispatcher = request.getRequestDispatcher(referrer);
				dispatcher.forward(request, response);
	    }
		 else {
			 HttpSession session = request.getSession();
			 session.setAttribute("admineemail", adminemail);
			 session.setAttribute("adminepassword", adminepassword);
			 response.sendRedirect("/library/ADMIN/admin.jsp");
				
		 }
	}

}
