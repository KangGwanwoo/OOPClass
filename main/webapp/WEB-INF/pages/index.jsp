<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <title>Spring MVC Autocomplete with JQuery &amp; JSON example</title>
  <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />

  <script type="text/javascript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
  <script type="text/javascript"
          src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>

</head>
<body>

<h2>load json data about Oss List </h2>

  <table>
    <tbody>
    <tr>
      <th>OSS</th>
      <td><input type="text" id="oss" /></td>
    </tr>
    </tbody>
  </table>
  <br />


<script type="text/javascript">

  $(document).ready(function() {

    var serverUrl = 'http://localhost:8080/get_oss_list';
    <%--$('#oss').autocomplete({--%>
      <%--source : '${pageContext. request. contextPath}/get_oss_list'--%>
      <%--});--%>
    <%--});--%>

    $( "#oss" ).autocomplete({
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

</body>
</html>