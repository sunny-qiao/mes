<%@ page language="C#" autoeventwireup="true" inherits="App_File_BizInfoList, ECI.Web" enableviewstatemac="false" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>业务类型</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        //var options = {width:400,dialog:false}


        function fileUpload1(obj) {
            var bizNo = $(obj).getKey();
            var bizType = "HFD";
            var options = {}
            eci.fileUpload(bizNo, bizType, options);
        }

        function fileUpload2(obj) {
            var bizNo = $(obj).getKey();
            var bizType = "HFD2";
            var options = {}
            eci.fileUpload(bizNo, bizType, options);
        }

        function view(obj) {
            var bizNo = $(obj).getKey();
            var bizType = "HFD";
            var options = {action:"view"}
            eci.fileUpload(bizNo, bizType, options);
        }
 
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">

            <asp:ETitle runat="server" ID="pagetitle" Title="业务类型"></asp:ETitle>

            <div id="divQuery" style="width: 100%;">
                <table id="tbQuery" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 23%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 23%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 23%"></th>
                    </tr>
                    <tr>
                        <td class="lbl">编码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" Query="A.CODE|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" Query="A.NAME|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">状态</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboStatus" DataField="STATUS" Query="A.STATUS|string|=" Width="85%">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Text="启用" Value="Y"></asp:ListItem>
                                <asp:ListItem Text="禁用" Value="N"></asp:ListItem>
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
            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server"
                    FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="true" EnableClickSelectRow="true"
                    Width="1000px" KeyField="CODE" HAlign="center" OnClick="editAction">
                    <Columns>

                        <asp:TemplateField HeaderText="文件上传" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="220">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnFileUpload" Text="附件上传1" IsClient="true" Icon="function" OnClientClick="fileUpload1(this);" />
                                 <asp:EButton runat="server" ID="EButton1" Text="附件上传2" IsClient="true" Icon="function" OnClientClick="fileUpload2(this);" />


                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnView" Text="查看" IsClient="true" Icon="function" OnClientClick="view(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>

                       

                        <asp:BoundField DataField="CODE" HeaderText="编码" SortExpression="CODE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="NAME" HeaderText="名称" SortExpression="NAME" ItemStyle-Width="150"></asp:BoundField>
                         </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
