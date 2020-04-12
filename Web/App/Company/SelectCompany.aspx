<%@ page language="C#" autoeventwireup="true" inherits="App_Company_SelectCompany, ECI.Web" enablesessionstate="True" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>选择登陆公司</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        

    </script>


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

</head>
<body class="body">
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="hidSelectCompanyFunctionId" />


        <input type="hidden" id="hidFrom" runat="server" />

        <div id="root">
            <div>

                <div id="datagrid" style="margin: 60px;">
                    <div id="divTitle" style="margin-top: 10px; margin-bottom: 10px; font-size: 14px;">
                        请选择要登录的操作公司
                    </div>

                    <asp:EGridView ID="gvData" Layout="divTitle,toolbar,120" runat="server" BorderStyle="None"
                        FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="false" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                        Width="1000px" PageSize="20" EnableFooter="false" HAlign="center">
                        <Columns>

                            <asp:BoundField DataField="COMPANY_ID" HeaderText="企业ID"
                                ItemStyle-Width="0px"></asp:BoundField>

                            <asp:BoundField DataField="COMPANY_CODE" HeaderText="企业代码"
                                ItemStyle-Width="170px"></asp:BoundField>

                            <asp:BoundField DataField="COMPANY_NAME" HeaderText="企业名称"
                                ItemStyle-Width="400px"></asp:BoundField>

                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90">
                                <ItemTemplate>
                                    <asp:EButton runat="server" Icon="ok" ID="btnSelect" Text="确定" CommandArgument='<%#Eval("COMPANY_CODE")%>' OnClick="btnSelect_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:EGridView>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
