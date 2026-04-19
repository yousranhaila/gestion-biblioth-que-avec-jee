<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container ">
      <div class="row justify-content-center mt-4 ">
      		
        <div class="col-lg-8 col-sm-12 col-md-10  ">
            <h3 class="text-center mb-4">Inscription</h3>
            <div class="card  text-dark shadow p-3 mb-5 bg-body rounded">
                    
                <div class="card-body">
                    <form class="col-md-12 p-t-10" role="form" action="insertuser" method="post" id="registrationForm">
                    <div  class="row g-3" >
                    
                    <div class="col-md-3 mt-3">
                            <label class="control-label mb-1" for="appoge">Appoge</label>
                                <input type="number" class="form-control" name="appoge"  id="appoge" required>
                        </div>
						<div class=" col-md-4 mt-3">
                            <label class="control-label mb-1" for="Nom">Nom</label>
                                <input type="text" class="form-control" name="nom"  id="Nom" required>
                        </div>
                        <div class="col-md-4 mt-3">
                            <label class="control-label mb-1" for="Prenom">Prenom</label>
                                <input type="text" class="form-control" name="prenom" id="Prenom" required>
                        </div>
                        <div class="col-md-6 mt-3">
                            <label class="control-label mb-1" for="email">Email</label>
                                <input type="email" class="form-control" name="email" id="email" required>
                        </div>

                        <div class="col-md-6 mt-3">
                            <label class="control-label mb-1" for="password">Password</label>
                                <input type="password" class="form-control" name="password" id="password" required>
                        </div>
						</div>
                        <div class="col-md-6 mt-3 ">
                                <button type="submit" class="btn btn-block btn-dark " onclick="submitAndRedirect()">
                                    S'inscrire
                                </button>
                        </div>
                    </form>
                    <script>
                    
                    function submitAndRedirect() {
                        // Submit the form
                        document.getElementById("registrationForm").submit();
                        // Redirect to home page after a short delay (adjust as needed)
                        setTimeout(function() {
                            window.location.href ="index.jsp";
                           
                        }, 1000); // 1000 milliseconds = 1 second
                    }
                    
					</script>
					
                    
             
                  
                  

                </div>
                </div>
      
                </div>
    </div>
</div>
</body>
<style>
@import url('https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap');
body{
	font-family: 'Source Sans Pro', sans-serif;
	padding:5% 3%;
	background: #f8f8f8;

}
h3{
	font-weight:bolder;
	font-size: 44px;
}





</style>
</html>