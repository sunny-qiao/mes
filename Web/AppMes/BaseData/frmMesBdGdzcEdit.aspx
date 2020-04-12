<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdGdzcEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdGdzcEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>固定资产/设备维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdGdzcEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="固定资产/设备维护"></asp:ETitle>

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
                        <td class="lbl">固定资产/设备编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">固定资产/设备名</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">对应物料名</td>
<td><asp:EChoose runat="server" ID ="txtWl"  DataField="WL" ECIType="WL" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">增加方式</td>
<td><asp:ECombox runat="server" ID ="cboZjfs"  DataField="ZJFS" AddEmpty="true" ECIType="GDZCZJFS" Width="85%"></asp:ECombox></td>
                        <td class="lbl">供货人</td>
<td><asp:EChoose runat="server" ID ="txtGhr"  DataField="GHR" ECIType="GYS" Width="85%"></asp:EChoose></td>
                        <td class="lbl">规格型号</td>
<td><asp:ETextBox runat="server" ID ="txtGgxh"  DataField="GGXH" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">制造厂商</td>
<td><asp:ETextBox runat="server" ID ="txtZzcs"  DataField="ZZCS" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">制造厂商联系方式</td>
<td><asp:ETextBox runat="server" ID ="txtZzcsTel"  DataField="ZZCS_TEL" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">制造号码</td>
<td><asp:ETextBox runat="server" ID ="txtZzhm"  DataField="ZZHM" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">制造日期</td>
<td><asp:ETextBox runat="server" ID ="txtZzrq"  DataField="ZZRQ" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">购置日期</td>
<td><asp:ETextBox runat="server" ID ="txtGzrq"  DataField="GZRQ" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">录入日期</td>
<td><asp:ETextBox runat="server" ID ="txtLrrq"  DataField="LRRQ" IsDate="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">录入人</td>
<td><asp:ETextBox runat="server" ID ="txtLrr"  DataField="LRR" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">停用日期</td>
<td><asp:ETextBox runat="server" ID ="txtTyrq"  DataField="TYRQ" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">注销日期</td>
<td><asp:ETextBox runat="server" ID ="txtZxrq"  DataField="ZXRQ" IsDate="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">注销原因</td>
<td><asp:ETextBox runat="server" ID ="txtZxyy"  DataField="ZXYY" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">开始使用日期</td>
<td><asp:ETextBox runat="server" ID ="txtKssyrq"  DataField="KSSYRQ" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">计量单位</td>
<td><asp:EChoose runat="server" ID ="txtUnit"  DataField="UNIT" ECIType="UNIT" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">个数</td>
<td><asp:ETextBox runat="server" ID ="txtQty"  DataField="QTY" IsNum="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">电功率/W</td>
<td><asp:ETextBox runat="server" ID ="txtDgl"  DataField="DGL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">固定资产/设备类别</td>
<td><asp:ECombox runat="server" ID ="cboSblb"  DataField="SBLB" AddEmpty="true" ECIType="GDZCLB" Width="85%"></asp:ECombox></td>

               </tr>
   <tr>
                        <td class="lbl">单价</td>
<td><asp:ETextBox runat="server" ID ="txtPrice"  DataField="PRICE" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">原值</td>
<td><asp:ETextBox runat="server" ID ="txtYz"  DataField="YZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">预计净残值</td>
<td><asp:ETextBox runat="server" ID ="txtYjjcz"  DataField="YJJCZ" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">净残值率</td>
<td><asp:ETextBox runat="server" ID ="txtJczl"  DataField="JCZL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">预计总折旧额</td>
<td><asp:ETextBox runat="server" ID ="txtYjzzje"  DataField="YJZZJE" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">预计总折旧率</td>
<td><asp:ETextBox runat="server" ID ="txtYjzzjl"  DataField="YJZZJL" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">预计使用寿命</td>
<td><asp:ETextBox runat="server" ID ="txtYjsysm"  DataField="YJSYSM" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">预计使用寿命的年数总和</td>
<td><asp:ETextBox runat="server" ID ="txtYjnszh"  DataField="YJNSZH" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">折旧方法</td>
<td><asp:ECombox runat="server" ID ="cboZjff"  DataField="ZJFF" AddEmpty="true" ECIType="ZJFF" Width="85%"></asp:ECombox></td>

               </tr>
   <tr>
                        <td class="lbl">预计工作量对应生产线</td>
