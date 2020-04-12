<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdBzEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdBzEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>班组维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdBzEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="班组维护"></asp:ETitle>

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
                        <td class="lbl">班组编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">班组名</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">班组代码</td>
<td><asp:ETextBox runat="server" ID ="txtCode"  DataField="CODE" NotNull="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">班组工资核算方式</td>
<td><asp:ECombox runat="server" ID ="cboGzhsfs"  DataField="GZHSFS" AddEmpty="true" ECIType="BZGZHSFS" Width="85%"></asp:ECombox></td>
                        <td class="lbl">是否手动考勤</td>
<td><asp:ECombox runat="server" ID ="cboIsSdkq"  DataField="IS_SDKQ" AddEmpty="true" ECIType="ISUSE" Width="85%"></asp:ECombox></td>
                        <td class="lbl">手动考勤是否默认全员出勤</td>
<td><asp:ECombox runat="server" ID ="cboIsQycq"  DataField="IS_QYCQ" AddEmpty="true" ECIType="ISUSE" Width="85%"></asp:ECombox></td>

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
