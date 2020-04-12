<%@ page language="C#" autoeventwireup="true" inherits="App_Language_frmEciLanguageEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>语言包维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        $(function () {

            $("#txtName").focus();

        })
       


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">



            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add"   OnClick="btnAdd_Click" />
                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

            </div>
            <div>
                <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 15%"></th>
                        <th style="width: 35%"></th>
                        <th style="width: 15%"></th>
                        <th style="width: 35%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">系统代码</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboSysCode" DataField="SYS_CODE" Width="95%">
                            </asp:ECombox></td>
                        <td class="lbl">系统模块</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboModule" DataField="MODULE" NotNull="true" Width="95%"></asp:ECombox></td>

                    </tr>
                    <tr>
                        <td class="lbl">编码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" ReadOnly="true" DataField="CODE" Width="95%"></asp:ETextBox></td>
                        <td class="lbl">&nbsp;</td>
                        <td>&nbsp;</td>

                    </tr>
                    <tr>
                        <td class="lbl">名称</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" TextMode="MultiLine" Rows="5" NotNull="true" Width="98%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">备注</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtNote" DataField="NOTE" TextMode="MultiLine" Rows="2" Width="98%"></asp:ETextBox></td>

                    </tr>

                    <tr>
                        <td class="lbl">辅助代码</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtHelp"  TextMode="MultiLine" Rows="2" Width="98%" ReadOnly="true"></asp:ETextBox></td>

                    </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
