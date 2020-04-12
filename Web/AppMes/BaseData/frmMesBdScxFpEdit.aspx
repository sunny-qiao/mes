<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdScxFpEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdScxFpEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>生产线子表-废品设置维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdScxFpEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="生产线子表-废品设置维护"></asp:ETitle>

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
                        <td class="lbl">对应生产线名</td>
<td><asp:ETextBox runat="server" ID ="txtScx"  DataField="SCX" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">废品名</td>
<td><asp:ETextBox runat="server" ID ="txtFpm"  DataField="FPM" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">转为回炉料比例</td>
<td><asp:ETextBox runat="server" ID ="txtHllbl"  DataField="HLLBL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">转为回炉料入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtHllrkck"  DataField="HLLRKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">转为二级品比例</td>
<td><asp:ETextBox runat="server" ID ="txtEjpbl"  DataField="EJPBL" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">二级片处理工序</td>
<td><asp:EChoose runat="server" ID ="txtEjpclgx"  DataField="EJPCLGX" ECIType="GX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">转为二级品入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtEjprkck"  DataField="EJPRKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">备注</td>
<td><asp:ETextBox runat="server" ID ="txtRemark"  DataField="REMARK" Width="85%"></asp:ETextBox></td>

               </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
