<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdMjList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdMjList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>模具</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmMesBdMjEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmMesBdMjEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
           
           <asp:ETitle runat="server" ID="pagetitle" Title="模具"></asp:ETitle>
               
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
                        <td class="lbl">模具编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Query="A.BH|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">模具名</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" Query="A.NAME|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">所属模具类型</td>
<td><asp:EChoose runat="server" ID ="txtSsmjlx"  DataField="SSMJLX" Query="A.SSMJLX|string|like" ECIType="MJLX" Width="85%"></asp:EChoose></td>

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


                      <asp:BoundField DataField="BH" HeaderText="模具编号" SortExpression="BH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="NAME" HeaderText="模具名" SortExpression="NAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SSMJLX" HeaderText="所属模具类型" SortExpression="SSMJLX"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GYS" HeaderText="模具供应商" SortExpression="GYS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SCRQ" HeaderText="模具生产日期" SortExpression="SCRQ" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DQDM" HeaderText="模具设备读取代码" SortExpression="DQDM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SLT" HeaderText="模具缩略图" SortExpression="SLT"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TXM" HeaderText="模具条形码" SortExpression="TXM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="EWM" HeaderText="模具二维码" SortExpression="EWM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SLT_PATH" HeaderText="模具缩略图" SortExpression="SLT_PATH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TXM_PATH" HeaderText="模具条形码" SortExpression="TXM_PATH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="EWM_PATH" HeaderText="模具二维码" SortExpression="EWM_PATH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DYMJLX" HeaderText="对应模具类型" SortExpression="DYMJLX"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GX" HeaderText="模具默认工序" SortExpression="GX"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CGJG" HeaderText="模具采购价格" SortExpression="CGJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CBTXSCXS" HeaderText="成本摊销生产箱数/次数" SortExpression="CBTXSCXS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CJTCB" HeaderText="次均摊成本" SortExpression="CJTCB"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="JMXTZ" HeaderText="模具浇冒系统重/kg" SortExpression="JMXTZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SYCPZZ" HeaderText="所有产品总重/kg" SortExpression="SYCPZZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZTSYL" HeaderText="总铁水用量/kg" SortExpression="ZTSYL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CPL" HeaderText="出品率/%" SortExpression="CPL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="BZDCSCGS" HeaderText="标准单次生产工时/s" SortExpression="BZDCSCGS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DGL" HeaderText="模具电功率/w" SortExpression="DGL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="BZGSSCCS" HeaderText="标准工时生产次数" SortExpression="BZGSSCCS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK" HeaderText="备注" SortExpression="REMARK"  ItemStyle-Width="150"></asp:BoundField>

                   </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
