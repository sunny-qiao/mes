var $mainTab;
var $workArea;
window.main = true;
window.error = false;
window.layoutDebug = false;
window.companycode = "";
window.companyid = "";
tabMenuAction = "1";
window.entryUrl = "";
window.entryName = "";

$(function () {
    $("#trBottom").show();
    $("#modulemenu").show();

    var width = parseFloat($("#hidMenuWidth").val());
    $("#left").width(width);
    $("#menu").width(width);

    tabMenuAction = $("#hidTabMenuAction").val();

    setui();

    $mainTab = $("#mainTab");
    $workArea = $("#divWorkArea");
    $(window).resize(function () { mainresize(); });

    var homeUrl = $("#hidHomeUrl").val();
    var homeShowType = $("#hidHomeShowType").val();

    var errorMessage = $("#hidError").val();

    if (errorMessage != "") {
        window.error = true;
        $("#app").hide();

        msg.warning(errorMessage);
    }

    if (window.error) { return; }

    var strToken = $("#strToken").val();

    homeUrl = homeUrl + "?strToken=" + strToken;

    if (homeShowType == "1") {
        openTab("home", lang.M00027, homeUrl, { fix: "fix" });
    }

    window.entryUrl = $("#hidEntryUrl").val();
    window.entryName = $("#hidEntryName").val();

    if (window.entryUrl == undefined) {
        window.entryUrl = "";
    }

    if (window.entryName == undefined) {
        window.entryName = "";
    }

    var EnableEntryUrl = $("#hidEnableEntryUrl").val() == "Y";
    EnableEntryUrl = true;

    if (EnableEntryUrl) {

        if (window.entryUrl != "") {
            if (window.entryName == "") {
                window.entryName = "起始页";
            }

            openTab("entry", window.entryName, window.entryUrl);
        }
    }

    $("#lblTitle").click(function () {
        $("#left").toggle();
        mainresize();
    });

    if ($("#prHideLogo").val() == "Y") {
        $("#trLogo").hide();
    }

    if ($("#form1").attr("LayoutDebug") == "true") {
        window.layoutDebug = true;
    }

    mainresize();

    $("#divUser").click(function () {
        eci.window("divAboutMe");
    });

    $("#lefttop").click(function (e) {

        e = e || event || arguments.callee.caller.arguments[0];

        if (e.ctrlKey) {
            var $li = $mainTab.find(".selected");
            if ($li.length > 0) {
                var id = $li.attr("data");

                var href = $workArea.find("iframe[data=" + id + "]")[0].contentWindow.location.href;

                var website = "http://" + $("#hidWebSite").val();

                if (href == "about:blank") {
                    return;
                }

                href = href.replace(website, "");

                msg.alert(href);
            }
        }
    });

    $("#trLogo").click(function (e) {
        e = e || event || arguments.callee.caller.arguments[0];

        if (e.ctrlKey) {
            var url = $("#hidWebBoxUrl").val();
            if (url) {
                //msg.alert(url);
            }
        }
    });

    $("#trLogo,#left").mouseover(function () {

        $("#jqContextMenu").hide();
        $("#jqContextMenu").next("div").hide();
    })

    var html = $("#topToolbar").html();
    $("#toolbarContainer").html(html);
    $("#topToolbar").remove();

    licenseTip();


    $("#lblLoginInfo").dblclick(function () {

        var url = "../../App/Session/SessionView.aspx";
        var option = { height: 480, width: 640, icon: "user" }

        eci.dialog("用户信息", url, option);

    })


});


function licenseTip() {
    var exists = $("#LicenseMessage").length > 0;

    if (exists) {
        var message = $("#LicenseMessage").val();
        var interval = parseFloat($("#LicenseInterval").val()); //单位秒 分钟 
        interval = interval * 60 * 1000;

        msg.warning(message);

        setTimeout(function () {

            msg.warning(message);

        }, interval);

    }

}


function trace(msg) {
    var log = $("#log").html();
    $("#log").html(log + msg + "\r\n");

}


function setui() {
    var mainMode = $("#hidMainMode").val();

    if (mainMode == "30") {
        var user = $("#divUser");
        user.remove();
        $("#userBox").html("").append(user);
    }
    else {
        $("#userBox").parent().remove();
        $(".userContainer").show();
    }
}

function mainCloseTab(win) {
    closeCurrent();
}

