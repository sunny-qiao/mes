<%@ page language="C#" autoeventwireup="true" inherits="Default_LoginByToken, ECI.Web" enablesessionstate="True" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户单点登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
    <link href="Index/Login/css/Login.css" rel="stylesheet" />
    <script src="Scripts/jQuery/jquery-1.9.1.min.js"></script>


    <style type="text/css">
        .lblError {
            font-family: 微软雅黑;
            font-weight: bold;
            font-size: larger;
            color: Red;
        }

        body {
            TEXT-ALIGN: center;
        }

        #center {
            MARGIN-RIGHT: auto;
            MARGIN-LEFT: auto;
        }

        .login {
            background-image: url(../../AppStart/Layout/css/images/bg_1.jpg);
            background-repeat: repeat-x;
            background-position: 40px 0px;
            background-color: #3EB4D2;
            height: 100%;
            width: 100%;
        }

        .father {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }

        .son {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            width: 50%;
            height: 50%;
            margin: auto;
        }
    </style>

    <script type="text/javascript">
 
    </script>


</head>
<body class="login">
    <form id="form1" runat="server">


        <div class="father">
            <div class="son">
                <div id="center" class="centered" style="border: 0px solid blue; width: 100%; margin-top: auto; margin-bottom: auto; margin-left: auto; margin-right: auto;">

                    <table id="TbAll" style="margin-left: auto; margin-right: auto; display: inline-block; width: 600px; text-align: center; background-image: url('index/token/images/Error.png'); height: 240px; padding: 0px; margin: 0px; background-repeat: no-repeat; border: 0px solid red;">
                        <tr>
                            <td style="width: 20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td style="text-align: center">
                                <table style="border: 0px solid blue;">
                                    <tr>
                                        <td style="height: 280px; width: 520px; vertical-align: top;">
                                            <div id="divMessage" style="overflow: hidden; border: 0px solid blue; margin-right: 20px; margin-top: 85px;">
                                                <asp:Label ID="lblMessage" runat="server" Font-Size="Large"></asp:Label>

                                                <div style="margin-top: 15px;">
                                                </div>

                                            </div>
                                        </td>
                                    </tr>

                                </table>
                            </td>
                        </tr>

                    </table>







                </div>
            </div>
        </div>



    </form>
</body>
</html>
