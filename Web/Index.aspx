<%@ page language="C#" autoeventwireup="true" inherits="Default_Index, ECI.Web" enablesessionstate="True" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
    <link href="Index/Login/css/Login.css" rel="stylesheet" />
    <script src="Scripts/jQuery/jquery-1.9.1.min.js"></script>
    <script src="Scripts/RSA.js"></script>

    <script type="text/javascript">

        String.prototype.trim = function () {
            return this.replace(/(^\s*)|(\s*$)/g, "");
        }

        var hasEncode = false;

        function login() {
            var account = $("#account").val().trim();
            var password = $("#password").val().trim();
            if (account == "" || account == "请输入用户名") {
                alert("请输入用户名");
                $("#account").focus()
                return;
            }

            if (password == "") {
                alert("请输入密码");
                $("#password").focus()
                return;
            }

            $("#btnLogin").val("登录……");

            if (!hasEncode) {
                var publicKey = $("#hidPublicKey").val();
                var encrypt = new JSEncrypt();
                encrypt.setPublicKey(publicKey);
                var encryptPassword = encrypt.encrypt(password);
  
                $("#password").val(encryptPassword);
            }

            document.getElementById("btnLoginAction").click();

            hasEncode = true;
        }

        $(function () {

            var isDev = ($("#hidIsDev").length == 1) && ($("#hidIsDev").val() == "true");

            if (isDev) {

                if ($("#hidAccount").length > 0) {
                    $("#account").val($("#hidAccount").val());
                    $("#password").val($("#hidPassword").val());
                }

                $("#account,#password").dblclick(function () {
                    login();
                });
            }

            $("#account").keyup(function (data) {
                if (data.keyCode == 13) {
                    var account = $("#account").val().trim();
                    if (account != "") {
                        $("#password").focus();
                    }
                }
            });

            $("#password").keyup(function (data) {
                if (data.keyCode == 13) {
                    var password = $("#password").val().trim();
                    if (password != "") {
                        $("#btnLogin").click();
                    }
                }
            });

            $("#account").focus();
        });

    </script>


</head>
<body class="login">
    <form id="form1" runat="server">
        <input type="hidden" name="version" value="002" />

        <div style="display: none;">
            <asp:EButton runat="server" ID="btnLoginAction" Text="登录" OnClick="btnLogin_Click" IsClient="true" UseSubmitBehavior="false" />
        </div>

        <div class="top_login">
            <div class="top_login_mid">

                <div class="logo">

                    <img runat="server" id="logo" src="samples/logo/Logo.png" class="logoimg" />

                    <div id="lblAppName" class="logotxt" runat="server">

                        <asp:Literal runat="server" ID="ltAppName" Text="华东信息统一开发平台"></asp:Literal>

                    </div>

                </div>

                <img src="index/login/images/logo_login.png" style="border: none; display: none;" width="324" height="80" />
            </div>
        </div>
        <div class="login_mid">
            <div class="dq">
                <div class="login_k">
                    <div class="login_k_1">
                        <asp:Label runat="server" ID="lblUserLogin">请登录</asp:Label>
                    </div>
                    <div class="login_k_2">
                        <input runat="server" type="text" id="account" class="input1" onfocus="if(value==&#39;请输入用户名&#39;) {value=&#39;&#39;}" onblur="if (value==&#39;&#39;) {value=&#39;请输入用户名&#39;}" />
                    </div>
                    <div class="login_k_2">
                        <input runat="server" type="password" id="password" autocomplete="off" class="input1" />
 
                    </div>
                    <div class="lblError">
                        <span id="lblError"></span>
                    </div>
                    <div class="login_k_2s">
                        <div class="login_k_2a">
                            <input name="keepLogin" type="checkbox" id="keepLogin" class="input2" runat="server" /><label for="keepLogin"><asp:Label runat="server" ID="lblRemember">记住我</asp:Label></label>
                        </div>

                        <div class="login_k_2b" style="display: none;"><a href="RegeisterS1.aspx" class="sig">免费注册</a><a href="#" class="fpw">忘记密码</a></div>
                    </div>
                    <div class="login_k_2s">

                        <input runat="server" type="button" id="btnLogin" value="登录" onclick="login();" class="login_btn" />

                    </div>
                </div>
            </div>
        </div>




    </form>
</body>
</html>
