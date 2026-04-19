<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="fr" xml:lang="fr" xmlns="http://www.w3.org/1999/xhtml">
<%
    session=request.getSession(false);
    if(session.getAttribute("admineemail")==null )
    {
    	
        response.sendRedirect("login.jsp");
    }

%>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

  </head>
  <body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost/db_library"  user="root"  password=""/>    
<jsp:include page="\ASSETS\adminheader.jsp"></jsp:include>  

<div class="container-fluid">
  <div class="row">
  <jsp:include page="\ASSETS\adminsidebar.jsp"></jsp:include>    





    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 p-4">

      <h2>Dashboard</h2>
    <sql:query dataSource="${db}" var="rs">  SELECT count(id) as cnt from emprunt;  </sql:query>
      <div class="row  mt-2">
    <div class="col-xl-3 col-sm-6 col-12 mt-2">
      <div class="card bg-success text-light">
        <div class="card-content">
          <div class="card-body">
            <div class="media d-flex">
              <div class="align-self-center">
                <i class="fas fa-book-reader fa-3x me-4"></i>
              </div>
              <div class="media-body text-right">
         <c:forEach var="emprunt" items="${rs.rows}">
                <h3><c:out value="${emprunt.cnt}" /></h3>
			</c:forEach>
                <span>Emprunts</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <sql:query dataSource="${db}" var="rs1">  SELECT count(appoge) as cnt from users;  </sql:query>
    <div class="col-xl-3 col-sm-6 col-12 mt-2">
      <div class="card bg-danger text-light">
        <div class="card-content">
          <div class="card-body">
            <div class="media d-flex">
              <div class="align-self-center">
                <i class="fas fa-user-friends fa-3x me-4"></i>
              </div>
              <div class="media-body text-right">
                <c:forEach var="user" items="${rs1.rows}">
                <h3><c:out value="${user.cnt}" /></h3>
                </c:forEach>
                <span>Utilisateurs</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
        <sql:query dataSource="${db}" var="rs2">  SELECT count(isbn) as cnt from livre;  </sql:query>
    <div class="col-xl-3 col-sm-6 col-12 mt-2">
      <div class="card bg-primary text-light">
        <div class="card-content">
          <div class="card-body">
            <div class="media d-flex">
              <div class="align-self-center">
                <i class="fas fa-book fa-3x me-4"></i>
              </div>
              <div class="media-body text-right">
                <c:forEach var="book" items="${rs2.rows}">
                <h3><c:out value="${book.cnt}" /></h3>
                </c:forEach>
                <span>Livres</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
            <sql:query dataSource="${db}" var="rs3">  SELECT count(isbn) as cnt from emprunt where date_fin < CURRENT_DATE;  </sql:query>
    <div class="col-xl-3 col-sm-6 col-12 mt-2">
      <div class="card bg-secondary text-light">
        <div class="card-content">
          <div class="card-body">
            <div class="media d-flex">
              <div class="align-self-center">
                <i class="fas fa-clock fa-3x me-4"></i>
              </div>
              <div class="media-body text-right">
                <c:forEach var="user" items="${rs3.rows}">
                <h3><c:out value="${user.cnt}" /></h3>
                </c:forEach>
                <span>Emprunts en Retard</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
      
    </main>
  </div>
</div>


          <tbody>
					
					<c:forEach var="user" items="${rs.rows}">

						<tr>
							<td><c:out value="${user.appoge}" /></td>
							<td><c:out value="${user.nom}" /></td>
							<td><c:out value="${user.prenom}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.password}" /></td>
							<td><a
								href="deleteuser?id=<c:out value='${user.appoge}' />" class='text-dark me-2 text-align-center'><i class="fas fa-trash"></i> </a></td>
						</tr>
					</c:forEach>
					
					
					
 </body>
 <style>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
body{
	font-family: 'Roboto', sans-serif;
	font-size:0.9rem;
	}
 </style>
</html>