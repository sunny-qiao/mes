<%@ page language="C#" autoeventwireup="true" inherits="App_EciBd_ChooseArea, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>行政区域</title>
     <base target="_self"></base>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

      

       

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidParentCode" runat="server" />

        <div id="root">



            <div id="divQuery" style="width: 100%;">
                <table id="tbQuery" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" Query="A.CODE|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" Query="A.NAME|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">类别</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboType" DataField="TYPE" Width="85%" ReadOnly="true" Query="A.TYPE|string|=">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="P">省</asp:ListItem>
                                <asp:ListItem Value="C">市</asp:ListItem>
                                <asp:ListItem Value="X">县</asp:ListItem>
                            </asp:ECombox></td>

                    </tr>

                    <tr>
                        <td class="center" colspan="6">
                            <asp:EButton runat="server" ID="btnSearch" Text="查询" Icon="find" />
                            <asp:EButton runat="server" ID="btnReset" IsClient="true" Text="重置" Icon="reset" OnClientClick="eci.reset('tbQuery');" /></td>
                    </tr>
                </table>
            </div>
            <div id="toolbar">
                <asp:EButton runat="server" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" IsClient="true" />
            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server"
                    FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="true" EnableClickSelectRow="true"
                    Width="1000px" KeyField="ID" HAlign="center" OnClick="selectData">
                    <Columns>
                         
                        <asp:BoundField DataField="CODE" HeaderText="代码" SortExpression="CODE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="NAME" HeaderText="名称" SortExpression="NAME" ItemStyle-Width="250"></asp:BoundField>
                        <asp:BoundField DataField="TYPE_NAME" HeaderText="类别" SortExpression="TYPE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="STATUS" HeaderText="是否启用" SortExpression="STATUS" ItemStyle-Width="150"></asp:BoundField>

                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
