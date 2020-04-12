<%@ page language="C#" autoeventwireup="true" inherits="App_Access_Access, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>部署检查</title>
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <style type="text/css">
        .body {
            background-image: url(../../AppStart/Layout/css/images/bg_1.jpg);
            background-repeat: repeat-x;
            background-position: 40px 0px;
            background-color: #3EB4D2;
            height: 100%;
            width: 100%;
        }
    </style>

    <script type="text/javascript">

        function executeAction() {

            $(".eci-grid-row").each(function (index) {
                resetTr($(this));
            })


            $(".eci-grid-row").each(function (index) {
                executeTr($(this));
            })
        }

        function resetTr($tr) {

            $tr.find(".STATUS").html("");
            $tr.find(".MSG").html("");
            $tr.find(".COST").html("");

            var icon = "<img src=\"../../Icon/bullet_lightning.png\">";
            $tr.find(".STATUS").html(icon);
        }

        function executeTr($tr) {

            var url = $tr.find(".URL").html();
            var data = { url: url, loading: false }

            var beginTime = new Date();

            eci.post("AccessHandler.ashx", "AccessWeb", data, function (response) {
                var endTime = new Date();
                var cost = endTime.getTime() - beginTime.getTime();

                var html = "";
                if (response.success) {
                    html = "<img src=\"../../Icon/ok.png\">";
                }
                else {
                    html = "<img src=\"../../Icon/error.png\">";
                }

                $tr.find(".STATUS").html(html);
                $tr.find(".STATUS").attr("title", response.message);
                $tr.find(".MSG").html(response.message);
                $tr.find(".COST").html(response.cost);
                $tr.find(".COST").attr("data", response.content);
            })
        }

        function accessAction(obj) {
            var $tr = $(obj).parents(".eci-grid-row");
            resetTr($tr)
            executeTr($tr);
        }

        function openAction(obj) {
            var name = $(obj).getField("NAME");
            var url = $(obj).getField("URL");
            eci.open(url);
        }

        $(function () {

            $(".COST").dblclick(function () {
                var content = $(this).attr("data");

                alert(content)
                eci.textView(content);

            })


        })


    </script>


</head>
<body class="body">
    <form id="form1" runat="server">

        <div id="root">
            <div>
                <div id="datagrid" style="margin: 10px; background-color: white;">
                    <div>

                        <table class="grid" cellpadding="0" cellspacing="0">
                            <tr>
                                <th style="width: 60%;"></th>
                                <th style="width: 40%"></th>

                            </tr>
                            <tr>
                                <td>
                                    <asp:ETextBox runat="server" ID="txtWebRootUrl" Width="80%"></asp:ETextBox>
                                    <asp:ECheckBox runat="server" ID="chkAll" Text="访问所有页面" /></td>

                                <td rowspan="2" style="margin-bottom: 4px;">
                                    <asp:EButton runat="server" ID="btnGet" Text="获取文件" CssClass="btn-green" Width="80" Height="50" OnClick="btnGet_Click" />
                                    <asp:EButton runat="server" ID="btnExecute" Text="执行检查" CssClass="btn-green" Width="80" Height="50" IsClient="true" OnClientClick="executeAction(this)" />
                                    <asp:EButton runat="server" ID="btnClose" Text="关闭"   CssClass="btn-blue" Width="80" Height="50" IsClient="true" OnClientClick="eci.close();" /></td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:ETextBox runat="server" ID="txtApps" Width="98%"></asp:ETextBox>
                                </td>
                                <td></td>

                            </tr>

                        </table>



                    </div>

                    <asp:EGridView ID="gvData" Layout="divTitle,toolbar,70" runat="server" BorderStyle="None"
                        FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="false" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                        Width="1000px" PageSize="20" EnableFooter="true" HAlign="center">
                        <Columns>
                            <asp:BoundField DataField="NAME" HeaderText="文件名"   
                                ItemStyle-Width="300px" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                            <asp:BoundField DataField="URL" HeaderText="地址"
                                ItemStyle-Width="450px" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                            <asp:BoundField DataField="STATUS" HeaderText="状态"
                                ItemStyle-Width="60px"></asp:BoundField>

                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="访问" ItemStyle-Width="160">
                                <ItemTemplate>
                                    <asp:EButton runat="server" Icon="execute" ID="btnAccess" Text="访问" IsClient="true" OnClientClick="accessAction(this)" />
                                    <asp:EButton runat="server" Icon="world" ID="btnOpen" Text="打开" IsClient="true" OnClientClick="openAction(this)" />


                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="COST" HeaderText="耗时"
                                ItemStyle-Width="80px"></asp:BoundField>


                            <asp:BoundField DataField="MSG" HeaderText="信息"
                                ItemStyle-Width="300px" ItemStyle-HorizontalAlign="Left"></asp:BoundField>



                        </Columns>
                    </asp:EGridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
