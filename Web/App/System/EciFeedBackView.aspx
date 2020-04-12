<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="App_System_EciFeedBackView, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户反馈查看</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function backAction() {
            var url = "EciFeedBackListMe.aspx";
            window.location.href = url;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div>
            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" IsClient="true" ID="btnBackList" Text="返回列表" Icon="back" OnClientClick="backAction();" />

                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

            </div>
            <div>


                <div style="width: 1000px; margin-left: auto; margin-right: auto; border: 1px dotted #ccc; padding: 0px;">

                    <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                        <tr>
                            <th style="width: 20%"></th>
                            <th style="width: 30%"></th>
                            <th style="width: 20%"></th>
                            <th style="width: 30%"></th>

                        </tr>
                        <tr>
                            <td class="lbl">系统代码</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtSysCode" DataField="SYS_CODE" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">系统名称</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtSysName" DataField="SYS_NAME" Width="85%"></asp:ETextBox></td>

                        </tr>
                        <tr>
                            <td class="lbl">联系人</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtLinkerMan" DataField="LINKER_MAN" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">电话</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtMobile" DataField="MOBILE" Width="85%"></asp:ETextBox></td>

                        </tr>
                        <tr>
                            <td class="lbl">邮箱</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtEmail" DataField="EMAIL" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">反馈状态</td>
                            <td>
                                <asp:ECombox runat="server" ID="cboStatus" DataField="STATUS" Width="85%">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem Value="TB">提报</asp:ListItem>
                                    <asp:ListItem Value="SL">已受理</asp:ListItem>
                                </asp:ECombox></td>

                        </tr>
                        <tr>
                            <td class="lbl">反馈人</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtCreateUser" DataField="CREATE_USER" ReadOnly="true" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">反馈日期</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtCreateDate" DataField="CREATE_DATE" Format="yyyy-MM-dd HH:mm:ss" ReadOnly="true" IsDate="true" Width="85%"></asp:ETextBox></td>

                        </tr>

                    </table>


                </div>

                <div style="min-height: 50px; width: 1000px; margin-left: auto; margin-right: auto; font-size: 16px; border: 1px dotted #ccc; padding: 0px;">

                    <div style="margin: 10px;">
                        <span style="color: brown">反馈内容:</span>
                        <br />
                        <asp:Literal ID="lblBody" runat="server"></asp:Literal>
                    </div>


                </div>

                <div style="min-height: 50px; width: 1000px; margin-left: auto; margin-right: auto; font-size: 16px; border: 1px dotted #ccc; padding: 0px;">
                    <div style="margin: 10px;">

                        <span style="color: brown">回复内容:</span>
                        <br />
                        <asp:Literal ID="lblAcceptMemo" runat="server"></asp:Literal>
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
