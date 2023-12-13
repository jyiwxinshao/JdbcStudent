<%@ page import="com.bean.Student" %>
<%@ page import="com.dao.StudentDao" %><%--
  Created by IntelliJ IDEA.
  User: 蒋万诺
  Date: 2023/12/4
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改学生信息</title>
    <link rel="stylesheet" type="text/css" href="update.css">
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Student stu = StudentDao.getStudent(id);
%>
<section>
    <div class="color"></div>
    <div class="color"></div>
    <div class="color"></div>
    <div class="container">
        <div class="form">
            <form action="updateCheck.jsp?id=<%=id%>" method="post">
                <div class="inputBox" style="color: #ffffff">学号：<input type="text" name="id" value="<%=stu.getId()%>"
                                                                       style="width: 80%"></div>
                <div class="inputBox" style="color: #ffffff">姓名：<input type="text" name="name"
                                                                       value="<%=stu.getName()%>" style="width: 80%">
                </div>
                <div class="inputBox" style="color: #ffffff">年龄：<input type="text" name="age" value="<%=stu.getAge()%>"
                                                                       style="width: 80%"></div>
                <div class="inputBox" style="color: #ffffff">生日：<input type="text" name="birthday"
                                                                       value="<%=stu.getBirthday()%>"
                                                                       style="width: 80%"></div>
                <div class="inputBox" style="color: #ffffff">性别：<input type="text" name="sex" value="<%=stu.getSex()%>"
                                                                       style="width: 80%"></div>
                <div class="inputBox">
                    <input type="submit" value="修改">
                    <input type="reset" value="重置"
                           style="background: #ffffff;color: #666666;max-width: 100px;cursor: pointer;margin-bottom: 20px;font-weight: 600;position: absolute;right: 60px;">
                </div>
            </form>
        </div>
    </div>
</section>

</body>
</html>
