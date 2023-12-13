<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="com.bean.Student" %>
<%@ page import="com.dao.StudentDao" %><%--
  Created by IntelliJ IDEA.
  User: 蒋万诺
  Date: 2023/12/13
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>检查添加学生信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    // 获取来自add.jsp的表单
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String birthdayString = request.getParameter("birthday");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date birthday = null;
    try {
        birthday = sdf.parse(birthdayString);
    } catch (ParseException e) {
        e.printStackTrace();
    }
    String sex = request.getParameter("sex");

    // 创建student对象
    Student student = new Student();
    student.setId(id);
    student.setName(name);
    student.setAge(age);
    student.setBirthday(birthday);
    student.setSex(sex);
    StudentDao.add(student);

    // 添加完成返回展示页面
    response.sendRedirect("show.jsp");
%>
</body>
</html>
