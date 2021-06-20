<%@ taglib uri="WEB-INF/mytags.tld" prefix="m" %>
<html>
<head>
    <title> SPARQL Query Testing </title>
</head>
<body>

    <form action="index.jsp" method="POST">
        <b>Name : </b><input type="text" name="name" value="${param["name"]}" id="a01">
        <b>Telephone : </b><input type="text" name="tel" value="${param["tel"]}" id="a02">
        <b>Car : </b><input type="text" name="car" value="${param["car"]}" id="a03">

        <textarea name="qstring" value="${param.qstring}" rows="10" cols="70" id="a04">
            PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
            PREFIX ex: <http://www.myontology.com/car#>

            SELECT ?name ?phone ?brand
                WHERE {
                  ?x ex:hasPersonName ?name .
                  ?x ex:hasTelephoneNumber ?phone .
                  ?x ex:hasCar ?y .
                  ?y ex:hasSeriesName ?brand .
                  FILTER regex(?name, "${param.name}", "i")
                  FILTER regex(?phone, "${param.tel}")
                  FILTER regex(?brand, "${param.car}", "i")
                }
          </textarea>

        <input type="submit" id="myBtn">
    </form>

    <m:sparqllab qstring="${param.qstring}"></m:sparqllab>

    <script>
        function sayHello(){
            alert("Hello World! sayHello() function executed successfully!");
            var x = document.getElementById("a01");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }

        function sayHi(){
            alert("Hi There! sayHi() function executed successfully!");
            var x = document.getElementById("a04");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }

        var btn = document.getElementById("myBtn");
        btn.addEventListener("click", sayHello);
        btn.addEventListener("click", sayHi);
    </script>
</body>
</html>