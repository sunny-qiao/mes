<%@ page language="C#" autoeventwireup="true" inherits="AppSpeed_ConfigManage_frmEciOperHisList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>操作历史</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
     

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
             
            <div id="toolbar">

                <div style="float: left; line-height: 30px; margin-right: 5px;">单号:</div>
                <div style="float: left">
                    <asp:ETextBox runat="server" ID="txtBizNo" Width="400px"></asp:ETextBox>

                    <asp:EButton runat="server" ID="btnSearch" Text="刷新" Icon="refresh" />
                    <asp:EButton runat="server" ID="btnExport" Text="导出EXCEL" Icon="excel" OnClick="btnExport_Click" CancelLoading="true" />
                </div>






            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,30" runat="server" BorderStyle="None" EnableDblClick="true"
                    FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="true" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                    Width="1000px" KeyField="GUID">
                    <Columns>

                        <asp:BoundField DataField="BIZ_TYPE" HeaderText="类型" SortExpression="BIZ_TYPE" ItemStyle-Width="0"></asp:BoundField>
                        <asp:BoundField DataField="BIZ_NO" HeaderText="编号" SortExpression="BIZ_NO" ItemStyle-Width="0"></asp:BoundField>


                        <asp:BoundField DataField="OPER_NAME" HeaderText="操作名称" SortExpression="OPER_NAME" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="CREATE_DATE" HeaderText="创建日期" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" SortExpression="CREATE_DATE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="CREATE_USER" HeaderText="创建人" ItemStyle-HorizontalAlign="Center" SortExpression="CREATE_USER" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="MEMO" HeaderText="备注" SortExpression="MEMO" ItemStyle-Width="150"></asp:BoundField>

                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
