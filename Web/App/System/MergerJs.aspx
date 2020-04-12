<%@ page language="C#" autoeventwireup="true" inherits="MergerJS, ECI.Web" enablesessionstate="True" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>合并JS文件</title>
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
            <div style="width: 100%; margin-top: 50px; text-align: center;">
                <asp:EButton runat="server" CssClass="btn-green" Text="执行合并" OnClick="btnSave_Click" />
                <asp:EButton runat="server" CssClass="btn-blue" Text="关闭" IsClient="true" OnClientClick="eci.close();" />
            </div>
        </div>
    </form>
</body>
</html>
