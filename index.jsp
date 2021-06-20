<%@ taglib uri="WEB-INF/mytags.tld" prefix="m" %>
<html>
<head></head>
<body>

    <form action="index.jsp" method="POST" name="vinform">
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
        <input type="submit" value="ShowTable" onClick="sendInfo()">
    </form>

    <span id="amit"></span>

    <script>
        var request;
        function sendInfo()
        {
            var name = document.vinform.name.value;
            var tel = document.vinform.tel.value;
            var car = document.vinform.car.value;

            var url="data.jsp?name="+name+"&tel="+tel+"&car="+car;


            if(window.XMLHttpRequest){
                request=new XMLHttpRequest();
            }
            else if(window.ActiveXObject){
                request=new ActiveXObject("Microsoft.XMLHTTP");
            }

            try
            {
                request.onreadystatechange=getInfo;
                request.open("GET",url,true);
                request.send();
            }
            catch(e)
            {
                alert("Unable to connect to server");
            }
        }

        function getInfo(){
            if(request.readyState == 4){
                var val=request.responseText;
                document.getElementById('amit').innerHTML=val;
            }
        }
    </script>
</body>
</html>