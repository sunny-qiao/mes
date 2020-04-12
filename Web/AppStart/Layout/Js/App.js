var moduleName = null;//模块名称、[应用名称]
var container = null;//容器
var its = false;
var appGroupData = {};
var ABOUNT_ME_URL;//关于我地址

//点击App
function SystemChange(id, code, obj) {
    
    collapseApp();
  
    var $this = $(obj);
    $(".nav").find("a").removeClass("selected");//清除选中
    $this.addClass("selected");//第一个选中

    var type = $this.attr("type");
    if (type == "float") {
        $(".more-app").parents("a").addClass("selected");//第一个选中
    }

    var name = $this.find("h2").html();
    var url = $this.attr("data-url");
    var type = $this.attr("data-type");
    var target = $this.attr("data-target");
    var action = $this.attr("data-action");
    var children = $this.attr("data-children");

    var app = {};
    app.name = name;
    app.type = type;
    app.appId = id;
    app.target = target;
    app.abountMeUrl = abountMeUrl;
    app.level = $this.attr("data-level");

    if (children == "true") {
        return showChildren(id);
    }

    var abountMeUrl = $this.attr("data-aboutme-url");

    var image = $this.find("img").attr("src");

    showAppName(name, image);

    if (action != "") {
        return eval(action + "(obj)");//自定义功能
    }

    if (its && url == "") {

        msg.warning("[" + name + "] 应用没有配置地址");
        msg.closemask();
        if (container) { container.hide(); }

        home();

        return;
    }
 
    $("#hidWebBoxUrl").val(url);
    $("#hidWebBoxMemo").val("appActionType=" + appActionType);
 
    if (url) {
         
        url = convertUrl(url);
  
        if (window.entryUrl != "") {
            url = urlAppend(url, "EntryUrl=" + encodeURIComponent(window.entryUrl));
            url = urlAppend(url, "EntryName=" + encodeURIComponent(window.entryName));

            window.entryUrl = "";
        }
 
        if (window.companycode) { url = urlAppend(url, "companycode=" + window.companycode + "&nodeid=" + window.companyid); }

        app.url = url;

        var e = window.event || arguments.callee.caller.arguments[0];
 
        showApp(app,e);
  
        return;
    }
    else {
        if (container) { container.hide(); }

        showMenu();
    }

    if ($("#hidSys").val() != code) {

        moduleName = name;

        closeAll();

        $("#hidModuleId").val(id);

        $("#app").hide();

        var appActionType = $("#hidAppActionType").val();

        if (appActionType == "Default") {

            try {
                $("#menu")[0].contentWindow.load();
            } catch (e) {
            }

            $("#left").find("#menuName").html(name);

            $("#menu").attr("src", getMenuUrl()+"?moduleId=" + id + "&dsp=" + eci.guid());

            var homeUrl = $("#hidHomeUrl").val();

            if (homeUrl == "") {
                homeUrl = "../Welcome/Welcome.aspx";
            }
            openTab("home", "首页", homeUrl, { fix: "fix" });
        }
        else if (appActionType == "PostBack") {

            eci.post("../../Data.ashx", "SystemChange", { id: id, code: code, name: name }, function (response) { msg.ajax(response); })
        }
    }
}

function getMenuUrl()
{
    var url = "../Menu/Menu4.aspx";
    var menuUrl = $("#hidMenuUrl").val();
    if(menuUrl)
    {
        url = menuUrl;
    }
    return url;
}

function convertUrl(url) {
    var from = $("#hidItsUrlReplaceFrom").val();
    var to = $("#hidItsUrlReplaceTo").val();

    if (from != "") {
        url = url.replace(from, to);
    }

    return url;
}

function urlAppend(url, param) {
    if (url.indexOf('?') >= 0) {
        url = url + "&" + param;
    }
    else {
        url = url + "?" + param;
    }

    return url;
}

function showChildren(id) {
    $(".appItem2").hide();
    $("." + id).show();
    $("#app2").show();

    var top = $("#trLogo").height();
    $("#app2").css("top", top + "px");
}

function showAppName(name, image) {
    $("#currentAppName").html(name).show();
}

function showApp(app,e) {
     
    var name = app.name;
    var url = app.url;
    var type = app.type;
    var appId = app.appId;

    ABOUNT_ME_URL = app.abountMeUrl;

    var token = $('#strToken').val();

    if (url.indexOf('?') < 0) {
        url = url + "?";
    }
 
    url = url + "&strToken=" + token;

    $("#app").hide();

    if (app.level == "2") {
        $("#app2").hide();
    }
 
    e = e|| event || arguments.callee.caller.arguments[0];
 
    if (e.ctrlKey) {
        app.target = "new";
    }
 
    if (app.target) {
        window.open(url);
    }
    else {
        container = createContainer();
        container.attr("type", type);
        container.attr("src", url);
        msg.loading();

        hideHome();

        containerResize();
        container.show();
    }
}

