<%@ page language="C#" autoeventwireup="true" inherits="App_Logout_Logout, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登出系统</title>
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-family: "微软雅黑","宋体";
            font-size: 12px;
        }

        .top_login_mid {
            width: 1200px;
            height: 80px;
            background-repeat: no-repeat;
            margin: 0px auto;
        }

        .login {
            background-image: url(images/bg_1.jpg);
            background-repeat: repeat-x;
            background-position: 40px 0px;
            background-color: #3EB4D2;
            height: 100%;
            width: 100%;
        }

        .dq-home {
            background-image: url(images/diqiu.png);
            background-repeat: no-repeat;
            width: 841px;
            height: 453px;
            margin-top: 90px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>

    <script type="text/javascript">
         
        function logout() {
            debugger;
            var loginUrl = $("#hidLoginUrl").val();

            if (loginUrl.indexOf("http") < 0) {
                loginUrl = "../../" + loginUrl;
            }

            window.location.href = loginUrl;
        }
 
    </script>

</head>
<body class="login" style="overflow:hidden;" onload="logout()">
     
    <form id="form1" runat="server">

        <asp:HiddenField runat="server" ID="hidLoginUrl" />
         
        <div class="login_mid">
            <div class="dq-home">
              
            </div>
        </div>

    </form>
</body>
</html>