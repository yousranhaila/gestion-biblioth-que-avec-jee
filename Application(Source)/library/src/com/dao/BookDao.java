package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.metier.Book;


public class BookDao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/db_library";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";

	private static final String INSERT_BOOKS_SQL = "INSERT INTO livre  (isbn , Titre, Auteur , Categorie , nbExemplaire , description) " + " VALUES "
			+ " (?, ?, ?, ?, ?, ?);";

	private static final String SELECT_BOOK_BY_ISBN = "select * from livre where isbn =?";
	private static final String SELECT_BOOK_BY_TITRE = "select * from livre where titre like ?";
	private static final String SELECT_ALL_BOOKS = "SELECT * FROM `livre` WHERE livre.categorie=? ;";
	private static final String DELETE_BOOK = "delete from livre where isbn = ?;";
	private static final String UPDATE_BOOK01 = "update livre set  titre= ?, auteur= ? ,categorie= ? ,  nbExemplaire =? ,description= ?  where isbn = ?;";


	public BookDao() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	public void insertBook(Book book) throws SQLException {
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOKS_SQL)) {
			preparedStatement.setString(1, book.getIsbn());
			preparedStatement.setString(2, book.getTitre());
			preparedStatement.setString(3, book.getAuteur());
			preparedStatement.setString(4, book.getCategorie());
			preparedStatement.setInt(5, book.getNbExemplaire());
			preparedStatement.setString(6, book.getDescription());
			
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Book selectBook(String isbn) {
		Book book = null;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_ISBN);) {
			preparedStatement.setString(1, isbn);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String isbnBook = rs.getString("isbn");
				String titre = rs.getString("Titre");
				String auteur = rs.getString("Auteur");
				String categorie = rs.getString("Categorie");
				int nbExemplaire = rs.getInt("nbExemplaire");
				String description = rs.getString("description");
				book = new Book(isbnBook, titre, auteur, categorie, description, nbExemplaire);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return book;
	}
	
	public Book selectBookbytitre(String titre) {
		Book book = null;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_TITRE);) {
			preparedStatement.setString(1, titre);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String isbnBook = rs.getString("isbn");
				String titrebook = rs.getString("Titre");
				String auteur = rs.getString("Auteur");
				String categorie = rs.getString("Categorie");
				int nbExemplaire = rs.getInt("nbExemplaire");
				String description = rs.getString("description");
				book = new Book(isbnBook, titrebook, auteur, categorie, description, nbExemplaire);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return book;
	}
	

	public List<Book> selectAllBooksbycategory(String categorie) {

		List<Book> books = new ArrayList<>();
		try (Connection connection = getConnection();

			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOKS);) {
			preparedStatement.setString(1, categorie);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String isbnBook = rs.getString("isbn");
				String titre = rs.getString("Titre");
				String auteur = rs.getString("Auteur");
				String categorieb = rs.getString("Categorie");
				String description = rs.getString("description");
				int nbExemplaire = rs.getInt("nbExemplaire");
				books.add(new Book(isbnBook, titre, auteur, categorieb, description, nbExemplaire));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return books;
	}

	public boolean deleteBook(String isbn) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_BOOK);) {
			statement.setString(1, isbn);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateBook(Book book) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_BOOK01);) {
			
			statement.setString(1, book.getTitre());
			statement.setString(2, book.getAuteur());
			statement.setString(3, book.getCategorie());
			statement.setInt(4, book.getNbExemplaire());
			statement.setString(5, book.getDescription());
			statement.setString(6, book.getIsbn());
			System.out.println(statement);
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}

