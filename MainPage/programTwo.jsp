<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head> 
<meta charset="UTF-8">
<title> Application </title>
</head>

<body>

<%
    int counter;

    // Check whether counter exists. If not, initialize to 1000
    if (application.getAttribute("counter") == null) {
        application.setAttribute("counter", "1000");
    }

    String strNo = (String)application.getAttribute("counter");

    // Exception Event  
    try {
        counter = Integer.parseInt(strNo); // Transfer string to int
    } catch (NumberFormatException e) {
        // The condition of the first time visit or other condition happened to initialize
        counter = 0;
    }

    //Check if the session existed and is new or not.
    if (session != null && session.isNew()) { 
        counter++;
    }

    strNo = String.valueOf(counter); // Transfer int to string
    application.setAttribute("counter", strNo); // sent back the counter value to the first code
%>

    <%= "您是第 " + counter + " 位賓客" %>

</body>

</html>
