<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="fr" xml:lang="fr" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

</head>
<body>
<%
    session=request.getSession(false);
    if(session.getAttribute("appoge")==null )
    {%>
    	<jsp:include page="\nav.jsp"></jsp:include>
    <% }
    else{%>
    <jsp:include page="\nav2.jsp"></jsp:include>
    <% }

%>

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost/db_library"  user="root"  password=""/> 
	
	
				
				<div class="container py-3">
				
				<%if(session.getAttribute("loginfailed")!=null ){%>
    	<div class="alert alert-danger mt-4 " role="alert"> Appoge ou Mots de passe incorrectes !!</div>
    <% session.removeAttribute("loginfailed");}%>
    
			        <!-- Card Start -->
			        <div class="card" style="max-height: 550px;">
			          <div class="row ">
			      
			            <div class="col-md-6 px-3">
			              <div class="card-block px-6">
			                <h5 class='text-danger'><c:out value='${book.categorie}' /></h5>
                            <h1 style='font-size: 2rem;font-weight:bold;'><c:out value='${book.titre}' /></h1>
                            <h6 class='text-warning' ><c:out value='${book.auteur}' /></h6>
                            <p style='font-size: 1rem;'><c:out value='${book.description}' /> </p>
			                
			                <%
							    session=request.getSession();
							    if(!(session.getAttribute("appoge")==null) )
							    {
							    	if(!(session.getAttribute("emprunt")==null) )
								    {
							    %>
							    	
						    		<div class="alert alert-primary " role="alert">
									  le livre est  emprunter avec succee
									</div>
						    <% }else{%>
						    <div class="me-3 mt-4">
                            <button type="button" class="btn btn-dark " data-bs-toggle="modal" data-bs-target="#exampleModalemprunt">Emprunter</button>
						    </div>
						    
						    
						    <%} }else{%>
							   <div class="alert alert-warning " role="alert">
									  Veuillez connecter pour emprunter ce livre !
									</div>
						     <% }%>
    
			              </div>
			            </div>
			            <div class="col-md-6">
			    				<img src='https://t3.ftcdn.net/jpg/02/15/84/20/360_F_215842088_udrMisz9cyj3OscJSZXth2aKsVm64zco.jpg' class='img-responsive' style="height:100%">
			            </div>
			          </div>
			        </div>
			        <!-- End of card -->
			      
			      </div>
				
				
	
	
	
	
	
	
	
        
        <!-- Suggestions part -->
        
        <div class="Suggestions ">
        	<div class="container p-4">
        		<div class="title">
        			<h2 style="color: black">Suggestions :</h2>
        		</div>
					<sql:query dataSource="${db}" var="rs">  SELECT * FROM livre ORDER BY RAND() LIMIT 4;  </sql:query> 
				        <div class="col">
				            <div class="row  row-cols-lg-4  row-cols-md-2 row-cols-sm-1  booklist mt-4">
				                <c:forEach var="book" items="${rs.rows}">
								  <div class="col ">
								    <div class="card mt-2">
								    <div>
								      <img src="https://mockuptree.com/wp-content/uploads/edd/2021/04/free-book-cover-mockup.jpg" class="card-img-top img-fluid" alt="..." height="50px">
								      </div>
								      <div class="card-body">      
								      	<p><span  class='text-success' style='font-size: 1rem;' ><c:out value='${book.categorie}' /></span><br>
								       <strong style='font-size: 2rem;'><c:out value='${book.Titre}' /></strong><br>
								     <span  class="text-secondary" style='font-size: 1rem;' ><c:out value='${book.auteur}' /> </span>  </p>   
								        <span class="d-flex me-3">
											<a class="btn btn-dark me-2 " href="selectbook?isbn=<c:out value='${book.isbn}' />"> Emprunter</a>
										</span>						     
								      </div>
								    </div>
								  </div>
				                </c:forEach>
				                
				            </div>
				            
				        </div>

 				    
                </div>
                
            </div>


<div>
<!-- Modal form  -->
<form method="POST" action='insertemprunt'>
			<div class="modal fade" id="exampleModalemprunt" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-md">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">Formulaire d'emprunt :</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <div  class="row g-3" >
			  <div class="col-md-3">
			    <label for="validationDefault01" class="form-label">ISBN</label>
			    <input type="text" class="form-control" id="validationDefault01" name="isbn" value='<c:out value='${book.isbn}' />'   readonly>
			  </div>
			  <div class="col-md-5">
			    <label for="validationDefault02" class="form-label">Titre</label>
			    <input type="text" class="form-control" id="validationDefault02" value='<c:out value='${book.titre}' />' readonly>
			  </div>
			  <div class="col-md-5">
			    <label for="auteur" class="form-label">Auteur</label>
			    <input type="text" class="form-control" id="auteur" value='<c:out value='${book.auteur}' />' readonly>
			  </div>
			  <div class="col-md-5">
			    <label for="cat" class="form-label">Categorie</label>
			    <input type="text" class="form-control" id="cat" value='<c:out value='${book.categorie}' />' readonly>
			  </div>
	
			      </div>
			      <div class="modal-footer mt-4">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <button  type="submit" class="btn btn-dark">Confirmer</button>
			      </div>
			    </div>
			  </div>
			</div>
</form>
</div>

<!-- Footer -->
        <jsp:include page="\footer.jsp"></jsp:include>
        
</body>
<style>
@import url('https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap');
*{
	font-family: 'Source Sans Pro'!important;
	}
	

  
  .card-block {
      font-size: 1em;
      position: relative;
      margin: 0;
      padding: 1em;
      border: none;
      border-top: 1px solid rgba(34, 36, 38, .1);
      box-shadow: none;
       
  }
  .card {
      font-size: 1em;
      overflow: hidden;
      padding: 5;
      border: none;
      border-radius: .28571429rem;
      box-shadow: 0 1px 3px 0 #d4d4d5, 0 0 0 1px #d4d4d5;
      margin-top:20px;
  }

</style>
</html>