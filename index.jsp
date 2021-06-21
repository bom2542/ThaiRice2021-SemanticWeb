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
    <title>[ Welcome ] - ThaiRice2021</title>
    <!--sweet alert-->
    <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
    <style>
        body {
            font-family: 'Kanit', sans-serif;
        }
    </style>
</head>
<body>
<h1>Thai Rice Project 2021 Search</h1>
    <form action="index.jsp" method="POST">

        <textarea name="qstring" value="${param.qstring}" rows="10" cols="70">

            PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
            PREFIX ex: <http://www.semanticweb.org/thairice#>

            SELECT ?ThaiRice ?RiceEngName
            WHERE {
                ?ThaiRice ex:isRiceEngName ?RiceEngName .
            }

          </textarea>
        <input type="submit">
    </form>

    <m:sparqllab qstring="${param.qstring}"></m:sparqllab>

</body>
</html>