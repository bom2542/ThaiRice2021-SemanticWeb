<form action="index.jsp" method="POST">
    <input name="qstring" required value="${param.qstring}" rows="10" cols="70">
    <br><br>
    <input type="submit">
</form>

<%--<form action="index.jsp" method="POST">--%>
<%--    <textarea name="qstring" value="${param.qstring}" rows="10" cols="70 ">--%>
<%--      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>--%>
<%--      PREFIX ex: <http://www.myontology.com/rice#>--%>

<%--      SELECT ?RiceEngName ?RiceThaiName ?Image--%>
<%--        WHERE { --%>
<%--          ?ThaiRice ex:isRiceEngName ?RiceEngName .--%>
<%--          ?ThaiRice ex:isRiceThaiName ?RiceThaiName .--%>
<%--          ?ThaiRice ex:hasImage ?Image .--%>
<%--          ?ThaiRice ex:beType ?tr .--%>
<%--          ?tr ex:isRiceTypeThaiName ?RiceType .--%>
<%--        }--%>
<%--    </textarea>--%>
<%--  <br><br>--%>
<%-- <input type="submit">--%>
<%--</form>--%>