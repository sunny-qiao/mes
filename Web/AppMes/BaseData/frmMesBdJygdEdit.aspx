<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdJygdEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdJygdEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>检验工段维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdJygdEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="检验工段维护"></asp:ETitle>

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
                        <td class="lbl">检验工段编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">检验工段名</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">默认上级车间</td>
<td><asp:EChoose runat="server" ID ="txtSjcj"  DataField="SJCJ" ECIType="CJ" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">默认出库仓库</td>
<td><asp:EChoose runat="server" ID ="txtCkck"  DataField="CKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认成品入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtRkck"  DataField="RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认废品1</td>
<td><asp:EChoose runat="server" ID ="txtFp1"  DataField="FP1" ECIType="FPSZ" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品1入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp1Rkck"  DataField="FP1_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品1处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp1Cljg"  DataField="FP1_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品1处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp1CljgRkck"  DataField="FP1_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">默认废品2</td>
<td><asp:EChoose runat="server" ID ="txtFp2"  DataField="FP2" ECIType="FPSZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品2入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp2Rkck"  DataField="FP2_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品2处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp2Cljg"  DataField="FP2_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品2处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp2CljgRkck"  DataField="FP2_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认废品3</td>
<td><asp:EChoose runat="server" ID ="txtFp3"  DataField="FP3" ECIType="FPSZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品3入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp3Rkck"  DataField="FP3_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品3处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp3Cljg"  DataField="FP3_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品3处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp3CljgRkck"  DataField="FP3_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认废品4</td>
<td><asp:EChoose runat="server" ID ="txtFp4"  DataField="FP4" ECIType="FPSZ" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品4入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp4Rkck"  DataField="FP4_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品4处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp4Cljg"  DataField="FP4_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品4处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp4CljgRkck"  DataField="FP4_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">默认废品5</td>
<td><asp:EChoose runat="server" ID ="txtFp5"  DataField="FP5" ECIType="FPSZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品5入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp5Rkck"  DataField="FP5_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品5处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp5Cljg"  DataField="FP5_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品5处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp5CljgRkck"  DataField="FP5_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认废品6</td>
<td><asp:EChoose runat="server" ID ="txtFp6"  DataField="FP6" ECIType="FPSZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品6入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp6Rkck"  DataField="FP6_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品6处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp6Cljg"  DataField="FP6_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品6处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp6CljgRkck"  DataField="FP6_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认废品7</td>
<td><asp:EChoose runat="server" ID ="txtFp7"  DataField="FP7" ECIType="FPSZ" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品7入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp7Rkck"  DataField="FP7_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品7处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp7Cljg"  DataField="FP7_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品7处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp7CljgRkck"  DataField="FP7_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">默认废品8</td>
<td><asp:EChoose runat="server" ID ="txtFp8"  DataField="FP8" ECIType="FPSZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品8入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp8Rkck"  DataField="FP8_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品8处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp8Cljg"  DataField="FP8_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品8处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp8CljgRkck"  DataField="FP8_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认废品9</td>
<td><asp:EChoose runat="server" ID ="txtFp9"  DataField="FP9" ECIType="FPSZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品9入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp9Rkck"  DataField="FP9_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品9处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp9Cljg"  DataField="FP9_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品9处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp9CljgRkck"  DataField="FP9_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认废品10</td>
<td><asp:EChoose runat="server" ID ="txtFp10"  DataField="FP10" ECIType="FPSZ" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品10入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp10Rkck"  DataField="FP10_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品10处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp10Cljg"  DataField="FP10_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品10处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp10CljgRkck"  DataField="FP10_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">默认废品11</td>
<td><asp:EChoose runat="server" ID ="txtFp11"  DataField="FP11" ECIType="FPSZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品11入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp11Rkck"  DataField="FP11_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品11处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp11Cljg"  DataField="FP11_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品11处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp11CljgRkck"  DataField="FP11_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认废品12</td>
<td><asp:EChoose runat="server" ID ="txtFp12"  DataField="FP12" ECIType="FPSZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品12入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp12Rkck"  DataField="FP12_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品12处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp12Cljg"  DataField="FP12_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品12处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp12CljgRkck"  DataField="FP12_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认废品13</td>
<td><asp:EChoose runat="server" ID ="txtFp13"  DataField="FP13" ECIType="FPSZ" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品13入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp13Rkck"  DataField="FP13_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品13处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp13Cljg"  DataField="FP13_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品13处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp13CljgRkck"  DataField="FP13_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">默认废品14</td>
<td><asp:EChoose runat="server" ID ="txtFp14"  DataField="FP14" ECIType="FPSZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品14入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp14Rkck"  DataField="FP14_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品14处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp14Cljg"  DataField="FP14_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品14处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp14CljgRkck"  DataField="FP14_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认废品15</td>
<td><asp:EChoose runat="server" ID ="txtFp15"  DataField="FP15" ECIType="FPSZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品15入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp15Rkck"  DataField="FP15_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品15处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp15Cljg"  DataField="FP15_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品15处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp15CljgRkck"  DataField="FP15_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认废品16</td>
<td><asp:EChoose runat="server" ID ="txtFp16"  DataField="FP16" ECIType="FPSZ" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品16入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp16Rkck"  DataField="FP16_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品16处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp16Cljg"  DataField="FP16_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品16处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp16CljgRkck"  DataField="FP16_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">默认废品17</td>
<td><asp:EChoose runat="server" ID ="txtFp17"  DataField="FP17" ECIType="FPSZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品17入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp17Rkck"  DataField="FP17_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品17处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp17Cljg"  DataField="FP17_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品17处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp17CljgRkck"  DataField="FP17_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认废品18</td>
<td><asp:EChoose runat="server" ID ="txtFp18"  DataField="FP18" ECIType="FPSZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品18入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp18Rkck"  DataField="FP18_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品18处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp18Cljg"  DataField="FP18_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品18处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp18CljgRkck"  DataField="FP18_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认废品19</td>
<td><asp:EChoose runat="server" ID ="txtFp19"  DataField="FP19" ECIType="FPSZ" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品19入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp19Rkck"  DataField="FP19_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品19处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp19Cljg"  DataField="FP19_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品19处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp19CljgRkck"  DataField="FP19_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">默认废品20</td>
<td><asp:EChoose runat="server" ID ="txtFp20"  DataField="FP20" ECIType="FPSZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品20入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp20Rkck"  DataField="FP20_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">废品20处理结果</td>
<td><asp:EChoose runat="server" ID ="txtFp20Cljg"  DataField="FP20_CLJG" ECIType="FPCLJG" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">废品20处理结果入库仓库</td>
<td><asp:EChoose runat="server" ID ="txtFp20CljgRkck"  DataField="FP20_CLJG_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">备注</td>
<td><asp:ETextBox runat="server" ID ="txtRemark"  DataField="REMARK" Width="85%"></asp:ETextBox></td>
                        <td class="lbl"></td>
