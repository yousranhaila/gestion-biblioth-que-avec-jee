<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr" xml:lang="fr" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>BiblioTEQ</title>
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


<main>

<div class="jumbotron bg-light rounded-lg p-4 text-light ">
<%if(session.getAttribute("loginfailed")!=null ){%>
    	<div class="alert alert-danger " role="alert"> Appoge ou Mots de passe incorrectes !!</div>
    <% session.removeAttribute("loginfailed");}%>
    
    
  <h1 class="display-2 text-center mt-4">BiblioTeQ</h1>
  <p class=" text-center" style='font-size: 1.5rem;'>
Spécialisée dans toutes les disciplines, la plateforme BiblioTEQ abrite des dizain de livres variés: <br>littérature, sciences, 
litératures sentimentale, litérature et fiction, essai et documents,...etc.</p>
  <div class='d-flex justify-content-center'>
  <a class="btn btn-light btn-lg " href="booklist.jsp" role="button">Explorer les livres</a>
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
.jumbotron {
	background: url("https://i.pinimg.com/originals/d2/fd/7f/d2fd7f18946b759d51bb829b225150ba.gif");
	background-repeat: no-repeat;
 	background-size: cover;
	background-attachment: fixed;
	height: 25rem;

}




</style>
</html>