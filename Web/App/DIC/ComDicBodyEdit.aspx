<%@ page language="C#" autoeventwireup="true" inherits="App_DIC_ComDicBodyEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>数据项维护</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function saved() {
            window.parent.changed = true;
        }

        function pageClose() {
            window.parent.trySearch();
            eci.close();
        }
    </script>

</head>
<body class="body">
    <form id="form1" runat="server">
        <div id="root">

            <input type="hidden" id="hidBodyId" runat="server" />
            <input type="hidden" id="hidHeadId" runat="server" />



            <div class="toolbar" id="toolbar">
                <asp:EButton ID="btnSave" runat="server" Text="保存(A)" AccessKey="a" Icon="save"
                    NeedCheck="true" OnClick="btnSave_Click" />
                <asp:EButton ID="btnSaveAndClose" runat="server" Text="保存并关闭" AccessKey="a" Icon="saveclose"
                    OnClientClick="return SaveCheck(this);" OnClick="btnSave_Click" NeedCheck="true" />

                <asp:EButton ID="btnMyClose" runat="server" IsClient="true" Text="关闭(X)" AccessKey="x" Icon="Close"
                    OnClientClick="pageClose();" />

            </div>

            <div>


                <table class="grid" cellspacing="0" cellpadding="0" border="1" width="98%">
                    <tr>
                        <td class="lbl" style="width: 15%">代码
                        </td>
                        <td style="width: 85%">
                            <asp:ETextBox ID="txtCode" DataField="CODE" Alias="代码" runat="server" Width="85%" ReadOnly="true"></asp:ETextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">中文描述
                        </td>
                        <td>
                            <asp:ETextBox ID="txtName" DataField="NAME" Alias="中文描述" runat="server" ReadOnly="true" Width="85%"></asp:ETextBox>
                        </td>
                    </tr>

                    <tr runat="server" id="trNotNull">
                        <td class="lbl">是否必填</td>
                        <td>
                            <asp:ECheckBox ID="chkNotNull" runat="server" DataField="NOTNULL" TrueValue="Y" FalseValue="N" />
                        </td>
                    </tr>

                    <tr style="display: none;">
                        <td class="lbl">显示</td>
                        <td>
                            <asp:ECheckBox ID="chkIsShow" runat="server" DataField="IS_SHOW" TrueValue="Y" FalseValue="N" Visible="false" />
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td class="lbl">顺序</td>
                        <td>
                            <asp:ETextBox ID="txtSeq" runat="server" Width="85%" IsFloat="true" DataField="SEQ"></asp:ETextBox>
                        </td>
                    </tr>

                    <tr style="display: none;">
                        <td class="lbl" style="width: 15%">宽度</td>
                        <td style="width: 85%">
                            <asp:ETextBox ID="txtWidth" runat="server" Width="85%" IsFloat="true" DataField="WIDTH"></asp:ETextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl" style="width: 15%">默认值</td>
                        <td style="width: 85%">
                            <asp:ETextBox ID="txtDefaultValue" runat="server" Width="85%" IsFloat="true" DataField="DEFAULT_VALUE"></asp:ETextBox>

                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
