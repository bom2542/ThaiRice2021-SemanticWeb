<%@ taglib uri="WEB-INF/mytags.tld" prefix="m"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>[ Welcome ] - ThaiRice2021</title>
  <!-- google font-->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Sarabun:wght@300&display=swap" rel="stylesheet">
  <!-- boostrap v4 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- font awesome v5 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css">
  <!-- jquery-->
  <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
  <style>
    body {  
        font-family: 'Kanit', sans-serif;
        background-color: rgba(248, 248, 248, 0.973);
    }
  </style>
</head>
<body>
<blockquote>
  <jsp:include page = "header.jsp"/>
  

  <div style="margin: 20px 20px;">
    <h3>Input your SPARQL Query</h3>
    <jsp:include page="SPARQL_Query1.jsp"/>
    <br>
  </div>

  <div style="margin: 20px 20px; background-color: rgb(255, 255, 255); box-shadow: 0px 0px 5px #b4b3b3; border-radius: 5px;">
    <div style="margin: 20px 20px;">
      <m:sparqllab qstring="${param.qstring}"></m:sparqllab>
    </div>
  </div>
</blockquote>
</html>

    
