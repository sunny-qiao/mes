<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdScxList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdScxList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>生产线</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmMesBdScxEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmMesBdScxEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
           
           <asp:ETitle runat="server" ID="pagetitle" Title="生产线"></asp:ETitle>
               
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
                        <td class="lbl">生产线编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Query="A.BH|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">生产线名</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" Query="A.NAME|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">生产线代码</td>
<td><asp:ETextBox runat="server" ID ="txtCode"  DataField="CODE" Query="A.CODE|string|like" Width="85%"></asp:ETextBox></td>

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


                      <asp:BoundField DataField="BH" HeaderText="生产线编号" SortExpression="BH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="NAME" HeaderText="生产线名" SortExpression="NAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CODE" HeaderText="生产线代码" SortExpression="CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SSCJ" HeaderText="所属车间" SortExpression="SSCJ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CJNSCX_CODE" HeaderText="车间内生产线代码" SortExpression="CJNSCX_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GX" HeaderText="班次1名" SortExpression="GX"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SCX_NAME1" HeaderText="该生产线班次1对应计件生产线名" SortExpression="SCX_NAME1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="JYSCX" HeaderText="班次2名" SortExpression="JYSCX"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SCX_NAME2" HeaderText="该生产线班次2对应计件生产线名" SortExpression="SCX_NAME2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="BC_NAME3" HeaderText="班次3名" SortExpression="BC_NAME3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SCX_NAME3" HeaderText="该生产线班次3对应计件生产线名" SortExpression="SCX_NAME3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GZ1_CODE" HeaderText="该生产线工种1" SortExpression="GZ1_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GZ2_CODE" HeaderText="该生产线工种2" SortExpression="GZ2_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GZ3_CODE" HeaderText="该生产线工种3" SortExpression="GZ3_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GZ4_CODE" HeaderText="该生产线工种4" SortExpression="GZ4_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GZ5_CODE" HeaderText="该生产线工种5" SortExpression="GZ5_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SXHD" HeaderText="默认砂箱厚度/cm(可变)" SortExpression="SXHD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SXGD" HeaderText="砂箱高度/cm(固定)" SortExpression="SXGD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SXKD" HeaderText="砂箱宽度/cm(固定)" SortExpression="SXKD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SXMD" HeaderText="砂箱密度kg/cm^3" SortExpression="SXMD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LLSSH" HeaderText="理论砂损耗百分比" SortExpression="LLSSH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LLTSSH" HeaderText="理论铁水损耗百分比" SortExpression="LLTSSH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="KYMJLX" HeaderText="可用模具类型" SortExpression="KYMJLX"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="KYMJLX1" HeaderText="优先使用模具类型1" SortExpression="KYMJLX1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="KYMJLX2" HeaderText="优先使用模具类型2" SortExpression="KYMJLX2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="KYMJLX3" HeaderText="优先使用模具类型3" SortExpression="KYMJLX3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL1" HeaderText="配料1名" SortExpression="PL1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL2" HeaderText="配料2名" SortExpression="PL2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL3" HeaderText="配料3名" SortExpression="PL3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL4" HeaderText="配料4名" SortExpression="PL4"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL5" HeaderText="配料5名" SortExpression="PL5"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL6" HeaderText="配料6名" SortExpression="PL6"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL7" HeaderText="配料7名" SortExpression="PL7"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL8" HeaderText="配料8名" SortExpression="PL8"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL1_PARAM" HeaderText="计算配料1用量使用参数" SortExpression="PL1_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL2_PARAM" HeaderText="计算配料2用量使用参数" SortExpression="PL2_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL3_PARAM" HeaderText="计算配料3用量使用参数" SortExpression="PL3_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL4_PARAM" HeaderText="计算配料4用量使用参数" SortExpression="PL4_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL5_PARAM" HeaderText="计算配料5用量使用参数" SortExpression="PL5_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL6_PARAM" HeaderText="计算配料6用量使用参数" SortExpression="PL6_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL7_PARAM" HeaderText="计算配料7用量使用参数" SortExpression="PL7_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL8_PARAM" HeaderText="计算配料8用量使用参数" SortExpression="PL8_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL1_DYCSBZ" HeaderText="配料1对应参数比值" SortExpression="PL1_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL2_DYCSBZ" HeaderText="配料2对应参数比值" SortExpression="PL2_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL3_DYCSBZ" HeaderText="配料3对应参数比值" SortExpression="PL3_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL4_DYCSBZ" HeaderText="配料4对应参数比值" SortExpression="PL4_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL5_DYCSBZ" HeaderText="配料5对应参数比值" SortExpression="PL5_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL6_DYCSBZ" HeaderText="配料6对应参数比值" SortExpression="PL6_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL7_DYCSBZ" HeaderText="配料7对应参数比值" SortExpression="PL7_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL8_DYCSBZ" HeaderText="配料8对应参数比值" SortExpression="PL8_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL1_CKCK" HeaderText="配料1默认出库仓库" SortExpression="PL1_CKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL2_CKCK" HeaderText="配料2默认出库仓库" SortExpression="PL2_CKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL3_CKCK" HeaderText="配料3默认出库仓库" SortExpression="PL3_CKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL4_CKCK" HeaderText="配料4默认出库仓库" SortExpression="PL4_CKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL5_CKCK" HeaderText="配料5默认出库仓库" SortExpression="PL5_CKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL6_CKCK" HeaderText="配料6默认出库仓库" SortExpression="PL6_CKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL7_CKCK" HeaderText="配料7默认出库仓库" SortExpression="PL7_CKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PL8_CKCK" HeaderText="配料8默认出库仓库" SortExpression="PL8_CKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP1" HeaderText="产品1名" SortExpression="CP1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP2" HeaderText="产品2名" SortExpression="CP2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP3" HeaderText="产品3名" SortExpression="CP3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP4" HeaderText="产品4名" SortExpression="CP4"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP5" HeaderText="产品5名" SortExpression="CP5"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP6" HeaderText="产品6名" SortExpression="CP6"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP7" HeaderText="产品7名" SortExpression="CP7"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP8" HeaderText="产品8名" SortExpression="CP8"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP1_PARAM" HeaderText="产品1使用参数" SortExpression="CP1_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP2_PARAM" HeaderText="产品2使用参数" SortExpression="CP2_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP3_PARAM" HeaderText="产品3使用参数" SortExpression="CP3_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP4_PARAM" HeaderText="产品4使用参数" SortExpression="CP4_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP5_PARAM" HeaderText="产品5使用参数" SortExpression="CP5_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP6_PARAM" HeaderText="产品6使用参数" SortExpression="CP6_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP7_PARAM" HeaderText="产品7使用参数" SortExpression="CP7_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP8_PARAM" HeaderText="产品8使用参数" SortExpression="CP8_PARAM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP1_DYCSBZ" HeaderText="产品1对应参数比值" SortExpression="CP1_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP2_DYCSBZ" HeaderText="产品2对应参数比值" SortExpression="CP2_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP3_DYCSBZ" HeaderText="产品3对应参数比值" SortExpression="CP3_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP4_DYCSBZ" HeaderText="产品4对应参数比值" SortExpression="CP4_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP5_DYCSBZ" HeaderText="产品5对应参数比值" SortExpression="CP5_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP6_DYCSBZ" HeaderText="产品6对应参数比值" SortExpression="CP6_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP7_DYCSBZ" HeaderText="产品7对应参数比值" SortExpression="CP7_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP8_DYCSBZ" HeaderText="产品8对应参数比值" SortExpression="CP8_DYCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP1_JSGS" HeaderText="产品1依配料计算公式" SortExpression="CP1_JSGS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP2_JSGS" HeaderText="产品2依配料计算公式" SortExpression="CP2_JSGS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP3_JSGS" HeaderText="产品3依配料计算公式" SortExpression="CP3_JSGS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP4_JSGS" HeaderText="产品4依配料计算公式" SortExpression="CP4_JSGS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP5_JSGS" HeaderText="产品5依配料计算公式" SortExpression="CP5_JSGS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP6_JSGS" HeaderText="产品6依配料计算公式" SortExpression="CP6_JSGS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP7_JSGS" HeaderText="产品7依配料计算公式" SortExpression="CP7_JSGS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP8_JSGS" HeaderText="产品8依配料计算公式" SortExpression="CP8_JSGS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP1_RKCK" HeaderText="产品1默认入库仓库" SortExpression="CP1_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP2_RKCK" HeaderText="产品2默认入库仓库" SortExpression="CP2_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP3_RKCK" HeaderText="产品3默认入库仓库" SortExpression="CP3_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP4_RKCK" HeaderText="产品4默认入库仓库" SortExpression="CP4_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP5_RKCK" HeaderText="产品5默认入库仓库" SortExpression="CP5_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP6_RKCK" HeaderText="产品6默认入库仓库" SortExpression="CP6_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP7_RKCK" HeaderText="产品7默认入库仓库" SortExpression="CP7_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CP8_RKCK" HeaderText="产品8默认入库仓库" SortExpression="CP8_RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK" HeaderText="备注" SortExpression="REMARK"  ItemStyle-Width="150"></asp:BoundField>

                   </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
