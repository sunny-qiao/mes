<%@ page language="C#" autoeventwireup="true" inherits="App_System_LogCatchView, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>操作执行跟踪</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <style type="text/css">
        .container {
            background: #EEEEEE;
        }

        .step {
            background: #EEEEEE;
            padding: 4px;
        }

        .step-head {
            font-weight: bold;
        }

        .step-message {
            background: pink;
            padding: 8px;
            margin-left: 10px;
            margin-right: 10px;
        }

        .soa {
            background: lightblue;
            padding: 4px;
            margin-left: 10px;
        }

        .sql {
            background: #EEEEEE;
            padding: 8px;
            margin-left: 20px;
        }

        .sql-error {
            background: pink;
        }

        .login {
            background-image: url(../../AppStart/Layout/css/images/bg_1.jpg);
            background-repeat: repeat-x;
            background-position: 40px 0px;
            background-color: #3EB4D2;
            height: 100%;
            width: 100%;
        }

    </style>


    <script type="text/javascript">
        
        $(function () {
 
            $(window).keyup(function (e) {
                e = e || event;
                if (e.keyCode == 27) {
                    eci.close();
                }
            });
 


        })

 
    </script>
</head>
<body class="login">
    <form id="form1" runat="server">

        <div>
            <div style="padding: 10px;">

                <div style="text-align: center; margin: 10px;">
                    <asp:EButton runat="server" CssClass="btn-blue" Text="关闭" IsClient="true" OnClientClick="eci.close();" />
                </div>

                <div class="container" style="font-size: 14px; line-height: 25px; border: 1px solid #808080; padding: 0px;">
                    <asp:Literal runat="server" ID="lblContent"></asp:Literal>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
