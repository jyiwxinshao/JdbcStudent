<%@ page import="com.dao.StudentDao" %><%--
  Created by IntelliJ IDEA.
  User: 蒋万诺
  Date: 2023/12/4
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除学生信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    StudentDao.delete(id);      // 调用删除方法，实现删除操作
    response.sendRedirect("show.jsp");      // 实现页面跳转
%>
</body>
</html>
