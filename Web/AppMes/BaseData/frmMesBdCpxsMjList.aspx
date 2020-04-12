<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdCpxsMjList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdCpxsMjList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>产品型式子表-模具使用设置</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmMesBdCpxsMjEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmMesBdCpxsMjEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
           
           <asp:ETitle runat="server" ID="pagetitle" Title="产品型式子表-模具使用设置"></asp:ETitle>
               
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
                        <td class="lbl">产品型式</td>
<td><asp:EChoose runat="server" ID ="txtCpxs"  DataField="CPXS" Query="A.CPXS|string|like" ECIType="CPXS" Width="85%"></asp:EChoose></td>
                        <td class="lbl">使用工序</td>
<td><asp:EChoose runat="server" ID ="txtGx"  DataField="GX" Query="A.GX|string|like" ECIType="GX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">使用生产线</td>
<td><asp:EChoose runat="server" ID ="txtScx"  DataField="SCX" Query="A.SCX|string|like" ECIType="SCX" Width="85%"></asp:EChoose></td>

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


                      <asp:BoundField DataField="CPXS" HeaderText="产品型式" SortExpression="CPXS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="BH" HeaderText="编号" SortExpression="BH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GX" HeaderText="使用工序" SortExpression="GX"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SCX" HeaderText="使用生产线" SortExpression="SCX"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="MJBH" HeaderText="优先使用模具编号" SortExpression="MJBH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="MJM" HeaderText="优先使用模具名" SortExpression="MJM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GS" HeaderText="该模具单次生产本产品型式个数" SortExpression="GS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK" HeaderText="备注" SortExpression="REMARK"  ItemStyle-Width="150"></asp:BoundField>

                   </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
