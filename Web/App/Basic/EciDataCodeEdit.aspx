<%@ page language="C#" autoeventwireup="true" inherits="App_Basic_EciDataCodeEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>基础数据明细维护</title>
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

        $(function () {
            $("#txtKeyValue").focus();
        })

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />
        <input type="hidden" runat="server" id="hidGroupCode" />
        <input type="hidden" runat="server" id="hidSave" />
        <input type="hidden" runat="server" id="hidPrefix" />

        <div id="root">

            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />

                <asp:EButton runat="server" ID="btnSaveAdd" Text="保存并新增" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSaveAdd_Click" Icon="saveadd" />

                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="return addAction();" OnClick="btnAdd_Click" />

                <asp:EButton runat="server" ID="btnCopy" Text="复制" Icon="copy" OnClick="btnCopy_Click" />

                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="myclose();" />


            </div>
            <div>
                <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 20%"></th>
                        <th style="width: 80%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">编码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtKeyValue" DataField="KEY_VALUE" Width="85%" NotNull="true" AutoUpper="true"></asp:ETextBox></td>

                    </tr>

                    <tr>
                        <td class="lbl">名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtKeyName" DataField="KEY_NAME" Width="85%" NotNull="true"></asp:ETextBox></td>

                    </tr>

                    <tr>
                        <td class="lbl">显示顺序</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSeq" DataField="SEQ" Width="85%" IsNum="true"></asp:ETextBox></td>

                    </tr>

                    <tr>
                        <td class="lbl">描述</td>
                        <td colspan="1">
                            <asp:ETextBox runat="server" ID="txtMemo" DataField="MEMO" Width="85%" Rows="4" IgnoreEnterToTab="true" TextMode="MultiLine"></asp:ETextBox></td>


                    </tr>
                    <tr>
                        <td class="lbl">扩展1</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUDF1" DataField="UDF1" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">&nbsp;</td>
                        <td>&nbsp;</td>


                    </tr>
                    <tr>
                        <td class="lbl">扩展2</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUDF2" DataField="UDF2" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">是否启用</td>
                        <td>
                            <asp:EDropDownList runat="server" ID="ddlStatus" DataField="STATUS" Query="A.STATUS|S|=" NotNull="true" Width="85%">
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
