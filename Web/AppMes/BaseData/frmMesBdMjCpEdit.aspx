<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdMjCpEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdMjCpEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>模具子表-产品信息维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdMjCpEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="模具子表-产品信息维护"></asp:ETitle>

            <div id="toolbar" class="toolbar">
              <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
              <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
              <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

            </div>
            <div>
                <table  id="tbEdit" class="grid" cellpadding="0" cellspacing="0" >
                    <tr>
                        <th style="width: 10%"></th>
<th style="width: 20%"></th>
<th style="width: 10%"></th>
<th style="width: 20%"></th>
<th style="width: 10%"></th>
<th style="width: 20%"></th>

                    </tr>
                        <tr>
                        <td class="lbl">编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具名</td>
<td><asp:EChoose runat="server" ID ="txtMjm"  DataField="MJM" ECIType="MJ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品型式</td>
<td><asp:EChoose runat="server" ID ="txtCpxs"  DataField="CPXS" ECIType="CPXS" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">默认商标</td>
<td><asp:EChoose runat="server" ID ="txtSb"  DataField="SB" ECIType="SB" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品单重/kg</td>
<td><asp:ETextBox runat="server" ID ="txtCpdz"  DataField="CPDZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品个数</td>
<td><asp:ETextBox runat="server" ID ="txtCpgs"  DataField="CPGS" IsNum="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">产品总重/kg</td>
<td><asp:ETextBox runat="server" ID ="txtCpzs"  DataField="CPZS" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">是否计入模具生产成品率</td>
<td><asp:ECombox runat="server" ID ="cboIsSccpl"  DataField="IS_SCCPL" AddEmpty="true" ECIType="ISUSE" Width="85%"></asp:ECombox></td>
                        <td class="lbl">是否计入工资核算成品率</td>
<td><asp:ECombox runat="server" ID ="cboIsGzhscpl"  DataField="IS_GZHSCPL" AddEmpty="true" ECIType="ISUSE" Width="85%"></asp:ECombox></td>

               </tr>
   <tr>
                        <td class="lbl">备注</td>
<td><asp:ETextBox runat="server" ID ="txtRemark"  DataField="REMARK" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">&nbsp;</td><td>&nbsp;</td>
                        <td class="lbl">&nbsp;</td><td>&nbsp;</td>

               </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
