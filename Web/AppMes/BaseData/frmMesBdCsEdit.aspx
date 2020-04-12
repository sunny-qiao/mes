<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdCsEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdCsEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>参数维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdCsEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="参数维护"></asp:ETitle>

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
                        <td class="lbl">参数编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">参数名</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">参数精度</td>
<td><asp:ETextBox runat="server" ID ="txtJd"  DataField="JD" IsNum="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">标准参数值</td>
<td><asp:ETextBox runat="server" ID ="txtBzcsz"  DataField="BZCSZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">低值下限</td>
<td><asp:ETextBox runat="server" ID ="txtDzxx"  DataField="DZXX" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">偏低下限</td>
<td><asp:ETextBox runat="server" ID ="txtPdxx"  DataField="PDXX" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">正常下限</td>
<td><asp:ETextBox runat="server" ID ="txtZcxx"  DataField="ZCXX" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">正常上限</td>
<td><asp:ETextBox runat="server" ID ="txtZcsx"  DataField="ZCSX" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">偏高上限</td>
<td><asp:ETextBox runat="server" ID ="txtPgsx"  DataField="PGSX" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">高值上限</td>
<td><asp:ETextBox runat="server" ID ="txtGzsx"  DataField="GZSX" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">偏低颜色</td>
<td><asp:ETextBox runat="server" ID ="txtPdys"  DataField="PDYS" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">低颜色</td>
<td><asp:ETextBox runat="server" ID ="txtDys"  DataField="DYS" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">超低颜色</td>
<td><asp:ETextBox runat="server" ID ="txtCdys"  DataField="CDYS" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">正常颜色</td>
<td><asp:ETextBox runat="server" ID ="txtZcys"  DataField="ZCYS" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">偏高颜色</td>
<td><asp:ETextBox runat="server" ID ="txtPgys"  DataField="PGYS" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">高颜色</td>
<td><asp:ETextBox runat="server" ID ="txtGys"  DataField="GYS" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">超高颜色</td>
<td><asp:ETextBox runat="server" ID ="txtCgys"  DataField="CGYS" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">备注</td>
<td><asp:ETextBox runat="server" ID ="txtRemark"  DataField="REMARK" Width="85%"></asp:ETextBox></td>

               </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
