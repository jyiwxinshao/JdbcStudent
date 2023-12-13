<%@ page import="com.dao.BaseDao" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: 蒋万诺
  Date: 2023/12/13
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String adminAccount = request.getParameter("adminAccount");

    if (adminAccount != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = BaseDao.getConnection();

            String query = "SELECT * FROM administrator WHERE account = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, adminAccount);
            rs = pstmt.executeQuery();

            if (rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Admin</title>
    <link rel="stylesheet" type="text/css" href="updateAdmin.css">
</head>
<body>
<section>
    <div class="color"></div>
    <div class="color"></div>
    <div class="color"></div>
    <div class="container">
        <div class="form">
            <h2>管理员账号: <%= adminAccount %></h2>
            <form action="updateAdminAction.jsp" method="post">
                <div class="inputBox"><input type="password" id="newPassword" name="newPassword" placeholder="请输入新密码"></div>
                <div class="inputBox"><input type="hidden" name="adminAccount" value="<%= adminAccount %>"></div>
                <div class="inputBox"><input type="submit" value="提交"></div>
            </form>
        </div>
    </div>
</section>
</body>
</html>
<%
} else {
%>
<script>
    alert("管理员账号无效！");
    window.location.href = "index.jsp";
</script>
<%
        }
    } catch (SQLException e) {
        out.print("发生错误：" + e.getMessage());
    } finally {
        if (rs != null) {
            try { rs.close(); } catch (SQLException e) { /* ignored */ }
        }
        if (pstmt != null) {
            try { pstmt.close(); } catch (SQLException e) { /* ignored */ }
        }
        if (conn != null) {
            try { conn.close(); } catch (SQLException e) { /* ignored */ }
        }
    }
} else {
%>
<script>
    alert("管理员账号无效！");
    window.location.href = "index.jsp";
</script>
<%
    }
%>