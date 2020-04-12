<%@ control language="C#" autoeventwireup="true" inherits="App_COMParam_ascxParamGroup, ECI.Web" %>

<table class="grid" cellpadding="0" cellspacing="0" style="width: 100%;">
    <tr>
        <th style="width: 80px"></th>
        <th style="width: 40%"></th>
        <th style="width: 80px"></th>
        <th style="width: 40%"></th>
    </tr>
    <tr style="display: none;">
        <td class="lbl">ID</td>
        <td>
            <asp:ETextBox runat="server" ID="txtID" Width="85%" ReadOnly="true"></asp:ETextBox>
        </td>
        <td></td>
    </tr>

    <tr>
        <td class="lbl">名称</td>
        <td>
            <asp:ETextBox runat="server" ID="txtGroupName" Width="85%" NotNull="true"></asp:ETextBox></td>
        <td class="lbl">编码</td>
        <td>
            <asp:ETextBox runat="server" ID="txtGroupCode" Width="85%"></asp:ETextBox>
        </td>
    </tr>

    <tr>
        <td class="lbl">顺序</td>
        <td>
            <asp:ETextBox runat="server" ID="txtSeq" Width="85%" IsNum="true"></asp:ETextBox></td>
        <td class="lbl"></td>
        <td></td>

    </tr>


    <tr style="display: none;">
        <td class="lbl">系统 </td>
        <td>
            <asp:ETextBox runat="server" ID="txtSysCode" Width="85%"></asp:ETextBox></td>

        <td class="lbl"></td>
        <td></td>

    </tr>


    <tr style="display: none;">
        <td class="lbl lbl-top">描述</td>
        <td>
            <asp:ETextBox runat="server" ID="txtMemo" Width="85%" Rows="1"></asp:ETextBox></td>
        <td class="lbl"></td>
        <td></td>

    </tr>

</table>

<div style="display: none;">
    <asp:ETextBox runat="server" ID="txtPARENTID" Width="85%" ReadOnly="true"></asp:ETextBox>
    <asp:ETextBox runat="server" ID="txtFLAG" Width="85%" ReadOnly="true"></asp:ETextBox>
</div>
