<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdWlList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdWlList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>物料</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmMesBdWlEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmMesBdWlEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
           
           <asp:ETitle runat="server" ID="pagetitle" Title="物料"></asp:ETitle>
               
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
                        <td class="lbl">物料编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Query="A.BH|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">外购物料名</td>
<td><asp:ETextBox runat="server" ID ="txtWgName"  DataField="WG_NAME" Query="A.WG_NAME|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">物料全名</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" Query="A.NAME|string|like" Width="85%"></asp:ETextBox></td>

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


                      <asp:BoundField DataField="BH" HeaderText="物料编号" SortExpression="BH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="WLSX_CODE" HeaderText="物料属性" SortExpression="WLSX_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="WLQZPL_CODE" HeaderText="物料前置品类" SortExpression="WLQZPL_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="WLPL_CODE" HeaderText="物料品类" SortExpression="WLPL_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="WG_NAME" HeaderText="外购物料名" SortExpression="WG_NAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="NAME" HeaderText="物料全名" SortExpression="NAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CODE" HeaderText="物料代码" SortExpression="CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="EN_NAME" HeaderText="物料英文名" SortExpression="EN_NAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TJLB1" HeaderText="统计类别1" SortExpression="TJLB1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TJLB2" HeaderText="统计类别2" SortExpression="TJLB2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TJLB3" HeaderText="统计类别3" SortExpression="TJLB3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TJLB4" HeaderText="统计类别4" SortExpression="TJLB4"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DZ" HeaderText="单重/kg" SortExpression="DZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DZJD" HeaderText="单重精度" SortExpression="DZJD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CD" HeaderText="长度/m" SortExpression="CD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CDJD" HeaderText="长度精度" SortExpression="CDJD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="MJ" HeaderText="面积/m^2" SortExpression="MJ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="MJJD" HeaderText="面积精度" SortExpression="MJJD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TJ" HeaderText="体积/m^3" SortExpression="TJ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TJJD" HeaderText="体积精度" SortExpression="TJJD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="UNIT" HeaderText="基本计量单位" SortExpression="UNIT"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="UNIT_JD" HeaderText="基本计量单位输入精度" SortExpression="UNIT_JD"  ItemStyle-Width="150"></asp:BoundField>
<%--                      <asp:BoundField DataField="FZ_UNIT1" HeaderText="辅助计量单位1" SortExpression="FZ_UNIT1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FZ_UNIT1_RATE" HeaderText="辅助计量单位1对基本计量单位换算率" SortExpression="FZ_UNIT1_RATE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FZ_UNIT1_JD" HeaderText="辅助计量单位1输入精度" SortExpression="FZ_UNIT1_JD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FZ_UNIT2" HeaderText="辅助计量单位2" SortExpression="FZ_UNIT2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FZ_UNIT2_RATE" HeaderText="辅助计量单位2对基本计量单位换算率" SortExpression="FZ_UNIT2_RATE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FZ_UNIT2_JD" HeaderText="辅助计量单位2输入精度" SortExpression="FZ_UNIT2_JD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FZ_UNIT3" HeaderText="辅助计量单位3" SortExpression="FZ_UNIT3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FZ_UNIT3_RATE" HeaderText="辅助计量单位3对基本计量单位换算率" SortExpression="FZ_UNIT3_RATE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FZ_UNIT3_JD" HeaderText="辅助计量单位3输入精度" SortExpression="FZ_UNIT3_JD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FZ_UNIT4" HeaderText="辅助计量单位4" SortExpression="FZ_UNIT4"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FZ_UNIT4_RATE" HeaderText="辅助计量单位4对基本计量单位换算率" SortExpression="FZ_UNIT4_RATE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FZ_UNIT4_JD" HeaderText="辅助计量单位4输入精度" SortExpression="FZ_UNIT4_JD"  ItemStyle-Width="150"></asp:BoundField>--%>
                      <asp:BoundField DataField="RK_WAREHOUSE" HeaderText="默认入库仓库" SortExpression="RK_WAREHOUSE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SCBM" HeaderText="默认生成部门/来源" SortExpression="SCBM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZDKC" HeaderText="最低库存量" SortExpression="ZDKC"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DKC" HeaderText="低库存量" SortExpression="DKC"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZCKC" HeaderText="正常库存量" SortExpression="ZCKC"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZGKC" HeaderText="最高库存量" SortExpression="ZGKC"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="STATUS" HeaderText="使用状态" SortExpression="STATUS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="IS_SB" HeaderText="是否为设备" SortExpression="IS_SB"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PRICE" HeaderText="采购单价" SortExpression="PRICE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PRICE_JD" HeaderText="单价精度" SortExpression="PRICE_JD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PRICE_CG" HeaderText="平均采购单价" SortExpression="PRICE_CG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CH_CODE" HeaderText="存货科目代码" SortExpression="CH_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XSSR_CODE" HeaderText="销售收入科目代码" SortExpression="XSSR_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SXCB_CODE" HeaderText="销售成本科目代码" SortExpression="SXCB_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CBCY_CODE" HeaderText="成本差异科目代码" SortExpression="CBCY_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DGWZKM" HeaderText="代管物质科目" SortExpression="DGWZKM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="RATE" HeaderText="税率(%)" SortExpression="RATE"  ItemStyle-Width="150"></asp:BoundField>
                        <asp:ETemplateField HeaderText="物料缩略图" DataField="PIC1" ItemStyle-Width="150">
                            <ItemTemplate>
                                <a href="javascript:void(0);" onclick="eci.open('../../Upload/CpPic1/<%#Eval("PIC1") %>') "><%#Eval("PIC1") %></a>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField HeaderText="物料条形码" DataField="PIC2" ItemStyle-Width="150">
                            <ItemTemplate>
                                <a href="javascript:void(0);" onclick="eci.open('../../Upload/CpPIC2/<%#Eval("PIC2") %>') "><%#Eval("PIC2") %></a>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField HeaderText="物料二维码" DataField="PIC3" ItemStyle-Width="150">
                            <ItemTemplate>
                                <a href="javascript:void(0);" onclick="eci.open('../../Upload/CpPIC3/<%#Eval("PIC3") %>') "><%#Eval("PIC3") %></a>
                            </ItemTemplate>
                        </asp:ETemplateField>
