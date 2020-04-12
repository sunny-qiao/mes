<%@ page language="C#" autoeventwireup="true" inherits="App_LoginHistory_frmEciLoginHistoryEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>登录登出日志</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <link href="../Common/View.css" rel="stylesheet" />

    <script type="text/javascript">

        function addAction() {

            if (eci.hasSave()) {
                var url = "frmEciLoginHistoryEdit.aspx";

                window.location.href = url;
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">

            <asp:ETitle runat="server" ID="pagetitle" Title="登录登出日志"></asp:ETitle>

            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

            </div>
            <div>
                <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">登录账号</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtLoginNo" DataField="LOGIN_NO" Width="85%"></asp:ETextBox></td>
                        <td class="lbl"></td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUserId" DataField="USER_ID" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">真实姓名</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtTrueName" DataField="TRUE_NAME" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">公司代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCompanyCode" DataField="COMPANY_CODE" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">公司名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCompanyName" DataField="COMPANY_NAME" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">操作日期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtOperationDate" DataField="OPERATION_DATE" IsDate="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">动作</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtOperationType" DataField="OPERATION_TYPE" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">是否成功</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSuccess" DataField="SUCCESS_NAME" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">描述</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtMessage" DataField="MESSAGE" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">类型</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtType" DataField="TYPE" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">令牌</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtToken" DataField="TOKEN" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">地址</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUrl" DataField="URL" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">会话ID</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSessionId" DataField="SESSION_ID" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="lbl">&nbsp;</td>
                        <td>&nbsp;</td>

                    </tr>
                    <tr>
                        <td class="lbl">客户端IP地址</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtIp" DataField="IP" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">客户端浏览器</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtBrowser" DataField="BROWSER" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">客户端操作系统</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtOs" DataField="OS" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl lbl-top">异常信息</td>
                        <td colspan="5">
                            <asp:ETextBox runat="server" ID="txtMemo" DataField="MEMO" Width="97%" TextMode="MultiLine" Rows="5"></asp:ETextBox></td>

                    </tr>

                    <tr>
                        <td class="lbl lbl-top">异常详情</td>
                        <td colspan="5">
                            <asp:ETextBox runat="server" ID="txtStackTrace" DataField="STACK_TRACE" Width="97%" TextMode="MultiLine" Rows="5"></asp:ETextBox></td>

                    </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
