<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdWlplEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdWlplEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>物料品类维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function addAction() {

            if (eci.hasSave()) {
                var url = "frmMesBdWlplEdit.aspx";

                window.location.href = url;
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">

            <asp:ETitle runat="server" ID="pagetitle" Title="物料品类维护"></asp:ETitle>

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
                        <td class="lbl">物料品类编号</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtBh" DataField="BH" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">商标</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtSbCode" DataField="SB_CODE" ECIType="SB" Width="85%"></asp:EChoose></td>
                        <td class="lbl">物料品类名</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" NotNull="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">物料品类全名</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtQname" DataField="QNAME" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">物料品类代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">备注</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtRemark" DataField="REMARK" Width="85%"></asp:ETextBox></td>
                    </tr>
                    <tr style="display:none">
                        <td class="lbl">对应产品型式1</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCpxs1" DataField="CPXS1" ECIType="CPXS" Width="85%"></asp:EChoose></td>

                        <td class="lbl">产品型式1优先级别</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboCpxs1Level" DataField="CPXS1_LEVEL" AddEmpty="true" ECIType="CPXSYXJB" Width="85%"></asp:ECombox></td>
                        <td class="lbl">产品型式1备注</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtRemark1" DataField="REMARK1" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">对应产品型式2</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCpxs2" DataField="CPXS2" ECIType="CPXS" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display:none">
                        <td class="lbl">产品型式2优先级别</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboCpxs2Level" DataField="CPXS2_LEVEL" AddEmpty="true" ECIType="CPXSYXJB" Width="85%"></asp:ECombox></td>
                        <td class="lbl">产品型式2备注</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtRemark2" DataField="REMARK2" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">对应产品型式3</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCpxs3" DataField="CPXS3" ECIType="CPXS" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display:none">
                        <td class="lbl">产品型式3优先级别</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboCpxs3Level" DataField="CPXS3_LEVEL" AddEmpty="true" ECIType="CPXSYXJB" Width="85%"></asp:ECombox></td>
                        <td class="lbl">产品型式3备注</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtRemark3" DataField="REMARK3" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">统计类别1</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtTjlb1" DataField="TJLB1" ECIType="WLPL" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display:none">
                        <td class="lbl">统计类别2</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtTjlb2" DataField="TJLB2" ECIType="WLPL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">统计类别3</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtTjlb3" DataField="TJLB3" ECIType="WLPL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">统计类别4</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtTjlb4" DataField="TJLB4" ECIType="WLPL" Width="85%"></asp:EChoose></td>

                    </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
