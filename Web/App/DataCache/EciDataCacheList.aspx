<%@ page language="C#" autoeventwireup="true" inherits="App_DataCache_EciDataCacheList, ECI.Web" enableviewstatemac="false" %>
<%@ Register Src="uc/ucDataCachePublish.ascx" TagName="ucDataCachePublish" TagPrefix="uc1" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>数据缓存</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <script type="text/javascript">



        function deleteAction() {
            if (!eci.selectRow()) return false;

            msg.confirm("确定要执行删除操作吗?", function () {

                __doPostBack("btnDelete");
            });

            return false;
        }

        function add() {
            var url = "EciDataCacheEdit.aspx";
            eci.open(url.identity());
        }

        function edit(key, tr) {
             
            var url = "EciDataCacheEdit.aspx?key=" + key;
 
            eci.open(url);
        }

        function publishAction() {
            eci.window("publisher_divHead");
            $("#publisher_radAll")[0].checked = true;
            $("#publisher_btnPublish").focus();
        }

        function webInit() {
            eci.config.focusSelectText = true;
        }

        $(function () {




        })

    </script>
    <style type="text/css">
        * {
            border: 0;
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div>
            <div>

                <asp:ETitle runat="server" ID="pagetitle" Title="数据缓存"></asp:ETitle>

                <div id="divQuery">
                    <table class="grid nobottom" cellpadding="0" cellspacing="0" runat="server" id="tbQuery">
                        <tr>
                            <th style="width: 10%"></th>
                            <th style="width: 20%"></th>
                            <th style="width: 10%"></th>
                            <th style="width: 20%"></th>
                            <th style="width: 10%"></th>
                            <th style="width: 20%"></th>
                        </tr>
                        <tr>
                            <td class="lbl">

                                类型
                            </td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtQUERY_TYPE" ToolTip="dddd<br>dd" AutoUpper="true" DataField="QUERY_TYPE" Query="A.QUERY_TYPE|S|LIKE" Width="85%"></asp:ETextBox>
                            </td>
                            <td class="lbl">中文说明</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtMEMO" DataField="MEMO" Width="85%" Query="A.MEMO|S|LIKE"></asp:ETextBox>

                            </td>
                            <td class="lbl">查询语句</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtSQL" DataField="SEQ" Width="85%" Query="A.SQL|S|LIKE"></asp:ETextBox>

                            </td>
                        </tr>
                        <tr>
                            <td class="center" colspan="6">
                                <asp:EButton runat="server" ID="btnSearch" Text="查询" Icon="Find" />
                                <asp:EButton runat="server" ID="btnReset" IsClient="true" Text="重置" Icon="reset" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="toolbar">
                    <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="add();" IsClient="true" />
                    <asp:EButton runat="server" ID="btnDelete" Icon="Delete" Text="删除" OnClientClick="return  deleteAction();" OnClick="btnDelete_Click" />
                    <asp:EButton runat="server" ID="btnPublish" Icon="world" Text="发布全部" OnClientClick="publishAction();" IsClient="true" />

                    <asp:EButton runat="server" ID="btnExport" Text="导出EXCEL" CancelLoading="true" Icon="excel" OnClick="btnExport_Click" />
   



                </div>
                <div id="datagrid">
                    <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server" BorderStyle="None"
                        FitWindow="true" EnableDblClick="true" EnableSorting="True" EnableSelect="true" EnablePaging="true" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                        Width="1000px" DblClickEventName="edit" KeyField="GUID" DataToken="true" PageSize="20">
                        <Columns>
                            <asp:BoundField DataField="QUERY_TYPE" HeaderText="类型" SortExpression="QUERY_TYPE"
                                ItemStyle-Width="170px"></asp:BoundField>

                            <asp:BoundField DataField="MEMO" HeaderText="中文说明" SortExpression="MEMO"
                                ItemStyle-Width="220px"></asp:BoundField>
  

                            <asp:BoundField DataField="CREATE_DATE" HeaderText="创建日期" SortExpression="CREATE_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                                ItemStyle-Width="140px" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

                            <asp:BoundField DataField="UPDATE_DATE" HeaderText="修改日期" SortExpression="UPDATE_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                                ItemStyle-Width="140px" ItemStyle-HorizontalAlign="Center"></asp:BoundField>


                            <asp:BoundField DataField="MEMO_DETAIL" HeaderText="备注说明"
                                ItemStyle-Width="270px"></asp:BoundField>

                           




                        </Columns>
                    </asp:EGridView>
                </div>
            </div>
        </div>

          <uc1:ucDataCachePublish ID="publisher" runat="server" />

    </form>
</body>
</html>
