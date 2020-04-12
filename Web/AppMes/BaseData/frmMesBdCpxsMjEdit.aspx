<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdCpxsMjEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdCpxsMjEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>产品型式子表-模具使用设置维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdCpxsMjEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="产品型式子表-模具使用设置维护"></asp:ETitle>

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
                        <td class="lbl">产品型式</td>
<td><asp:EChoose runat="server" ID ="txtCpxs"  DataField="CPXS" ECIType="CPXS" Width="85%"></asp:EChoose></td>
                        <td class="lbl">编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">使用工序</td>
<td><asp:EChoose runat="server" ID ="txtGx"  DataField="GX" ECIType="GX" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">使用生产线</td>
<td><asp:EChoose runat="server" ID ="txtScx"  DataField="SCX" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">优先使用模具编号</td>
<td><asp:EChoose runat="server" ID ="txtMjbh"  DataField="MJBH" ECIType="MJ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">优先使用模具名</td>
<td><asp:ETextBox runat="server" ID ="txtMjm"  DataField="MJM" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">该模具单次生产本产品型式个数</td>
<td><asp:ETextBox runat="server" ID ="txtGs"  DataField="GS" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">备注</td>
<td><asp:ETextBox runat="server" ID ="txtRemark"  DataField="REMARK" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">&nbsp;</td><td>&nbsp;</td>

               </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
