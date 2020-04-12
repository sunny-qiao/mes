<%@ page language="C#" autoeventwireup="true" inherits="AppStartPT_Layout_Main, ECI.Web" enablesessionstate="True" enableviewstatemac="false" %>

<%@ Register Src="~/AppStart/Layout/uc/AppTop.ascx" TagPrefix="uc1" TagName="AppTop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" style="overflow-x: hidden; overflow-y: hidden;">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>主框架页</title>
    <link rel="icon" href="../../favicon.ico" type="image/x-icon" />

    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <link href="css/main.css?v=111" rel="stylesheet" />

    <script type="text/javascript" src="Js/Main.js?v=555"></script>
    <script type="text/javascript" src="Js/Notice.js?v=555"></script>
    <script type="text/javascript" src="Js/Org.js?v=555"></script>
    <script type="text/javascript" src="Js/Toolbar.js?v=555"></script>
    <script type="text/javascript" src="Js/Cross.js?v=555"></script>
    <script type="text/javascript" src="Js/App.js?v=555"></script>

    <script src="../../Scripts/jquery.contextmenu.js" type="text/javascript"></script>

    <style type="text/css">
        .l-btn {
            color: white;
            background: transparent;
            border: none;
            filter: none;
        }

            .l-btn:hover {
                border: none;
            }

            .l-btn:hover {
                background: transparent;
                color: #ffffff;
                border: 0px solid #b7d2ff;
                filter: none;
            }
    </style>


    <script type="text/javascript">

        function ChangeCompany(obj) {

            var name = $(obj).find("h2").html();
            var code = $(obj).attr("data-code");

            closeAll();

            $("#app").hide();

            eci.post("../../Data.ashx", "ChangeCompany", { companyCode: code, companyName: name }, function (res) {

                if (res.success) {

                    $("#AppTop_current").html(name);
                    $("#currentImg").attr("src", "../../Samples/App/" + code + ".png")

                    $("#menu").attr("src", "../Menu/Menu4.aspx?dsp=" + eci.guid());

                    msg.tip(res.message);
                }

            })
        }


        $(function () {

            $("#close-current").html('<img src="css/images/cancel.gif" alt="" />' + lang.M00029 + '</li>');
            $("#close-all").html('<img src="css/images/cancel.gif" alt="" />' + lang.M00030 + '</li>');
            $("#close-other").html('<img src="css/images/cancel.gif" alt="" />' + lang.M00031 + '</li>');
            $("#refresh-page").html('<img src="css/images/refresh.png" alt="" />' + lang.M00032 + '</li>');
            $("#full-screen").html('<img src="css/images/fullscreen.png" alt="" />' + lang.M00033 + '</li>');

            $("#ul-context-menu").css("width", "160px");

            var myFavorite = $("#hidMyFavorite").val();

            var skin = $("#hidSkin").val();

            if (skin) {
                $(".f-body").addClass(skin);
            }
 

        })


    </script>

