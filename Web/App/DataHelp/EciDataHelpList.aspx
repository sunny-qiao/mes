<%@ page language="C#" autoeventwireup="true" inherits="App_DataHelp_EciDataHelpList, ECI.Web" enableviewstatemac="false" %>

<%@ Register Src="uc/ucDataHelpPublish.ascx" TagName="ucDataHelpPublish" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>数据选择</title>
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
            var url = "EciDataHelpEdit.aspx";
            eci.open(url.identity());
        }

        function edit(key, tr) {

            var datatoken = $(tr).datatoken();

            var url = "EciDataHelpEdit.aspx?key=" + key;

            url = url.appendUrl("datatoken", datatoken);

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

        function getFromXML(obj) {
            msg.confirm("确定要从文件中恢复吗?", obj);
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

                <asp:ETitle runat="server" ID="pagetitle" Title="数据选择"></asp:ETitle>

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
                            <td class="lbl">查询类型
                            </td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtQUERY_TYPE" ToolTip="dddd<br>dd" AutoUpper="true" DataField="QUERY_TYPE" Query="A.QUERY_TYPE|S|mlike" Width="85%" Pop="true"></asp:ETextBox>
                            </td>
                            <td class="lbl">中文说明</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtMEMO" DataField="MEMO" Width="85%" Query="A.MEMO|S|LIKE"></asp:ETextBox>

                            </td>
                            <td class="lbl">查询语句</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtSQL" DataField="SEQ" Width="85%" Query="A.SQL|S|LIKE|ESCAPE"></asp:ETextBox>

                            </td>
                        </tr>
                        <tr>
                            <td class="lbl">分类代码</td>
                            <td>
                                <asp:ECombox runat="server" ID="cboSysCode" DataField="SYS_CODE" DataValueField="CODE" DataTextField="NAME" Width="85%" Query="A.SYS_CODE|S|=">
                                </asp:ECombox>
                            </td>
                            <td class="lbl">扩展配置</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtASSEMBLY_NAME" DataField="ASSEMBLY_NAME" Width="85%" Query="A.ASSEMBLY_NAME|S|LIKE"></asp:ETextBox>

                            </td>
                            <td class="lbl">检查</td>
                            <td>
                                <asp:ECombox runat="server" ID="cboCheck" DataField="CHECK" Width="85%">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem Value="ECI_SELECT">已SQL优化</asp:ListItem>
                                    <asp:ListItem Value="NO_ECI_SELECT">未SQL优化</asp:ListItem>
                                    <asp:ListItem Value="1=1">含有1=1语句</asp:ListItem>
                                </asp:ECombox>
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

                    <asp:EButton runat="server" ID="btnGetFromXml" Text="从文件恢复" ToolTip="数据库中有的数据不会被恢复"
                        Icon="function" OnClick="btnGetFromXml_Click" OnClientClick="getFromXML(this)" IsClient="true" />

                    <asp:EButton runat="server" ID="btnExport" Text="导出EXCEL" CancelLoading="true" Icon="excel" OnClick="btnExport_Click" />


                </div>


                <div id="datagrid">
                    <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server" BorderStyle="None"
                        FitWindow="true" EnableDblClick="true" EnableSorting="True" EnableSelect="true" EnablePaging="true" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                        Width="1000px" DblClickEventName="edit" KeyField="GUID" DataToken="true" PageSize="20" MaxPageSize="50">
                        <Columns>

                            <asp:EBoundField DataField="QUERY_TYPE" HeaderText="查询类型"  SortExpression="QUERY_TYPE"
                                ItemStyle-Width="170px">
                            </asp:EBoundField>

                            <asp:BoundField DataField="MEMO" HeaderText="中文说明" SortExpression="MEMO"
                                ItemStyle-Width="220px"></asp:BoundField>


                            <asp:BoundField DataField="DATA_CHANGE_CODE" HeaderText="代码"
                                ItemStyle-Width="170px"></asp:BoundField>

                            <asp:BoundField DataField="DATA_CHANGE_NAME" HeaderText="名称"
                                ItemStyle-Width="170px"></asp:BoundField>



                            <asp:BoundField DataField="CREATE_DATE" HeaderText="创建日期" SortExpression="CREATE_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                                ItemStyle-Width="140px" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

                            <asp:BoundField DataField="UPDATE_DATE" HeaderText="修改日期" SortExpression="UPDATE_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                                ItemStyle-Width="140px" ItemStyle-HorizontalAlign="Center"></asp:BoundField>


                            <asp:BoundField DataField="MEMO_DETAIL" HeaderText="备注说明"
                                ItemStyle-Width="270px"></asp:BoundField>

                            <asp:BoundField DataField="ASSEMBLY_NAME" HeaderText="扩展定义"
                                ItemStyle-Width="370px"></asp:BoundField>




                        </Columns>
                    </asp:EGridView>
                </div>
            </div>
        </div>

        <uc1:ucDataHelpPublish ID="publisher" runat="server" />
    </form>
</body>
</html>
