<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdMjlxEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdMjlxEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>模具类型维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdMjlxEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="模具类型维护"></asp:ETitle>

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
                        <td class="lbl">模具类型编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具类型名</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具对应工序</td>
<td><asp:EChoose runat="server" ID ="txtDygx"  DataField="DYGX" ECIType="MES_BD_GX" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">模具适用机型</td>
<td><asp:ETextBox runat="server" ID ="txtSyjx"  DataField="SYJX" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具长/mm</td>
<td><asp:ETextBox runat="server" ID ="txtMjLong"  DataField="MJ_LONG" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具宽/mm</td>
<td><asp:ETextBox runat="server" ID ="txtMjWidh"  DataField="MJ_WIDH" Width="85%"></asp:ETextBox></td>

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
