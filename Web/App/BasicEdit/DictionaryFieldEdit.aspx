<%@ page language="C#" autoeventwireup="true" inherits="App_BasicEdit_DictionaryFieldEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>程序元素设置</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function SaveCheck() {
            var name = document.getElementById("txtName").value;
            var mainAlias = document.getElementById("txtMainAlias").value;
            if (name == "") {
                alert("字段名不可以为空");
                return false;
            }

            if (mainAlias == "") {
                alert("显示名不可以为空");
                return false;
            }
            return true;
        }

        function Open(hidFieldKey) {
            var key = hidFieldKey;
            if (key != "") {
                var url = "../../App/Core/Edit.aspx?p=ECI_TABLE_ELEMENT&key=" + key;
                window.location.href = url;
            }
            return false;

            window.setTimeout(temp, 100);
        }

        function temp() {
        }

        function copyAction() {
            $("#hidGuid").val("");
            msg.alert("下面进入新增模式");
        }

    </script>
    <style type="text/css">
        .auto-style1 {
            line-height: 20px;
            font-size: medium;
            font-style: normal;
            font-family: 宋体;
            text-align: right;
            white-space: nowrap;
            padding-right: 4px;
        }

        .tr-title {
            background-color: #C7DDFD;
        }
    </style>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div id="root">
            <!--元素Guid-->
            <input type="hidden" id="hidGuid" runat="server" />
            <!--程序Guid-->
            <input type="hidden" id="hidTableGuid" runat="server" />

            <div class="toolbar" id="toolbar">
                <asp:EButton ID="btnSave" runat="server" Text="保存(A)" AccessKey="a" Icon="save"
                    OnClientClick="return SaveCheck(this);" OnClick="btnSave_Click" />
                <asp:EButton ID="btnSaveAndClose" runat="server" Text="保存并关闭" AccessKey="a" Icon="saveclose"
                    OnClientClick="return SaveCheck(this);" OnClick="btnSave_Click" />
                <asp:EButton ID="btnCopy" runat="server" Text="复制" IsClient="true" OnClientClick="copyAction();" Icon="copy" />

                <asp:EButton ID="btnMyClose" runat="server" IsClient="true" Text="关闭(X)" AccessKey="x" Icon="Close"
                    OnClientClick="$.eci.close();" />

            </div>

            <div class="workarea" layout="toolbar,pagetitle">

                <table width="100%">
                    <tr>
                        <td valign="top" width="100%">
                            <table class="grid" cellspacing="0" cellpadding="0" border="1" width="98%">
                                <tr>
                                    <td class="lbl" style="width: 15%">
                                        <span class="notnull">*</span>元素代码
                                    </td>
                                    <td style="width: 85%">
                                        <asp:ETextBox ID="txtCode" DataField="CODE" runat="server" Width="96%" AutoUpper="true" ImeDisabled="true"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">
                                        <span class="notnull">*</span>显示名称
                                    </td>
                                    <td>
                                        <asp:ETextBox ID="txtMainAlias" DataField="MAIN_ALIAS" runat="server" Width="50%" ToolTip="显示名称"></asp:ETextBox>
                                        <asp:ETextBox ID="txtLangCode" DataField="LANG_CODE" runat="server" Width="45%" ToolTip="语言编码"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">&nbsp;</td>
                                    <td>
                                        <asp:ECheckBox ID="chkEditShow" runat="server" Text="编辑" DataField="EDIT_SHOW" TrueValue="1" FalseValue="0" />
                                        &nbsp;&nbsp;
                                        <asp:ECheckBox ID="chkNullableKey" DataField="NULLABLE_KEY" TrueValue="1" FalseValue="0" runat="server" Text="可空" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">顺序设置</td>
                                    <td>
                                        <asp:ETextBox
                                            ID="txtEditSeq" runat="server" Width="30%" ToolTip="编辑显示顺序" DataField="EDIT_SEQ"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">字典类型
                                    </td>
                                    <td>
                                        <asp:EDropDownList ID="cboDictionaryType" runat="server" Width="96%" DataField="DICTIONARY_TYPE">
                                            <asp:ListItem>INPUT</asp:ListItem>
                                            <asp:ListItem>INPUT_INT</asp:ListItem>
                                            <asp:ListItem>INPUT_NUMBER</asp:ListItem>
                                            <asp:ListItem>MEMO</asp:ListItem>
                                            <asp:ListItem>DATE</asp:ListItem>
                                            <asp:ListItem>CHOOSE</asp:ListItem>
                                            <asp:ListItem>DROPDOWNLIST</asp:ListItem>
                                            <asp:ListItem>RADIONGROUP</asp:ListItem>
                                            <asp:ListItem>CHECK</asp:ListItem>
                                            <asp:ListItem>CHECKGROUP</asp:ListItem>
                                            <asp:ListItem>EMPTY</asp:ListItem>
                                            <asp:ListItem>LABEL</asp:ListItem>
                                        </asp:EDropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">字典配置</td>
                                    <td>
                                        <asp:ETextBox ID="txtDictionaryTypeConfig" ToolTip="下拉框配置 放大镜配置 多行文本框配置"
                                            runat="server" Width="96%" DataField="DICTIONARY_TYPE_CONFIG" AutoUpper="true"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">备注
                                    </td>
                                    <td>
                                        <asp:ETextBox ID="txtMEMO" runat="server" Rows="4" Width="95%" TextMode="MultiLine" DataField="MEMO"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">
                                        <span class="notnull">*</span>数据字段</td>
                                    <td>
                                        <asp:ETextBox
                                            ID="txtDbField" ToolTip="字段名" runat="server" Width="96%" DataField="DB_FIELD" AutoUpper="true" ImeDisabled="true"></asp:ETextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl"><span class="notnull">*</span>物理类型
                                    </td>
                                    <td>
                                        <asp:EDropDownList ID="cboPhysicalType" runat="server" Width="96%" DataField="PHYSICAL_TYPE">
                                            <asp:ListItem>VARCHAR2</asp:ListItem>
                                            <asp:ListItem>CHAR</asp:ListItem>
                                            <asp:ListItem>NUMBER</asp:ListItem>
                                            <asp:ListItem>FLOAT</asp:ListItem>
                                            <asp:ListItem>DATE</asp:ListItem>
                                            <asp:ListItem>CLOB</asp:ListItem>
                                        </asp:EDropDownList>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">字段长度</td>
                                    <td>
                                        <asp:ETextBox ID="txtFIELD_LENGTH" DataField="FIELD_LENGTH" IsNum="true" ToolTip="字段长度"
                                            runat="server" Width="96%"></asp:ETextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">所占列数</td>
                                    <td>
                                        <asp:EDropDownList ID="cboColSpan" runat="server" Width="96%" ToolTip="ColSpan" DataField="COLSPAN">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                        </asp:EDropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">控件宽度
                                    </td>
                                    <td>
                                        <asp:ETextBox ID="txtControlWidth" runat="server" Width="96%" DataField="CONTROL_WIDTH"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">编辑显示格式</td>
                                    <td>
                                        <asp:ETextBox ID="txtDATA_FORMAT_EDIT" runat="server" Width="96%" DataField="DATA_FORMAT_EDIT"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">编辑默认值</td>
                                    <td>
                                        <asp:ETextBox
                                            ID="txtDefaultValue" ToolTip="字段默认值" runat="server" Width="96%" DataField="DEFAULT_VALUE"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="padding-left: 50px;">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="padding-left: 50px;">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="padding-left: 50px;">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="padding-left: 50px;">&nbsp;</td>
                                </tr>

                            </table>
                        </td>

                    </tr>
                </table>

            </div>
        </div>

    </form>
</body>
</html>
