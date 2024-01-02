<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head> 
<meta charset="UTF-8">
<title> Application </title>
</head>

<body>

<%
    application.setAttribute("counter", "1000");
    out.print("已經設定為網路計數器值為" + 1000);
%>

</body>



</html>
