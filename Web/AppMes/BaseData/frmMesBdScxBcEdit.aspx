<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdScxBcEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdScxBcEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>生产线子表-班次设置维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdScxBcEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="生产线子表-班次设置维护"></asp:ETitle>

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
<td><asp:ETextBox runat="server" ID ="txtScx"  DataField="SCX" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">对应部门</td>
<td><asp:ETextBox runat="server" ID ="txtDept"  DataField="DEPT" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">是否停用</td>
<td><asp:ECombox runat="server" ID ="cboIsTy"  DataField="IS_TY" AddEmpty="true" ECIType="ISUSE" Width="85%"></asp:ECombox></td>

               </tr>
   <tr>
                        <td class="lbl">编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">班次编号</td>
<td><asp:ETextBox runat="server" ID ="txtBcbh"  DataField="BCBH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">班次名</td>
<td><asp:ETextBox runat="server" ID ="txtBcm"  DataField="BCM" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">班次名简写</td>
<td><asp:ETextBox runat="server" ID ="txtBcmShort"  DataField="BCM_SHORT" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">上班考勤机编号</td>
<td><asp:EChoose runat="server" ID ="txtSbkqjbh"  DataField="SBKQJBH" ECIType="KQJ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">上班备用考勤机编号</td>
<td><asp:EChoose runat="server" ID ="txtBsbykqjbh"  DataField="BSBYKQJBH" ECIType="KQJ" Width="85%"></asp:EChoose></td>

               </tr>
   <tr>
                        <td class="lbl">下班考勤机编号</td>
<td><asp:EChoose runat="server" ID ="txtXbkqjbh"  DataField="XBKQJBH" ECIType="KQJ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">下班备用考勤机编号</td>
<td><asp:EChoose runat="server" ID ="txtXbbykqjbh"  DataField="XBBYKQJBH" ECIType="KQJ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产量考核起始日期差值</td>
<td><asp:ECombox runat="server" ID ="cboClkhQsRqcz"  DataField="CLKH_QS_RQCZ" AddEmpty="true" ECIType="SBRQCZ" Width="85%"></asp:ECombox></td>

               </tr>
   <tr>
                        <td class="lbl">产量考核起始时间</td>
<td><asp:ETextBox runat="server" ID ="txtClkhQsTime"  DataField="CLKH_QS_TIME" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产量考核结束日期差值</td>
<td><asp:ECombox runat="server" ID ="cboClkhJsRqcz"  DataField="CLKH_JS_RQCZ" AddEmpty="true" ECIType="SBRQCZ" Width="85%"></asp:ECombox></td>
                        <td class="lbl">产量考核结束时间</td>
<td><asp:ETextBox runat="server" ID ="txtClkhJsTime"  DataField="CLKH_JS_TIME" IsDate="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">#1上班日期差值</td>
<td><asp:ECombox runat="server" ID ="cboSbrqcz1"  DataField="SBRQCZ1" AddEmpty="true" ECIType="SBRQCZ" Width="85%"></asp:ECombox></td>
                        <td class="lbl">#1上班时间</td>
<td><asp:ETextBox runat="server" ID ="txtSbTime1"  DataField="SB_TIME1" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#1下班日期差值</td>
<td><asp:ECombox runat="server" ID ="cboXbrqcz1"  DataField="XBRQCZ1" AddEmpty="true" ECIType="XBRQCZ" Width="85%"></asp:ECombox></td>

               </tr>
   <tr>
                        <td class="lbl">#1下班时间</td>
<td><asp:ETextBox runat="server" ID ="txtXbTime1"  DataField="XB_TIME1" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#1上班考勤开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtSbkqksTime1"  DataField="SBKQKS_TIME1" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#1迟到开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtCdksTime1"  DataField="CDKS_TIME1" IsDate="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">#1严重迟到开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtYzcdTime1"  DataField="YZCD_TIME1" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#1上班旷工开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtSbkgTime1"  DataField="SBKG_TIME1" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#1下班旷工开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtXbkgTime1"  DataField="XBKG_TIME1" IsDate="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">#1下班严重早退开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtXbyzztksTime1"  DataField="XBYZZTKS_TIME1" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#1下班早退开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtXbztksTime1"  DataField="XBZTKS_TIME1" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#1加班开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtJbksTime1"  DataField="JBKS__TIME1" IsDate="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">#1下班终止考勤时间</td>
<td><asp:ETextBox runat="server" ID ="txtXbzzkqTime1"  DataField="XBZZKQ_TIME1" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#2上班日期差值</td>
<td><asp:ECombox runat="server" ID ="cboSbrqcz2"  DataField="SBRQCZ2" AddEmpty="true" ECIType="SBRQCZ" Width="85%"></asp:ECombox></td>
                        <td class="lbl">#2上班时间</td>
<td><asp:ETextBox runat="server" ID ="txtSbTime2"  DataField="SB_TIME2" IsDate="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">#2下班日期差值</td>
<td><asp:ECombox runat="server" ID ="cboXbrqcz2"  DataField="XBRQCZ2" AddEmpty="true" ECIType="XBRQCZ" Width="85%"></asp:ECombox></td>
                        <td class="lbl">#2下班时间</td>
<td><asp:ETextBox runat="server" ID ="txtXbTime2"  DataField="XB_TIME2" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#2上班考勤开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtSbkqksTime2"  DataField="SBKQKS_TIME2" IsDate="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">#2迟到开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtCdksTime2"  DataField="CDKS_TIME2" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#2严重迟到开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtYzcdTime2"  DataField="YZCD_TIME2" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#2上班旷工开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtSbkgTime2"  DataField="SBKG_TIME2" IsDate="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">#2下班旷工开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtXbkgTime2"  DataField="XBKG_TIME2" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#2下班严重早退开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtXbyzztksTime2"  DataField="XBYZZTKS_TIME2" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#2下班早退开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtXbztksTime2"  DataField="XBZTKS_TIME2" IsDate="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">#2加班开始时间</td>
<td><asp:ETextBox runat="server" ID ="txtJbksTime2"  DataField="JBKS__TIME2" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">#2下班终止考勤时间</td>
<td><asp:ETextBox runat="server" ID ="txtXbzzkqTime2"  DataField="XBZZKQ_TIME2" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">备注</td>
<td><asp:ETextBox runat="server" ID ="txtRemark"  DataField="REMARK" Width="85%"></asp:ETextBox></td>

               </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