function mainOpenUrl(url) {
    var strToken = $("#strToken").val();

    if (url.indexOf('?') < 0) {
        url = url + "?strToken=" + strToken;
    }
    else {
        url = url + "&strToken=" + strToken;
    }


    eci.open(url);
}

function mainOpenTab(id, title, url, option) {
    id = $.trim(id);
    openTab(id, title, url, option);
}

function openTab(id, title, url, option) {
    id = $.trim(id);
    option = $.extend({}, option);

    //控制页面不可以重复打开
    var $iframe = $workArea.find("iframe[data=" + id + "]");

    var onlyOneTab = false;

    if ($iframe.length > 0) {

        if (tabMenuAction == "1") {
            $iframe.attr("src", url);
            $mainTab.find("li[data=" + id + "]").find("div").html(title);
        }

        mainresize();
    }
    else {
        //创建页面
        var html = '<li data="' + id + '" url="' + url + '" class="tab"><a href="javascript:void(0);">' + title + '</a>';
        html += '</li>';
        $mainTab.find("li").removeClass("selected");
        $mainTab.append(html);
        $mainTab.append('<li class="separate" style="border:0px;"></li>');

        if (option.fix) {
            $("li[data=" + id + "]").attr("fix", "fix");
        }

        html = '<iframe ';
        if (option.openid) {
            html += ' openid="' + option.openid + '" ';
        }
        html += ' data="' + id + '" src="' + url + '"  frameBorder="no" style="margin-left:-1px; margin-right:-7px; border:0px solid red;width:100%;"></iframe>';

        $workArea.append(html);

        initEvent(id);
        mainresize();
    }

    showTab(id);
}


function mainresize() {
    if (!$workArea) {
        $workArea = $("#divWorkArea");
    }

    var topHeight = getTopHeight();
    var bottomHeight = getBottomHeight();

    var workAreaHeight = 500;
    var frameHeight = 500;

    var winHeight = $(window).height();

    $("#txtLog").val("winHeight=" + winHeight + "  topHeight=" + topHeight + " bottomHeight=" + bottomHeight + " documentMode=" + document.documentMode);

    if (document.documentMode == "81") {
        workAreaHeight = winHeight - topHeight - bottomHeight - 30;
        frameHeight = workAreaHeight + 30;
    }
    else {
        workAreaHeight = winHeight - topHeight - bottomHeight - 0;
        frameHeight = workAreaHeight;
    }

    if (document.documentMode == "11") {
        // workAreaHeight = workAreaHeight - 70;
        //frameHeight = frameHeight - 80;
    }

    //$("#menu").css("border", "1px solid red");
    $("#menu").height(workAreaHeight);
    $workArea.height(workAreaHeight);
    $workArea.find("iframe").height(frameHeight);

    var menuWidth = $("#left").width();

    if ($("#menu").is(":hidden")) {
        menuWidth = 0;
    }

    var workAreaWidth = $(window).width() - menuWidth - 2 - 1;

    $workArea.width(workAreaWidth);
    $workArea.find("iframe").width(workAreaWidth);

    containerResize();

    if (window.layoutDebug) {
        $("#txtLog").show();
        $workArea.find("iframe").css("border", "1px solid green");
        $workArea.css("border", "1px solid blue");
    }
    else {
        //$workArea.css("border-bottom", "1px solid #95B8E7");
        // $workArea.css("border-right", "2px solid #3B95C8");
    }
}

function getTopHeight() {
    var height = 0;

    if (!$("#trLogo").is(":hidden")) {
        height += $("#trLogo").height();
    }

    height += $("#modulemenu").height();

    return height;
}

function getBottomHeight() {
    var height = 0;

    if ($("#trBottom").is(":visible")) {
        height += $("#trBottom").height();
    }
    return height;
}

function initEvent(id) {
    $li = $mainTab.find("li[data=" + id + "]");

    $li.find(".close").click(function () {
        closeTab(id);
    });


    $li.click(function () {
        showTab(id);
    });

    var fix = $li.attr("fix");

    if ($("#context-menu").length == 1) {

        $li.contextMenu('context-menu', {
            bindings:
            {
                'full-screen': function (t) { full($(t).attr("data")); },
                'close-current': function (t) { closeTab($(t).attr("data")); },
                'close-all': function (t) { closeAll(); },
                'close-other': function (t) { closeOther($(t).attr("data")); },
                'refresh-page': function (t) { menuRefreshPage($(t).attr("data")); },
                'my_favorite': function (t) { addMyFavorite($(t)); }
            }
        });
    }
}

