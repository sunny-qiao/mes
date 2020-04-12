<%@ page language="C#" autoeventwireup="true" inherits="App_Common_Choose, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>数据选择</title>
    <base target="_self"></base>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function resetAction() {
            $("#txtCONN").val("").focus();
            dom("txtCONN").focus();
        }

        function add(){
            var url = $("#hidEditUrl").val();

            eci.open(url);
        }


        $(function () {
             
            $("#txtCONN").keydown(function (e) {
                 
                var key = e.which;
                if (key == 13) {
                    postback("btnSearch");
                }

            })

        })

       


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" runat="server" id="hidTId" />
        <input type="hidden" runat="server" id="hidChooseCode" />
        <input type="hidden" runat="server" id="hidChooseName" />
        <input type="hidden" runat="server" id="hidTitle" />
        <input type="hidden" runat="server" id="hidEditUrl" />

        <!--查询类型-->
        <input type="hidden" id="hidQueryType" runat="server" />

        <div id="root">
            <div id="divQuery" style="width: 100%;">
                <table class="grid" cellpadding="0" cellspacing="0" id="tbQuery">
                    <tr>
                        <td class="center">
                            <asp:ELabel runat="server" ID="lblConn">查询条件</asp:ELabel>
                           
                            <asp:ETextBox runat="server" ID="txtCONN" Width="200px" IgnoreEnterToTab="true" ></asp:ETextBox>
                            <asp:EButton runat="server" ID="btnSearch" Text="查询" Icon="Find" />
                            <asp:EButton runat="server" ID="btnReset" Icon="Erase" IsClient="true" Text="重置" AccessKey="r" OnClientClick="resetAction();" />
                        </td>
                    </tr>
                </table>
            </div>

            
            <div id="toolbar">
                <asp:EButton runat="server" ID="btnOK" IsClient="true" OnClientClick="selectDataM()" Text="选择" Icon="ok" />
                <asp:EButton runat="server" ID="btnAdd" IsClient="true"  Visible="false"  OnClientClick="add()" Text="新增" Icon="add" />
            </div>

            <div id="datagrid">
                <asp:EGridView ID="gvData" Layout="divQuery,toolbar" runat="server" BorderStyle="None" 
                    FitWindow="true" EnableDblClick="true" EnableSorting="True" EnablePaging="true" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                    Width="1000px" DblClickEventName="selectData">
                    <Columns>
                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
