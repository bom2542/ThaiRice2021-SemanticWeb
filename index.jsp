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
    }
  </style>
</head>
<body>
   <blockquote>
      <jsp:include page="input1.jsp"/>
      <h3>Input your SPARQL Query</h3>
        <form action="index.jsp" method="POST">
          <textarea name="qstring" value="${param.qstring}" rows="10" cols="70">
            PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
            PREFIX ex: <http://www.myontology.com/rice#>

            SELECT ?RiceEngName ?RiceThaiName ?Image
              WHERE { 
                    ?ThaiRice ex:isRiceEngName ?RiceEngName .
                    ?ThaiRice ex:isRiceThaiName ?RiceThaiName .
                    ?ThaiRice ex:hasImage ?Image .
              }
          </textarea>
        <br><br>
       <input type="submit">
      </form>
      <br>    
      <m:sparqllab qstring="${param.qstring}"></m:sparqllab>
   </blockquote>
</html>

    
