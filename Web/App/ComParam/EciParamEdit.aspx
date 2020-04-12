<%@ page language="C#" autoeventwireup="true" inherits="App_ComParam_frmEciParamEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统参数维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function addAction() {

            if (eci.hasSave()) {
                var groupId = $("#txtGroupId").val();
                var url = "EciParamEdit.aspx?groupId=" + groupId;

                window.location.href = url;
            }
        }

        function saved() {
            window.parent.saved();
        }

        function pageClose() {
            window.parent.search();
            eci.close();
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">


        <input type="hidden" id="hidKey" runat="server" />

        <div id="root">

            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
                <asp:EButton runat="server" ID="btnCopy" Text="复制" Icon="copy" OnClick="btnCopy_Click" />
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
                    <tr style="display: none;">
                        <td class="lbl">参数分组</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtGroupId" DataField="GROUP_ID" ReadOnly="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">&nbsp;</td>
                        <td>&nbsp;</td>

                    </tr>
                    <tr>
                        <td class="lbl">参数名称</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtParamName" DataField="PARAM_NAME" NotNull="true" Width="94%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">参数编码</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtParamKey" DataField="PARAM_KEY" NotNull="true" Width="94%" AutoUpper="true"></asp:ETextBox>

                        </td>

                    </tr>
                    <tr>
                        <td class="lbl">参数默认值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtParamValue" DataField="PARAM_VALUE" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">参数状态</td>
                        <td>
                            <asp:EDropDownList runat="server" ID="txtStatus" DataField="STATUS" Width="85%" NotNull="true">
                                <asp:ListItem Value="Y">在用</asp:ListItem>
                                <asp:ListItem Value="N">停用</asp:ListItem>
                            </asp:EDropDownList></td>

                    </tr>
                    <tr>
                        <td class="lbl">控件类型</td>
                        <td>
                            <asp:ECombox runat="server" ID="txtUIType" DataField="UI_TYPE" Width="85%" NotNull="true">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="CHECKBOX">复选框</asp:ListItem>
                                <asp:ListItem Value="TEXTBOX" Selected="True">文本框</asp:ListItem>
                                <asp:ListItem Value="MEMO">多行文本框</asp:ListItem>
                                <asp:ListItem Value="COMBOX">下拉框</asp:ListItem>
                                <asp:ListItem Value="COMBOXEX">多选下拉框</asp:ListItem>
                                <asp:ListItem Value="CHOOSE">放大镜</asp:ListItem>
                            </asp:ECombox></td>
                        <td class="lbl">显示顺序</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSeq" DataField="SEQ" IsNum="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">控件基本配置</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtUITypeConfig" DataField="UI_TYPE_CONFIG" Width="94%" Rows="2" TextMode="MultiLine"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">&nbsp;控件扩展配置</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtUIOption" DataField="UI_OPTION" Width="94%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">备注</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtMemo" DataField="MEMO" Width="94%" Rows="2" TextMode="MultiLine"></asp:ETextBox></td>

                    </tr>

                    <tr>
                        <td class="lbl">创建人</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCreateUser" DataField="CREATE_USER" ReadOnly="true" Width="85%" NotSave="true"></asp:ETextBox></td>
                        <td class="lbl">创建日期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCreateDate" DataField="CREATE_DATE" Format="yyyy-MM-dd HH:mm:ss" ReadOnly="true" IsDate="true" Width="85%" NotSave="true"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">修改人</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUpdateUser" DataField="UPDATE_USER" ReadOnly="true" Width="85%" NotSave="true"></asp:ETextBox></td>
                        <td class="lbl">修改日期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUpdateDate" DataField="UPDATE_DATE" ReadOnly="true" Format="yyyy-MM-dd HH:mm:ss" IsDate="true" Width="85%" NotSave="true"></asp:ETextBox></td>

                    </tr>

                    <tr style="display: none;">
                        <td class="lbl">&nbsp;</td>
                        <td>
                            <asp:EButton runat="server" ID="btnTest" Text="获取参数测试" CssClass="btn-blue" OnClick="btnTest_Click" />
                            &nbsp;<asp:EButton runat="server" ID="btnClear" Text="清空缓存" CssClass="btn-green" OnClick="btnClear_Click" />
                        </td>
                        <td class="lbl">&nbsp;</td>
                        <td>&nbsp;</td>

                    </tr>

                    <tr>
                        <td class="lbl">&nbsp;</td>
                        <td>

                            <asp:EButton ID="btnEditParamKey" runat="server" Text="修改参数编码" Icon="edit" OnClick="btnEditParamKey_Click" />
                            <asp:EButton ID="btnEditParamValue" runat="server" Text="修改参数默认值" Icon="edit" OnClick="btnEditParamValue_Click" />



                        </td>
                        <td class="lbl">&nbsp;</td>
                        <td>&nbsp;</td>

                    </tr>

                    </table>

                <p>
                    &nbsp;
                </p>
            </div>
        </div>

    </form>
</body>
</html>
