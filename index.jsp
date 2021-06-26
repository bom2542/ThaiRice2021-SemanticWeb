<%-- JSP TAGS--%>
<%@ taglib uri="WEB-INF/mytags.tld" prefix="m"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%-- HTML --%>
<!DOCTYPE html>
<html lang="en">
<head>
  <jsp:include page = "jsp/header.jsp"/>
</head>
<body>

  <jsp:include page = "jsp/banner.jsp"/>

  <div class="container">
      <div class="row">
          <div class="col-md-12">
            <jsp:include page="jsp/search.jsp"/>
          </div>
        </div>
      </div>
  </div>



  <div style="margin: 20px 20px; background-color: rgb(255, 255, 255); box-shadow: 0px 0px 5px #b4b3b3; border-radius: 5px;">
    <div style="margin: 20px 20px;">
      <m:sparqllab qstring="${param.qstring}"></m:sparqllab>
    </div>
  </div>
</body>
</html>

    
