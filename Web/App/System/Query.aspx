<%@ page language="C#" autoeventwireup="true" inherits="App_System_Query, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        $(function () {

            $("#txtSql").focus();
        });
     

    </script>

    <style type="text/css">
        .sql
        {
            font-family:Verdana
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
            <div id="pagetitle" class="pagetitle">数据查询</div>
            <div id="divQuery">
                <table class="grid" cellpadding="0" cellspacing="0" runat="server" id="tbQuery">
                    <tr>
                        <td>
                            <asp:ETextBox runat="server"  AddClassName="sql" ID="txtSql" Font-Size="12" Width="99%" TextMode="MultiLine" Rows="10" NotNull="true" Alias="查询语句"></asp:ETextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">
                            <asp:EButton runat="server" ID="btnSearch" Text="查询(Q)" OnClick="btnSearch_Click" NeedCheck="true" Icon="Find" AccessKey="q" />
                            <asp:EButton runat="server" ID="btnReset" IsClient="true" Text="重置(R)" Icon="reset"  AccessKey="r" OnClientClick="eci.reset('tbQuery'); $('#txtSql').focus()" /></td>
                    </tr>
                </table>
            </div>
            <div id="toolbar">
                <asp:EButton runat="server" ID="btnExcel" Text="导出EXCEL" Icon="excel"  CancelLoading="true" OnClick="btnExcel_Click"  NeedCheck="true"/>
            </div>
            <div id="datagrid">
                <asp:EGridView ID="gvData" FitWindow="true" Layout="divQuery,pagetitle,toolbar" ColumnResize="false" runat="server" BorderStyle="None" BorderWidth="0px" CssClass="grid"
                    Width="1000px">
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
