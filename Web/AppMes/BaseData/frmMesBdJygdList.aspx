<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdJygdList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdJygdList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>检验工段</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmMesBdJygdEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmMesBdJygdEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
           
           <asp:ETitle runat="server" ID="pagetitle" Title="检验工段"></asp:ETitle>
               
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
                        <td class="lbl">检验工段编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Query="A.BH|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">检验工段名</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" Query="A.NAME|string|like" Width="85%"></asp:ETextBox></td>
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

                        <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnEdit" Text="编辑" IsClient="true" Icon="edit" OnClientClick="editAction(this);" />
                                <asp:EButton runat="server" Icon="Delete" ID="btnDelete" Text="删除" IsClient="true" OnClientClick="return deleteAction(this);" CommandArgument='<%#Eval("GUID")%>' OnClick="btnDelete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>


                      <asp:BoundField DataField="BH" HeaderText="检验工段编号" SortExpression="BH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="NAME" HeaderText="检验工段名" SortExpression="NAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SJCJ" HeaderText="默认上级车间" SortExpression="SJCJ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CKCK" HeaderText="默认出库仓库" SortExpression="CKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="RKCK" HeaderText="默认成品入库仓库" SortExpression="RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP1" HeaderText="默认废品1" SortExpression="FP1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP1_RKCK" HeaderText="废品1入库仓库" SortExpression="FP1_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP1_CLJG" HeaderText="废品1处理结果" SortExpression="FP1_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP1_CLJG_RKCK" HeaderText="废品1处理结果入库仓库" SortExpression="FP1_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP2" HeaderText="默认废品2" SortExpression="FP2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP2_RKCK" HeaderText="废品2入库仓库" SortExpression="FP2_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP2_CLJG" HeaderText="废品2处理结果" SortExpression="FP2_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP2_CLJG_RKCK" HeaderText="废品2处理结果入库仓库" SortExpression="FP2_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP3" HeaderText="默认废品3" SortExpression="FP3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP3_RKCK" HeaderText="废品3入库仓库" SortExpression="FP3_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP3_CLJG" HeaderText="废品3处理结果" SortExpression="FP3_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP3_CLJG_RKCK" HeaderText="废品3处理结果入库仓库" SortExpression="FP3_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP4" HeaderText="默认废品4" SortExpression="FP4"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP4_RKCK" HeaderText="废品4入库仓库" SortExpression="FP4_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP4_CLJG" HeaderText="废品4处理结果" SortExpression="FP4_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP4_CLJG_RKCK" HeaderText="废品4处理结果入库仓库" SortExpression="FP4_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP5" HeaderText="默认废品5" SortExpression="FP5"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP5_RKCK" HeaderText="废品5入库仓库" SortExpression="FP5_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP5_CLJG" HeaderText="废品5处理结果" SortExpression="FP5_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP5_CLJG_RKCK" HeaderText="废品5处理结果入库仓库" SortExpression="FP5_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP6" HeaderText="默认废品6" SortExpression="FP6"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP6_RKCK" HeaderText="废品6入库仓库" SortExpression="FP6_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP6_CLJG" HeaderText="废品6处理结果" SortExpression="FP6_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP6_CLJG_RKCK" HeaderText="废品6处理结果入库仓库" SortExpression="FP6_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP7" HeaderText="默认废品7" SortExpression="FP7"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP7_RKCK" HeaderText="废品7入库仓库" SortExpression="FP7_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP7_CLJG" HeaderText="废品7处理结果" SortExpression="FP7_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP7_CLJG_RKCK" HeaderText="废品7处理结果入库仓库" SortExpression="FP7_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP8" HeaderText="默认废品8" SortExpression="FP8"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP8_RKCK" HeaderText="废品8入库仓库" SortExpression="FP8_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP8_CLJG" HeaderText="废品8处理结果" SortExpression="FP8_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP8_CLJG_RKCK" HeaderText="废品8处理结果入库仓库" SortExpression="FP8_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP9" HeaderText="默认废品9" SortExpression="FP9"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP9_RKCK" HeaderText="废品9入库仓库" SortExpression="FP9_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP9_CLJG" HeaderText="废品9处理结果" SortExpression="FP9_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP9_CLJG_RKCK" HeaderText="废品9处理结果入库仓库" SortExpression="FP9_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP10" HeaderText="默认废品10" SortExpression="FP10"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP10_RKCK" HeaderText="废品10入库仓库" SortExpression="FP10_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP10_CLJG" HeaderText="废品10处理结果" SortExpression="FP10_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP10_CLJG_RKCK" HeaderText="废品10处理结果入库仓库" SortExpression="FP10_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP11" HeaderText="默认废品11" SortExpression="FP11"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP11_RKCK" HeaderText="废品11入库仓库" SortExpression="FP11_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP11_CLJG" HeaderText="废品11处理结果" SortExpression="FP11_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP11_CLJG_RKCK" HeaderText="废品11处理结果入库仓库" SortExpression="FP11_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP12" HeaderText="默认废品12" SortExpression="FP12"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP12_RKCK" HeaderText="废品12入库仓库" SortExpression="FP12_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP12_CLJG" HeaderText="废品12处理结果" SortExpression="FP12_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP12_CLJG_RKCK" HeaderText="废品12处理结果入库仓库" SortExpression="FP12_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP13" HeaderText="默认废品13" SortExpression="FP13"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP13_RKCK" HeaderText="废品13入库仓库" SortExpression="FP13_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP13_CLJG" HeaderText="废品13处理结果" SortExpression="FP13_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP13_CLJG_RKCK" HeaderText="废品13处理结果入库仓库" SortExpression="FP13_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP14" HeaderText="默认废品14" SortExpression="FP14"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP14_RKCK" HeaderText="废品14入库仓库" SortExpression="FP14_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP14_CLJG" HeaderText="废品14处理结果" SortExpression="FP14_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP14_CLJG_RKCK" HeaderText="废品14处理结果入库仓库" SortExpression="FP14_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP15" HeaderText="默认废品15" SortExpression="FP15"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP15_RKCK" HeaderText="废品15入库仓库" SortExpression="FP15_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP15_CLJG" HeaderText="废品15处理结果" SortExpression="FP15_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP15_CLJG_RKCK" HeaderText="废品15处理结果入库仓库" SortExpression="FP15_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP16" HeaderText="默认废品16" SortExpression="FP16"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP16_RKCK" HeaderText="废品16入库仓库" SortExpression="FP16_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP16_CLJG" HeaderText="废品16处理结果" SortExpression="FP16_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP16_CLJG_RKCK" HeaderText="废品16处理结果入库仓库" SortExpression="FP16_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP17" HeaderText="默认废品17" SortExpression="FP17"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP17_RKCK" HeaderText="废品17入库仓库" SortExpression="FP17_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP17_CLJG" HeaderText="废品17处理结果" SortExpression="FP17_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP17_CLJG_RKCK" HeaderText="废品17处理结果入库仓库" SortExpression="FP17_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP18" HeaderText="默认废品18" SortExpression="FP18"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP18_RKCK" HeaderText="废品18入库仓库" SortExpression="FP18_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP18_CLJG" HeaderText="废品18处理结果" SortExpression="FP18_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP18_CLJG_RKCK" HeaderText="废品18处理结果入库仓库" SortExpression="FP18_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP19" HeaderText="默认废品19" SortExpression="FP19"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP19_RKCK" HeaderText="废品19入库仓库" SortExpression="FP19_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP19_CLJG" HeaderText="废品19处理结果" SortExpression="FP19_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP19_CLJG_RKCK" HeaderText="废品19处理结果入库仓库" SortExpression="FP19_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP20" HeaderText="默认废品20" SortExpression="FP20"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP20_RKCK" HeaderText="废品20入库仓库" SortExpression="FP20_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP20_CLJG" HeaderText="废品20处理结果" SortExpression="FP20_CLJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FP20_CLJG_RKCK" HeaderText="废品20处理结果入库仓库" SortExpression="FP20_CLJG_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK" HeaderText="备注" SortExpression="REMARK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CREATE_USER" HeaderText="" SortExpression="CREATE_USER"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CREATE_USER_NAME" HeaderText="" SortExpression="CREATE_USER_NAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CREATE_DATE" HeaderText="" SortExpression="CREATE_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="UPDATE_USER" HeaderText="" SortExpression="UPDATE_USER"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="UPDATE_USER_NAME" HeaderText="" SortExpression="UPDATE_USER_NAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="UPDATE_DATE" HeaderText="" SortExpression="UPDATE_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="COMPANY_CODE" HeaderText="" SortExpression="COMPANY_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="COMPANY_NAME" HeaderText="" SortExpression="COMPANY_NAME"  ItemStyle-Width="150"></asp:BoundField>

                   </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
