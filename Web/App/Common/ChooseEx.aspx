<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" enableviewstatemac="false" inherits="App_Common_ChooseEx, ECI.Web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <base target="_self"></base>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        $(function () {
            if ($("#hidConn").length == 1) {
                var conn = $("#hidConn").val();

                if ($("#hidIsComplex").val() == "true") {
                    var chooseCode = $("#hidChooseCode").val()
                    $("#txt" + chooseCode).val(conn);
                }
            }
        });
    </script>
</head>
<body style="overflow: hidden;">
    <form id="form1" runat="server">
        <input type="hidden" runat="server" id="hidTId" />
        <input type="hidden" runat="server" id="hidChooseCode" />
        <input type="hidden" runat="server" id="hidChooseName" />
        <input type="hidden" runat="server" id="hidTitle" />
        <input type="hidden" runat="server" id="hidPageCode" />
        <asp:UIList runat="server" ID="uiList"></asp:UIList>
    </form>
</body>
</html>