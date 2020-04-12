<%@ page language="C#" autoeventwireup="true" inherits="App_System_RSA, ECI.Web" enablesessionstate="True" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>合并JS文件</title>
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

</head>
<body>
    <form id="form1" runat="server">

        <div style="margin-top: 10px;">
            <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                <tr>
                    <th style="width: 20%"></th>
                    <th style="width: 80%"></th>
                </tr>
                <tr>
                    <td class="lbl">加密内容</td>
                    <td>
                        <asp:ETextBox runat="server" ID="txtInput" TextMode="MultiLine" Rows="5" NotNull="true" Width="85%"></asp:ETextBox></td>


                </tr>
                <tr>
                    <td class="lbl">加密结果</td>
                    <td>
                        <asp:ETextBox runat="server" ID="txtResult" ReadOnly="true" TextMode="MultiLine" Rows="5" Width="85%"></asp:ETextBox></td>


                </tr>

                <tr>
                    <td colspan="2"  class="center" style="padding-top:20px;">

                        <asp:EButton runat="server" CssClass="btn-green" Text="数据库连接字符串加密" NeedCheck="true" Width="180" ID="btnExecute" OnClick="btnExecute_Click" />
                        <asp:EButton runat="server" CssClass="btn-blue" Text="关闭" IsClient="true" Width="80" OnClientClick="eci.close();" />
                    </td>
                </tr>
            </table>

        </div>

    </form>
</body>
</html>
