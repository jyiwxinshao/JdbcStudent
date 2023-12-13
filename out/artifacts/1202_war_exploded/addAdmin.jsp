<%--
  Created by IntelliJ IDEA.
  User: 蒋万诺
  Date: 2023/12/13
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加管理员</title>
    <link rel="stylesheet" type="text/css" href="update.css">
</head>
<body>
<section>
    <div class="color"></div>
    <div class="color"></div>
    <div class="color"></div>
    <div class="container">
        <div class="form">
            <form action="#" method="post" onsubmit="return condition()">
                <div class="inputBox">账号：<input type="text" id="account" name="account"></div>
                <div class="inputBox">密码：<input type="text" id="password" name="password"></div>
                <div class="inputBox">
                    <input type="submit" value="提交">
                    <input type="reset" value="重置">
                </div>
            </form>
        </div>
    </div>
</section>
<script>
    function condition() {
        // 获取输入的学生属性
        var account_1 = document.getElementById("id").value;
        var password_2 = document.getElementById("name").value;
        if (account_1 == "") {
            alert("账号不能为空！");
            return false;
        } else if (password_2 == "") {
            alert("密码不能为空！");
            return false;
        } else {
            return true;
        }
    }
</script>
</body>
</html>
