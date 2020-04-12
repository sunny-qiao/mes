<%@ control language="C#" autoeventwireup="true" inherits="AppSSO_SSO_ascxFunction, ECI.SSO.Web" %>
<link href="../../Themes/Default/eci.css" rel="stylesheet" />



<table class="grid" cellpadding="0" cellspacing="0" style="width: 100%;">
    <tr>
        <th style="width: 140px"></th>
        <th style="width: 100%"></th>
    </tr>
    <tr>
        <td class="lbl">ID：</td>
        <td>
            <asp:ETextBox runat="server" ID="txtFUNCTIONID" Width="85%" ReadOnly="true"></asp:ETextBox>


        </td>
    </tr>

    <tr>
        <td class="lbl">名称：</td>
        <td>
            <asp:ETextBox runat="server" ID="txtNAME" Width="85%" NotNull="true"></asp:ETextBox></td>
    </tr>

    <tr>
        <td class="lbl lbl-top">编码：</td>
        <td>
            <asp:ETextBox runat="server" ID="txtCODE" Width="85%" NotNull="true"></asp:ETextBox>
            <br />
            <span class="notnull">编码为0将不管控权限，修改编码会导致用户失去对此功能点的权限，请谨慎操作</span>
        </td>
    </tr>

    <tr>
        <td class="lbl lbl-top">页面地址：</td>
        <td>
            <asp:ETextBox runat="server" ID="txtURL" Width="85%" TextMode="MultiLine" Rows="3"></asp:ETextBox></td>


    </tr>

    <tr>
        <td class="lbl">显示顺序：</td>
        <td>
            <asp:ETextBox runat="server" ID="txtSEQUENCE" Width="85%" IsNum="true"></asp:ETextBox></td>


    </tr>

    <tr>
        <td class="lbl">功能点图片：</td>
        <td>
            <asp:ETextBox runat="server" ID="txtIMAGEFILE" Width="85%" IsNum="true"></asp:ETextBox></td>


    </tr>

    <tr>
        <td class="lbl lbl-top">描述：</td>
        <td>
            <asp:ETextBox runat="server" ID="txtDESCRIPTION" Width="85%" TextMode="MultiLine" Rows="3"></asp:ETextBox></td>


    </tr>

    <tr>
        <td class="lbl">显示为菜单：</td>
        <td>
            <asp:ECheckBox runat="server" ID="chkSHOWINMENU" TrueValue="1" FalseValue="0" DataField="SHOW_IN_MENU" Checked="true" />
        </td>
    </tr>

    <tr>
        <td class="lbl">创建时间：</td>
        <td>
            <asp:ETextBox runat="server" ID="txtCreateTime" Width="85%" IsDate="true" ReadOnly="true"></asp:ETextBox>
        </td>
    </tr>

    <tr>
        <td class="lbl">&nbsp;</td>
        <td>
            <asp:EButton runat="server" Text="应用设置功能" ID="btnAssignToRole" Icon="group" IsClient="true" OnClientClick="appSetFunctionAction()" />
            <asp:EButton runat="server" Text="功能授权给角色" ID="btnAppSetFunction" Icon="group" IsClient="true" OnClientClick="assignAction()" />


            <asp:EButton runat="server" Text="重置顺序" ID="btnResetSEQ" Icon="refresh" IsClient="true" OnClientClick="resetParentSEQ()" />


        </td>
    </tr>
</table>

<div style="display: none;">
    <asp:ETextBox runat="server" ID="txtPARENTID" Width="85%" ReadOnly="true"></asp:ETextBox>
    <asp:ETextBox runat="server" ID="txtFLAG" Width="85%" ReadOnly="true"></asp:ETextBox>
</div>
