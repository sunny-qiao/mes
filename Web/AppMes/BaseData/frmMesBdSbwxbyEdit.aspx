<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdSbwxbyEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdSbwxbyEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>设备维修保养设置维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdSbwxbyEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="设备维修保养设置维护"></asp:ETitle>

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
                        <td class="lbl">对应设备名</td>
<td><asp:EChoose runat="server" ID ="txtName"  DataField="NAME" ECIType="GDZC" Width="85%"></asp:EChoose></td>
                        <td class="lbl">维修保养内容</td>
<td><asp:ETextBox runat="server" ID ="txtWxbynr"  DataField="WXBYNR" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">维修保养对应工作量调用生产线</td>
<td><asp:EChoose runat="server" ID ="txtScx"  DataField="SCX" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">工作量对应单位</td>
<td><asp:ECombox runat="server" ID ="cboUnit"  DataField="UNIT" AddEmpty="true" ECIType="GZ_UNIT" Width="85%"></asp:ECombox></td>
                        <td class="lbl">维修保养工作量限额</td>
<td><asp:ETextBox runat="server" ID ="txtWxbyxe"  DataField="WXBYXE" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">提醒工作量限额</td>
<td><asp:ETextBox runat="server" ID ="txtTxxe"  DataField="TXXE" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">工作量最大限额</td>
<td><asp:ETextBox runat="server" ID ="txtZdxe"  DataField="ZDXE" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">备注</td>
<td><asp:ETextBox runat="server" ID ="txtRemark"  DataField="REMARK" Width="85%"></asp:ETextBox></td>

               </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
