<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdGdzcList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdGdzcList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>固定资产/设备</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmMesBdGdzcEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmMesBdGdzcEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
           
           <asp:ETitle runat="server" ID="pagetitle" Title="固定资产/设备"></asp:ETitle>
               
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
                        <td class="lbl">固定资产/设备编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Query="A.BH|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">固定资产/设备名</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" Query="A.NAME|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">对应物料名</td>
<td><asp:EChoose runat="server" ID ="txtWl"  DataField="WL" Query="A.WL|string|like" ECIType="WL" Width="85%"></asp:EChoose></td>

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


                      <asp:BoundField DataField="BH" HeaderText="固定资产/设备编号" SortExpression="BH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="NAME" HeaderText="固定资产/设备名" SortExpression="NAME"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="WL" HeaderText="对应物料名" SortExpression="WL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZJFS" HeaderText="增加方式" SortExpression="ZJFS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GHR" HeaderText="供货人" SortExpression="GHR"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GGXH" HeaderText="规格型号" SortExpression="GGXH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZZCS" HeaderText="制造厂商" SortExpression="ZZCS"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZZCS_TEL" HeaderText="制造厂商联系方式" SortExpression="ZZCS_TEL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZZHM" HeaderText="制造号码" SortExpression="ZZHM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZZRQ" HeaderText="制造日期" SortExpression="ZZRQ" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GZRQ" HeaderText="购置日期" SortExpression="GZRQ" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LRRQ" HeaderText="录入日期" SortExpression="LRRQ" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LRR" HeaderText="录入人" SortExpression="LRR"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="TYRQ" HeaderText="停用日期" SortExpression="TYRQ" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZXRQ" HeaderText="注销日期" SortExpression="ZXRQ" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZXYY" HeaderText="注销原因" SortExpression="ZXYY"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="KSSYRQ" HeaderText="开始使用日期" SortExpression="KSSYRQ" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="UNIT" HeaderText="计量单位" SortExpression="UNIT"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="QTY" HeaderText="个数" SortExpression="QTY"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DGL" HeaderText="电功率/W" SortExpression="DGL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SBLB" HeaderText="固定资产/设备类别" SortExpression="SBLB"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PRICE" HeaderText="单价" SortExpression="PRICE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YZ" HeaderText="原值" SortExpression="YZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YJJCZ" HeaderText="预计净残值" SortExpression="YJJCZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="JCZL" HeaderText="净残值率" SortExpression="JCZL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YJZZJE" HeaderText="预计总折旧额" SortExpression="YJZZJE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YJZZJL" HeaderText="预计总折旧率" SortExpression="YJZZJL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YJSYSM" HeaderText="预计使用寿命" SortExpression="YJSYSM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YJNSZH" HeaderText="预计使用寿命的年数总和" SortExpression="YJNSZH"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZJFF" HeaderText="折旧方法" SortExpression="ZJFF"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YJSCX" HeaderText="预计工作量对应生产线" SortExpression="YJSCX"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YJGZL" HeaderText="预计工作量" SortExpression="YJGZL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YJGZL_UNIT" HeaderText="预计工作量对应单位" SortExpression="YJGZL_UNIT"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DWGZLZJE" HeaderText="单位工作量折旧额" SortExpression="DWGZLZJE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DYYSCZGL" HeaderText="对应已生产工作量" SortExpression="DYYSCZGL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="GZLJSZZJE" HeaderText="工作量计算总折旧额" SortExpression="GZLJSZZJE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="SCJZRQ" HeaderText="上次结账日期" SortExpression="SCJZRQ" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DQQSRQ" HeaderText="当期起始日期对应折旧年份值" SortExpression="DQQSRQ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="QSRQDY" HeaderText="起始日期对应折旧年份年折旧额" SortExpression="QSRQDY"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DQZZRQDY" HeaderText="当期终止日期对应折旧年份值" SortExpression="DQZZRQDY"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="ZZRQDY" HeaderText="终止日期对应折旧年份年折旧额" SortExpression="ZZRQDY"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="BZQZJE" HeaderText="本账期折旧额/当月折旧额" SortExpression="BZQZJE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DYZJL" HeaderText="当月折旧率" SortExpression="DYZJL"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YZJE" HeaderText="日折旧额" SortExpression="YZJE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YJTNF" HeaderText="已计提年份" SortExpression="YJTNF"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YJTYF" HeaderText="已计提月份" SortExpression="YJTYF"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="YJZNFZJE" HeaderText="该固定资产/设备已结账年份折旧额" SortExpression="YJZNFZJE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="LJZJ" HeaderText="累计折旧" SortExpression="LJZJ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="JZ" HeaderText="净值" SortExpression="JZ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="DYZJKM" HeaderText="对应折旧科目" SortExpression="DYZJKM"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CFDD" HeaderText="存放地点" SortExpression="CFDD"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="JZMJ" HeaderText="建筑面积/m^2" SortExpression="JZMJ"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="CSJG" HeaderText="出售价格" SortExpression="CSJG"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="PYKE" HeaderText="盘盈/亏额" SortExpression="PYKE"  ItemStyle-Width="150"></asp:BoundField>
                      <asp:BoundField DataField="REMARK" HeaderText="备注" SortExpression="REMARK"  ItemStyle-Width="150"></asp:BoundField>

                   </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
