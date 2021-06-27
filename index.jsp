<%-- JSP --%>
<%@ taglib uri="WEB-INF/mytags.tld" prefix="m"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%-- HTML --%>
<!DOCTYPE html>
<html lang="en">
<head>
  <jsp:include page = "jsp/header.jsp"/>
</head>
<body id="body-pd">

    <div class="loader">
        <img src="./jsp/img/loader.gif" />
    </div>

  <jsp:include page = "jsp/banner.jsp"/>

  <div class="container">
      <div class="row">

          <div class="col-md-12">
<%--              <div class="mt-5 mb-1">--%>
<%--                  <b><i class="fas fa-filter"></i> Filter Search :</b>--%>
<%--                  <a class="btn btn-info active ml-2" href="index.jsp" role="button">Thai Rice</a>--%>
<%--                  <a class="btn btn-info" href="type.jsp" role="button">Type Rice</a>--%>
<%--                  <a class="btn btn-info" href="#" role="button">Link</a>--%>
<%--              </div>--%>
          </div>
          <div class="col-md-12">
            <jsp:include page="jsp/search.jsp"/>
          </div>
          <div class="col-md-12">
              <div class="table-responsive mt-4">
                <!-- <div class="result"></div> -->
                <m:sparqllab qstring="${param.qstring}"></m:sparqllab>
              </div>
          </div>

        </div>
      </div>
  </div>

  <jsp:include page = "jsp/foot.jsp"/>

</body>
</html>

    
