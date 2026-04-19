package com.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.metier.Book;
import com.metier.Emprunt;
import com.metier.User;

public class EmpruntDao {
	
	// les parametres de connexion
	private String jdbcURL = "jdbc:mysql://localhost:3306/db_library";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";
	
	// les requets sql 
	private static final String INSERT_EMPRUNT =  "insert into emprunt (appoge,isbn, date_debut, date_fin) values (?, ? , ? ,? )";
	private static final String SELECT_BOOK_BY_ISBN_OR_APPOGE =  "SELECT e.id, e.isbn ,e.appoge, l.Titre, e.date_debut, e.date_fin from emprunt e , livre l "
			+ "where e.isbn=l.isbn and (e.isbn=? OR e.appoge=?)";               
	private static final String DELETE_EMPRUNT = "delete from emprunt where id=?";
	private static final String UPDATE_BOOK02 = "update livre set   nbExemplaire = (nbExemplaire + 1) where isbn = ?;";
	private static final String UPDATE_BOOK03 = "update livre set   nbExemplaire = (nbExemplaire - 1) where isbn = ?;";
	
	private Connection getConnection() {
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
	
	public void insertEmprunt(Emprunt emprunt ,int appoge , String isbn) throws SQLException, IOException {
		boolean rowUpdated;
		try(Connection connection = getConnection();
				PreparedStatement state01 = connection.prepareStatement(INSERT_EMPRUNT);
				PreparedStatement state02 = connection.prepareStatement(UPDATE_BOOK03);){
			state01.setInt(1, appoge);
			state01.setString(2, isbn);
			state01.setDate(3,    emprunt.getDate_debut());
			state01.setDate(4,    emprunt.getDate_fin());
			System.out.print(state01);
			state01.executeUpdate();
			
			state02.setString(1, isbn);
			rowUpdated = state02.executeUpdate() > 0;
			
		}catch(SQLException e) {
			printSQLException(e);
		}
	}
	
	public Emprunt selectemprunt(String isbn , int appoge) {
		Emprunt emprunt = null;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_ISBN_OR_APPOGE);) {
			preparedStatement.setString(1, isbn);
			preparedStatement.setInt(2, appoge);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String isbnb = rs.getString("isbn");
				int appogeu = rs.getInt("appoge");
				String titre = rs.getString("titre");
				Date debut = rs.getDate("date_debut");
				Date fin = rs.getDate("date_fin");
				emprunt = new Emprunt(id , isbnb, appogeu,titre, debut, fin);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return emprunt;
	}
	
	public boolean deleteEmprunt(int id ,String isbn) throws SQLException {
		boolean rowDeleted,rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement01 = connection.prepareStatement(DELETE_EMPRUNT);
				PreparedStatement statement02 = connection.prepareStatement(UPDATE_BOOK02);) {
			
			statement01.setInt(1, id);
			rowDeleted = statement01.executeUpdate() > 0;
			
			statement02.setString(1, isbn);
			rowUpdated = statement02.executeUpdate() > 0;
			
		}
		return rowDeleted;
	}
	
	// printException methode
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