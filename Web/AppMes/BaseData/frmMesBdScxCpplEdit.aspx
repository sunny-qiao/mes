<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdScxCpplEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdScxCpplEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>生产线子表-产品及配料设置维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdScxCpplEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="生产线子表-产品及配料设置维护"></asp:ETitle>

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
                        <td class="lbl">生产线</td>
<td><asp:EChoose runat="server" ID ="txtScx"  DataField="SCX" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品/配料名</td>
<td><asp:EChoose runat="server" ID ="txtCpm"  DataField="CPM" ECIType="WL" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">依生产数据用量参数</td>
<td><asp:ETextBox runat="server" ID ="txtYscsjylcs"  DataField="YSCSJYLCS" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">该参数比值</td>
<td><asp:ETextBox runat="server" ID ="txtGcsbz"  DataField="GCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">依产品/配料1计算</td>
<td><asp:EChoose runat="server" ID ="txtYcpjs1"  DataField="YCPJS1" ECIType="WL" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">依产品/配料1计算比值</td>
<td><asp:ETextBox runat="server" ID ="txtYcpjsbz1"  DataField="YCPJSBZ1" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">依产品/配料2计算</td>
<td><asp:EChoose runat="server" ID ="txtYcpjs2"  DataField="YCPJS2" ECIType="WL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">依产品/配料2计算比值</td>
<td><asp:ETextBox runat="server" ID ="txtYcpjsbz2"  DataField="YCPJSBZ2" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">依产品/配料3计算</td>
<td><asp:EChoose runat="server" ID ="txtYcpjs3"  DataField="YCPJS3" ECIType="WL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">依产品/配料3计算比值</td>
<td><asp:ETextBox runat="server" ID ="txtYcpjsbz3"  DataField="YCPJSBZ3" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">依产品/配料4计算</td>
<td><asp:EChoose runat="server" ID ="txtYcpjs4"  DataField="YCPJS4" ECIType="WL" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">依产品/配料4计算比值</td>
<td><asp:ETextBox runat="server" ID ="txtYcpjsbz4"  DataField="YCPJSBZ4" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">默认出库仓库</td>
<td><asp:ETextBox runat="server" ID ="txtCkck"  DataField="CKCK" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">默认入库仓库</td>
<td><asp:ETextBox runat="server" ID ="txtRkck"  DataField="RKCK" Width="85%"></asp:ETextBox></td>

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
