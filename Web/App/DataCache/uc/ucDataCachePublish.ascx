<%@ control language="C#" autoeventwireup="true" inherits="App_DataCache_uc_ucDataCachePublish, ECI.Web" %>

<asp:EWindow runat="server" ID="divHead" Title="数据缓存发布" Icon="world" Width="400" Height="200">

    <table class="grid" cellpadding="0" cellspacing="0">
        <tr>
            <th style="width: 100px"></th>
            <th style="width: 100%"></th>
        </tr>
        <tr>
            <td class="lbl">
                <asp:RadioButton ID="radAll" runat="server" GroupName="G" Text="发布全部" /></td>
            <td class="txt"></td>
        </tr>

        <tr>
            <td class="lbl">
                <asp:RadioButton ID="radQueryType" runat="server" GroupName="G" Text="指定类型" /></td>
            <td class="txt">


                <asp:ETextBox runat="server" ID="txtQueryTypePublish" Width="200" />

            </td>
        </tr>


        <tr>

            <td class="center" colspan="2">
                <asp:EButton runat="server" ID="btnPublish" Text="确定发布" Icon="world" OnClick="btnPublish_Click" />

                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.closewindow(this);" />


            </td>
        </tr>


    </table>



</asp:EWindow>


