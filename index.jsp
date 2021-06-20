<%@ taglib uri="WEB-INF/mytags.tld" prefix="m" %>
<html>
<head>
    <!-- google font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@200&family=Sarabun:wght@300&display=swap" rel="stylesheet">
    <!-- boostrap v4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- font awesome v5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css">
    <!--sweet alert-->
    <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
    <style>
        body {
            font-family: 'Kanit', sans-serif;
        }
        nav #topic_bold {
            font-weight: bold;
        }
        .col-example {
            padding: 1rem;
            background-color: #33b5e5;
            border: 2px solid #fff;
            color: #fff;
            text-align: center;
        }
        html {
            scroll-behavior: smooth;
        }
    </style>
</head>
<body>
<h1>Thai Rice Project 2021 Search</h1>
<blockquote>
    <form action="index.jsp" method="POST">
<%--        <b>Name : </b><input type="text" name="name" value="${param["name"]}">--%>
<%--        <b>Telephone : </b><input type="text" name="tel" value="${param["tel"]}">--%>
<%--        <b>Car : </b><input type="text" name="car" value="${param["car"]}">--%>

        <textarea name="qstring" value="${param.qstring}" rows="10" cols="70" style="display:none;">
            PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
            PREFIX owl: <http://www.w3.org/2002/07/owl#>
            PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
            PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
            PREFIX ex: <http://www.semanticweb.org/thairice#>

            SELECT ?RiceEngName ?RiceThaiName
                WHERE {
                    ?ThaiRice ex:isRiceEngName ?RiceEngName .
                    ?ThaiRice ex:isRiceThaiName ?RiceThaiName .
                }
          </textarea>
        <input type="submit">
    </form>
    <br>
    <m:sparqllab qstring="${param.qstring}"></m:sparqllab>
</blockquote>
</body>
</html>