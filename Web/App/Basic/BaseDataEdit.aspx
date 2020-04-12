<%@ page language="C#" autoeventwireup="true" inherits="App_BasicData_BaseDataEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>基础数据维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function addAction() {

            if (!eci.hasSave()) { return false; }
        }

        function myclose() {

            eci.close();

            if ($("#hidSave").val() == "true") {
                window.parent.search();
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />
        <input type="hidden" runat="server" id="hidType" />
        <input type="hidden" runat="server" id="hidSave" />
        <input type="hidden" runat="server" id="hidTitle" />

        <div id="root">
            

            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />

                <asp:EButton runat="server" ID="btnSaveAdd" Text="保存并新增" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSaveAdd_Click" Icon="saveadd" />

                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="return addAction();" OnClick="btnAdd_Click" />

                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="myclose();" />


            </div>
            <div>
                <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0" runat="server">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                    </tr>
                    <tr>
                        <td class="lbl">代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" Width="85%" NotNull="true" AutoUpper="true"></asp:ETextBox></td>
                        <td class="lbl">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>

                    <tr>
                        <td class="lbl">名称</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" Width="94%" NotNull="true"></asp:ETextBox></td>
                    </tr>

                    <tr>
                        <td class="lbl">备注</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtMemo" DataField="MEMO" Width="94%" Rows="8" TextMode="MultiLine"></asp:ETextBox></td>


                    </tr>

                    <tr>
                        <td class="lbl">顺序</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSeq" DataField="SEQ" Width="85%" IsNum="true"></asp:ETextBox></td>
                        <td class="lbl">是否启用</td>
                        <td>
                            <asp:EDropDownList runat="server" ID="ddlStatus" DataField="STATUS" Query="A.STATUS|S|=" NotNull="true" Width="87%">
                                <asp:ListItem Value="Y">是</asp:ListItem>
                                <asp:ListItem Value="N">否</asp:ListItem>
                            </asp:EDropDownList></td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
