<%@ control language="C#" autoeventwireup="true" inherits="App_Ascx_ascxTabItemList, ECI.Web" %>
<div style="margin-top: 10px;"></div>
<div>
    <asp:EButton runat="server" Text="删除" ID="btnDelete" Icon="delete" OnClientClick="deleteAction()" IsClient="true" />
</div>
<asp:EGridView ID="gvData" runat="server" BorderStyle="None" Layout="tbEdit,toolbar,40"
    EnableDblClick="true" BorderWidth="0px" EnableSorting="True" CssClass="grid" FitWindow="true"
    Width="1000px" EnableSelect="true" DblClickEventName="edit" KeyField="GUID" EnableClickSelectRow="true">
    <Columns>
        <asp:BoundField DataField="TAB_NAME" HeaderText="名称" ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
        <asp:BoundField DataField="CONTROL_PATH" HeaderText="路径"
            ItemStyle-Width="350px"></asp:BoundField>


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
            __doPostBack("List$btnDelete");
        });

        return false;
    }

    $(function () {

        var key = $("#hidKey").val();


        $("#List_gvDataTable").find("tr[key=" + key + "]").css("background", "pink");

    });

</script>
