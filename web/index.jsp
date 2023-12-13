<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 蒋万诺
  Date: 2023/12/2
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
<section>
    <div class="color"></div>
    <div class="color"></div>
    <div class="color"></div>
    <div class="box">
        <div class="square" style="--i:0"></div>
        <div class="square" style="--i:0"></div>
        <div class="square" style="--i:0"></div>
        <div class="square" style="--i:0"></div>
        <div class="square" style="--i:0"></div>
        <div class="container">
            <div class="form">
                <h2>Login</h2>
                <form action="checkLogin.jsp" method="post" onsubmit="return condition()">
                    <div class="inputBox">
                        <input type="text" name="account" id="account" placeholder="Account">
                    </div>
                    <div class="inputBox">
                        <input type="password" name="password" id="password" placeholder="Password">
                    </div>
                    <div class="inputBox">
                        <input type="submit" value="Login">
                    </div>
                    <p class="forget">Forget Password?        <a href="#" onclick="adminConfirmation()">Click Here</a></p>
                    <p class="forget">Don't have an account?        <a href="addAdmin.jsp">Click Here</a></p>
                </form>
            </div>
        </div>
    </div>
</section>
<script>
    function condition() {
        // 获取account和password
        var id = document.getElementById("account").value;
        var pwd = document.getElementById("password").value;

        // 判断账号或密码是否为空
        if (account == "") {
            alert("账号不能为空！")
            return false;
        } else if (pwd == "") {
            alert("密码不能为空！")
            return false;
        } else {
            return true;
        }
    }

    // 获取 URL 参数中的状态信息并用 alert 显示
    const params = new URLSearchParams(window.location.search);
    const stateMessage = params.get('state');
    if (stateMessage) {
        alert(stateMessage);
    }

    function adminConfirmation() {
        var adminAccount = prompt("请输入admin账号：");
        if (adminAccount) {
            window.location.href = "updateAdmin.jsp?adminAccount=" + adminAccount;
        } else {
            alert("请输入admin账号！");
        }
    }
</script>
</body>
</html>
