<%@ page import="com.bean.Admin" %><%--
  Created by IntelliJ IDEA.
  User: 蒋万诺
  Date: 2023/12/13
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>检查添加管理员信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    // 获取来自addAdmin.jsp的表单
    String account = request.getParameter("account");
    String password = request.getParameter("password");

    // 创建admin对象
    Admin admin = new Admin();
    admin.setAccount(account);
    admin.setPassword(password);

    // 添加完成返回登录页面
    response.sendRedirect("index.jsp");
%>
</body>
</html>
