<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdScxBcTqyjlList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdScxBcTqyjlList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>生产线子表-班次设置子表-停启用记录</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmMesBdScxBcTqyjlEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmMesBdScxBcTqyjlEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
           
           <asp:ETitle runat="server" ID="pagetitle" Title="生产线子表-班次设置子表-停启用记录"></asp:ETitle>
               
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
                        <td class="lbl">对应班次名</td>
<td><asp:ETextBox runat="server" ID ="txtBcm"  DataField="BCM" Query="A.BCM|string|like" Width="85%"></asp:ETextBox></td>
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
                      <asp:BoundField DataField="BCM" HeaderText="对应班次名" SortExpression="BCM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="QY_DATE" HeaderText="启用日期" SortExpression="QY_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TY_DATE" HeaderText="停用日期" SortExpression="TY_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="QY_YY" HeaderText="启用原因" SortExpression="QY_YY"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TY_YY" HeaderText="停用原因" SortExpression="TY_YY"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK" HeaderText="备注" SortExpression="REMARK"  ItemStyle-Width="150"></asp:BoundField>

                   </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
