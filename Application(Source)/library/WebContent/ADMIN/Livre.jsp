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
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost/db_library"  user="root"  password=""/> 

<div class="container-fluid">
  <div class="row">
  <jsp:include page="\ASSETS\adminsidebar.jsp"></jsp:include>    

     <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 p-4">

      <h2>Livres</h2>
      <div class='mt-4 '>
      
      <form class='align-items-end row row-cols-sm-auto row-cols-md-auto row-cols-lg-auto g-3  mb-4 d-flex '  action='searchbook' method='POST'>
      			<div class="col-12 title">
				<h5>Liste des Livres :</h5>
			  </div>
			  <div class="col-12 ">
			    <div class="input-group">
			      <input type="text" class="form-control form-control-sm" placeholder="Search" name='isbn' >
			      <button type="submit" class="btn btn-dark btn-sm rounded-end">Rechercher</button>			    
			      <div class="col-3">
			      <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModalajouterlivre" class="btn btn-dark btn-sm ms-4">Ajouter</button>
			      </div>
			      
			    </div>
			  </div>
			</form>
			
			
			<%  
			if(request.getAttribute("none")!=null ){%>
      <div class="alert alert-danger" role="alert"> Ce livre n'existe pas !</div>
      <%} %>
      <%  
			if(request.getAttribute("bookexiste")!=null ){%>
      <div class="rouge rouge_corect" role="rouge">  livre ajouter avec succee  </div>
      <%} %>
 
      
      <div class="table-responsive">
        <table class="table table-striped table-hover table-sm">
          <thead class="bg-dark text-light">
            <tr>
              <th>ISBN</th>
              <th>Titre</th>
              <th>Auteur</th>
              <th>Categorie</th>
              <th>Nombre d'exemplaires</th>
              <th>Description</th>
              <th>Actions</th>
            </tr>
          </thead>
          <sql:query dataSource="${db}" var="rs">  
			SELECT * from livre;  
			</sql:query> 
          
          <tbody>
            <c:forEach var="book" items="${rs.rows}">

						<tr>
							<td><c:out value="${book.isbn}" /></td>
							<td><c:out value="${book.titre}" /></td>
							<td><c:out value="${book.auteur}" /></td>
							<td><c:out value="${book.categorie}" /></td>
							<td><c:out value="${book.nbExemplaire}" /></td>
							<td class="text-truncate" style="max-width: 150px;"><c:out value="${book.description}" /></td>
              <td>
              <a href="deletebook?isbn=<c:out value='${book.isbn}' />" class="text-dark me-3 ms-3"> <i class="fas fa-trash"> </i> </a>
              <a href="editbook?isbn=<c:out value='${book.isbn}' />" class='link-dark' ><i class="fas fa-pen"></i></a>
              </td>
            </tr>
            </c:forEach>
            
          </tbody>
        </table>
      </div>
      
      </div>
      
    </main>
  </div>
</div>




<!-- modal  -->
					
					<form action="insertbook" method="post" accept-charset="utf-8" >
					<div class="modal fade" id="exampleModalajouterlivre" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title">Formulaire :</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <div  class="row g-3" >
					  <div class="col-md-2">
					    <label for="validationDefault01" class="form-label">ISBN</label>
					    <input type="text" class="form-control" id="validationDefault01"  lang='fr'   name='isbn' required>
					  </div>
					  <div class="col-md-4">
					    <label for="validationDefault02" class="form-label">Titre</label>
					    <input type="text" class="form-control" id="validationDefault02" lang='fr'   name='titre' required>
					  </div>
					  <div class="col-md-4">
					    <label for="validationDefault03" class="form-label">Auteur</label>
					    <input type="text" class="form-control" id="validationDefault03"  lang='fr'  name='auteur' required>
					  </div>
					  <div class="col-md-4">
					    <label for="validationDefault04" class="form-label">Categorie</label>
					    <select class="form-select" aria-label="Default select example"  lang='fr'  name='categorie' id='validationDefault04'>
					  <option selected>Choisir...</option>
					  <option value="Litterature et fiction">Litterature et fiction</option>
					  <option value="Litterature sentimentale">Litterature sentimentale</option>
					  <option value="Essais et documents.">Essais et documents</option>
					  <option value="Policier et thriller">Policier et thriller</option>
					  <option value="Biographies">Biographies</option>
					  <option value="Commerce et finance">Commerce et finance</option>
					  <option value="Science">Science</option>
					  <option value="Fantasy">Fantasy</option>
					</select>
					  </div>
					  <div class="col-md-3">
					    <label for="validationDefault05" class="form-label">Nombre d'exemplaires</label>
					    <input type="text" class="form-control" id="validationDefault05" lang='fr'  name='nbexemplaire' >
					  </div>  
					  <div class="col-md-12">
					    <label for="exampleFormControlTextarea1">Description</label>
					    <textarea class="form-control" id="exampleFormControlTextarea1" lang='fr'    name='description' rows="3"></textarea>
					  </div>
					</div>
					
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					        <button type="submit" class="btn btn-dark">Confirmer</button>
					      </div>
					    </div>
					  </div>
					
					</form>



</body>
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
body{
	font-family: 'Roboto', sans-serif;
	font-size:0.9rem;
	}
.title{
	margin-right:50%!important;

}
.rouge_corect {
    color: #2b5742;
    background-color: #d7f8e6;
    border-color: #c2f5cb;
}
.rouge{
    position: relative;
    padding: 1rem 1rem;
    margin-bottom: 1rem;
    border: 1px solid transparent;
    border-radius: .25rem;
}
.alert-danger {
    color: #212529;
    background-color: #dc3545;
    border-color: #c2f5cb;
}
</style>
</html>