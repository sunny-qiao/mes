<%@ page language="C#" autoeventwireup="true" inherits="App_Core_Edit, ECI.Web" validaterequest="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script src="Js/Edit.js" type="text/javascript"></script>
</head>
<body style="overflow: hidden; overflow-x: hidden;">
    <form id="form1" runat="server">
        <div style="display: none;">
            <input type="text" id="dataTemp" runat="server" />
            <asp:EButton runat="server" ID="btnServerExecute" Text="数据加载"
                OnClick="btnServerExecute_Click" />
        </div>
        <asp:Literal runat="server" ID="ltJs"></asp:Literal>
         <input type="hidden" runat="server" id="hidPageCode" />
        <input type="hidden" runat="server" id="hid1" />
        <input type="hidden" runat="server" id="hid2" />
        <div id="root">
            <input type="hidden" id="hidRequestParameter" runat='server' />
            <asp:UIEdit runat="server" ID="uiEdit" />
        </div>
    </form>
</body>
</html>
