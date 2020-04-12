<%@ control language="C#" autoeventwireup="true" inherits="App_MyQuery_MyQuery, ECI.Web" %>

<script type="text/javascript">

    function saveQueryAction(obj) {
        var controlId = $(obj).attr("controlId");
        eci.window(controlId + "_divMyQuery");

        $("#" + controlId + "_txtName").focus();
    }

</script>


<div style="display:none;float:right;" runat="server" id="myQueryContainer">

    <div style="display:none">
        <asp:ETextBox runat="server" ID="txtQueryCode" ReadOnly="true" />
    </div>
     
    <div style="float: right;">
        &nbsp;<asp:ECombox runat="server" ID="cboMyQuery" AutoPostBack="true" OnSelectedIndexChanged="cboMyQuery_SelectedIndexChanged" Height="25"></asp:ECombox>
        <asp:EButton runat="server" ID="btnSaveQuery" Icon="add" BorderWidth="0" IsClient="true" OnClientClick="saveQueryAction(this)" />
        <asp:EButton runat="server" ID="btnRemoveQuery" Icon="delete" BorderWidth="0" OnClick="btnRemoveQuery_Click" />
    </div>

    <asp:EWindow runat="server" ID="divMyQuery" Title="保存为我的查询条件" Width="400" Height="150" Icon="function" EnableToggle="false">

        <table class="grid" cellpadding="0" cellspacing="0">
            <tr>
                <th style="width: 20%"></th>
                <th style="width: 80%"></th>
            </tr>
            <tr>
                <td class="lbl"></td>
                <td class="txt"></td>
            </tr>
            <tr>
                <td class="lbl">查询名称</td>
                <td class="txt">
                    <asp:ETextBox runat="server" ID="txtName" Width="85%" NotNull="true"></asp:ETextBox>

                </td>
            </tr>
            <tr>
                <td class="center" colspan="2">
                    <asp:EButton runat="server" ID="btnSaveExecute" Text="保存" Icon="ok" OnClick="btnSaveExecute_Click" OnClientClick="return saveExecuteAction()" />
                    <asp:EButton runat="server" ID="btnClose" Text="取消" Icon="cancel" IsClient="true" OnClientClick="eci.closewindow(this)" />
                </td>
            </tr>
        </table>
    </asp:EWindow>
</div>