<td><asp:ETextBox runat="server" ID ="txtCreateUser"  DataField="CREATE_USER" ReadOnly="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl"></td>
<td><asp:ETextBox runat="server" ID ="txtCreateUserName"  DataField="CREATE_USER_NAME" Width="85%"></asp:ETextBox></td>
                        <td class="lbl"></td>
<td><asp:ETextBox runat="server" ID ="txtCreateDate"  DataField="CREATE_DATE" Format="yyyy-MM-dd HH:mm:ss"  ReadOnly="true" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl"></td>
<td><asp:ETextBox runat="server" ID ="txtUpdateUser"  DataField="UPDATE_USER" ReadOnly="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl"></td>
<td><asp:ETextBox runat="server" ID ="txtUpdateUserName"  DataField="UPDATE_USER_NAME" Width="85%"></asp:ETextBox></td>
                        <td class="lbl"></td>
<td><asp:ETextBox runat="server" ID ="txtUpdateDate"  DataField="UPDATE_DATE" Format="yyyy-MM-dd HH:mm:ss"  ReadOnly="true" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl"></td>
<td><asp:ETextBox runat="server" ID ="txtCompanyCode"  DataField="COMPANY_CODE" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl"></td>
<td><asp:ETextBox runat="server" ID ="txtCompanyName"  DataField="COMPANY_NAME" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">&nbsp;</td><td>&nbsp;</td>
                        <td class="lbl">&nbsp;</td><td>&nbsp;</td>

               </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
