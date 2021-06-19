<%@ taglib uri="WEB-INF/mytags.tld" prefix="m" %>
<!doctype html>
<html lang="en">
<body>

     <%
         String uname=request.getParameter("n3");
         out.println("Welcome "+ uname);
//         param.qstring = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>" +
//                 "PREFIX ex: <http://www.myontology.com/car#>" +
//                 "" +
//                 "SELECT ?name ?phone ?brand" +
//                 "WHERE {" +
//                 "?x ex:hasPersonName ?name ." +
//                 "?x ex:hasTelephoneNumber ?phone ." +
//                 "?x ex:hasCar ?y ." +
//                 "?y ex:hasSeriesName ?brand ." +
//                 "}" ;
//         qstring = "555";
     %>

<%--     <% out.println(uname); %>--%>
     <input type="name" name="qstring" value="" />



<%--     <form action="#">--%>
<%--         <textarea name="qstring" value="${param.qstring}" rows="10" cols="70">--%>
<%--                PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>--%>
<%--                PREFIX ex: <http://www.myontology.com/car#>--%>

<%--                SELECT ?name ?phone ?brand--%>
<%--                    WHERE {--%>
<%--                        ?x ex:hasPersonName ?name .--%>
<%--                        ?x ex:hasTelephoneNumber ?phone .--%>
<%--                        ?x ex:hasCar ?y .--%>
<%--                        ?y ex:hasSeriesName ?brand .--%>
<%--                        FILTER regex(?name, "<%out.println(uname);%>", "i")--%>
<%--                        FILTER regex(?phone, "${param.tel}")--%>
<%--                        FILTER regex(?brand, "${param.car}", "i")--%>
<%--                    }--%>
<%--         </textarea>--%>
<%--     </form>--%>

     <m:sparqllab qstring="${param.qstring}"></m:sparqllab>
</body>
</html>