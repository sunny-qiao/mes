<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdGysList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdGysList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>供应商/客户</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmMesBdGysEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmMesBdGysEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
           
           <asp:ETitle runat="server" ID="pagetitle" Title="供应商/客户"></asp:ETitle>
               
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
                        <td class="lbl">供应商/客户编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Query="A.BH|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">供应商/客户名</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" Query="A.NAME|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">供应商/客户全名</td>
<td><asp:ETextBox runat="server" ID ="txtFullName"  DataField="FULL_NAME" Query="A.FULL_NAME|string|like" Width="85%"></asp:ETextBox></td>

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


                      <asp:BoundField DataField="BH" HeaderText="供应商/客户编号" SortExpression="BH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="NAME" HeaderText="供应商/客户名" SortExpression="NAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="FULL_NAME" HeaderText="供应商/客户全名" SortExpression="FULL_NAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LXR1" HeaderText="联系人1" SortExpression="LXR1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LXDH1" HeaderText="联系电话1" SortExpression="LXDH1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LXR2" HeaderText="联系人2" SortExpression="LXR2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LXDH2" HeaderText="联系电话2" SortExpression="LXDH2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LXR3" HeaderText="联系人3" SortExpression="LXR3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LXDH3" HeaderText="联系电话3" SortExpression="LXDH3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LXR4" HeaderText="联系人4" SortExpression="LXR4"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LXDH4" HeaderText="联系电话4" SortExpression="LXDH4"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LXR5" HeaderText="联系人5" SortExpression="LXR5"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LXDH5" HeaderText="联系电话5" SortExpression="LXDH5"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="RATE" HeaderText="税率(%)" SortExpression="RATE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="COUNTRY" HeaderText="所属国家" SortExpression="COUNTRY"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PROVINCE" HeaderText="所属省份" SortExpression="PROVINCE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CITY" HeaderText="所属城市" SortExpression="CITY"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ADDRESS" HeaderText="地址" SortExpression="ADDRESS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="IS_QYXE" HeaderText="是否启用限额" SortExpression="IS_QYXE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="XE" HeaderText="限额(应收款限额为正,应付款限额为负)" SortExpression="XE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK" HeaderText="备注" SortExpression="REMARK"  ItemStyle-Width="150"></asp:BoundField>

                   </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
