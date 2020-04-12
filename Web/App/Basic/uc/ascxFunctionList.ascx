<%@ control language="C#" autoeventwireup="true" inherits="App_Ascx_ascxFunctionList, ECI.Web" %>
<div style="margin-top: 10px;"></div>
<div>
    <asp:EButton runat="server" Text="删除" ID="btnDelete" Icon="delete" OnClientClick="deleteAction()" IsClient="true" />

</div>
<asp:EGridView ID="gvData" runat="server" BorderStyle="None" FitWindow="true" Layout="tbEdit,toolbar,40"
    EnableDblClick="true" BorderWidth="0px" EnableSorting="True" CssClass="grid"
    Width="1000px" EnableSelect="true" DblClickEventName="edit" KeyField="GUID" EnableClickSelectRow="true">
    <Columns>
        <asp:BoundField DataField="FUNCTION_NAME" HeaderText="功能名称" ItemStyle-Width="220px"></asp:BoundField>
        <asp:BoundField DataField="CONTROL_ID" HeaderText="控件ID"
            ItemStyle-Width="180px"></asp:BoundField>
        <asp:BoundField DataField="SEQ" HeaderText="显示顺序" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

    </Columns>
</asp:EGridView>

<script type="text/javascript">
    function edit(key) {

        var tableGuid = $("#hidTABLE_GUID").val();
        var url = "?TABLE_GUID=" + tableGuid + "&key=" + key;

        window.location.href = url;
    }

    function deleteAction() {

        if (!$.egrid.selectRow("List_gvData")) {
            return false;
        }

        msg.confirm("确定要执行删除操作吗？", function () {
            postback("List$btnDelete");
        });

        return false;
    }

    $(function () {

        var key = $("#hidKey").val();

        $("#List_gvDataTable").find("tr[key=" + key + "]").css("background", "pink");

    });

</script>
