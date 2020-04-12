<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdGdzcZjfftEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdGdzcZjfftEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>固定资产/设备子表-折旧费分摊详录维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdGdzcZjfftEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="固定资产/设备子表-折旧费分摊详录维护"></asp:ETitle>

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
                        <td class="lbl">编码(折旧年号)</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">起始日期</td>
<td><asp:ETextBox runat="server" ID ="txtQsrq"  DataField="QSRQ" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">终止日期</td>
<td><asp:ETextBox runat="server" ID ="txtZzrq"  DataField="ZZRQ" IsDate="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">折旧天数</td>
<td><asp:ETextBox runat="server" ID ="txtZjts"  DataField="ZJTS" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">尚可使用寿命/年</td>
<td><asp:ETextBox runat="server" ID ="txtSksysm"  DataField="SKSYSM" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">年数总和法-年折旧率</td>
<td><asp:ETextBox runat="server" ID ="txtZhNzjl"  DataField="ZH_NZJL" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">年数总和法-年初固定资产账面价值</td>
<td><asp:ETextBox runat="server" ID ="txtZhNczmjz"  DataField="ZH_NCZMJZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">年数总和法-年初理论剩余折旧率</td>
<td><asp:ETextBox runat="server" ID ="txtZhLlsyzjl"  DataField="ZH_LLSYZJL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">年数总和法-年折旧率取值</td>
<td><asp:ETextBox runat="server" ID ="txtZhNzjlqz"  DataField="ZH_NZJLQZ" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">年数总和法-年初剩余折旧率</td>
<td><asp:ETextBox runat="server" ID ="txtZhNcsyzjl"  DataField="ZH_NCSYZJL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">年数总额合法-年折旧额</td>
<td><asp:ETextBox runat="server" ID ="txtZhNzje"  DataField="ZH_NZJE" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">年限平均法-年折旧率</td>
<td><asp:ETextBox runat="server" ID ="txtPjNzjl"  DataField="PJ_NZJL" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">年限平均法-年初固定资产账面价值</td>
<td><asp:ETextBox runat="server" ID ="txtPjNczmjz"  DataField="PJ_NCZMJZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">年限平均法-年初理论剩余折旧率</td>
<td><asp:ETextBox runat="server" ID ="txtPjLlsyzjl"  DataField="PJ_LLSYZJL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">年限平均法-年折旧率取值</td>
<td><asp:ETextBox runat="server" ID ="txtPjNzjlqz"  DataField="PJ_NZJLQZ" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">年限平均法-年初剩余折旧率</td>
<td><asp:ETextBox runat="server" ID ="txtPjNcsyzjl"  DataField="PJ_NCSYZJL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">年限平均法-年折旧额</td>
<td><asp:ETextBox runat="server" ID ="txtPjNzje"  DataField="PJ_NZJE" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">双倍余额递减法-年折旧率</td>
<td><asp:ETextBox runat="server" ID ="txtSbNzjl"  DataField="SB_NZJL" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">双倍余额递减法-年初固定资产账面价值</td>
<td><asp:ETextBox runat="server" ID ="txtSbNczmjz"  DataField="SB_NCZMJZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">双倍余额递减法-年初理论剩余折旧率</td>
<td><asp:ETextBox runat="server" ID ="txtSbLlsyzjl"  DataField="SB_LLSYZJL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">双倍余额递减法-年折旧率取值</td>
<td><asp:ETextBox runat="server" ID ="txtSbNzjlqz"  DataField="SB_NZJLQZ" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">双倍余额递减法-年初剩余折旧率</td>
<td><asp:ETextBox runat="server" ID ="txtSbNcsyzjl"  DataField="SB_NCSYZJL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">年数总额法-年折旧额</td>
<td><asp:ETextBox runat="server" ID ="txtSbNzje"  DataField="SB_NZJE" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">年初账面价值</td>
<td><asp:ETextBox runat="server" ID ="txtNczmjz"  DataField="NCZMJZ" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">年初折旧率</td>
<td><asp:ETextBox runat="server" ID ="txtNczjl"  DataField="NCZJL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">年折旧额</td>
<td><asp:ETextBox runat="server" ID ="txtNzje"  DataField="NZJE" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">年折旧率</td>
<td><asp:ETextBox runat="server" ID ="txtNzjl"  DataField="NZJL" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">月均折旧额</td>
<td><asp:ETextBox runat="server" ID ="txtYjzje"  DataField="YJZJE" IsFloat="true" Width="85%"></asp:ETextBox></td>
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
