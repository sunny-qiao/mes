<%@ page language="C#" autoeventwireup="true" inherits="App_Core_List, ECI.Web" enableeventvalidation="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script src="Js/List.js?v=1" type="text/javascript"></script>
</head>
<body class="body" style="overflow-x: hidden;">
    <form id="form1" runat="server">
        <asp:Literal runat="server" ID="ltJs"></asp:Literal>
        <input type="hidden" runat="server" id="hidPageCode" />
        <input type="hidden" runat="server" id="hid1" />
        <input type="hidden" runat="server" id="hid2" />
        <div id="root">
            <asp:UIList runat="server" ID="uiList">
            </asp:UIList>
        </div>

        <asp:EWindow runat="server" Icon="wrench" ID="divBatchEdit" Title="批量修改" Width="500px" Height="400px" EnableBackgroundColor="true" EnableClose="true" EnableToggle="true">
            <div style='padding: 2px 5px 5px 5px;'>
                <div style='background: white; padding: 5px;'>
                    <asp:UIBatchEdit runat="server" ID="batchEdit" />
                </div>
            </div>
        </asp:EWindow>

    </form>
</body>
</html>