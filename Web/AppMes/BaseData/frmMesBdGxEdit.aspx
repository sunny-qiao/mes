<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdGxEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdGxEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>工序维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function addAction() {

            if (eci.hasSave()) {
                var url = "frmMesBdGxEdit.aspx";

                window.location.href = url;
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">

            <asp:ETitle runat="server" ID="pagetitle" Title="工序维护"></asp:ETitle>

            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

            </div>
            <div>
                <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">工序编号</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtBh" DataField="BH" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">工序名</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">默认出库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCkck" DataField="CKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr>
                        <td class="lbl">默认入库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtRkck" DataField="RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认出库产品前置名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCkcpqzm" DataField="CKCPQZM" ECIType="WLQZPL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认入库产品前置名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtRkcpqzm" DataField="RKCPQZM" ECIType="WLQZPL" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr>
                        <td class="lbl">表面处理用原料</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtBmclyl" DataField="BMCLYL" ECIType="WL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">
                            <asp:ELabel ID="Label1" runat="server" Text="该表面处理原料密度kg/cm^3" ToolTip="该表面处理原料密度kg/cm^3"></asp:ELabel></td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtMd" DataField="MD" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl"><asp:ELabel ID="ELabel1" runat="server" Text="理论表面处理原料损耗百分比" ToolTip="理论表面处理原料损耗百分比"></asp:ELabel></td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtYlsh" DataField="YLSH" IsFloat="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">备注</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtRemark" DataField="REMARK" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="lbl">&nbsp;</td>
                        <td>&nbsp;</td>

                    </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
