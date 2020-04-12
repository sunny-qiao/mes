<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdGdzcZjfftList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdGdzcZjfftList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>固定资产/设备子表-折旧费分摊详录</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmMesBdGdzcZjfftEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmMesBdGdzcZjfftEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
           
           <asp:ETitle runat="server" ID="pagetitle" Title="固定资产/设备子表-折旧费分摊详录"></asp:ETitle>
               
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
                        <td class="lbl">编码(折旧年号)</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Query="A.BH|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">折旧天数</td>
<td><asp:ETextBox runat="server" ID ="txtZjts"  DataField="ZJTS" Query="A.ZJTS|string|like" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">尚可使用寿命/年</td>
<td><asp:ETextBox runat="server" ID ="txtSksysm"  DataField="SKSYSM" Query="A.SKSYSM|string|like" IsFloat="true" Width="85%"></asp:ETextBox></td>

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


                      <asp:BoundField DataField="BH" HeaderText="编码(折旧年号)" SortExpression="BH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="QSRQ" HeaderText="起始日期" SortExpression="QSRQ" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZZRQ" HeaderText="终止日期" SortExpression="ZZRQ" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZJTS" HeaderText="折旧天数" SortExpression="ZJTS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SKSYSM" HeaderText="尚可使用寿命/年" SortExpression="SKSYSM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZH_NZJL" HeaderText="年数总和法-年折旧率" SortExpression="ZH_NZJL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZH_NCZMJZ" HeaderText="年数总和法-年初固定资产账面价值" SortExpression="ZH_NCZMJZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZH_LLSYZJL" HeaderText="年数总和法-年初理论剩余折旧率" SortExpression="ZH_LLSYZJL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZH_NZJLQZ" HeaderText="年数总和法-年折旧率取值" SortExpression="ZH_NZJLQZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZH_NCSYZJL" HeaderText="年数总和法-年初剩余折旧率" SortExpression="ZH_NCSYZJL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZH_NZJE" HeaderText="年数总额合法-年折旧额" SortExpression="ZH_NZJE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PJ_NZJL" HeaderText="年限平均法-年折旧率" SortExpression="PJ_NZJL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PJ_NCZMJZ" HeaderText="年限平均法-年初固定资产账面价值" SortExpression="PJ_NCZMJZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PJ_LLSYZJL" HeaderText="年限平均法-年初理论剩余折旧率" SortExpression="PJ_LLSYZJL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PJ_NZJLQZ" HeaderText="年限平均法-年折旧率取值" SortExpression="PJ_NZJLQZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PJ_NCSYZJL" HeaderText="年限平均法-年初剩余折旧率" SortExpression="PJ_NCSYZJL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PJ_NZJE" HeaderText="年限平均法-年折旧额" SortExpression="PJ_NZJE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SB_NZJL" HeaderText="双倍余额递减法-年折旧率" SortExpression="SB_NZJL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SB_NCZMJZ" HeaderText="双倍余额递减法-年初固定资产账面价值" SortExpression="SB_NCZMJZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SB_LLSYZJL" HeaderText="双倍余额递减法-年初理论剩余折旧率" SortExpression="SB_LLSYZJL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SB_NZJLQZ" HeaderText="双倍余额递减法-年折旧率取值" SortExpression="SB_NZJLQZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SB_NCSYZJL" HeaderText="双倍余额递减法-年初剩余折旧率" SortExpression="SB_NCSYZJL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SB_NZJE" HeaderText="年数总额法-年折旧额" SortExpression="SB_NZJE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="NCZMJZ" HeaderText="年初账面价值" SortExpression="NCZMJZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="NCZJL" HeaderText="年初折旧率" SortExpression="NCZJL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="NZJE" HeaderText="年折旧额" SortExpression="NZJE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="NZJL" HeaderText="年折旧率" SortExpression="NZJL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YJZJE" HeaderText="月均折旧额" SortExpression="YJZJE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK" HeaderText="备注" SortExpression="REMARK"  ItemStyle-Width="150"></asp:BoundField>

                   </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
