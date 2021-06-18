<%@ taglib uri="WEB-INF/mytags.tld" prefix="m" %>
<html>
<head>
  <title> SPARQL Query Testing </title>
</head>
<body>
 <h1>Lab SPARQL</h1>
   <blockquote>
        <form action="index.jsp" method="POST">
            <b>Name : </b><input type="text" name="name" value="${param["name"]}">
            <b>Telephone : </b><input type="text" name="tel" value="${param["tel"]}">
            <b>Car : </b><input type="text" name="car" value="${param["car"]}">

            <textarea name="qstring" value="${param.qstring}" rows="10" cols="70" style="display:none;">
            PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
            PREFIX ex: <http://www.myontology.com/car#>

            SELECT ?name ?phone ?brand
                WHERE {
              	    
                }?x ex:hasPersonName ?name .
                    ?x ex:hasTelephoneNumber ?phone .
                    ?x ex:hasCar ?y .
                    ?y ex:hasSeriesName ?brand .
                    FILTER regex(?name, "${param.name}", "i")
                    FILTER regex(?phone, "${param.tel}")
                    FILTER regex(?brand, "${param.car}", "i")
          </textarea>
       <input type="submit">
      </form>
      <br>
      <m:sparqllab qstring="${param.qstring}"></m:sparqllab>
   </blockquote>
</body>
</html>

    
