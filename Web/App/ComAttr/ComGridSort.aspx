<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="App_ComAttr_ComGridSort, ECI.Web" enableviewstatemac="false" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>数据选择</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

       

    </script>


</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="hidGridId" />
        <asp:HiddenField runat="server" ID="hidId" />


        <div id="divSqlHelp" style="position: absolute; border: 1px solid green; background: #EEEEEE; top: 80px; display: none;">
        </div>


        <div id="root">

            <div class="toolbar" id="toolbar">

                <asp:EButton runat="server" ID="btnSave" Text="保存"
                    NeedCheck="true" OnClick="btnSave_Click" Icon="save" />

                &nbsp;&nbsp;&nbsp;<asp:EButton runat="server" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" IsClient="true" />



            </div>
            <div>
                <table class="grid notop" cellpadding="0" cellspacing="0" id="tbEdit">
                    <tr>
                        <th style="width: 20%"></th>
                        <th style="width: 80%"></th>


                    </tr>
                    <tr>
                        <td class="lbl">排序字段 
                        </td>
                        <td>
                            <asp:ECombox runat="server" ID="cboDataField" Width="50%" DataTextField="HEADER_TEXT" DataValueField="SORT"></asp:ECombox>
                            <asp:ECombox runat="server" ID="cboAscDesc" Width="60">
                                <asp:ListItem Value="ASC">升序</asp:ListItem>
                                <asp:ListItem Value="DESC">降序</asp:ListItem>
                            </asp:ECombox>

                            <asp:ETip runat="server" Show="true" ToolTip="企业自己设置自定义的排序" />
                        </td>


                    </tr>

                    <tr>
                        <td class="lbl">分页大小</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboPageSize" Width="50%"></asp:ECombox>
                        </td>


                    </tr>

                </table>
            </div>
        </div>


    </form>
</body>
</html>
