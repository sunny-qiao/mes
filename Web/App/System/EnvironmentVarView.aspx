<%@ page language="C#" autoeventwireup="true" enablesessionstate="ReadOnly" inherits="App_System_EnvironmentVarView, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>环境变量查看</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:EPanel runat="server" Title="框架环境变量" Icon="chart_organisation">

                <table class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 20%"></th>
                        <th style="width: 80%"></th>
                    </tr>
                    <tr>
                        <td class="lbl">登录用户：</td>
                        <td class="txt">

                            <asp:ETextBox  runat="server" ID="txtLoginNo"  ReadOnly="true" Width="80%"></asp:ETextBox>

                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">真实姓名：</td>
                        <td class="txt">
                            <asp:ETextBox ID="txtUserName" runat="server" ReadOnly="true" Width="80%"></asp:ETextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">用户ID：</td>
                        <td class="txt">
                            <asp:ETextBox ID="txtUserId" runat="server" ReadOnly="true" Width="80%"></asp:ETextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">登录公司代码：</td>
                        <td class="txt">
                            <asp:ETextBox ID="txtCompanyCode" runat="server" ReadOnly="true" Width="80%"></asp:ETextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">登录公司名称：</td>
                        <td class="txt">
                            <asp:ETextBox ID="txtCompanyName" runat="server" ReadOnly="true" Width="80%"></asp:ETextBox>
                        </td>
                    </tr>

                     <tr>
                        <td class="lbl">会话ID：</td>
                        <td class="txt">
                            <asp:ETextBox ID="txtSessionID" runat="server" ReadOnly="true" Width="80%"></asp:ETextBox>
                        </td>
                    </tr>

                </table>


            </asp:EPanel>

            <br />

            <asp:EPanel runat="server" Title="业务系统环境变量" Icon="chart_organisation">

                <asp:Table  runat="server" id="tbVar" CssClass="grid">
                    <asp:TableRow>
                        <asp:TableHeaderCell Width="20%"></asp:TableHeaderCell>
                        <asp:TableHeaderCell Width="80%"></asp:TableHeaderCell>
                    </asp:TableRow>

                </asp:Table>
               


            </asp:EPanel>
        </div>
    </form>
</body>
</html>
