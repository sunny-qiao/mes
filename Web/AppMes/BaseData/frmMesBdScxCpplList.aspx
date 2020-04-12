<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdScxCpplList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdScxCpplList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>生产线子表-产品及配料设置</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmMesBdScxCpplEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmMesBdScxCpplEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
           
           <asp:ETitle runat="server" ID="pagetitle" Title="生产线子表-产品及配料设置"></asp:ETitle>
               
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
                        <td class="lbl">生产线</td>
<td><asp:EChoose runat="server" ID ="txtScx"  DataField="SCX" Query="A.SCX|string|like" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Query="A.BH|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品/配料名</td>
<td><asp:EChoose runat="server" ID ="txtCpm"  DataField="CPM" Query="A.CPM|string|like" ECIType="WL" Width="85%"></asp:EChoose></td>

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


                      <asp:BoundField DataField="SCX" HeaderText="生产线" SortExpression="SCX"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="BH" HeaderText="编号" SortExpression="BH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CPM" HeaderText="产品/配料名" SortExpression="CPM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YSCSJYLCS" HeaderText="依生产数据用量参数" SortExpression="YSCSJYLCS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GCSBZ" HeaderText="该参数比值" SortExpression="GCSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YCPJS1" HeaderText="依产品/配料1计算" SortExpression="YCPJS1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YCPJSBZ1" HeaderText="依产品/配料1计算比值" SortExpression="YCPJSBZ1"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YCPJS2" HeaderText="依产品/配料2计算" SortExpression="YCPJS2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YCPJSBZ2" HeaderText="依产品/配料2计算比值" SortExpression="YCPJSBZ2"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YCPJS3" HeaderText="依产品/配料3计算" SortExpression="YCPJS3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YCPJSBZ3" HeaderText="依产品/配料3计算比值" SortExpression="YCPJSBZ3"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YCPJS4" HeaderText="依产品/配料4计算" SortExpression="YCPJS4"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YCPJSBZ4" HeaderText="依产品/配料4计算比值" SortExpression="YCPJSBZ4"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CKCK" HeaderText="默认出库仓库" SortExpression="CKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="RKCK" HeaderText="默认入库仓库" SortExpression="RKCK"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK" HeaderText="备注" SortExpression="REMARK"  ItemStyle-Width="150"></asp:BoundField>

                   </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
