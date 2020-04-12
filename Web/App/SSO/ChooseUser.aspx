<%@ page language="C#" autoeventwireup="true" inherits="App_SSO_ChooseUser, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户选择</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />

    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <link href="../../EasyUI/themes/default/easyui.css" rel="stylesheet" />
    <link href="../../EasyUI/themes/icon.css" rel="stylesheet" />
    <script type="text/javascript" src="../../EasyUI/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="Js/ChooseUser.js?v=1"></script>
    <style type="text/css">
        div#rMenu {
            position: absolute;
            visibility: hidden;
            top: 0;
            background-color: #AECAF0;
            text-align: left;
            padding: 2px;
        }

            div#rMenu ul li {
                margin: 1px 0;
                padding: 0 8px;
                cursor: pointer;
                list-style: none outside none;
                background-color: #C7DDFD;
            }

                div#rMenu ul li:hover {
                    background: #FFB951;
                }
    </style>


</head>


<script type="text/javascript">

    $(function () {

        var employee = new Employee();
        employee.Init();

        window.LoadUsers = employee.QueryUser;

 
        $("#divHidden").show();

    });

    function searchAction() {
        var data = {};

        var node= $('#tt').tree('getRoot');
      
        data.NODEID = node.id;
        var userName = $("#txtUserName").val();
        var trueName = $("#txtTrueName").val();

        data.userName = userName;
        data.trueName = trueName;

        var rootNodeId = "root";

        eci.post("ChooseUserData.aspx", "SearchUser", data, function (res) {
            if (res.success) {
                var data = res.json;
                var d = eval('(' + data + ')');

                $('#dg').datagrid('loadData', d);
                $('#dg').datagrid('loadData', d);
            }
            else { msg.ajax(res); }

        });
    }


    function chooseData(select) {

       var json = {}

        var data = [];
        for (var i = 0; i < select.length; i++) {

            var user = {};
            var id = select[i].USERID;
            var name = select[i].TRUENAME;

            user.id = id;
            user.truename = name;

            data.push(user);
        }

        var type = $("#hidType").val();

        json.type = type;
        json.data = data;   
 
        var config = window.opener.chooseUserConfig();

        if (config.client) {
            window.opener.chooseUserCallback(json);

            if(config.command=="Close")
            {
                window.close();
            }
 
        }
        else {
            json.data = JSON.stringify(data);

            eci.post(config.url, config.method, json, function (response) {
                msg.ajax(response);

                var command = response.command;

                if (config.command == "Close") {
                    window.close();
                }

                if (config.command == "CloseRefresh") {
                    window.opener.location.href = window.opener.location.href;
                    window.close();
                }

            })
        }

       
  
    }

</script>
<body class="easyui-layout">

    <form id="form1" runat="server">
        <input type="hidden" runat="server" id="hidType" />
        <input type="hidden" runat="server" id="hidNodeId" />
       
        <div data-options="region:'west',title:'组织机构'" width="340px">

            <div id="toolbar1" class="toolbar" style="width: 100%">

                <asp:EButton runat="server" Text="展开树" ID="btnExpandAll" Icon="application_put" IsClient="true" />
                <asp:EButton runat="server" Text="折叠树" ID="btnCollapseAll" Icon="application_osx_get" IsClient="true" />

            </div>
            <div>
                <ul style="height: 100%" id="tt"></ul>
            </div>

        </div>


        <div title="用户列表" data-options="region:'center',title:'用户列表'">

            <div id="toolbar" class="toolbar">

                <asp:EButton runat="server" Text="选择" ID="btnChoose" Icon="ok" IsClient="true" />

                <asp:EButton runat="server" Text="关闭" ID="btnClose" Icon="close" IsClient="true" OnClientClick="eci.close();" />

            &nbsp;&nbsp;

                姓名：<asp:ETextBox runat="server" ID="txtTrueName" Width="100"></asp:ETextBox>
                英文姓名：<asp:ETextBox runat="server" ID="txtUserName" Width="100"></asp:ETextBox>
                
                <asp:EButton runat="server" Text="查询" ID="btnSearch" Icon="find" IsClient="true" OnClientClick="searchAction();" />

            </div>
            <table id="dg" height="95%" pagination="true">
            </table>
        </div>
 
        

        <div class="hidden" id="divHidden">

            <div id="mm" class="easyui-menu" style="width: 120px;">

                <div id="btnExpand">展开</div>
                <div id="btnCollapse">折叠</div>
            </div>
        </div>

    </form>

</body>
</html>


