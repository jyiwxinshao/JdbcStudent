<%@ page import="java.util.List" %>
<%@ page import="com.bean.Student" %>
<%@ page import="com.dao.StudentDao" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: 蒋万诺
  Date: 2023/12/3
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息</title>
    <link rel="stylesheet" type="text/css" href="show.css">
</head>
<body>
<section>
    <div class="color"></div>
    <div class="color"></div>
    <div class="color"></div>
    <table border="2px" align="center" cellspacing="0" class="forget">
        <tr class="first">
            <td>学号</td>
            <td>姓名</td>
            <td>年龄</td>
            <td>生日</td>
            <td>性别</td>
            <td>
                <a href="add.jsp" style="color: #a8a8a8;">增加学生</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="searchStudent.jsp" style="color: #a8a8a8;">查询学生</a>
            </td>
        </tr>
        <%
            List<Student> list = StudentDao.getList();
            Iterator<Student> iter = list.iterator();

            while (iter.hasNext()) {
                Student student = iter.next();
        %>
        <tr>
            <td width="75px"><%=student.getId()%>
            </td>
            <td width="75px"><%=student.getName()%>
            </td>
            <td width="75px"><%=student.getAge()%>
            </td>
            <td width="75px"><%=student.getBirthday()%>
            </td>
            <td width="75px"><%=student.getSex()%>
            </td>
            <td width="120px">
                <a href="javascript:void(0);" onclick="confirmDelete(<%=student.getId()%>)" style="color: #a8a8a8;">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="updateStudent.jsp?id=<%=student.getId()%>" style="color: #a8a8a8;">修改</a>
            </td>
        </tr>
        <tr></tr>
        <%
            }
        %>
    </table>
</section>
<script>
    // 获取 URL 参数中的状态信息并用 alert 显示
    const params = new URLSearchParams(window.location.search);
    const stateMessage = params.get('state');
    if (stateMessage) {
        alert(stateMessage);
    }
    function confirmDelete(id) {
        var result = confirm("确定要删除吗？");
        if (result) {
            location.href='delete.jsp?id=' + id;
        }
    }
</script>
</body>
</html>
