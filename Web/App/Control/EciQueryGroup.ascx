<%@ control language="C#" autoeventwireup="true" inherits="App_Control_EciQueryGroup, ECI.Web" %>
<table class="grid">
    <tr>
        <th style="width: 60px"></th>
        <th style="width: 20%"></th>
        <th style="width: 80px"></th>
        <th style="width: 50%"></th>
    </tr>
    <tr>
        <td>第一组</td>
        <td>
            <asp:ECombox runat="server" ID="cboDataField1" CssClass="eci-select dataField"></asp:ECombox></td>
        <td>
            <asp:ECombox runat="server" ID="cboQueryType1" Width="60" CssClass="eci-select queryType"></asp:ECombox></td>
        <td>
            <asp:EChoose runat="server" ID="txtConn1" CssClassEx="conn"></asp:EChoose>
        </td>
    </tr>
    <tr>
        <td>
            <asp:ECombox runat="server" ID="cboJoinType2">
                <asp:ListItem Value="and">并且</asp:ListItem>
                <asp:ListItem Value="or">或者</asp:ListItem>
            </asp:ECombox></td>
        <td>
            <asp:ECombox runat="server" ID="cboDataField2" CssClass="eci-select dataField"></asp:ECombox></td>
        <td>
            <asp:ECombox runat="server" ID="cboQueryType2" Width="60" CssClass="eci-select queryType"></asp:ECombox></td>
        <td>
            <asp:EChoose runat="server" ID="txtConn2" CssClassEx="conn"></asp:EChoose></td>
    </tr>
    <tr>
        <td>
            <asp:ECombox runat="server" ID="cboJoinType3">
                <asp:ListItem Value="and">并且</asp:ListItem>
                <asp:ListItem Value="or">或者</asp:ListItem>
            </asp:ECombox></td>
        <td>
            <asp:ECombox runat="server" ID="cboDataField3" CssClass="eci-select dataField"></asp:ECombox></td>
        <td>
            <asp:ECombox runat="server" ID="cboQueryType3" Width="60" CssClass="eci-select queryType"></asp:ECombox></td>
        <td>
            <asp:EChoose runat="server" ID="txtConn3" CssClassEx="conn"></asp:EChoose></td>
    </tr>
</table>

