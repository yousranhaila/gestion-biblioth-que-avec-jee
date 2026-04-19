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
<jsp:include page="\ASSETS\adminheader.jsp"></jsp:include>  

<div class="container-fluid">
  <div class="row">
  <jsp:include page="\ASSETS\adminsidebar.jsp"></jsp:include>    

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 p-4">

      <h2>Emprunts</h2>
      <div class='container mt-4 p-0'>
      
      <form class='align-items-end row row-cols-sm-auto row-cols-md-auto row-cols-lg-auto g-3  mb-4 ' action='searchemprunt' method='POST' >
      			<div class="col-12 title">
				<h5>Liste des emprunts :</h5>
			  </div>
			  <div class="col-12 ">
			    <div class="input-group">
			      <input type="number" class="form-control form-control-sm" id="inlineFormInputGroupSearch" placeholder="appoge" name="appoge">
			      <input type="text" class="form-control form-control-sm" id="inlineFormInputGroupSearch" placeholder="isbn" name="isbn">
			      <button type="submit" class="btn btn-dark btn-sm">Rechercher</button>
			    </div>
			  </div>
			</form>
      
      
      <div class="table-responsive">
        <table class="table table-striped table-hover table-sm">
          <thead class="bg-dark text-light">
            <tr>
              <th>ID</th>
              <th>ISBN</th>
              <th>Titre</th>
              <th>Appoge</th>
              <th>Date de retour</th>
              <th>Date de retour</th>
              <th>Delete</th>
            </tr>
          </thead>

          <tbody>
						<tr>
							<td><c:out value="${emprunt.id}" /></td>
							<td><c:out value="${emprunt.isbn}" /></td>
							<td><c:out value="${emprunt.titre}" /></td>
							<td><c:out value="${emprunt.appoge}" /></td>
							<td><c:out value="${emprunt.date_debut}" /></td>
							<td><c:out value="${emprunt.date_fin}" /></td>
              <td>
              <a href="deleteemprunt?id=<c:out value='${emprunt.id}' />&isbn=<c:out value="${emprunt.isbn}" />" class="text-dark me-3 ms-3"> <i class="fas fa-trash"> </i> </a>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      
      
      
      
      </div>
      
    </main>
  </div>
</div>
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
body{
	font-family: 'Roboto', sans-serif;
	font-size:0.9rem;
	}
.title{
	margin-right:40%!important;

}

 </style>
 </body>
</html>