<td><asp:EChoose runat="server" ID ="txtYjscx"  DataField="YJSCX" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">预计工作量</td>
<td><asp:ETextBox runat="server" ID ="txtYjgzl"  DataField="YJGZL" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">预计工作量对应单位</td>
<td><asp:EChoose runat="server" ID ="txtYjgzlUnit"  DataField="YJGZL_UNIT" ECIType="GZL_UNIT" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">单位工作量折旧额</td>
<td><asp:ETextBox runat="server" ID ="txtDwgzlzje"  DataField="DWGZLZJE" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">对应已生产工作量</td>
<td><asp:ETextBox runat="server" ID ="txtDyysczgl"  DataField="DYYSCZGL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">工作量计算总折旧额</td>
<td><asp:ETextBox runat="server" ID ="txtGzljszzje"  DataField="GZLJSZZJE" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">上次结账日期</td>
<td><asp:ETextBox runat="server" ID ="txtScjzrq"  DataField="SCJZRQ" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">当期起始日期对应折旧年份值</td>
<td><asp:ETextBox runat="server" ID ="txtDqqsrq"  DataField="DQQSRQ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">起始日期对应折旧年份年折旧额</td>
<td><asp:ETextBox runat="server" ID ="txtQsrqdy"  DataField="QSRQDY" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">当期终止日期对应折旧年份值</td>
<td><asp:ETextBox runat="server" ID ="txtDqzzrqdy"  DataField="DQZZRQDY" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">终止日期对应折旧年份年折旧额</td>
<td><asp:ETextBox runat="server" ID ="txtZzrqdy"  DataField="ZZRQDY" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">本账期折旧额/当月折旧额</td>
<td><asp:ETextBox runat="server" ID ="txtBzqzje"  DataField="BZQZJE" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">当月折旧率</td>
<td><asp:ETextBox runat="server" ID ="txtDyzjl"  DataField="DYZJL" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">日折旧额</td>
<td><asp:ETextBox runat="server" ID ="txtYzje"  DataField="YZJE" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">已计提年份</td>
<td><asp:ETextBox runat="server" ID ="txtYjtnf"  DataField="YJTNF" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">已计提月份</td>
<td><asp:ETextBox runat="server" ID ="txtYjtyf"  DataField="YJTYF" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">该固定资产/设备已结账年份折旧额</td>
<td><asp:ETextBox runat="server" ID ="txtYjznfzje"  DataField="YJZNFZJE" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">累计折旧</td>
<td><asp:ETextBox runat="server" ID ="txtLjzj"  DataField="LJZJ" IsFloat="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">净值</td>
<td><asp:ETextBox runat="server" ID ="txtJz"  DataField="JZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">对应折旧科目</td>
<td><asp:EChoose runat="server" ID ="txtDyzjkm"  DataField="DYZJKM" ECIType="KM" Width="85%"></asp:EChoose></td>
                        <td class="lbl">存放地点</td>
<td><asp:ETextBox runat="server" ID ="txtCfdd"  DataField="CFDD" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">建筑面积/m^2</td>
<td><asp:ETextBox runat="server" ID ="txtJzmj"  DataField="JZMJ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">出售价格</td>
<td><asp:ETextBox runat="server" ID ="txtCsjg"  DataField="CSJG" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">盘盈/亏额</td>
<td><asp:ETextBox runat="server" ID ="txtPyke"  DataField="PYKE" IsFloat="true" Width="85%"></asp:ETextBox></td>

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
