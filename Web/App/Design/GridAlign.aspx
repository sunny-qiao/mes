<%@ page language="C#" autoeventwireup="true" inherits="App_Design_GridAlign, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>列表对齐方式自定义</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <script type="text/javascript">
        function deleteAction(obj) {
            msg.confirm("确定要删除自定义配置吗?", obj);
        }

        function deleteOK() {
            msg.alert("自定义配置删除成功", {
                closed: function () {
                    eci.close();
                }
            });
        }


        $(function () {

            $("#btnSave").focus();

            $(window).keyup(function (e) {
                e = e || event;
                if (e.keyCode == 27) {
                    eci.close();
                }
            });


           

        })

    </script>

</head>
<body>


    <form id="form1" runat="server">

        <div>



            <div id="toolbar">
                 
                <asp:EButton runat="server" ID="btnSave" Text="保存" Icon="save" OnClick="btnSave_Click" />
                <span style="margin-left:20px;"></span>
                <asp:EButton runat="server" ID="btnDelete" Text="删除自定义配置" Icon="delete" IsClient="true" OnClientClick="deleteAction(this)" OnClick="btnDelete_Click" />
                <asp:EButton runat="server" ID="btnClose" Text="关闭" Icon="close" IsClient="true" OnClientClick="eci.close();" />




            </div>

        </div>

        <div id="datagrid">
            <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle,10" runat="server" BorderStyle="None"
                EnableSorting="True" EnableSelect="false" EnablePaging="false" EnableFooter="false" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                Width="1000px" FitWindow="true">
                <Columns>

                    <asp:BoundField DataField="ROWNUM" HeaderText="序号"
                        ItemStyle-Width="60" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

                    <asp:BoundField DataField="HEADER_TEXT" HeaderText="显示名称"
                        ItemStyle-Width="300px"></asp:BoundField>


                    <asp:ETemplateField ItemStyle-Width="200px" DataField="ALIGN" TwoWay="cboAlign" HeaderText="内容对齐方式" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ECombox runat="server" ID="cboAlign" Width="98%">
                                <asp:ListItem> </asp:ListItem>
                                <asp:ListItem Value="Left">左对齐</asp:ListItem>
                                <asp:ListItem Value="Center">居中对齐</asp:ListItem>
                                <asp:ListItem Value="Right">右对齐</asp:ListItem>
                            </asp:ECombox>

                        </ItemTemplate>
                    </asp:ETemplateField>





                </Columns>
            </asp:EGridView>
        </div>

        <div class="easyui-panel" style="padding: 5px; border-top: 0px;">
            <ul id="tt"></ul>
        </div>

        </div>

    </form>
</body>
</html>
