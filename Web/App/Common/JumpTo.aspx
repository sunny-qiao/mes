<%@ page language="C#" autoeventwireup="true" inherits="App_Common_JumpTo, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>页面跳转</title>
    <script type="text/javascript">

        function jumpAction() {
            var data = document.getElementById("data").value;
            if (data) {
                document.getElementById("form1").submit();
            }
        }

    </script>
</head>
<body onload="jumpAction()">
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="data" />
        <asp:HiddenField runat="server" ID="url" />
        <asp:HiddenField runat="server" ID="signatureValue" />
        <asp:HiddenField runat="server" ID="digestValue" />




        <div style="text-align: center; margin: 50px; margin-top: 100px;">
            <asp:Label runat="server" ID="lblMessage">页面加载中……</asp:Label>
        </div>
    </form>
</body>
</html>
