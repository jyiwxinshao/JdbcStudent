<%@ page import="java.util.List" %>
<%@ page import="com.bean.Student" %><%--
  Created by IntelliJ IDEA.
  User: 蒋万诺
  Date: 2023/12/13
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询学生信息</title>
    <link rel="stylesheet" type="text/css" href="search.css">
</head>
<body>
<section>
    <div class="color"></div>
    <div class="color"></div>
    <div class="color"></div>
    <div class="container">
        <div class="form">
            <form action="${pageContext.request.contextPath}/search" method="post" onsubmit="return f()">
                <div class="inputBox"><input type="text" name="id" id="id" placeholder="请输入学号进行查询"></div>
                <div class="inputBox"><input type="submit" value="查询"></div>
            </form>
            <table>
                <tr>
                    <td>学号</td>
                    <td>姓名</td>
                    <td>年龄</td>
                    <td>生日</td>
                    <td>性别</td>
                </tr>
                <%
                    List list=(List) request.getAttribute("list");
                    if (list!=null){
                        for (int i=0;i<list.size();i++){
                            Student stu=(Student) list.get(i);
                %>
                <tr>
                    <td><%=stu.getId()%></td>
                    <td><%=stu.getName()%></td>
                    <td><%=stu.getAge()%></td>
                    <td><%=stu.getBirthday()%></td>
                    <td><%=stu.getSex()%></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
    </div>
</section>
<script type="text/javascript">
    function f(){
        var id=document.getElementById("id").value;
        if (id==""){
            alert("请输入学号！");
            return false;
        }else {
            return true;
        }
    }
</script>
</body>
</html>
