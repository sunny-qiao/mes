<%@ page language="C#" autoeventwireup="true" inherits="App_Common_Change_Change, ECI.Web" enablesessionstate="True" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>切换登录公司</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <script type="text/javascript">

        function ok() {
            eci.close();
            parent.msg.tip("登录公司切换成功");
        }

    </script>
</head>
<body onload='eci.focus("txtPassword");'>
    <form id="form1" runat="server">
        <div style="width: 100%; margin-top: 20px; text-align: center;">

            <div style="margin: 10px;">
                <table class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 20%"></th>
                        <th style="width: 80%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">登录公司代码</td>
                        <td class="txt">
                            <asp:ETextBox runat="server" ID="txtCompanyCode" Width="85%" NotNull="true" />
                        </td>

                    </tr>

                    <tr>
                        <td class="lbl">登录公司名称</td>
                        <td class="txt">
                            <asp:ETextBox runat="server" ID="txtCompanyName" Width="85%" />
                        </td>

                    </tr>

                    <tr>
                        <td class="center" colspan="2" style="height: 50px;">
                            <asp:EButton runat="server" CssClass="btn-green" Text="确定" NeedCheck="true" OnClick="btnSave_Click" />
                            &nbsp;<asp:EButton runat="server" CssClass="btn-blue" Text="关闭" IsClient="true" OnClientClick="eci.close();" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>