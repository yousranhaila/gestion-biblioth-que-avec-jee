package com.web;

import java.io.IOException;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDao;
import com.dao.EmpruntDao;
import com.dao.UserDao;
import com.metier.User;
import com.metier.Book;
import com.metier.Emprunt;


@WebServlet("/")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDAO;
	private BookDao bookDAO;
	private EmpruntDao empruntDAO;
	
	public void init() {
		userDAO = new UserDao();
		bookDAO = new BookDao();
		empruntDAO = new EmpruntDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/newuser":
				showNewForm(request, response);
				break;
			case "/insertuser":
				insertUser(request, response);
				break;
			case "/ADMIN/deleteuser":
				deleteUser(request, response);
				break;
			case "/ADMIN/searchuser":
				searchuser(request, response);
				break;
			case "/listbook":
				listbook(request, response);
				break;
			case "/ADMIN/insertbook":
				insertbook(request, response);
				break;
			case "/ADMIN/updatebook":
				updateBook(request, response);
				break;
			case "/ADMIN/deletebook":
				deletebook(request, response);
				break;
			case "/ADMIN/editbook":
				showeditbook(request, response);
				break;
			case "/ADMIN/searchbook":
				searchbook(request, response);
				break;
			case "/insertemprunt":
				insertEmprunt(request, response);
				break;
			case "/ADMIN/deleteemprunt":
				deleteEmprunt(request, response);
				break;
			case "/ADMIN/searchemprunt":
				searchemprunt(request, response);
				break;
			case "/selectbook":
				showeditbook(request, response);
				break;
			case "/login":
				login(request, response);
				break;
			case "/logout":
				logout(request, response);
				break;
				
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	// selection :
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		dispatcher.forward(request, response);
	}
	
	private void listbook(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String categorie =request.getParameter("categorie");
		List<Book> listbook = bookDAO.selectAllBooksbycategory(categorie);
		request.setAttribute("listbook", listbook);
		RequestDispatcher dispatcher = request.getRequestDispatcher("booklistcategorie.jsp");
		dispatcher.forward(request, response);
	}

	
	private void showeditbook(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		String isbn = request.getParameter("isbn");
		Book existingBook = bookDAO.selectBook(isbn);
		request.setAttribute("book", existingBook);
		String referrer = request.getHeader("referer");
		if(referrer.equals("http://localhost:8080/library/ADMIN/Livre.jsp")) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ADMIN/Livreupdate.jsp");
		dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/infosbook.jsp");
			dispatcher.forward(request, response);
		}

	}
	
	//  recherche :
	private void searchbook(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		String isbn = request.getParameter("isbn");
		Book existingBook = bookDAO.selectBook(isbn);
		
		if(existingBook!=null) {
			request.setAttribute("book", existingBook);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ADMIN/Livresearch.jsp");
		dispatcher.forward(request, response);
		}
		else {
			String none="none";
			request.setAttribute("none", none);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/ADMIN/Livre.jsp");
			dispatcher.forward(request, response);
		}
	}
		
		private void searchuser(HttpServletRequest request, HttpServletResponse response)
				throws SQLException, ServletException, IOException {
			
			String appstring = request.getParameter("appoge");
			if(!appstring.equals("")) {
			int appoge = Integer.parseInt(appstring);
			User existinguser = userDAO.selectUser(appoge);
			if(existinguser!=null) {
			request.setAttribute("user", existinguser);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/ADMIN/userssearch.jsp");
			dispatcher.forward(request, response);
			}
			else {
				String none="none";
				request.setAttribute("none", none);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/ADMIN/users.jsp");
				dispatcher.forward(request, response);
			}
			}else {
				String none="none";
				request.setAttribute("none", none);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/ADMIN/users.jsp");
				dispatcher.forward(request, response);
			}
		

	}
	
		private void searchemprunt(HttpServletRequest request, HttpServletResponse response)
				throws SQLException, ServletException, IOException {
			
			String appstring = request.getParameter("appoge");
			String isbn = request.getParameter("isbn");
			
			if(isbn.equals("") && appstring.equals("")) {
				String none="none";
				request.setAttribute("none", none);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/ADMIN/Emprunt.jsp");
				dispatcher.forward(request, response);
			}
			
			else {
			if(!appstring.equals("") ) {
				int appoge = Integer.parseInt(appstring);
				Emprunt existingemprunt = empruntDAO.selectemprunt(isbn, appoge);
						if(existingemprunt!=null) {
						request.setAttribute("emprunt", existingemprunt);
						RequestDispatcher dispatcher = request.getRequestDispatcher("/ADMIN/Empruntsearch.jsp");
						dispatcher.forward(request, response);
						}
						else {
							String none="none";
							request.setAttribute("none", none);
							RequestDispatcher dispatcher = request.getRequestDispatcher("/ADMIN/Emprunt.jsp");
							dispatcher.forward(request, response);
						}
			}
			else  {
					Emprunt existingemprunt = empruntDAO.selectemprunt(isbn, 0);
					if(existingemprunt!=null) {
					request.setAttribute("emprunt", existingemprunt);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/ADMIN/Empruntsearch.jsp");
					dispatcher.forward(request, response);
				}
					else {
						String none="none";
						request.setAttribute("none", none);
						RequestDispatcher dispatcher = request.getRequestDispatcher("/ADMIN/Emprunt.jsp");
						dispatcher.forward(request, response);
					}
			}
			}
		}
		
	// Insertion :
	
	private void insertUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int appoge =Integer.parseInt(request.getParameter("appoge")) ;		
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User newUser = new User(appoge, nom, prenom, email,password);
		userDAO.insertUser(newUser);
		response.sendRedirect("http://localhost:8080/library/index.jsp");
	}
	
	private void insertbook(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
		String isbn =request.getParameter("isbn") ;		
		String titre = request.getParameter("titre");
		String auteur = request.getParameter("auteur");
		String categorie = request.getParameter("categorie");
		int nbExemplaire = Integer.parseInt(request.getParameter("nbexemplaire"));
		String desc = request.getParameter("description");
		Book book = new Book(isbn, titre, auteur, categorie, desc ,nbExemplaire);
		bookDAO.insertBook(book);
		
		Book existingbook = bookDAO.selectBook(isbn);
		 if(existingbook!=null) {
			 request.setAttribute("bookexiste", existingbook);
		 }
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ADMIN/Livre.jsp");
		dispatcher.forward(request, response);
	}
	

	private void insertEmprunt(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		 LocalDateTime now = LocalDateTime.now();
		 LocalDateTime next = now.plusDays(7);
		 Date date_debut =  Date.from(now.atZone(ZoneId.systemDefault()).toInstant());
		 Date date_fin =  Date.from(next.atZone(ZoneId.systemDefault()).toInstant());
		 java.sql.Date date_sql_debut = new java.sql.Date(date_debut.getTime());
		 java.sql.Date date_sql_fin = new java.sql.Date(date_fin.getTime());
		 
		 int appoge =(int) request.getSession().getAttribute("appoge");
		String isbn =request.getParameter("isbn");
        Emprunt Emp = new Emprunt(date_sql_debut,date_sql_fin);

		empruntDAO.insertEmprunt(Emp,appoge,isbn);
		Emprunt existingemprunt = empruntDAO.selectemprunt("", appoge);
		 if(existingemprunt!=null) {
			 request.getSession().setAttribute("emprunt", existingemprunt);
		 }
	        
	    String referrer = request.getHeader("referer");
		response.sendRedirect(referrer);
	}
	
	
	// mise a jour :
	
	private void updateBook(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String isbn = request.getParameter("isbn");
		String titre = request.getParameter("titre");
		String auteur = request.getParameter("auteur");
		String Categorie = request.getParameter("categorie");
		int  NbExemplaire = Integer.parseInt(request.getParameter("nbExemplaire"));
		String Description = request.getParameter("description");

		Book book = new Book(isbn,titre,auteur,Categorie,Description,NbExemplaire);
		bookDAO.updateBook(book);
		response.sendRedirect("http://localhost:8080/library/ADMIN/Livre.jsp");
	}
	
	// Suppression :
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
	    try {
	        int id = Integer.parseInt(request.getParameter("id"));
	        userDAO.deleteUser(id);
	        // Use request.getContextPath() to get the context path dynamically
	        response.sendRedirect(request.getContextPath() + "/ADMIN/users.jsp");
	    } catch (NumberFormatException e) {
	        // Handle the case where the "id" parameter cannot be parsed as an integer
	        e.printStackTrace(); // Log the exception or handle it as needed
	        response.sendRedirect(request.getContextPath() + "/errorPage.jsp");}
	}
	
	private void deletebook(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
	    try {
	        String isbn = request.getParameter("isbn");
	        bookDAO.deleteBook(isbn);
	        response.sendRedirect(request.getContextPath() + "/ADMIN/Livre.jsp");
	    } catch (SQLException e) {
	        e.printStackTrace(); // Log the exception or handle it as needed
	        response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
	    }

}
	private void deleteEmprunt(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
	    try {
	        int id = Integer.parseInt(request.getParameter("id"));
	        String isbn = request.getParameter("isbn");

	        empruntDAO.deleteEmprunt(id, isbn);

	        response.sendRedirect(request.getContextPath() + "/ADMIN/Emprunt.jsp");
	    } catch (NumberFormatException | SQLException e) {
	        e.printStackTrace(); // Log the exception or handle it as needed
	        response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
	    }
	}
	
	
	// login :
	private void login(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
	int appoge=Integer.parseInt(request.getParameter("appoge"));
	 String password=request.getParameter("password");
	 User user=userDAO.selectUser(appoge);
	 if(user==null || !user.getPassword().equals(password) ){ 
		 boolean loginfailed=true;
		 request.setAttribute("user", user);
		 HttpSession session = request.getSession();
		 session.setAttribute("loginfailed", loginfailed);
		 String referrer = request.getHeader("referer");
		 response.sendRedirect(referrer);

    }
	 else {
		 Emprunt existingemprunt = empruntDAO.selectemprunt("", appoge);
		 HttpSession session = request.getSession();
		 if(existingemprunt!=null) {
				session.setAttribute("emprunt", existingemprunt);
		 }
		 session.setAttribute("appoge", appoge);
		 session.setAttribute("password", password);
		 String referrer = request.getHeader("referer");
		 response.sendRedirect(referrer);
	 }
	
	}
	
	//logout
	private void logout(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
	HttpSession session = request.getSession();
	session.removeAttribute("appoge");
	session.removeAttribute("password");
	session.removeAttribute("emprunt");
	String referrer = request.getHeader("referer");
	response.sendRedirect(referrer);
	
	}
}