//创建应用承载容器
function createContainer() {
    container = $("#container");

    if (container.length == 0) {
        var containerHtml = '<iframe id="container"  code="" frameborder="no" border="0" style="display: none; position: absolute; top: 88px; border: 1px; height:100%; width: 100%; z-index: 10" scrolling="auto"></iframe>';
        $("body").append(containerHtml);
        container = $("#container");

        container[0].onload = container[0].onreadystatechange = iframeload;
    }

    return container;
}

function containerResize() {
    if (!container) { return; }

    var logoIsHidden = $("#trLogo").is(":hidden");

    if (logoIsHidden) {
        var height = eci.height() - 44;

        container.css("top", "28px");
        container.css("height", height);
        //$("#divWorkArea").height(height);
    }
    else {
        var top = $("#trLogo").height();
        height = eci.height() - (top + 20);
        container.css("height", height);
        container.css("top", top + "px");
        //$("#divWorkArea").height(height);
    }
}

function iframeload() {
    msg.close();
}

function expandApp(id) {
    var isAppGroup = $(this).hasClass("app-group");

    if (id) {
        $("#app").find(".appItem").hide();

        $("#app").find(".appItem").each(function () {

            var parentId = $(this).attr("data-parentid");

            if (id == parentId) {
                $(this).show();
            }

        });
    }


    $("#app2").hide();
    $("#app").show();
    var top = $("#trLogo").height();

    $("#app").css("top", top + "px");

    var height = $("#app").height();

    if (container) {
        var type = container.attr("type");
        if (type == "Silverlight") {
            container.css("top", top + height + 45);
        }
    }

    if (isAppGroup) {
        $(this)[0].click();
    }
}

function collapseApp() {
    $("#app").hide();

    if (container) {
        var top = $("#trLogo").height();
        container.css("top", top + "px");
    }
}


function adjustAppBox() {
    var left = $(".topleft").width();
    var right = $(".topright").width();
 

    var width = eci.width();

    $(".nav").width(width - left - right-30);

}

$(function () {
 
    if (window.error) { return; }

    $(".nav").find("a").removeClass("selected");//清除选中
    $(".nav").find("a:first").addClass("selected");//第一个选中

    its = $("#hidIts").val() == "true";

    trace("its=" + its);

    //如果是集成框架,没有配置地址的App设置黄色
    if (its) {
        $(".appItem").find("a").each(function () {
            var url = $(this).attr("data-url");
            if (url == "") {
                $(this).find("h2").css("color", "yellow");
            }
        });

        hideMenu();

        $("#divMenuControl").hide();
    }

    var appDisplayType = $("#hidAppDisplayType").val();
    var appActionType = $("#hidAppActionType").val();

    trace("appDisplayType=" + appDisplayType);
    trace("appActionType=" + appActionType);


    if (appDisplayType == "Float" || appDisplayType == "Fix") {

        var selector = "#app,.app-group";

        if ($("#hidAppGroup").val() == "true") {
            selector = "#app,.app-group";
        }

        var eventName = $("#hidAppShowEvent").val();

        if (eventName == "Click") {
            $("#AppTop_currentli,.top-app").click(function (event) {
                var id = $(this).attr("data-id");
                expandApp(id);
                event.stopPropagation();
            });
        }
        else {
            $("#AppTop_currentli,#divApp3,.top-app").mouseover(function (event) {
                var id = $(this).attr("data-id");
                expandApp(id);
                event.stopPropagation();
            });
        }

        $(selector).mouseover(function (event) {

            if (checkHover(event, this)) {
                expandApp();
                event.stopPropagation();
            }
        });

        $(selector).mouseout(function (event) {

            if (checkHover(event, this)) {

                collapseApp();

                event.stopPropagation();
            }
        });

        $(".module").mouseover(function (event) {

            if (checkHover(event, this)) {

                collapseApp();

                event.stopPropagation();
            }
        });




        $("#app2").mouseout(function (event) {

            if (checkHover(event, this)) {
                $("#app2").hide();
                event.stopPropagation();
            }
        });
    }

    //菜单加载类型
    var menuLoadType = $("#hidMenuLoadType").val();

  
    trace("menuLoadType=" + menuLoadType);
  

    if (menuLoadType == "Default") {

        $("#menu").attr("src",  getMenuUrl());
    }
    else if (menuLoadType == "Hide") {
        hideMenu();
    }
    else if (menuLoadType == "First") {

        // $(".nav").find(".module").find("a")[0].click();

        var a = $(".nav-app").find(".appItem").find("a");

        if (a.length > 0) {

            var id = a.attr("data-id");
            var code = a.attr("data-code");

            SystemChange(id, code, a[0]);
 
            if (appActionType == "PostBack") {
                $("#menu").attr("src", "../Menu/Menu4.aspx");
            }
        }
    }
    else if (menuLoadType == "Second") {
        $(".nav").find(".module").find("a")[1].click();

        var a = $(".nav-app").find(".appItem").find("a");

        if (a.length > 1) {

            var id = a[1].attr("data-id");
            var code = a[1].attr("data-code");

            SystemChange(id, code, a[1]);
        }
    }
 
})