function addMyFavorite(t) {
    var id = t.attr("data");
    var url = t.attr("url");
    var name = t.text();

    var data = { icon: "function", post: true, width: 800, height: 480, data: { id: id, url: url, name: name } }

    var url = $("#hidMyFavoriteEditUrl").val();

    eci.dialog("我的收藏", url, data);

}

function showTab(id) {
    //选项卡样式
    $mainTab.find("li").removeClass("selected");
    $("li[data=" + id + "]").addClass("selected");
    //选项卡分隔线样式
    $mainTab.find("li.separateselected").removeClass("separateselected").addClass("separate");
    $("li[data=" + id + "]").next().addClass("separateselected");
    $("li[data=" + id + "]").prev().addClass("separateselected");

    //页面显示控制
    $workArea.find("iframe").hide();
    $workArea.find("iframe[data=" + id + "]").show();
}

function closeCurrent() {
    var $li = $mainTab.find(".selected");
    if ($li.length > 0) {
        var id = $li.attr("data");
        closeTab(id);
    }
}

function full(id) {
    up();
    hideMenu();
}

function closeTab(id) {
    id = $.trim(id);
    $this = $mainTab.find("li[data=" + id + "]");

    var fix = $this.attr("fix");
    if (fix == "fix") {
        return;
    }

    //是否可以控制取消关闭，根据未来需要
    try {
        $workArea.find("iframe[data=" + id + "]")[0].contentWindow.pageclose();
    }
    catch (e) {
    }

    //获取当前页面的openid
    var openId = currentTabOpenId();

    $this.next().remove();
    $this.remove();
    $workArea.find("iframe[data=" + id + "]").remove();

    if (openId) {
        showTab(openId);
    }
    else {
        lastshow();
    }
}

function refreshCurrentTab() {
    var $li = $mainTab.find(".selected");
    if ($li.length > 0) {
        var id = $li.attr("data");
        menuRefreshPage(id);
    }
}

function menuRefreshPage(id) {
    id = $.trim(id);
    $this = $mainTab.find("li[data=" + id + "]");
    var url = $this.attr("url");

    var win = $workArea.find("iframe[data=" + id + "]")[0].contentWindow;

    try {
        win.location.href = url;
    }
    catch (error) {

    }
}

function closeAll() {
    $mainTab.find("li.tab").each(function () {
        var id = $(this).attr("data");
        closeTab(id);
    });
}

function closeOther(notIncludeId) {
    $mainTab.find("li.tab").each(function () {
        var id = $(this).attr("data");
        if (id != notIncludeId) {
            var fix = $(this).attr("fix");
            if (fix == "fix") {
            }
            else {
                closeTab(id);
            }
        }
    });
}

function currentTabOpenId() {
    var $li = $mainTab.find(".nui-tabs-item-selected");
    if ($li.length > 0) {
        return id = $li.attr("openid");
    }
}

function lastshow() {
    //如果当前没有选中的，则最后一个显示
    var count = $mainTab.find(".selected").length;
    if (count == 0) {
        var $li = $mainTab.find("li.tab:last");
        var id = $li.attr("data");
        showTab(id);
    }
}

function hideMenu() {
    $("#left").hide();
    $("#divMenuControl").show();
    mainresize();
}

function showMenu() {
    var width = parseFloat($("#hidMenuWidth").val());
    $("#left").width(width);
    $("#left").show();
    $("#divMenuControl").hide();
    mainresize();
}

function up() {
    msg.closetip();
    $("#mainTab").find("li").toggle();
    $("#trLogo").toggle();

    $("#divExpand").toggle();

    mainresize();
    containerResize();
}

function up2(obj) {
    msg.closetip();
    $("#trLogo").toggle();
    if ($("#trLogo").is(":hidden")) {
        $(obj).addClass("full-li-select");
        $(obj).attr("title", "退出全屏");
    }
    else {
        $(obj).removeClass("full-li-select");
        $(obj).attr("title", "全屏显示");
    }

    mainresize();
    containerResize();
}


function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) { return pair[1]; }
    }
    return (false);
}

