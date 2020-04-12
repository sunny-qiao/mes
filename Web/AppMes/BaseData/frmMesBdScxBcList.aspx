<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdScxBcList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdScxBcList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>生产线子表-班次设置</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmMesBdScxBcEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmMesBdScxBcEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
           
           <asp:ETitle runat="server" ID="pagetitle" Title="生产线子表-班次设置"></asp:ETitle>
               
            <div id="divQuery" style="width: 100%;">
                <table   id="tbQuery" class="grid" cellpadding="0" cellspacing="0">
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
<td><asp:ETextBox runat="server" ID ="txtScx"  DataField="SCX" Query="A.SCX|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">对应部门</td>
<td><asp:ETextBox runat="server" ID ="txtDept"  DataField="DEPT" Query="A.DEPT|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">&nbsp;</td><td>&nbsp;</td>

               </tr>

                    <tr>
                        <td class="center" colspan="6">
                            <asp:EButton runat="server" ID="btnSearch" Text="查询"  Icon="find"   />
                            <asp:EButton runat="server" ID="btnReset" IsClient="true" Text="重置"  Icon="reset"   OnClientClick= "eci.reset('tbQuery');"/></td>
                    </tr>
                </table>
            </div>
            <div id="toolbar">
                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server" 
                    FitWindow="true"  EnableSorting="True" EnableSelect="false"   EnablePaging="true" EnableClickSelectRow="true" 
                    Width="1000px" KeyField="GUID"  HAlign="center" OnClick="editAction"> 
                    <Columns>

                      <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnEdit" Text="编辑" IsClient="true" Icon="edit" OnClientClick="editAction(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>


                          <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" Icon="Delete" ID="btnDelete" Text="删除" IsClient="true" OnClientClick="return deleteAction(this);"  CommandArgument='<%#Eval("GUID")%>'  OnClick="btnDelete_Click" />

                            </ItemTemplate>
                        </asp:TemplateField>


                      <asp:BoundField DataField="SCX" HeaderText="对应生产线" SortExpression="SCX"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DEPT" HeaderText="对应部门" SortExpression="DEPT"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="IS_TY" HeaderText="是否停用" SortExpression="IS_TY"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="BH" HeaderText="编号" SortExpression="BH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="BCBH" HeaderText="班次编号" SortExpression="BCBH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="BCM" HeaderText="班次名" SortExpression="BCM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="BCM_SHORT" HeaderText="班次名简写" SortExpression="BCM_SHORT"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SBKQJBH" HeaderText="上班考勤机编号" SortExpression="SBKQJBH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="BSBYKQJBH" HeaderText="上班备用考勤机编号" SortExpression="BSBYKQJBH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XBKQJBH" HeaderText="下班考勤机编号" SortExpression="XBKQJBH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XBBYKQJBH" HeaderText="下班备用考勤机编号" SortExpression="XBBYKQJBH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CLKH_QS_RQCZ" HeaderText="产量考核起始日期差值" SortExpression="CLKH_QS_RQCZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CLKH_QS_TIME" HeaderText="产量考核起始时间" SortExpression="CLKH_QS_TIME" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CLKH_JS_RQCZ" HeaderText="产量考核结束日期差值" SortExpression="CLKH_JS_RQCZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CLKH_JS_TIME" HeaderText="产量考核结束时间" SortExpression="CLKH_JS_TIME" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SBRQCZ1" HeaderText="#1上班日期差值" SortExpression="SBRQCZ1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SB_TIME1" HeaderText="#1上班时间" SortExpression="SB_TIME1" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XBRQCZ1" HeaderText="#1下班日期差值" SortExpression="XBRQCZ1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XB_TIME1" HeaderText="#1下班时间" SortExpression="XB_TIME1" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SBKQKS_TIME1" HeaderText="#1上班考勤开始时间" SortExpression="SBKQKS_TIME1" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CDKS_TIME1" HeaderText="#1迟到开始时间" SortExpression="CDKS_TIME1" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YZCD_TIME1" HeaderText="#1严重迟到开始时间" SortExpression="YZCD_TIME1" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SBKG_TIME1" HeaderText="#1上班旷工开始时间" SortExpression="SBKG_TIME1" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XBKG_TIME1" HeaderText="#1下班旷工开始时间" SortExpression="XBKG_TIME1" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XBYZZTKS_TIME1" HeaderText="#1下班严重早退开始时间" SortExpression="XBYZZTKS_TIME1" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XBZTKS_TIME1" HeaderText="#1下班早退开始时间" SortExpression="XBZTKS_TIME1" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="JBKS__TIME1" HeaderText="#1加班开始时间" SortExpression="JBKS__TIME1" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XBZZKQ_TIME1" HeaderText="#1下班终止考勤时间" SortExpression="XBZZKQ_TIME1" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SBRQCZ2" HeaderText="#2上班日期差值" SortExpression="SBRQCZ2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SB_TIME2" HeaderText="#2上班时间" SortExpression="SB_TIME2" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XBRQCZ2" HeaderText="#2下班日期差值" SortExpression="XBRQCZ2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XB_TIME2" HeaderText="#2下班时间" SortExpression="XB_TIME2" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SBKQKS_TIME2" HeaderText="#2上班考勤开始时间" SortExpression="SBKQKS_TIME2" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CDKS_TIME2" HeaderText="#2迟到开始时间" SortExpression="CDKS_TIME2" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YZCD_TIME2" HeaderText="#2严重迟到开始时间" SortExpression="YZCD_TIME2" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SBKG_TIME2" HeaderText="#2上班旷工开始时间" SortExpression="SBKG_TIME2" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XBKG_TIME2" HeaderText="#2下班旷工开始时间" SortExpression="XBKG_TIME2" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XBYZZTKS_TIME2" HeaderText="#2下班严重早退开始时间" SortExpression="XBYZZTKS_TIME2" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XBZTKS_TIME2" HeaderText="#2下班早退开始时间" SortExpression="XBZTKS_TIME2" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="JBKS__TIME2" HeaderText="#2加班开始时间" SortExpression="JBKS__TIME2" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XBZZKQ_TIME2" HeaderText="#2下班终止考勤时间" SortExpression="XBZZKQ_TIME2" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK" HeaderText="备注" SortExpression="REMARK"  ItemStyle-Width="150"></asp:BoundField>

                   </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
