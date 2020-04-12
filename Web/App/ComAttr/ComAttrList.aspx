<%@ page language="C#" autoeventwireup="true" inherits="App_ComAttr_ComAttrList, ECI.Web" enableviewstatemac="false" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>企业级参数</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <script type="text/javascript">


 

    </script>

</head>
<body class="body">
    <form id="form1" runat="server">
        <div>
            <div>

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
                            <td class="lbl">企业代码</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtCompanyCode" AutoUpper="true" DataField="COMPANY_CODE" Query="A.COMPANY_CODE|S|LIKE" Width="85%"></asp:ETextBox>
                            </td>
                            <td class="lbl">企业名称</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtCompanyName" DataField="COMPANY_NAME" Width="85%" Query="A.COMPANY_NAME|S|LIKE"></asp:ETextBox>

                            </td>
                            <td class="lbl">参数类型</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtAttrType" DataField="ATTR_TYPE" Width="85%" Query="A.ATTR_TYPE|S|="></asp:ETextBox>

                            </td>
                        </tr>
                        <tr>
                            <td class="lbl">创建日期</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtCreateDateS" IsDate="true" DataField="CREATE_DATE_S" Query="A.CREATE_DATE|D|start" Width="85%"></asp:ETextBox>
                            </td>
                            <td class="lbl">至</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtCreateDateE" IsDate="true" DataField="CREATE_DATE_E" Width="85%" Query="A.CREATE_DATE|D|end"></asp:ETextBox>

                            </td>
                            <td class="lbl">&nbsp;</td>
                            <td>&nbsp;</td>
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

                    <asp:EButton runat="server" ID="btnExport" Text="导出EXCEL" CancelLoading="true" Icon="excel" OnClick="btnExport_Click" />




                </div>
                <div id="datagrid">
                    <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server" BorderStyle="None"
                        FitWindow="true" EnableDblClick="true" EnableSorting="True" EnableSelect="true" EnablePaging="true" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                        Width="1000px" DblClickEventName="edit" KeyField="GUID" DataToken="true" PageSize="20">
                        <Columns>
                            <asp:BoundField DataField="COMPANY_CODE" HeaderText="企业代码" SortExpression="COMPANY_CODE"
                                ItemStyle-Width="170px"></asp:BoundField>

                            <asp:BoundField DataField="COMPANY_NAME" HeaderText="企业名称" SortExpression="COMPANY_NAME"
                                ItemStyle-Width="170px"></asp:BoundField>


                            <asp:BoundField DataField="ATTR_TYPE" HeaderText="参数类型" SortExpression="ATTR_TYPE"
                                ItemStyle-Width="170px"></asp:BoundField>

                            <asp:BoundField DataField="ATTR_KEY" HeaderText="参数" SortExpression="ATTR_KEY"
                                ItemStyle-Width="170px"></asp:BoundField>

                            <asp:BoundField DataField="ATTR_VALUE" HeaderText="设定值" SortExpression="ATTR_VALUE"
                                ItemStyle-Width="170px"></asp:BoundField>
 
                        </Columns>
                    </asp:EGridView>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
