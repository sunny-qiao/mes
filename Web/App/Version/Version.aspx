<%@ page language="C#" autoeventwireup="true" inherits="App_Version_Version, ECI.Web" enablesessionstate="True" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>版本查看</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        

    </script>


    <style type="text/css">
        .body {
            background-image: url(../../AppStart/Layout/css/images/bg_1.jpg);
            background-repeat: repeat-x;
            background-position: 40px 0px;
            background-color: #3EB4D2;
            height: 100%;
            width: 100%;
        }
    </style>

    <script type="text/javascript">
        function viewAction(obj) {
            var dllName = $(obj).getField("DLL_NAME");
            var version = $(obj).getField("VERSION");
            var url = "VersionDetail.aspx?dllName=" + dllName + "&version=" + version;
            eci.open(url);
        }

        function viewDllAction(obj) {
            var dllName = $(obj).getField("DLL_NAME");

            var url = "VersionDll.aspx?dllName=" + dllName;
            eci.dialog("查看组件明细", url, { width: 600, height: 400 });
        }



    </script>

</head>
<body class="body">
    <form id="form1" runat="server">
        <input type="hidden" id="hidFrom" runat="server" />

        <div id="root">
            <div>

                <div id="datagrid" style="margin: 30px;">

                    <div id="divTitle" style="margin-top: 10px; margin-bottom: 10px; font-size: 14px;">
                        <asp:EButton runat="server" ID="btnClose" IsClient="true" OnClientClick="eci.close()" Icon="close" Text="关闭" />
                        组件清单
                    </div>

                    <asp:EGridView ID="gvData" Layout="divTitle,toolbar,120" runat="server" BorderStyle="None"
                        FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="false" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                        Width="1000px" PageSize="20" EnableFooter="false" HAlign="center">
                        <Columns>

                            <asp:BoundField DataField="DLL_NAME" HeaderText="组件名"
                                ItemStyle-Width="300px" ItemStyle-HorizontalAlign="Left"></asp:BoundField>

                            <asp:BoundField DataField="VERSION" HeaderText="版本号"
                                ItemStyle-Width="140px"></asp:BoundField>



                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120">
                                <ItemTemplate>
                                    <asp:EButton runat="server" Icon="book_open" ID="btnView" Text="版本记录" IsClient="true" OnClientClick="viewAction(this)" />
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120">
                                <ItemTemplate>
                                    <asp:EButton runat="server" Icon="book_open" ID="btnView" Text="查看组件明细" IsClient="true" OnClientClick="viewDllAction(this)" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:EGridView>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
