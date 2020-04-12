<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdZyStatusList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdZyStatusList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>职员子表-职员工种及状态</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmMesBdZyStatusEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmMesBdZyStatusEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
           
           <asp:ETitle runat="server" ID="pagetitle" Title="职员子表-职员工种及状态"></asp:ETitle>
               
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
                        <td class="lbl">职员</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" Query="A.NAME|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">所属车间</td>
<td><asp:EChoose runat="server" ID ="txtSscj"  DataField="SSCJ" Query="A.SSCJ|string|like" ECIType="MES_BD_DEPT" Width="85%"></asp:EChoose></td>
                        <td class="lbl">所属生产线</td>
<td><asp:EChoose runat="server" ID ="txtSscscx"  DataField="SSCSCX" Query="A.SSCSCX|string|like" ECIType="MES_BD_SCX" Width="85%"></asp:EChoose></td>

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


                      <asp:BoundField DataField="FGUID" HeaderText="MES_BD_ZY.GUID" SortExpression="FGUID"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="NAME" HeaderText="职员" SortExpression="NAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="RZ_DATE" HeaderText="入职日期" SortExpression="RZ_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LZ_DATE" HeaderText="离职/转岗日期" SortExpression="LZ_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SSCJ" HeaderText="所属车间" SortExpression="SSCJ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SSCSCX" HeaderText="所属生产线" SortExpression="SSCSCX"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZW" HeaderText="职务" SortExpression="ZW"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GZ" HeaderText="工种" SortExpression="GZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SSBZ" HeaderText="所属班组" SortExpression="SSBZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GZJJGZBL" HeaderText="工种计件工资比例" SortExpression="GZJJGZBL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK" HeaderText="备注" SortExpression="REMARK"  ItemStyle-Width="150"></asp:BoundField>

                   </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
