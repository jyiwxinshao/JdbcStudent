<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: 蒋万诺
  Date: 2023/12/3
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>检查登录信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");      // 设置接收的字符编码
    boolean flag = false;       // 用来判断是否登入成功的标志

    // 获取从登入界面接收的信息
    String id = request.getParameter("account");
    String pwd = request.getParameter("password");

    // 连接数据库
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/student?serverTimezone=UTC";
    Connection conn = DriverManager.getConnection(url, "root", "");

    // 查询数据库并确认
    String sql = "select * from administrator where account=? and password=?";
    PreparedStatement prestat = conn.prepareStatement(sql);
    prestat.setString(1, id);
    prestat.setString(2, pwd);
    ResultSet rs = prestat.executeQuery();
    if (rs.next()) {
        flag = true;
    }
%>
<%--判断登录是否成功并前往对应界面--%>
<%
    if (flag) {
        response.sendRedirect("show.jsp?state=LoginSuccessed");
    }else {
        response.sendRedirect("index.jsp?state=LoginFailed");
    }
%>
</body>
</html>
