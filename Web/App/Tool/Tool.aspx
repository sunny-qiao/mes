<%@ page language="C#" autoeventwireup="true" inherits="App_Tool_Tool, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <link href="../../EasyUI/themes/default/easyui.css" rel="stylesheet" />
    <link href="../../EasyUI/themes/icon.css" rel="stylesheet" />


    <script type="text/javascript">
        function tabHead_select(from,to)
        {
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
 
        <div class="fitH">

            <asp:ETab runat="server" ID="tabHead">

                <asp:ETabItem runat="server" Title="图标上传" Frame="true" Url="ImageUpload.aspx">
                </asp:ETabItem>

                 <asp:ETabItem runat="server" Title="配置设置" Frame="true" Url="Config.aspx">
                </asp:ETabItem>
 
                <asp:ETabItem runat="server" Title="登录设置" Frame="true" LazyUrl="ChangeUser.aspx">
                </asp:ETabItem>

                 <asp:ETabItem runat="server" Title="调试设置" Frame="true" LazyUrl="Debug.aspx">
                </asp:ETabItem>



            </asp:ETab>

        </div>



    </form>
</body>
</html>
