<%@ page import="com.bean.Student" %>
<%@ page import="com.dao.StudentDao" %><%--
  Created by IntelliJ IDEA.
  User: 蒋万诺
  Date: 2023/12/4
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改检查页面</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String pwd = request.getParameter("password");
    Student student = new Student();
    student.setId(id);
    student.setName(name);
    student.setPassword(pwd);
    StudentDao.updateStudent(student);
    // 返回查看界面
    response.sendRedirect("show.jsp");
%>
</body>
</html>
