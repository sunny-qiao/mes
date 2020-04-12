<%@ page language="C#" autoeventwireup="true" inherits="App_EciBd_frmEciBdCountryEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>国家信息</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function addAction() {

            if (eci.hasSave()) {
                var url = "EciBdCountryEdit.aspx";

                window.location.href = url;
            }
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
                        <td class="lbl">国家代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">国家名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" NotNull="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">英文名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtNameEn" DataField="NAME_EN" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">海关编码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCustomsCode" DataField="CUSTOMS_CODE" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">备注</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtMemo" DataField="MEMO" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">是否启用</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboStatus" DataField="STATUS" AddEmpty="true" NotNull="true" Width="85%">
                                <asp:ListItem Value="Y">是</asp:ListItem>
                                <asp:ListItem Value="N">否</asp:ListItem>
                            </asp:ECombox></td>

                    </tr>
                    <tr>
                        <td class="lbl">创建日期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCreateDate" DataField="CREATE_DATE" Format="yyyy-MM-dd HH:mm:ss" ReadOnly="true" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">创建人</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCreateUser" DataField="CREATE_USER" ReadOnly="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">修改日期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUpdateDate" DataField="UPDATE_DATE" Format="yyyy-MM-dd HH:mm:ss" ReadOnly="true" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">修改人</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUpdateUser" DataField="UPDATE_USER" ReadOnly="true" Width="85%"></asp:ETextBox></td>

                    </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
