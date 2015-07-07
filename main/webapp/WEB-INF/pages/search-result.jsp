<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>OpenSource Infomation DataBase System</title>
  <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <script type="text/javascript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
  <script type="text/javascript"
          src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>
  <link href="/menu.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<header id="pageHeader">
  <div id="pageHeader-logo"><h2>daumkakao</h2></div>
</header>
<nav id="pageNav">
  <div id="pageNav-title"><h3>OpenSource DataBase</h3></div>
  <div id="pageNav-searchArea">
    <form id="pageNav-searchArea-searchForm" action="oss-database.jsp">
      <span><input id="pageNav-searchArea-searchTxt" class="form-control" type="text" id="ossname" name="ossname" /></span>
      <span><button id="pageNav-searchArea-searchBtn" class="btn btn-default" name="btnSearch" type="submit" >검색</button></span>
    </form></div>
</nav>
<section id="searchResult-section">
  <div id="#searchResult-section-area">
    <table class="table table-hover">
    <thead>
      <tr>
        <th>V</th>
        <th>오픈소스 명</th>
        <th>라이센스</th>
        <th>URL</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${ossList}" var="oss">
        <tr>
          <td><input type="checkbox" name="${oss.ossname}"></td>
          <td><a href="product_info.jeju?id=${oss.ossname}">${oss.ossname}</a></td>
          <td>${oss.license}</td>
          <td>${oss.url}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>

  </div>
</section>
</body>
<script type="text/javascript">

  $(document).ready(function() {

    var serverUrl = 'http://localhost:8080/get_oss_list';
    <%--$('#oss').autocomplete({--%>
    <%--source : '${pageContext. request. contextPath}/get_oss_list'--%>
    <%--});--%>
    <%--});--%>

    $( "#pageNav-searchArea-searchTxt" ).autocomplete({
      source: function (request, response) {
        $.ajax({
          url: serverUrl,
          data: request,
          dataType: "json",
          success : function(data) {
            var result = new Array();
            for(var i = 0;i<data.length;i++){
              console.log(data[0]['ossname']);
              result[i] = data[i]['ossname'];
            }
            response(result);
          }
        });
      }
    });

  });

</script>
</html>
