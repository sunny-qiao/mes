<%@ page language="C#" autoeventwireup="true" inherits="App_System_frmEciErrorEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>异常编码维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function addAction() {

            if (eci.hasSave()) {
                var url = "frmEciErrorEdit.aspx";

                window.location.href = url;
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">

            <div class="pagetitle" id="pagetitle">异常编码维护</div>

            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

            </div>
            <div class="workarea" layout="toolbar,pagetitle">
                <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 20%"></th>
                        <th style="width: 30%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 30%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">业务域</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtDomain" DataField="DOMAIN" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">帮助编码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtHelpCode" DataField="HELP_CODE" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" NotNull="true" Width="85%" MaxLength="12" AutoUpper="true"></asp:ETextBox></td>
                        <td class="lbl">语言</td>
                        <td>
                            <asp:EDropDownList runat="server" ID="txtLang" DataField="LANG" Width="85%">
                                <asp:ListItem Value="ZH-CN">中文</asp:ListItem>
                                <asp:ListItem Value="EN">英文</asp:ListItem>
                            </asp:EDropDownList></td>

                    </tr>
                    <tr>
                        <td class="lbl">信息</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" NotNull="true" Width="94%" TextMode="MultiLine" Rows="5"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">备注</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtMemo" DataField="MEMO" Width="94%" TextMode="MultiLine" Rows="5"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">创建日期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCreateDate" DataField="CREATE_DATE" ReadOnly="true" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">创建人</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCreateUser" DataField="CREATE_USER" ReadOnly="true" Width="85%"></asp:ETextBox></td>

                    </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
