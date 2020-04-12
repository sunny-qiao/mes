<%@ page language="C#" autoeventwireup="true" inherits="App_DIC_DicFetch, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>数据项导入</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function imported()
        {
            window.parent.changed = true;
        }

        function pageClose()
        {
            window.parent.trySearch();
            eci.close();
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
             
            <div class="toolbar" id="toolbar" style="border-bottom: 0px;">
                <asp:EButton ID="btnImport" runat="server" Text="导 入(I)" AccessKey="i"
                    OnClientClick="return eci.selectRow();" OnClick="btnImport_Click"  Icon="ok"/>
                <asp:EButton ID="btnClose" runat="server" IsClient="true" Text="关闭(X)" AccessKey="x"
                      OnClientClick="pageClose();"  Icon="close"/>
            </div>
            <div class="workarea" layout="toolbar,pagetitle">
                <asp:EGridView ID="gvData" runat="server" CssClass="grid" BorderStyle="None"
                    BorderWidth="0px" CellPadding="0" CellSpacing="0" AllowSorting="True" Width="750px"
                  FitWindow="true" EnableSelect="true" layout="toolbar,pagetitle" EnableClickSelectRow="true" SelectMode="Append">
                    <Columns>
                        <asp:BoundField DataField="COLUMN_NAME" HeaderText="字段名" ItemStyle-Width="200"></asp:BoundField>
                        <asp:BoundField DataField="COMMENTS" HeaderText="名称" ItemStyle-Width="200"></asp:BoundField>
                        <asp:BoundField DataField="DATA_TYPE" HeaderText="数据类型" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="DATA_LENGTH" HeaderText="数据长度" ItemStyle-Width="60"></asp:BoundField>
                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
