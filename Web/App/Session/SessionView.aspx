<%@ page language="C#" autoeventwireup="true" inherits="App_Session_SessionView, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>会话查看</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <style type="text/css">
        .grid {
            border-top: 1px solid #EEEEEE;
            border-left: 1px solid #EEEEEE;
        }

            .grid td {
                border-bottom: 1px solid #EEEEEE;
                border-right: 1px solid #EEEEEE;
            }
    </style>

    <script type="text/javascript">

        function detailAction()
        {
            $("#tbSession").toggle();

            $("#btnClose").focus();


            $(window).keyup(function (e) {
                e = e || event;
                if (e.keyCode == 27) {
                    eci.close();
                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 100%; margin-top: 10px; text-align: center;">
            <div style="margin: 5px;">

                <table class="grid" runat="server" id="tbHead" ondblclick="menuShowSession(this)">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                    </tr>
                    <tr>
                        <td class="lbl">登录用户：</td>
                        <td class="txt">
                            <asp:Label ID="lblUserName" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="lbl">登录帐号：</td>
                        <td class="txt">
                            <asp:Label ID="lblLoginNo" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="lbl">登录公司名称：</td>
                        <td class="txt">
                            <asp:Label ID="lblCompanyName" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="lbl">登录公司编码：</td>
                        <td class="txt">
                            <asp:Label ID="lblCompanyCode" runat="server"></asp:Label></td>
                    </tr>
                </table>

                <div style="margin-top: 10px; text-align: center;">
                    <asp:EButton ID="btnDetail" runat="server" CssClass="btn-blue" Text="详情" OnClientClick="detailAction();" Width="120" IsClient="true" />
                    &nbsp;<asp:EButton ID="btnClose" runat="server" CssClass="btn-green" Text="关闭" OnClientClick="eci.close();" Width="120" IsClient="true" />
                    &nbsp;
                </div>

                <table class="grid" cellpadding="0" cellspacing="0" runat="server" id="tbSession" style="display:none;">
                    <tr>

                        <th style="width: 100%"></th>

                    </tr>
                    <tr>
                        <td style="margin: 2px;">
                              
                            <asp:ETextBox runat="server" ID="txtInfo" ReadOnly="true" TextMode="MultiLine" BackColor="White" Rows="13" Width="98%"></asp:ETextBox>
                        </td>
                    </tr>

                </table>

                 

            </div>
        </div>
    </form>
</body>
</html>
