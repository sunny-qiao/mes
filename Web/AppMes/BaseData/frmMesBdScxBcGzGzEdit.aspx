<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdScxBcGzGzEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdScxBcGzGzEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>生产线子表-班次-工种-工资设置维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdScxBcGzGzEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="生产线子表-班次-工种-工资设置维护"></asp:ETitle>

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
                        <td class="lbl">对应生产线</td>
<td><asp:EChoose runat="server" ID ="txtScx"  DataField="SCX" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">对应班次</td>
<td><asp:EChoose runat="server" ID ="txtBcm"  DataField="BCM" ECIType="SCX_BC" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">对应工种</td>
<td><asp:EChoose runat="server" ID ="txtGz"  DataField="GZ" ECIType="GZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">对应计件类型</td>
<td><asp:EChoose runat="server" ID ="txtJjlx"  DataField="JJLX" ECIType="JJLX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">同工种工资等额计算/平均计算</td>
<td><asp:ECombox runat="server" ID ="cboGzjsfs"  DataField="GZJSFS" AddEmpty="true" ECIType="BZGZHSFS" Width="85%"></asp:ECombox></td>

               </tr>
   <tr>
                        <td class="lbl">依生产数据用量参数</td>
<td><asp:EChoose runat="server" ID ="txtYscsjylcs"  DataField="YSCSJYLCS" ECIType="SCSJBCS" Width="85%"></asp:EChoose></td>
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
