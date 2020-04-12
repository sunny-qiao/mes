<%@ page language="C#" autoeventwireup="true" inherits="App_System_frmEciNoticeListView, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统通知</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function viewAction(obj) {

            var key = $(obj).getKey();

            var url = "../../App/System/EciNoticeView.aspx?key=" + key;

            parent.eci.dialog(lang.M00039, url, { full: true, target: "notice-view" });
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">

        <!--系统通知类型-->
        <input type="hidden" id="hidType" runat="server" />

        <div id="divQuery" style="width: 100%;">
            <table id="tbQuery" class="grid" cellpadding="0" cellspacing="0">
                <tr>
                    <th style="width: 10%"></th>
                    <th style="width: 40%"></th>
                    <th style="width: 10%"></th>
                    <th style="width: 40%"></th>


                </tr>
                <tr>
                    <td class="lbl"><asp:ELabel runat="server" LangCode="NOTICE_001" >标题</asp:ELabel>  </td>
                    <td>
                        <asp:ETextBox runat="server" ID="txtTitle" DataField="TITLE" Query="A.TITLE|string|like" Width="85%"></asp:ETextBox></td>
                    <td class="lbl">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="lbl">&nbsp;</td>
                    <td>&nbsp;</td>


                </tr>

                <tr>
                    <td class="center" colspan="6">
                        <asp:EButton runat="server" ID="btnSearch" Text="查询" LangCode="CMD_QUERY" Icon="find" />
                        <asp:EButton runat="server" ID="btnReset" IsClient="true" Text="重置" LangCode="CMD_RESET" Icon="reset" OnClientClick="eci.reset('tbQuery');" /></td>
                </tr>
            </table>
        </div>
        <div id="toolbar">
        </div>
        <div id="datagrid" style="margin-left: 4px; margin-right: 4px;">

            <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server" BorderStyle="None"
                FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="true" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                Width="1000px" KeyField="GUID" HAlign="center" OnClick="viewAction">
                <Columns>

                    <asp:ETemplateField HeaderText="标题" LangCode="MESSAGE_001" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="500">
                        <ItemTemplate>
                            <a href="javascript:void(0);" onclick="viewAction(this);"><%#Eval("TITLE")%></a>
                        </ItemTemplate>
                    </asp:ETemplateField>

                    <asp:EBoundField DataField="CREATE_DATE"  LangCode="NOTICE_002" HeaderText="发布日期" SortExpression="CREATE_DATE" ItemStyle-Width="130" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"></asp:EBoundField>
                    <asp:EBoundField DataField="CREATE_USER" LangCode="NOTICE_003" HeaderText="创建人" SortExpression="CREATE_USER" ItemStyle-Width="100"></asp:EBoundField>

                </Columns>
            </asp:EGridView>
        </div>

    </form>
</body>
</html>
