<%@ page language="C#" autoeventwireup="true" inherits="App_Common_ChangeUser, ECI.Web" enablesessionstate="True" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
    
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <table class="grid" cellpadding="0" cellspacing="0">
            <tr>
          <th style="width: 10%"></th>
                <th style="width:90%"></th>

            </tr>
            <tr>
                <td class="lbl">登录帐号</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtFromUser" DataField="FROM_USER" NotNull="true" Width="85%"> </asp:ETextBox>
                </td>

            </tr>

            <tr>
                <td class="lbl">目标帐号</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtToUser" DataField="TO_USER" NotNull="true" Width="85%" Autocomplete="false"></asp:ETextBox>
                </td>

            </tr>

            <tr>
                <td class="lbl">密码</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtPassword" TextMode="Password" DataField="PASSWORD" NotNull="true" Width="85%"></asp:ETextBox>
                </td>

            </tr>

            <tr>
                <td class="lbl">&nbsp;</td>
                <td>
                    <asp:EButton runat="server" ID="btnSave" Text="设置" CssClass="btn-green"
                        NeedCheck="true" OnClick="btnSave_Click" />

                    &nbsp;<asp:EButton runat="server" ID="btnClear" Text="清除" CssClass="btn-green"
                        OnClick="btnClear_Click" />

                    &nbsp;<asp:EButton runat="server" ID="btnClose" Text="关闭"
                        IsClient="true" OnClientClick="parent.eci.close();" CssClass="btn-blue" />
                </td>

            </tr>

        </table>

    </form>
</body>
</html>
