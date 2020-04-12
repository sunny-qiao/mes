<%@ page language="C#" autoeventwireup="true" inherits="App_File_FileTypeEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>业务类型维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function addAction() {

            if (eci.hasSave()) {
                var url = "FileTypeEdit.aspx";

                window.location.href = url;
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />

        <div style="display: none;">
            <asp:ETextBox runat="server" ID="txtConfig" TextMode="MultiLine" ReadOnly="true" Rows="4" DataField="CONFIG" Width="95%"></asp:ETextBox>
        </div>

        <div id="root">


            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

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
                        <td class="lbl">编码</td>
                        <td>
                            <asp:ETextBox runat="server" AutoUpper="true" ID="txtCode" DataField="CODE" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" NotNull="true" Width="85%"></asp:ETextBox></td>
                    </tr>
                    <tr>
                        <td class="lbl">保存到数据库</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboSaveDB" DataField="SAVE_DB" NotNull="true" Width="85%">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Text="是" Value="Y"></asp:ListItem>
                                <asp:ListItem Text="否" Value="N"></asp:ListItem>
                            </asp:ECombox></td>
                        <td class="lbl">状态</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboStatus" DataField="STATUS" NotNull="true" Width="85%">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Text="启用" Value="Y"></asp:ListItem>
                                <asp:ListItem Text="禁用" Value="N"></asp:ListItem>
                            </asp:ECombox></td>
                    </tr>

                    <tr>
                        <td class="lbl">允许文件类型</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtFileType" Width="85%"></asp:ETextBox></td>
                        <td class="notnull" style="text-align: left" colspan="2">
                            <img src="../../icon/tip.png" />
                            如果不填写，不控制文件类型</td>
                    </tr>
                    <tr>
                        <td class="lbl">保存序号</td>
                        <td>
                            <asp:ECheckBox runat="server" ID="chkSaveSeq" />
                            &nbsp;</td>
                        <td class="lbl"></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td class="lbl">最大上传数</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtMaxNum" IsNum="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl"></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