</head>
<body class="f-body" style="overflow: hidden;">
    <form id="form1" runat="server">

        <div id="log" style="display: none;">
        </div>

        <input type="hidden" id="hidSkin" runat="server" />
        <input type="hidden" id="hidWebBoxUrl" runat="server" />
        <input type="hidden" id="hidWebBoxMemo" runat="server" />
        <input type="hidden" id="hidItsUrlReplaceFrom" runat="server" />
        <input type="hidden" id="hidItsUrlReplaceTo" runat="server" />
        <input type="hidden" id="hidNoticeGuid" runat="server" />
        <input type="hidden" id="hidLoginUrl" runat="server" />
        <input type="hidden" id="hidHomeUrl" runat="server" />
        <input type="hidden" id="hidHomeShowType" runat="server" />
        <input type="hidden" id="hidResourceUrl" runat="server" />
        <input type="hidden" id="hidUrl" runat="server" />
        <input type="hidden" id="hidModuleId" runat="server" />
        <input type="hidden" id="prHideLogo" runat="server" />
        <input type="hidden" id="strToken" runat="server" />
        <input type="hidden" id="hidIts" runat="server" />
        <input type="hidden" id="hidAppGroup" runat="server" />
        <input type="hidden" id="hidAppGroupMode" runat="server" />
        <input type="hidden" id="hidWebSite" runat="server" />
        <input type="hidden" id="hidSelectOrg" runat="server" />

        <!--登录Token-->
        <input type="hidden" id="hidAppDisplayType" runat="server" />
        <input type="hidden" id="hidAppActionType" runat="server" />
        <input type="hidden" id="hidAppShowEvent" runat="server" />

        <!--功能菜单加载方式: Default默认（加载） None(不加载） First(加载一个模块) -->
        <input type="hidden" id="hidMenuLoadType" runat="server" />
        <input type="hidden" id="hidSsoAdminUrl" runat="server" />
        <input type="hidden" id="hidError" runat="server" />
        <input type="hidden" id="hidMenuWidth" runat="server" />
        <input type="hidden" id="hidMainMode" runat="server" />
        <input type="hidden" id="hidTabMenuAction" runat="server" />

        <table id="main" class="main" cellpadding="0" cellspacing="0">
            <tr id="trLogo" runat="server" onselectstart="return false">
                <td>
                    <div class="div-top" style="overflow-x: hidden; overflow-y: hidden;">
                        <div class="topleft" style="border: 0px solid yellow;">
                            <div id="div3" runat="server" style="width: 202px; height: 30px;" visible="false">
                                <img id="imgLogo3" runat="server" onclick="logoEvent();" src="" alt="" />
                            </div>

                            <img alt="" id="imgLogo" class="img-logo" visible="false" runat="server" src="../../samples/logo/logo.png" onclick="logoEvent();" />
                            <img alt="" id="imgTitle" class="img-title" runat="server" style="" visible="false" src="" />
                            <div id="lblAppName" runat="server" class="logotxt" visible="false"></div>


                        </div>

                        <div id="divApp3" runat="server" style="float: left; padding-left: 0px; padding-right: 5px;">
                            <div style="float: left; margin-top: 5px;">
                                <img id="img2" alt="" class="img-logo1" runat="server" src="../../samples/top/app.png" onclick="logoEvent();" />
                                <img id="img3" alt="" class="img-logo1" runat="server" src="../../samples/top/myapp.png" onclick="logoEvent();" />
                            </div>
                        </div>

                        <div style="border: 0px solid green;">
                            <uc1:AppTop runat="server" ID="AppTop" />
                        </div>

                        <div class="topright" style="border: 0px solid blue;">
                            <ul id="toolbarContainer"></ul>

                            <ul runat="server" id="ulSelectOrg">
                                <li id="select-org" title="点击切换机构">
                                    <span>
                                        <img alt="" style="cursor: pointer;" src="../../Icon/chart_organisation.png" />
                                    </span><a href="javascript:void(0);"></a>
                                </li>
                            </ul>

                            <div class="userContainer" style="display: none;">
                                <div class="user" id="divUser" style="padding-left: 10px; max-width: 800px; overflow: hidden;" runat="server">
                                    <span id="currentAppName" style="color: white; display: none;" title="当前应用"></span>
                                    <asp:Label ID="lblLoginInfo" runat="server" ToolTip="关于我"></asp:Label>
                                    <i onclick="viewMessage();" runat="server" id="messageInfo">消息</i>
                                    <b onclick="viewMessage();" runat="server" id="messageQty">5</b>
                                    <i onclick="viewMessage();" runat="server" id="noticeInfo">通知</i>
                                    <b onclick="viewMessage();" runat="server" id="noticeQty">5</b>
                                </div>
                            </div>

                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <table id="content" style="height: 100%; background: #FFFFFF;" cellpadding="0" cellspacing="0">
                        <tr>
                            <td id="left" style="width: 200px; float: left; overflow-y: hidden; overflow-x: hidden; float: left; vertical-align: top;">
                                <div id="lefttop" class="lefttop">
                                    <span class="span" onclick="hideMenu()" style="float: left;"></span>
                                    <span runat="server" id="menuName" class="lefttop-name">系统功能</span>
                                    <div class="lefttop-function" runat="server" id="lefttopFunction">

                                        <img runat="server" id="imgTaskCenter" alt="" class="lefttop-function-icon" src="../../icon/world.png" onclick="showTaskCenter(this);" />

                                        <img alt="" class="lefttop-function-icon" src="../../icon/function.png" onclick="showMoreFunction();" />
                                    </div>
                                </div>
                                <iframe id="menu" frameborder="0" style="border: 0px; width: 200px;"></iframe>
                            </td>
                            <td id="right" style="min-width: 500px; vertical-align: top; width: 100%;">
                                <div id="modulemenu" class="sysmenu" style="overflow: hidden; display: none;">
                                    <div class="place">
                                        <div id="divMenuControl" class="menu-control">
                                            <img src="css\images\right.png" alt="" onclick="showMenu();" />
                                        </div>

                                        <div id="tab" class="div-tab">
                                            <ul id="mainTab" class="ul-main"></ul>

                                            <div class="tab-right">
                                                <ul>
                                                    <li>
                                                        <div class="tool-data-select" style="float: right; cursor: pointer;" visible="false" runat="server" id="divDataSelect">
                                                            <a id="aDataSelect" runat="server" onclick="dataSelect(this)">请选择</a>
                                                        </div>
                                                    </li>

                                                    <li id="selectCompany" runat="server" onclick="selectCompany(this);" title="切换公司">
                                                        <a style="background: url('../../Icon/chart_organisation.png') no-repeat; background-position: left center; padding-left: 20px;" href="javascript:void(0);" runat="server" id="selectCompanyName">切换公司</a>
                                                    </li>

                                                    <%--  <li>
                                                        <div class="notice" style="padding-left: 10px; overflow: hidden;">
                                                            <i onclick="viewNotice()">通知</i>
                                                            <b onclick="viewNotice()">0</b>
                                                        </div>
                                                    </li>--%>
                                                </ul>
                                            </div>


                                        </div>
                                    </div>
                                </div>

                                <div id="divWorkArea" style="border: 0px solid red; height: 200px;"></div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="trBottom" style="display: none;" runat="server">
                <td style="padding-right: 10px;">

                    <div style="float: left;">

                        <span id="lblLogin" runat="server"></span>

                    </div>

                    <div style="float: right;">
                        <span id="lblSupportInfo" runat="server"></span>

                    </div>


                </td>
            </tr>
        </table>

        <div id="divContextMenu" class="hidden">
            <div id="context-menu" style="left: 769px; top: 65px; display: none; width: 380px; font-size: 11px;">
                <ul id="ul-context-menu" style="background: #dfe8f6; width: 140px">
                    <li id="close-current">
                        <img src="css/images/cancel.gif" alt="" />关闭页面</li>
                    <li id="close-all">
                        <img src="css/images/cancel.gif" alt="" />关闭全部</li>
                    <li id="close-other">
                        <img src="css/images/cancel.gif" alt="" />关闭其它</li>

                    <li id="refresh-page">
                        <img src="css/images/refresh.png" alt="" />重新加载</li>

                    <li id="full-screen">
                        <img src="css/images/fullscreen.png" alt="" />全屏显示</li>

                    <li id="my_favorite" runat="server" visible="false">
                        <img src="css/images/favorites.png" alt="" />加入收藏</li>
                </ul>
            </div>
        </div>

        <ul runat="server" id="topToolbar" style="float: right; display: none;">
            <li style="">
                <div id="userBox" class="user-box"></div>
            </li>
            <asp:FrameworkTool runat="server" ID="functionBarChangePlatform" Icon="chart_organisation" Text="切换区域" OnClick="changePlatform();" />
            <asp:FrameworkTool runat="server" ID="functionBarOnlineService" LangCode="SYSTEM_ON_LINE_SERVICE" Icon="service" Text="在线客服" />
            <asp:FrameworkTool runat="server" ID="functionBarFullScreen" LangCode="SYSTEM_FULL_SCREEN" Icon="up" Text="全屏" OnClick="up();" />
            <asp:FrameworkTool runat="server" ID="functionBarDev" LangCode="SYSTEM_DEV_PLATFORM" Icon="function" Text="开发平台" OnClick="dev();" />
            <asp:FrameworkTool runat="server" ID="functionBarRefresh" LangCode="SYSTEM_REFRESH" Icon="reload" Text="刷新" OnClick="refreshPage();" />
            <asp:FrameworkTool runat="server" ID="functionBarSelectCompany" LangCode="SYSTEM_SELECT_COMPANY" Icon="chart_organisation" Text="切换公司" OnClick="selectCompany(this);" />
            <asp:FrameworkTool runat="server" ID="functionBarViewSource" LangCode="SYSTEM_VIEW_SOURCE" Icon="source" Text="查看源码" OnClick="menuViewSource();" />
            <asp:FrameworkTool runat="server" ID="functionBarResource" LangCode="SYSTEM_DEV_RESOURCE" Icon="plugin" Text="开发资源" OnClick="resource();" />
            <asp:FrameworkTool runat="server" ID="functionBarReload" LangCode="SYSTEM_RELOAD" Icon="reload" Text="重新加载" OnClick="systemReload();" />
            <asp:FrameworkTool runat="server" ID="functionBarHome" LangCode="SYSTEM_HOME" Icon="home" Text="首页" OnClick="home();" />
            <asp:FrameworkTool runat="server" ID="functionFeedback" ImageHeight="20px" ImageWidth="20px" LangCode="SYSTEM_FEEDBACK" Icon="feedback" Text="反馈" OnClick="feedback();" />
            <asp:FrameworkTool runat="server" ID="functionBarChangePassword" LangCode="SYSTEM_CHANGE_PASSWORD" Icon="lock_edit" Text="修改密码" OnClick="changepwd();" />
            <asp:FrameworkTool runat="server" ID="functionBarQuite" LangCode="SYSTEM_QUITE" Icon="exit" Text="退出" OnClick="logout();" />

        </ul>

        <div id="divRefresh" style="display: none;">
            <iframe style="display: none;" src="../../App/Refresh/Refresh.aspx"></iframe>
        </div>
    </form>
</body>
</html>
