//修改密码
function changepwd() {
    eci.post("../../Data.ashx", "GetChangePwdUrl", {}, function (res) {

        if (res.success) {
            var url = res.url;

            if (url == "") {
                alert("配置异常，没有配置修改密码地址");
            }
            else {
                //"修改密码"
                eci.dialog(lang.M00042, url, { width: 640, height: 480 });
            }
        }
        else {
            msg.ajax(res);
        }
    })
}

//权限管理
function quanxian() {
    var strToken = $("#strToken").val();

    var url = $("#hidSsoAdminUrl").val() + "?strToken=" + strToken;

    eci.open(url);
}

function menuNotice() {
    var url = "../../App/System/EciNoticeList.aspx?type=SYS";

    openTab("notice", "系统通知", url);
}

function menuReload() {
    systemReload();
}

function menuRight() {
    eci.post("../../Data.ashx", "GetSSOManageUrl", {}, function (r) {

        var url = r.url;

        if (url == "") {
            msg.warning("没有配置权限管理地址");
        }
        else {

            window.open(url);
        }

    })
}

function menuAccess() {
    var url = "../../App/Access/Access.aspx";
    eci.open(url, { full: true });
}

//登出
function logout() {

    window.parent.location.href = "../../App/Logout/Logout.aspx";
    return;

    var loginUrl = $("#hidLoginUrl").val();

    if (loginUrl.indexOf("http") < 0) {
        loginUrl = "../../" + loginUrl;
    }

    window.parent.location.href = loginUrl;

    return;

    eci.post("../../Data.ashx", "Logout", { loading: false }, function () {
        window.parent.location.href = loginUrl;
    })


}

function refreshPage() {
    var $li = $mainTab.find(".selected");
    if ($li.length > 0) {
        var id = $li.attr("data");

        var win = $workArea.find("iframe[data=" + id + "]")[0].contentWindow;

        try {
            win.location.href = win.location.href;
        }
        catch (error) {

        }
    }
}

function systemReload() {

    orgAppCache = {};
    eci.post("../../Data.ashx", "SystemReload", {}, function (response) {
        if (response.success) {
            msg.tip(response.message);
        }
        else {
            msg.ajax(response);
        }
    });
}

function home() {

    if (container) {
        container.hide()
    }

    var homeUrl = $("#hidHomeUrl").val();

    var strToken = $("#strToken").val();

    homeUrl = homeUrl + "?strToken=" + strToken;

    openTab("home", "首页", homeUrl);

    $("#modulemenu").find(".place").show()
    containerResize();
}

function hideHome() {
    openTab("home", "首页", "");
    $("#modulemenu").find(".place").hide();

}

function dev() {
    openTab("dev", "开发平台", "../../App/System/Dev.aspx");
}

function resource() {
    var url = $("#hidResourceUrl").val();
    openTab("resource", "开发资源", url);
}

function menuViewSource() {

    var $li = $mainTab.find(".selected");
    if ($li.length > 0) {
        var id = $li.attr("data");

        var file = $workArea.find("iframe[data=" + id + "]")[0].contentWindow.location.href;

        if (file == "about:blank") {
            return;
        }

        var url = "../../App/System/SourceFile.aspx?file=" + file;
        eci.open(url);
    }
}

function showMoreFunction() {
    var url = "../../App/Tool/Head.aspx";
    openTab("SystemTool", lang.M00028, url);//系统功能
}

function showChart(obj) {
    var url = $(obj).attr("url");
    openTab("SystemChart", "统计分析", url);
}

function showTaskCenter(obj) {
    var url = $(obj).attr("url");
    eci.dialog("任务中心", url, { icon: "world" });
}

function menuShowMenu() {
    showMenu();
}

function menuHideMenu() {
    hideMenu();
}

function menuReload() {
    systemReload();
}

function menuRefresh() {
    parent.window.location.reload();
}

function menuClearSession() {
    eci.post("../../Data.ashx", "ClearSession", {});
}

function menuDevLog() {
    eci.post("../../Data.ashx", "DevLog", {}, function (response) {

        msg.ajaxAlert(response);

    });
}

//查看版本
function menuVersion() {
    var url = "../../App/Version/Version.aspx";
    eci.dialog("系统版本", url);
}

