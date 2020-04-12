<%@ page language="C#" autoeventwireup="true" inherits="App_Basic_EciTableFunctionEdit, ECI.Web" enableviewstatemac="false" %>

<%@ Register Src="uc/ascxFunctionList.ascx" TagName="ascxFunctionList" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>功能扩展</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function add() {
            var TABLE_GUID = $("#hidTABLE_GUID").val();
            window.location.href = "EciTableFunctionEdit.aspx?TABLE_GUID=" + TABLE_GUID;
        }

        function deleteAction() {
            if (eci.hasSave()) {
                msg.confirm("确定执行删除操作吗?", function () {
                    __doPostBack("btnDelete");
                });
            }

            return false;
        }
    </script>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div id="toolbar" class="toolbar">
            <input type="hidden" id="hidKey" runat="server" />
            <input type="hidden" id="hidTABLE_GUID" runat="server" />

            <asp:EButton runat="server" ID="btnSave" Text="保存"
                NeedCheck="true" OnClick="btnSave_Click" Icon="save" />

            <asp:EButton runat="server" ID="btnAdd" Text="新增"
                OnClientClick="add()" Icon="Add" IsClient="true" />

            <asp:EButton runat="server" ID="btnClose" Text="关闭"
                OnClientClick="eci.close()" Icon="Cancel" />
        </div>

        <table class="grid" cellpadding="0" cellspacing="0" id="tbEdit">
            <tr>
                <th style="width: 10%"></th>
                <th style="width: 20%"></th>
                <th style="width: 10%"></th>
                <th style="width: 20%"></th>
                <th style="width: 10%"></th>
                <th style="width: 20%"></th>

            </tr>
            <tr>
                <td class="lbl">扩展类型</td>
                <td>
                    <asp:EDropDownList runat="server" ID="ddlEXTEND_TYPE" DataField="EXTEND_TYPE" Width="89%" NotNull="true">
                        <asp:ListItem Value="INPUT">前台功能</asp:ListItem>
                        <asp:ListItem Value="BUTTON">后台功能</asp:ListItem>
                        <asp:ListItem Value="STDBUTTON">标准功能</asp:ListItem>
                    </asp:EDropDownList></td>
                <td class="lbl">功能名称</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtFUNCTION_NAME" DataField="FUNCTION_NAME" Width="85%" NotNull="true"></asp:ETextBox></td>
                <td class="lbl">控件ID</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtCONTROL_ID" DataField="CONTROL_ID" Width="85%" NotNull="true"></asp:ETextBox></td>

            </tr>
            <tr>
                <td class="lbl">&nbsp;</td>
                <td>

                    <asp:ECheckBox runat="server" ID="chkList" Text="查询页显示"></asp:ECheckBox>

                    &nbsp;

                            <asp:ECheckBox runat="server" ID="chkEdit" Text="编辑页显示"></asp:ECheckBox>
                </td>
                <td class="lbl">显示位置</td>
                <td>
                    <asp:EDropDownList runat="server" ID="ddlSHOW_POSITION" DataField="SHOW_POSITION" Width="89%">
                        <asp:ListItem Value=""></asp:ListItem>
                        <asp:ListItem Value="BEFORE">标准按钮之前</asp:ListItem>

                    </asp:EDropDownList></td>
                <td class="lbl">显示顺序</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtSEQ" DataField="SEQ" Width="85%"></asp:ETextBox></td>

            </tr>
            <tr>
                <td class="lbl">脚本</td>
                <td colspan="5">
                    <asp:ETextBox runat="server" ID="txtJS_SCRIPT" DataField="JS_SCRIPT" Width="96%"></asp:ETextBox>

                </td>

            </tr>
            <tr>
                <td class="lbl">调用存储过程</td>
                <td colspan="5">
                    <asp:ETextBox runat="server" ID="txtPROC_NAME" DataField="PROC_NAME" Width="96%"></asp:ETextBox></td>

            </tr>
            <tr>
                <td class="lbl">图标</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtICON" DataField="ICON" Width="85%"></asp:ETextBox></td>
                <td class="lbl">样式</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtCSS" DataField="CSS" Width="85%"></asp:ETextBox></td>
                <td class="lbl">权限号</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtAUTHORITY_ID" DataField="AUTHORITY_ID" Width="85%"></asp:ETextBox></td>

            </tr>
            <tr>
                <td class="lbl">热键</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtHOT_KEY" DataField="HOT_KEY" Width="85%" MaxLength="1"></asp:ETextBox></td>
                <td class="lbl">后台服务数据</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtWCF_SERVICE_DATA" AutoUpper="true" DataField="WCF_SERVICE_DATA" Width="85%"></asp:ETextBox></td>
                <td class="lbl">
                    <label for="chkSTATUS">启用</label>
                </td>
                <td>

                    <asp:ECheckBox runat="server" ID="chkSTATUS" DataField="STATUS" TrueValue="Y" FalseValue="N" Checked="true"></asp:ECheckBox></td>

            </tr>
            <tr>
                <td class="lbl">备注</td>
                <td colspan="5">
                    <asp:ETextBox runat="server" ID="txtMEMO" DataField="MEMO" Width="97%" TextMode="MultiLine" Rows="4"></asp:ETextBox></td>

            </tr>

        </table>
        <uc1:ascxFunctionList ID="List" runat="server" />
    </form>
</body>
</html>
