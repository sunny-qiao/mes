<%@ page language="C#" autoeventwireup="true" inherits="App_Favorite_FavoriteManage, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>收藏夹管理</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-top:20px;">

            <table class="grid" cellpadding="0" cellspacing="0">
                <tr>
                    <th style="width: 20%"></th>
                    <th style="width: 80%"></th>
                </tr>
                <tr>
                    <td class="lbl">功能ID</td>
                    <td class="txt">
                        <asp:ETextBox runat="server" ID="txtId" Width="85%" ReadOnly="true"></asp:ETextBox>
                    </td>
                </tr>
                <tr>
                    <td class="lbl">功能名称</td>
                    <td class="txt">
                        <asp:ETextBox runat="server" ID="txtName" Width="85%" ReadOnly="true"></asp:ETextBox></td>
                </tr>
                <tr>
                    <td class="lbl">功能地址</td>
                    <td class="txt">
                        <asp:ETextBox runat="server" ID="txtUrl" Width="85%" ReadOnly="true"></asp:ETextBox></td>
                </tr>
                <tr>
                    <td class="center" colspan="2" style="padding-top:20px">
                        <asp:EButton runat="server" CssClass="btn-green" Text="确定"  Width="120px"/>
                        <asp:EButton runat="server" CssClass="btn-blue" Text="关闭" Width="100" IsClient="true" OnClientClick="eci.close();" />
 
                    </td>

                </tr>
            </table>

        </div>
    </form>
</body>
</html>