<%--                        <asp:ETemplateField HeaderText="产品照片4" DataField="PIC4" ItemStyle-Width="150">
                            <ItemTemplate>
                                <a href="javascript:void(0);" onclick="eci.open('../../Upload/CpPIC4/<%#Eval("PIC4") %>') "><%#Eval("PIC4") %></a>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField HeaderText="产品照片5" DataField="PIC5" ItemStyle-Width="150">
                            <ItemTemplate>
                                <a href="javascript:void(0);" onclick="eci.open('../../Upload/CpPIC5/<%#Eval("PIC5") %>') "><%#Eval("PIC5") %></a>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField HeaderText="产品照片6" DataField="PIC6" ItemStyle-Width="150">
                            <ItemTemplate>
                                <a href="javascript:void(0);" onclick="eci.open('../../Upload/CpPIC6/<%#Eval("PIC6") %>') "><%#Eval("PIC6") %></a>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField HeaderText="产品照片7" DataField="PIC7" ItemStyle-Width="150">
                            <ItemTemplate>
                                <a href="javascript:void(0);" onclick="eci.open('../../Upload/CpPIC7/<%#Eval("PIC7") %>') "><%#Eval("PIC7") %></a>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField HeaderText="产品照片8" DataField="PIC8" ItemStyle-Width="150">
                            <ItemTemplate>
                                <a href="javascript:void(0);" onclick="eci.open('../../Upload/CpPIC8/<%#Eval("PIC8") %>') "><%#Eval("PIC8") %></a>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField HeaderText="产品照片9" DataField="PIC9" ItemStyle-Width="150">
                            <ItemTemplate>
                                <a href="javascript:void(0);" onclick="eci.open('../../Upload/CpPIC9/<%#Eval("PIC9") %>') "><%#Eval("PIC9") %></a>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField HeaderText="产品照片10" DataField="PIC10" ItemStyle-Width="150">
                            <ItemTemplate>
                                <a href="javascript:void(0);" onclick="eci.open('../../Upload/CpPic10/<%#Eval("PIC10") %>') "><%#Eval("PIC10") %></a>
                            </ItemTemplate>
                        </asp:ETemplateField>
                      <asp:BoundField DataField="TXM" HeaderText="产品条形码" SortExpression="TXM"  ItemStyle-Width="150"></asp:BoundField>
                        <asp:ETemplateField HeaderText="附件1" DataField="FILE1" ItemStyle-Width="150">
                            <ItemTemplate>
                                <a href="javascript:void(0);" onclick="eci.open('../../Upload/CpFile1/<%#Eval("FILE1") %>') "><%#Eval("FILE1") %></a>
                            </ItemTemplate>
                        </asp:ETemplateField>--%>
                   </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
