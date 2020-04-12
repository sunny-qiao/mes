<%@ page language="C#" autoeventwireup="true" inherits="App_Password_Password, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>重置密码</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        

    </script>


    <style type="text/css">
        .body {
            background-image: url(../../AppStart/Layout/css/images/bg_1.jpg);
            background-repeat: repeat-x;
            background-position: 40px 0px;
            background-color: #3EB4D2;
            height: 100%;
            width: 100%;
        }
    </style>

    <script type="text/javascript">
        function home() {
            var url = $("#hidLoginUrl").val();
            window.parent.location.href = url;
        }
 
    </script>

</head>
<body class="body">
    <form id="form1" runat="server">
        <input type="hidden" id="hidLoginUrl" runat="server" style="width: 100%;" />
        <div id="root">
            <div>
                <div id="datagrid" style="margin: 50px; margin-top: 10px;">

                    <div style="margin-top: 10px; margin-left: 10px; margin-bottom: 10px; font-size: 14px;">

                        <asp:EButton runat="server" ID="btnGet" Text="重新登录" CssClass="btn-green" Width="200" Height="40" OnClientClick="home()" IsClient="true" />

                    </div>
                    <div class="fitH">
                        <iframe id="container" runat="server" frameborder="no" style="border: 1px; width: 100%; height: 100%;"></iframe>

                    </div>


                </div>
            </div>
        </div>

    </form>
</body>
</html>
