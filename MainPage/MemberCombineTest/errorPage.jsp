<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error Page</title>
    <!-- 添加样式代码 -->
</head>
<body>
    <h1>发生错误</h1>
    <p>错误信息: <%= request.getAttribute("javax.servlet.error.message") %></p>
    <a href="ReturnMethod.jsp">返回首页</a>
</body>
</html>
