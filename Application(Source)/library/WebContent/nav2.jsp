<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>

<jsp:include page="\modal2.jsp"></jsp:include>
<nav class="navbar navbar-expand-md navbar-dark position-sticky fixed-top bg-dark">

  <div class="container-fluid pe-4 ps-4">
    <a class="navbar-brand" href="/library/index.jsp">BiblioTEQ</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
       
        <li class="nav-item">
          <a class="nav-link" href="booklist.jsp">Liste des livres</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
            <li><a href="listbook?categorie=Litterature+et+fiction" class="dropdown-item">Littérature et fiction</a></li>
             <li>   <a href="listbook?categorie=Litterature+sentimentale" class="dropdown-item">Littérature sentimentale</a></li>
           <li>     <a href="listbook?categorie=Essais+et+documents" class="dropdown-item">Essais et documents</a></li>
            <li>    <a href="listbook?categorie=Policier+et+thriller" class="dropdown-item">Policier et thriller</a></li>
              <li>  <a href="listbook?categorie=Biographies" class="dropdown-item">Biographies</a></li>
              <li>  <a href="listbook?categorie=Commerce+et+finance" class="dropdown-item">Commerce et finance</a></li>
               <li> <a href="listbook?categorie=Fantasy" class="dropdown-item">Fantasy</a></li>
              <li>  <a href="listbook?categorie=Science" class="dropdown-item">Science</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="team.jsp">Contact</a>
        </li>
      </ul>
    <div class="dropdown me-4">
			  <button class="btn btn-transparent text-white dropdown-toggle me-4" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
			    <img
                 src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                 class="rounded-circle"
                 height="22"
                 alt=""
                 loading="lazy"
                 /> Profile
			  </button>
			  <ul
              class="dropdown-menu dropdown-menu-start dropdown-menu-dark"
              aria-labelledby="navbarDropdownMenuLink"
              >
            <li >
      <a class="dropdown-item text-light link btn btn-dark"  data-bs-toggle="modal" data-bs-target="#exampleModal">Se Deconnecter</a>
    </li>
          </ul>
			</div>
  </div>
  </div>
  
  
</nav>




</body>
<style>
.btn:focus {
  outline: none !important;
}


</style>
</html>