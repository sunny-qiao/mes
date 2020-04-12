<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdWlplList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdWlplList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>物料品类</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmMesBdWlplEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmMesBdWlplEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
           
           <asp:ETitle runat="server" ID="pagetitle" Title="物料品类"></asp:ETitle>
               
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
                        <td class="lbl">物料品类编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Query="A.BH|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">物料品类全名</td>
<td><asp:ETextBox runat="server" ID ="txtQname"  DataField="QNAME" Query="A.QNAME|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">物料品类代码</td>
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


                      <asp:BoundField DataField="BH" HeaderText="物料品类编号" SortExpression="BH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SB_CODE" HeaderText="商标" SortExpression="SB_CODE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="NAME" HeaderText="物料品类名" SortExpression="NAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="QNAME" HeaderText="物料品类全名" SortExpression="QNAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CODE" HeaderText="物料品类代码" SortExpression="CODE"  ItemStyle-Width="150"></asp:BoundField>
<%--                      <asp:BoundField DataField="CPXS1" HeaderText="对应产品型式1" SortExpression="CPXS1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CPXS1_LEVEL" HeaderText="产品型式1优先级别" SortExpression="CPXS1_LEVEL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK1" HeaderText="产品型式1备注" SortExpression="REMARK1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CPXS2" HeaderText="对应产品型式2" SortExpression="CPXS2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CPXS2_LEVEL" HeaderText="产品型式2优先级别" SortExpression="CPXS2_LEVEL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK2" HeaderText="产品型式2备注" SortExpression="REMARK2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CPXS3" HeaderText="对应产品型式3" SortExpression="CPXS3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CPXS3_LEVEL" HeaderText="产品型式3优先级别" SortExpression="CPXS3_LEVEL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK3" HeaderText="产品型式3备注" SortExpression="REMARK3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TJLB1" HeaderText="统计类别1" SortExpression="TJLB1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TJLB2" HeaderText="统计类别2" SortExpression="TJLB2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TJLB3" HeaderText="统计类别3" SortExpression="TJLB3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TJLB4" HeaderText="统计类别4" SortExpression="TJLB4"  ItemStyle-Width="150"></asp:BoundField>--%>
                      <asp:BoundField DataField="REMARK" HeaderText="备注" SortExpression="REMARK"  ItemStyle-Width="150"></asp:BoundField>

                   </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
