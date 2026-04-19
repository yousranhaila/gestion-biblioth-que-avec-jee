<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
	<title></title>

</head>
<body>
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
    <button class="btn btn-sm btn-light me-2 " data-bs-toggle="modal" data-bs-target="#exampleModallogin" >Se connecter</button>
    <a class="btn btn-sm btn-outline-light " href="register.jsp">S'inscrire</a>
  </div>
  </div>

</nav>



<!-- modal -->
  
  
  <form class="col-md-12 p-t-10" role="form" method="POST" action="login">
<div class="modal fade" id="exampleModallogin" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Connexion</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div  class="row g-3" >
  						<div class="form-group">
                            <label class="control-label mb-1" for="appoge">Appoge</label>                           
                            <input type="number" class="form-control" name="appoge"  id="appoge" required>     
                        </div>
                        <div class="form-group mt-2">
                            <label class="control-label mb-1" for="password">Password</label>
                            <input type="password" class="form-control" name="password" id="password" required >
                            </div>

		</div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-block btn-dark ">  Se connecter</button>
      </div>
    </div>
    
  </div>
  </div>
</form>
</body>

</html>