<%--
  Created by IntelliJ IDEA.
  User: 蒋万诺
  Date: 2023/12/3
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生</title>
    <link rel="stylesheet" type="text/css" href="update.css">
</head>
<body>
<section>
    <div class="color"></div>
    <div class="color"></div>
    <div class="color"></div>
    <div class="container">
        <div class="form">
            <form action="addCheck.jsp" method="post" onsubmit="return condition()">
                <div class="inputBox">学号：<input type="text" id="id" name="id"></div>
                <div class="inputBox">姓名：<input type="text" id="name" name="name"></div>
                <div class="inputBox">年龄：<input type="text" id="age" name="age"></div>
                <div class="inputBox">生日：<input type="text" id="birthday" name="birthday"></div>
                <div class="inputBox">性别：<input type="text" id="sex" name="sex"></div>
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
        var id_1 = document.getElementById("id").value;
        var name_2 = document.getElementById("name").value;
        var age_3 = document.getElementById("age").value;
        var birthday_4 = document.getElementById("birthday").value;
        var sex_5 = document.getElementById("sex").value;
        if (id_1 == "") {
            alert("学号不能为空！");
            return false;
        } else if (name_2 == "") {
            alert("姓名不能为空！");
            return false;
        } else if (age_3 == "") {
            alert("年龄不能为空！");
            return false;
        } else if (birthday_4 == "") {
            alert("生日不能为空！");
            return false;
        } else if (sex_5 == "") {
            alert("性别不能为空！");
            return false;
        } else {
            return true;
        }
    }
</script>
</body>
</html>