//查看版本
function menuConfig() {
    var url = "../../App/Config/ConfigView.aspx";
    eci.dialog("系统配置", url);
}

function logoEvent() {

    var e = window.event || arguments.callee.caller.arguments[0];

    if (e.ctrlKey) {
        url = "../../App/Tool/Tool.aspx";
        eci.dialog("辅助功能", url, { height: 350, width: 700 });
    }
}

//系统版本
function menuSystemVersion(obj) {
    var url = $(obj).attr("data-url");
    if (url) {
        eci.open(url);
    }
    else {
        msg.warning("没有配置查询系统发布版本地址");
    }
}

//权限管理
function menuSSO(obj) {
    var url = $(obj).attr("data-url");
    if (url) {
        eci.open(url);
    }
    else {
        msg.warning("没有配置权限管理地址");
    }
}

//默认
function menuDefault(obj) {
    var url = $(obj).attr("data-url");
    if (url) {
        eci.open(url);
    }
    else {
        msg.warning("配置不正确");
    }
}

function menuDialog(obj) {
    var url = $(obj).attr("data-url");
    var title = $(obj).attr("data-title");
    var width = $(obj).attr("data-width");
    var height = $(obj).attr("data-height");

    var option = {};
    if (width) { option.width = width; }
    if (height) { option.height = height; }

    if (url) {
        eci.dialog(title, url, option);
    }
    else {
        msg.warning("配置不正确");
    }

}

function menuShowSession(obj) {
    var url = "../../App/Session/SessionView.aspx";
    eci.dialog("用户会话详细信息", url, { width: 800, height: 400 });
}

function dataSelect() {
    var obj = $("#aDataSelect");
    var url = $(obj).attr("data-url");
    var name = $(obj).attr("data-name");
    var value = $(obj).attr("data-value");
    var width = $(obj).attr("data-width");
    var height = $(obj).attr("data-height");
    var icon = $(obj).attr("data-icon");

    if (url.indexOf('?') < 0) {
        url += "?value=" + value;
    }
    else {
        url += "&value=" + value;
    }

    eci.dialog(name, url, { width: width, height: height, icon: icon });
}

function dataSelected(value, display) {
    $("#aDataSelect").attr("data-value", value);
    $("#aDataSelect").html(display);

    var closeTab = $("#aDataSelect").attr("data-closeTab");

    if (closeTab == "true") {
        closeAll();
    }
    else {
        refreshCurrentTab();
    }
}

function selectCompany(obj) {
    var url = $(obj).attr("StartUrl");
    window.location.href = url;
}


function feedback() {
     
    var url = "../../App/System/EciFeedBack.aspx";
          
    eci.open(url, {width:1020,target:"feedback"});
 

}


function menuMyFeedback() {
    eci.post("../../Data.ashx", "GetFeedbackUrl", { type: "list" }, function (response) {

        if (response.success) {
            var url = response.url;
            eci.open(url, { full: true });

        }
        else {
            msg.ajax(response);
        }
    })
}

function menuIEVersion() {
    var browser = navigator.appName
    var b_version = navigator.appVersion
    var version = b_version.split(";");
    var trim_Version = version[1].replace(/[ ]/g, "");
    if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE6.0") {
        alert("IE 6.0");
    }
    else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE7.0") {
        alert("IE 7.0");
    }
    else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE8.0") {
        alert("IE 8.0");
    }
    else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE9.0") {
        alert("IE 9.0");
    }
    else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE10.0") {
        alert("IE 10.0");
    }
    else {
        alert(browser + " " + trim_Version);
    }
}

function changePlatform() {
    var url = "../../App/System/Platform.aspx";

    eci.dialog("运行公司选择", url, { width: 750, height: 380 });
}


function changePlatformCallback(code) {
    var replace = "";
    var Platform = getQueryVariable("Platform");

    if (Platform) {
        replaceValue = "Platform=" + Platform;
    }

    else (Platform == false)
    {
        Platform = getQueryVariable("platform");

        if (Platform) {
            replaceValue = "platform=" + Platform;
        }
    }

    var url = window.location.href;

    url = url.replace(replaceValue, "Platform=" + code)

    window.location.href = url;
}
