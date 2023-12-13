<%@ page import="com.dao.BaseDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 蒋万诺
  Date: 2023/12/13
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String adminAccount = request.getParameter("adminAccount");
    String newPassword = request.getParameter("newPassword");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = BaseDao.getConnection();

        String query = "UPDATE administrator SET password = ? WHERE account = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, newPassword);
        pstmt.setString(2, adminAccount);
        int rowsUpdated = pstmt.executeUpdate();

        if (rowsUpdated > 0) {
%>
<script>
    alert("密码修改成功！");
    window.location.href = "index.jsp";
</script>
<%
} else {
%>
<script>
    alert("密码修改失败！");
    window.location.href = "index.jsp";
</script>
<%
    }
} catch (SQLException e) {
%>
<script>
    alert("发生错误：" + "<%= e.getMessage() %>");
    window.location.href = "index.jsp";
</script>
<%
    } finally {
        if (pstmt != null) {
            try { pstmt.close(); } catch (SQLException e) { /* ignored */ }
        }
        if (conn != null) {
            try { conn.close(); } catch (SQLException e) { /* ignored */ }
        }
    }
%>
</body>
</html>
