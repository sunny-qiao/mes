<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdMjEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdMjEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>模具维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdMjEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="模具维护"></asp:ETitle>

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
                        <td class="lbl">模具编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具名</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">所属模具类型</td>
<td><asp:EChoose runat="server" ID ="txtSsmjlx"  DataField="SSMJLX" ECIType="MJLX" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">模具供应商</td>
<td><asp:EChoose runat="server" ID ="txtGys"  DataField="GYS" ECIType="GYS" Width="85%"></asp:EChoose></td>
                        <td class="lbl">模具生产日期</td>
<td><asp:ETextBox runat="server" ID ="txtScrq"  DataField="SCRQ" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具设备读取代码</td>
<td><asp:ETextBox runat="server" ID ="txtDqdm"  DataField="DQDM" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">模具缩略图</td>
<td><asp:ETextBox runat="server" ID ="txtSlt"  DataField="SLT" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具条形码</td>
<td><asp:ETextBox runat="server" ID ="txtTxm"  DataField="TXM" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具二维码</td>
<td><asp:ETextBox runat="server" ID ="txtEwm"  DataField="EWM" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">模具缩略图</td>
<td><asp:ETextBox runat="server" ID ="txtSltPath"  DataField="SLT_PATH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具条形码</td>
<td><asp:ETextBox runat="server" ID ="txtTxmPath"  DataField="TXM_PATH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具二维码</td>
<td><asp:ETextBox runat="server" ID ="txtEwmPath"  DataField="EWM_PATH" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">对应模具类型</td>
<td><asp:EChoose runat="server" ID ="txtDymjlx"  DataField="DYMJLX" ECIType="MJLX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">模具默认工序</td>
<td><asp:EChoose runat="server" ID ="txtGx"  DataField="GX" ECIType="GX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">模具采购价格</td>
<td><asp:ETextBox runat="server" ID ="txtCgjg"  DataField="CGJG" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">成本摊销生产箱数/次数</td>
<td><asp:ETextBox runat="server" ID ="txtCbtxscxs"  DataField="CBTXSCXS" IsNum="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">次均摊成本</td>
<td><asp:ETextBox runat="server" ID ="txtCjtcb"  DataField="CJTCB" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具浇冒系统重/kg</td>
<td><asp:ETextBox runat="server" ID ="txtJmxtz"  DataField="JMXTZ" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">所有产品总重/kg</td>
<td><asp:ETextBox runat="server" ID ="txtSycpzz"  DataField="SYCPZZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">总铁水用量/kg</td>
<td><asp:ETextBox runat="server" ID ="txtZtsyl"  DataField="ZTSYL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">出品率/%</td>
<td><asp:ETextBox runat="server" ID ="txtCpl"  DataField="CPL" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">标准单次生产工时/s</td>
<td><asp:ETextBox runat="server" ID ="txtBzdcscgs"  DataField="BZDCSCGS" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具电功率/w</td>
<td><asp:ETextBox runat="server" ID ="txtDgl"  DataField="DGL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">标准工时生产次数</td>
<td><asp:ETextBox runat="server" ID ="txtBzgssccs"  DataField="BZGSSCCS" IsFloat="true" Width="85%"></asp:ETextBox></td>

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
