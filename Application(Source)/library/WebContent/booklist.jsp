<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="fr" xml:lang="fr" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>


</head>
<body>

<%
    session=request.getSession(false);
    if(session.getAttribute("appoge")==null)
    {%>
    	<jsp:include page="\nav.jsp"></jsp:include>
    <% }
    else{%>
    <jsp:include page="\nav2.jsp"></jsp:include>
    <% }

%>


<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost/db_library"  user="root"  password=""/> 


<main>
<div class="container pb-4 bookcontainer">
    <div class="row booklist">
        <div class="col-lg-3 ">
            <div class="list-group pt-4 position-sticky fixed-top aside">
  				<a class="list-group-item list-group-item-action bg-dark disabled text-light" aria-current="true">
				    Categories
				  </a>
                <a href="listbook?categorie=Litterature+et+fiction" class="list-group-item list-group-item-action">Littérature et fiction</a>
                <a href="listbook?categorie=Litterature+sentimentale" class="list-group-item list-group-item-action">Littérature sentimentale</a>
                <a href="listbook?categorie=Essais+et+documents" class="list-group-item list-group-item-action">Essais et documents</a>
                <a href="listbook?categorie=Policier+et+thriller" class="list-group-item list-group-item-action">Policier et thriller</a>
                <a href="listbook?categorie=Biographies" class="list-group-item list-group-item-action">Biographies</a>
                <a href="listbook?categorie=Commerce+et+finance" class="list-group-item list-group-item-action">Commerce et finance</a>
                <a href="listbook?categorie=Fantasy" class="list-group-item list-group-item-action">Fantasy</a>
                <a href="listbook?categorie=Science" class="list-group-item list-group-item-action">Science</a>

				</div>
        </div>
        <!-- Query -->
       <sql:query dataSource="${db}" var="rs">  SELECT * from livre;  </sql:query> 
        <div class="col-md-9 booklist ">
        
        <%if(session.getAttribute("loginfailed")!=null ){%>
    	<div class="alert alert-danger mt-4 " role="alert"> Appoge ou Mots de passe incorrectes !!</div>
    <% session.removeAttribute("loginfailed");}%>
        
            <div class="row  row-cols-lg-3  row-cols-md-2 row-cols-sm-1   mt-2">
                <c:forEach var="book" items="${rs.rows}">
				  <div class="col ">
				    <div class="card mt-3">
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
</main>


  <jsp:include page="\footer.jsp"></jsp:include>

</body>
<style>

@import url('https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap');
*{
	font-family: 'Source Sans Pro'!important;
	}
	
		.aside{
	padding-top:80px!important;
	z-index:0;
	}
	.booklist{
		padding-top:80px!important;
	}
	.bookcontainer{
	margin-top:-100px!important;
	}
</style>

</html>