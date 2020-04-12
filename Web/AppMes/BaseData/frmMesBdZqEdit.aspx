<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdZqEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdZqEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>账期维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdZqEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="账期维护"></asp:ETitle>

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
                        <td class="lbl">账期名</td>
<td><asp:ETextBox runat="server" ID ="txtZqm"  DataField="ZQM" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">账期结账月份</td>
<td><asp:ETextBox runat="server" ID ="txtJzyf"  DataField="JZYF" IsDate="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">账期起始日期</td>
<td><asp:ETextBox runat="server" ID ="txtQsrq"  DataField="QSRQ" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">账期结账日期</td>
<td><asp:ETextBox runat="server" ID ="txtJzrq"  DataField="JZRQ" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">该账期实际天数</td>
<td><asp:ETextBox runat="server" ID ="txtSjts"  DataField="SJTS" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">是否已经结账</td>
<td><asp:ECombox runat="server" ID ="cboIsJz"  DataField="IS_JZ" AddEmpty="true" ECIType="ISUSE" Width="85%"></asp:ECombox></td>
                        <td class="lbl">结账人</td>
<td><asp:ETextBox runat="server" ID ="txtJzr"  DataField="JZR" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">审核人</td>
<td><asp:ETextBox runat="server" ID ="txtShr"  DataField="SHR" Width="85%"></asp:ETextBox></td>

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
