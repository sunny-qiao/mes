<%@ page language="C#" autoeventwireup="true" inherits="App_Config_frmEciConfigEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>应用参数维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function addAction() {

            if (eci.hasSave()) {
                var url = "EciConfigEdit.aspx";

                window.location.href = url;
            }
        }

        function saved() {
            window.parent.saved = true;
        }
        function pageClose()
        {
            window.parent.trySearch();
            eci.close();
        }

        $(function () {

            $("#txtCode").focus();

        })


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">



            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="pageClose();" />

            </div>
            <div>
                <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 20%"></th>
                        <th style="width: 30%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 30%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE"  ImeDisabled="true" MaxLength="50" Width="85%" NotNull="true"></asp:ETextBox></td>
                        <td class="lbl">名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" Width="85%" NotNull="true"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">设定值</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtValue" DataField="VALUE" Width="94%" TextMode="MultiLine" Rows="8"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">是否启用</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboStatus" DataField="STATUS" Width="85%">

                                <asp:ListItem Value="Y">是</asp:ListItem>
                                <asp:ListItem Value="N">否</asp:ListItem>
                            </asp:ECombox></td>
                        <td class="lbl">&nbsp;</td>
                        <td>&nbsp;</td>

                    </tr>
                    <tr>
                        <td class="lbl">备注</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtMemo" DataField="MEMO" Width="94%" TextMode="MultiLine" Rows="4"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">创建日期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCreateDate" DataField="CREATE_DATE" Format="yyyy-MM-dd HH:mm:ss" ReadOnly="true" IsDate="true" Width="85%"></asp:ETextBox></td>
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
