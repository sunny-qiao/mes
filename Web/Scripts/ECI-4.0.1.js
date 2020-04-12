//1.ECI.Common.js ===========================================
WebStartTime = new Date();

JavascriptLog = false;
var ecigridSelector;
var menugroupSelector;
var comboxexSelector;
var $form;

String.prototype.dom = function () {
    return window.document.getElementById(this);
}

String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, '');
}

String.prototype.replaceAll = function (reallyDo, replaceWith, ignoreCase) {
    if (!RegExp.prototype.isPrototypeOf(reallyDo)) {
        return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi" : "g")), replaceWith);
    } else {
        return this.replace(reallyDo, replaceWith);
    }
}

String.prototype.focus = function () {
    $.msg.focusId = this;
    dom(this).focus();
}

String.prototype.isnull = function () {
    return this.length == 0;
}

String.prototype.code = function () {
    var ss = new Array();
    ss = this.split('|');
    return ss[0];
}

String.prototype.name = function () {
    var ss = new Array();
    ss = this.split('|');
    if (ss.length < 2)
        return "";
    return ss[1];
}


String.prototype.identity = function () {

    var url = this;

    if (url.indexOf('Identity=') >= 0) {
        return this;
    }

    if ($("#Identity").length > 0) {
        var Identity = $("#Identity").val();
        url = urlAppend(url, "Identity=" + Identity);
    }

    return url;
}
 
String.prototype.appendUrl = function (key,value) {

    var url = this;

    if (url.indexOf(key+'=') >= 0) {
        return this;
    }

    if (url.indexOf('?') >= 0) {
        url = url + "&" + key + "=" + value;
    }
    else {
        url = url + "?" + key + "=" + value;
    }
 
    return url;
}
 
Array.prototype.contains = function (element) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == element) {
            return true;
        }
    }
    return false;
}

Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1, //month
        "d+": this.getDate(), //day
        "H+": this.getHours(), //hour
        "m+": this.getMinutes(), //minute
        "s+": this.getSeconds(), //second
        "q+": Math.floor((this.getMonth() + 3) / 3), //quarter
        "f": this.getMilliseconds() //millisecond
    }
    if (/(y+)/.test(format)) format = format.replace(RegExp.$1,
    (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o) if (new RegExp("(" + k + ")").test(format))
        format = format.replace(RegExp.$1,
        RegExp.$1.length == 1 ? o[k] :
        ("00" + o[k]).substr(("" + o[k]).length));
    return format;
}

function dom(id) {
    if (typeof (id) == "string") {
        return window.document.getElementById(id);
    }
    else {
        return id;
    }
}

function strToJson(str) {
    var json = eval('(' + str + ')');
    return json;
}

function fullScreen(url) {
    window.open(url, '', 'fullscreen=yes, scrollbars=auto');
}

function getAlias(my) {
    var alias = $(my).attr("alias");
    if (alias) return alias;
    var $td = $(my).closest("td").prev();
    alias = $td.attr("alias");
    if (alias) {
        alias = alias.trim();
    }
    else {
        alias = $td.html();
    }

    alias = alias.replaceAll(":", "").replaceAll("：", "");

    return alias;
}

function resize() {
}

function epanelToggle(id) {
    var $this = $("#" + id);
    var $target = $("#" + id).find(".e-panel-bwrap");

    if ($target.is(":hidden")) {
        $target.slideDown();
        $this.removeClass("e-panel-collapsed");
    }
    else {
        $target.slideUp();
        $this.addClass("e-panel-collapsed");
    }
}

function postback(eventTarget, eventArgument, tag) {

    if (!eventArgument) { eventArgument = ""; }

    var needLoading = true;

    if (eventArgument == "excel" || tag=="excel") {
        needLoading = false;
    }

    if (typeof (eventTarget) == "string") {

        $("select[disabled]").removeAttr("disabled");
        __doPostBack(eventTarget, eventArgument);

        if (tag) {
            var $dom = $("#" + tag);

            if ($dom.length == 1) {
                var cancelLoading = $dom.attr("CancelLoading");

                if (cancelLoading == "true") {
                    needLoading = false;
                }
            }
        }

        if (needLoading) { msg.loading(); }
    }
    else {
        var name = $(eventTarget).attr("name");

        if (name) {
            var cancelLoading = $(eventTarget).attr("CancelLoading");
            if (cancelLoading == "true") {
                needLoading = false;
            }

            $("select[disabled]").removeAttr("disabled");
            __doPostBack(name, eventArgument);
            if (needLoading) { msg.loading(); }
        }
        else {
            msg.error("postback函数调用：参数异常！");
        }
    }
}

function execute(id, executeType, executeArgument) {
    $("#__EXECUTE_TYPE").val(executeType);
    $("#__EXECUTE_ARGUMENT").val(executeArgument);

    $("#" + id)[0].click();
}

function IE8() {
    if (document.all) {
        return true;
    }
    else {
        return false;
    }
}

function validateImage(id) {
    var $dom;
    if (typeof (id) == "string") {
        $dom = $("#" + id);
    }
    else {
        $dom = $(id)
    }
 
    $dom.attr("src", eci.webPath + '/App/Common/ValidateImage.aspx?id=' + Math.random()).show();
}

function DBC2SB(str) {
    var result = '';
    for (var i = 0; i < str.length; i++) {
        var code = str.charCodeAt(i); //获取当前字符的unicode编码
        if (code >= 65281 && code <= 65373)//在这个unicode编码范围中的是所有的英文字母已经各种字符
        {
            result += String.fromCharCode(str.charCodeAt(i) - 65248); //把全角字符的unicode编码转换为对应半角字符的unicode码
        } else if (code == 12288)//空格
        {
            result += String.fromCharCode(str.charCodeAt(i) - 12288 + 32);
        } else {
            result += str.charAt(i);
        }
    }
    return result;
}
function ToDBC(txtstring) {
    txtstring = utils.html(txtstring);
    var tmp = "";
    var mark = "";/*用于判断,如果是html尖括里的标记,则不进行全角的转换*/
    for (var i = 0; i < txtstring.length; i++) {
        if (txtstring.charCodeAt(i) == 32) {
            tmp = tmp + String.fromCharCode(12288);
        }
        else if (txtstring.charCodeAt(i) < 127) {
            tmp = tmp + String.fromCharCode(txtstring.charCodeAt(i) + 65248);
        }
        else {
            tmp += txtstring.charAt(i);
        }
    }
    return tmp;
}


function contains(parentNode, childNode) {
    if (parentNode.contains) {
        return parentNode != childNode && parentNode.contains(childNode);
    } else {
        return !!(parentNode.compareDocumentPosition(childNode) & 16);
    }
}

function checkHover(e, target) {
    if (getEvent(e).type == "mouseover") {
        return !contains(target, getEvent(e).relatedTarget || getEvent(e).fromElement) && !((getEvent(e).relatedTarget || getEvent(e).fromElement) === target);
    } else {
        return !contains(target, getEvent(e).relatedTarget || getEvent(e).toElement) && !((getEvent(e).relatedTarget || getEvent(e).toElement) === target);
    }
}

function getEvent(e) {
    return e || window.event;
}

function refreshValidateImage() {
    validateImage("msgValidateImag");
    $("#msgValidateCode").val("").focus();
}

function getAbsoluteLeft(ob) {
    if (!ob) { return null; }
    var mendingOb = ob;
    var mendingLeft = mendingOb.offsetLeft;
    while (mendingOb != null && mendingOb.offsetParent != null && mendingOb.offsetParent.tagName != "BODY") {
        mendingLeft += mendingOb.offsetParent.offsetLeft;
        mendingOb = mendingOb.offsetParent;
    }
    return mendingLeft;
}

function getAbsoluteTop(ob) {
    if (!ob) { return null; }
    var mendingOb = ob;
    var mendingTop = mendingOb.offsetTop;
    while (mendingOb != null && mendingOb.offsetParent != null && mendingOb.offsetParent.tagName != "BODY") {
        mendingTop += mendingOb.offsetParent.offsetTop;
        mendingOb = mendingOb.offsetParent;
    }

    mendingOb = $(ob).parent();
    var scrollTop = 0;
    while (mendingOb.length != 0) {

        if (mendingOb[0].scrollTop) {
            scrollTop += mendingOb[0].scrollTop;
        }

        mendingOb = mendingOb.parent();
    }



    mendingTop = mendingTop - scrollTop;

    return mendingTop;
}
 
function importPageClose(type, status, obj) {
    eci.close();

    var eventClose = $(obj).attr("data-close");


    if (eventClose) {
        eval(eventClose + "(status)");

    }
}

function importPageImport(obj) {
    if ($("#file").val() == "") {
        $("#lblMessage").text(lang.M00017);
    }
    else {
        postback("btnImport");
    }
}

function importPageDownload(obj) {
    var url = $(obj).attr("data-url");
    if (url) {
        eci.open(url, { width: 500, height: 250 });
    }
    else {
        $("#lblMessage").text(lang.M00018);
    }
}


function logBegin() {
    WebStartTime = new Date();
    logEnd("begin");
}

var lastCost = 0;
var logMessage = "";
function logEnd(message) {

    if (window.JavascriptLog) {
        var WebEndTime = new Date()
        var cost = WebEndTime.getTime() - WebStartTime.getTime();
        logMessage += " " + cost + "   Cost:" + (cost - lastCost) + "   " + message + "<br>";
        lastCost = cost;
    }
}

function logCompleted(message) {
    var WebEndTime = new Date()
    var cost = WebEndTime.getTime() - WebStartTime.getTime();

    $("body").attr("WebCost", cost);
    $("body").attr("WebStartTime", WebStartTime.format("yyyy-MM-dd HH:mm:ss-f"));
    $("body").attr("WebEndTime", WebEndTime.format("yyyy-MM-dd HH:mm:ss-f"));

    if (!window.JavascriptLog) { return; }

    var logDom = $("#scriptLog");
    if (logDom.length == 0) {
        var html = "<div id=\"scriptLog\"></div>"
        $(document.body).append(html);

        logDom = $("#scriptLog");

        logDom.css("padding", "5px");
        logDom.css("width", "auto");
        logDom.css("position", "absolute");
        logDom.css("top", "0px");
        logDom.css("left", "0px");
        logDom.css("border", "1px solid green");
        logDom.css("background", "#ffd800");
        logDom.css("overflow", "#scroll");
        logDom.css("text-align", "left");

        logDom.dblclick(function () {
            $(this).hide();
        })

    }

    logDom.html(logMessage);
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

function _ImgCheckAction(obj) {

    var id = $(obj).attr("data-id");
    var value = $("#" + id).val();

    var $img = $(obj).find(".eci-img-check-div");


    if (value == "") {
        value = "2";
    }

    if (value == "0") {
        value = "2";
        $img.removeClass("eci-img-check-unchecked");
        $img.addClass("eci-img-check-empty");
    }
    else if (value == "1") {
        value = "0";
        $img.removeClass("eci-img-check-checked");
        $img.addClass("eci-img-check-unchecked");
    }
    else if (value == "2") {
        value = "1";
        $img.removeClass("eci-img-check-empty");
        $img.addClass("eci-img-check-checked");
    }

    $("#" + id).val(value);
}


function gridUIConfig(id, configCode, configOwner) {

    var data = $("#" + id + "Config").val();

    configData = data;

    if (data == "") {
        msg.warning(lang.M00019);
        return;
    }

    var th = $("#" + id + "TableHeader").find("tr:last").find("th[dataField]");
    var size = "";
    $(th).each(function () {
        var dataField = $(this).attr("dataField");
        if (size.length > 0) { size += ","; }
        var width = $(this).width();
        if (width > 0) { width += 5; }
        size += dataField + "|" + width;
    })
 
    var url = eci.webPath + "/App/UIConfig/ListConfigList.aspx?configOwner=" + configOwner + "&configCode=" + configCode + "&dsp=" + eci.guid();
    eci.open(url, { width: 1000, post: true, data: { configData: configData, size: size } });
}
 
function editZoneConfig(pageCode) {
    
    var url = eci.webPath + "/App/Basic/EditZoneConfig.aspx?PageCode=" + pageCode;
    eci.open(url, { width: 640, height: 480 });
}


/*
  获取异步汇总信息
*/
function getAsyncSumInfo(taskId) {

    eci.post("../../Data.ashx", "GetAsyncSumInfo", { loading: false, taskId: taskId }, function (res) {

        if (res.success) {
            var data = strToJson(res.data);
            $("#lblSum").html(data.Message);
        }
        else {
            $("#lblSum").html(res.message);
        }

    })
}


function highlightElement(id) {
    var $target = $("#" + id);
    $target.addClass("hightlight-focus");

    $target.focus(function () {
        $target.removeClass("hightlight-focus");
    })
}

function __page(eventTarget,eventArgument)
{
    __doPostBack(eventTarget, eventArgument);
}
 
function timeoutLogin(url)
{
    alert(url);
}




 
//解决 IE8 不支持console
window.console = window.console || (function () {
    var c = {}; c.log = c.warn = c.debug = c.info = c.error = c.time = c.dir = c.profile
    = c.clear = c.exception = c.trace = c.assert = function () { };
    return c;
})();




//2.ECI.Core.js ===========================================
$.eci = function () { }
$.eci.isChrome = navigator.userAgent.toLowerCase().match(/chrome/) != null;
$.eci.isSafari = navigator.userAgent.toLowerCase().match(/safari/) != null;
$.eci.isFirefox = navigator.userAgent.toLowerCase().match(/firefox/) != null;

$.eci.isIE8 = document.all;
$.eci.action = "";
$.eci.data = "";
$.eci.textViewValue = "";
$.eci.openedDialog;
$.eci.webPath = "";
$.eci.config = { focusSelectText: false }

$.eci.getBrowserType = function () {
    /// <summary>
    /// <para>获取当前浏览器类型</para>
    /// <para></para>
    /// <para>支持检查的浏览器类型：</para>
    /// <para>"Chrome"： Chrome浏览器（包括使用Chromium内核的浏览器）</para>
    /// <para>"IE6"： IE6</para>
    /// <para>"IE7"： IE7</para>
    /// <para>"IE8"： IE8</para>
    /// <para>"IE9"： IE9</para>
    /// <para>"IE10"： IE10</para>
    /// <para>"IE11"： IE11</para>
    /// <para>"Firefox"： Firefox火狐浏览器</para>
    /// <para>"Unknow"： 未知浏览器</para>
    /// </summary>
    /// <return>当前浏览器类型</return>

    //获取UA
    var ua = window.navigator.userAgent;

    //判断是否是Chrome
    if (ua.indexOf('Chrome') > 0) return 'Chrome';

    //判断是否是IE 6
    if (ua.indexOf('MSIE 6.0') > 0) return 'IE6';

    //判断是否是IE 7
    if (ua.indexOf('MSIE 7.0') > 0) return 'IE7';

    //判断是否是IE 8
    if (ua.indexOf('MSIE 8.0') > 0) return 'IE8';

    //判断是否是IE 9
    if (ua.indexOf('MSIE 9.0') > 0) return 'IE9';

    //判断是否是IE 10
    if (ua.indexOf('MSIE 10.0') > 0) return 'IE10';

    //判断是否是IE 10
    if (ua.indexOf('MSIE 10.0') > 0) return 'IE10';

    //判断是否是IE 11
    if (ua.indexOf('Trident/7.0') > 0) return 'IE11';

    //判断是否是Firefox火狐浏览器
    if (ua.indexOf('Firefox') > 0) return 'Firefox';

    return 'Unknow(' + ua + ')';
}

$.eci.getIEVersion = function () {
    /// <summary>
    /// <para>获取当前IE版本</para>
    /// </summary>
    /// <return>当前当前IE版本（不是IE则返回null）</return>

    //获取当前浏览器类型
    var type = this.getBrowserType();

    //判断是否IE  如果不是IE则返回null
    if (type.indexOf('IE') == -1) return null;

    return type.replace('IE', '');
}

$.eci.isSupportVersion = function () {
    /// <summary>
    /// <para>判断是否是支持的浏览器版本</para>
    /// </summary>
    /// <return>是否是支持的浏览器版本</return>

    //获取IE版本
    var ieVersion = this.getIEVersion();

    //IE兼容性判断
    if (ieVersion && ieVersion < 8) return false;

    return true;
}

$.eci.defaults = {
    postback: function (r) { $.msg.close(); $.msg.ajax(r); }
};

$.eci.textView = function (value, options) {

    var width = eci.width() - 100;
    var height = eci.height() - 100;


    options = $.extend({ width: width, height: height }, options);

    $.eci.textViewValue = value;

    var url = eci.webPath + "/App/Text/TextView.aspx";
    eci.dialog(lang.M00021, url, options);
}

$.eci.guid = function () {
    var result = "";
    for (var i = 1; i <= 32; i++) { result += Math.floor(Math.random() * 16.0).toString(16); }
    return result;
}

$.eci.key = function () {
    return $("#hidKey").val();
}

$.eci.hasSave = function (opt) {
    opt = $.extend({ message: lang.A00003 }, opt);
    if ($.eci.key() == "") return $.msg.error(opt.message);
    return true;
}


$.eci.scrollToKey = function (key) {
    return $.egrid.scrollToKey('gvData', key);
}


$.eci.selectRow = function (option) {
    return $.egrid.selectRow('gvData');
}

$.eci.selectOneRow = function () {
    return $.egrid.selectOneRow('gvData');
}

$.eci.hasRow = function () {
    return $.egrid.hasRow('gvData');
}

$.eci.selectedKey = function () {
    return $.egrid.selectedKey("gvData");
}

$.eci.notSelectedKey = function () {
    return $.egrid.notSelectedKey("gvData");
}

$.eci.selectedField = function (f) {
    return $.egrid.selectedField("gvData", f);
}

$.eci.width = function () {
    return window.document ? $(window.document).width() : $(window).width();
}

$.eci.height = function () {
    return $(window).height();
}

$.eci.middle = function (id, opt) {
    id = dom(id);

    if (!id) return;

    opt = $.extend({ type: 'all' }, opt);

    var h = $(id).height();
    var w = $(id).width();
    var l = (eci.width() - w) / 2;
    var t = (eci.height() - h) / 2;

    if (opt.top) t = t + opt.top;

    if (t < 0) t = 0;
    if (l < 0) l = 0;

    var scrollTop = window.scrollY;

    if (scrollTop == undefined) {
        scrollTop = window.pageYOffset
                || document.documentElement.scrollTop
                || document.body.scrollTop
                || 0;
    }

    if (scrollTop != undefined) {
        t += scrollTop;
    }

    if (opt.type == "all") {

        $(id).css({ left: l + "px", top: t + "px" });
    }
    else if (opt.type == "h") {
        $(id).css("left", l + "px");
    }
}

$.eci.reset = function (id) {
    id = dom(id);
    if (id) {
        $(id).find("input,textarea,select").each(function () {

            var notReset = $(this).attr("NotReset");

            if (notReset == "true") { return; }

            var type = $(this).attr("type");

            var r = $(this).attr("r");

            if (r != undefined) {
                $(this).val(r);
            }

            var readonly = $(this).attr("readonly");
            if (readonly == "readonly") {

                var enablechoose = $(this).attr("enablechoose");
                if (enablechoose == "true") {
                    $(this).val("");
                }

                return;
            }

            if ($(this).hasClass("select-disabled")) return;

            if (type != "submit") {

                if (type != "checkbox") {
                    r = $(this).attr("r");
                    $(this).val(r ? r : '');
                }
            }
        });

        $(id).find("input[type=checkbox]").each(function () {
            $(this).attr("r") == "true" ? this.checked = true : this.checked = false;
        });
    }
}

$.eci.focus = function (id) {
    try {
        var input = dom(id);
        if (input == null) { return; }
        if (input.type == "text") { input.select() };
        input.focus();
        $.msg.focusId = id;
    }
    catch (e) {
    }
}

$.eci.copy = function (t) {
    window.clipboardData ? window.clipboardData.setData("Text", t) : $.msg.error(lang.F00001);
}

$.eci.post = function (url, action, data, callback) {
    data = $.extend({ loading: true, errorMsg:true }, data);

    

    if (data.validate) {
        if ($("#hidValidateCode").length == 1) {
            data.validateCode = $("#hidValidateCode").val();
        }
    }

    data.eciaction = action;

    if (!callback) callback = $.eci.defaults.postback;

    if (data.loading) {
        msg.loading();
    }

    $.post(url, data, function (r) {
        msg.close();

        if (r.success == "Y") {
            r.success = true;
        }
        else if (r.success == "N") {
            r.success = false;
        }

        callback(r);
    }, "JSON").error(function (a) {
        
        msg.close();
        if (data.errorMsg) { msg.error(lang.M00022 + ":" + url); }
        console.error(lang.M00022 + ":" + url);
    })
}

$.eci.postme = function (action, data, callback) {

    data = $.extend({ loading: true }, data);

    if (data.validate) {
        if ($("#hidValidateCode").length == 1) {
            data.validateCode = $("#hidValidateCode").val();
        }
    }

    var url = window.location.href.split('?')[0];
    url += "?dsp=" + eci.guid() + "&eciaction=" + action;

    if (!callback) callback = $.eci.defaults.postback;

    if (data.loading) {
        msg.loading();
    }

    $.post(url, data, function (r) {
        msg.close();

        if (r.success == "Y") {
            r.success = true;
        }
        else if (r.success == "N") {
            r.success = false;
        }

        callback(r);
    }, "JSON").error(function (a) { msg.close(); msg.error(lang.M00022 + ":" + url); })
}

$.eci.close = function (option) {

    option = $.extend({ message: lang.M00023 }, option);

    if (option.esc) {

        if (event.keyCode == 27) { $.eci.close(); }
    }
    else if (option.confirm) {
        msg.confirm(option.message, function () {
            $.eci.close();
        });
    }
    else {

        var isDialog = false;
        if (window.frameElement) {
            var id = $(window.frameElement).attr("tag");

            var $d = $(window.parent.document).find("#" + id)

            $d.hide();
            $d.find("iframe").attr("src", "");

            window.parent.$.msg.closemask()

            if ($(window.frameElement).parent().hasClass("eci-window-content")) {
                isDialog = true;
            }
        }

        if (!isDialog) {
            window.parent.main ? window.parent.mainCloseTab(window) : window.close();
        }
    }

    return false;
}

$.eci.open = function (url, options) {

    options = $.extend({ width: "auto", height: "auto", target: "_blank", post: false, data: "" }, options);

    var t, l;
    var h = options.height;
    var w = options.width;
    var target = options.target;

    if (h == "auto") h = window.screen.availHeight - 150;
    if (w == "auto") w = window.screen.availWidth - 100;

    if (options.full) {
        h = window.screen.availHeight - 70;
        w = window.screen.availWidth - 10;
        t = 0;
        l = 0;
    }
    else {
        t = (window.screen.availHeight - h) / 2;
        l = (window.screen.availWidth - w) / 2;
    }

    var f = "height=" + h + ", width=" + w + ", top=" + t + " , left=" + l + ",location=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes, status=no";

    if (options.post) {
        eci.action = url;
        eci.data = options.data;

        url = eci.webPath + "/App/Common/PostTransfer.html?dsp=" + eci.guid();
    }

    if (url == undefined || url == "") {
        msg.alert("打开页面地址不可以为空");
    }
    else {
        window.open(url.identity(), target, f);
    }
}



$.eci.now = function (f) {
    if (!f) { f = "yyyy-MM-dd"; }
    var today = new Date();
    return today.format(f);
}

$.eci.form = function (id) {
    return new EForm(id);
}

$.eci.data = function (id, options) {
    var serializeObj = {};

    $("#" + id).find("input,textarea,select").each(function () {
        var $this = $(this);

        var dataField = $this.attr("dataField");
        if (dataField) {
            this.name = dataField;
            serializeObj[dataField] = $this.val();
        }
    });

    return serializeObj;
}

$.eci.call = function (f) {
    return f();
}

$.eci.rowkey = function (o) {
    return $(o).parents("tr").attr("key");
}

$.eci.window = function (id, option) {
    id += "Wrapper"

    var $this = $("#" + id);

    if ($this.hasClass("needmask")) msg.mask();

    eci.middle(id, option);

    $this.show();

    layout();
}

$.eci.closewindow = function (id) {
    if (typeof (id) == "string") {
        $("#" + id + "Wrapper").hide();
    }
    else {
        $(id).parents(".e-window").hide();
    }
    msg.closemask();
}

$.eci.closedialog = function () {
    parent.$.eci.closedialogImp();
}

$.eci.closedialogImp = function () {
    if ($.eci.openedDialog) {
        $.eci.openedDialog.hide();
        $.eci.openedDialog.find("iframe").attr("src", "");
        $.msg.closemask();
    }
}


function closedialog() {
    parent.closedialogImp();
}

function closedialogImp() {

}

$.eci.layoutHeight = function ($t) {
    h = 0;
    var m = $t.attr("layout");
    if (m) {
        var a = m.split(',');
        $.each(a, function (i, v) {
            if (isNaN(v)) {
                var $target = $("#" + v);

                if ($target.length > 0) {

                    var marginTop = parseFloat($target.css("margin-top"));
                    var marginBottom = parseFloat($target.css("margin-bottom"));

                    var borderTop = parseFloat($target.css("border-top"));
                    var borderBottom = parseFloat($target.css("border-bottom"));

                    if (eci.isIE8) {
                        if (!isNaN(borderTop) && borderTop != 0) { h += borderTop; }
                        if (!isNaN(borderBottom) && borderBottom != 0) { h += borderBottom; }
                    }

                    if (!isNaN(marginTop) && marginTop != 0) { h += marginTop; }
                    if (!isNaN(marginBottom) && marginBottom != 0) { h += marginBottom; }

                    h += $target.outerHeight();

                }
            }
            else {
                h += parseFloat(v);
            }
        });
    }

    return h;
}

$.eci.layoutWidth = function ($t) {
    h = 0;
    var m = $t.attr("layout");
    if (m) {
        var a = m.split(',');
        $.each(a, function (i, v) {
            if (isNaN(v)) {
                var $target = $("#" + v);

                if ($target.length > 0) {

                    var marginLeft = parseFloat($target.css("margin-left"));
                    var marginRight = parseFloat($target.css("margin-right"));

                    var borderLeft = parseFloat($target.css("border-left"));
                    var borderRight = parseFloat($target.css("border-right"));

                    if (eci.isIE8) {
                        if (!isNaN(marginLeft) && marginLeft != 0) { h += marginLeft; }
                        if (!isNaN(marginRight) && marginRight != 0) { h += marginRight; }

                        if (!isNaN(borderLeft) && borderLeft != 0) { h += borderLeft; }
                        if (!isNaN(borderRight) && borderRight != 0) { h += borderRight; }
                    }

                    h += $target.outerWidth();
                }
            }
            else {
                h += parseFloat(v);
            }
        });
    }

    return h;
}

$.eci.report = function (r, d) {
    var p = "";
    if (typeof (d) == "string") p = "&" + d;
    else
        for (var k in d) p += "&" + k + "=" + d[k];

    var url = eci.webPath + "/App/Report/ReportView.aspx?ReportCode=" + r + p;
    eci.open(url, { width: 600, height: 400 });
}

$.eci.help = function (obj) {

    var tipId = $(obj).attr("TipId");
    var helpCode = $(obj).attr("code");
    var url = $(obj).attr("Url");
    var options = $(obj).attr("options");

    if (options) {
        options = strToJson(options);
    }

    alert(tipId);

    if (tipId) {
        var html = $("#" + tipId).html();
        eci.textView(html);
        return;
    }

    if (url) {
        eci.open(url, options);
    }
    else {
        var mappingKey = "";

        if ($("#hidHelpMappingKey").length == 1) {
            mappingKey = $("#hidHelpMappingKey").val();
        }
        else {
            mappingKey = $("#hidPageTypeName").val();
        }

        eci.post(eci.webPath + "/Data.ashx", "GetHelpUrl", { mappingKey: mappingKey, helpCode: helpCode }, function (r) {

            var url = r.url;
            if (url) {
                eci.open(url);
            }
            else {
                msg.error(lang.M00024);
            }
        })
    }
}

$.eci.toggle = function (obj) {
    var selector = $(obj).attr("selector");
    var valueId = $(obj).attr("valueId");
    if (selector == "") { selector = "#tbQuery"; }

    if ($(selector).is(":hidden")) {
        $("#" + valueId).val("show");
    }
    else {
        $("#" + valueId).val("hide");
    }

    eci.toggleSet(obj);

    setTimeout(layout, 20);

    layout();
}

$.eci.toggleSet = function (obj) {
    var selector = $(obj).attr("selector");
    var valueId = $(obj).attr("valueId");
    if (selector == "") { selector = "#tbQuery"; }

    var value = $("#" + valueId).val();

    if (value == "hide") {
        $(selector).hide();
    }
    else {
        $(selector).show();
    }
}


$.eci.feedback = function (obj) {

    msg.alert("意见反馈");

}


$.eci.hasFunction = function (funcName) {
    try {
        if (typeof (eval(funcName)) == "function") {
            return true;
        }
    } catch (e) { }
    return false;
}

$.eci.getPostData = function () {
    var data = { action: eci.action, data: eci.data };
    return data;
}

$.eci.search = function (parent) {
    if (parent == true) {
        window.opener.eci.search();
    }
    else {
        postback("btnSearch");
    }
}

$.eci.lazyurl = function (tabId, url) {
    $("#" + tabId).attr("lazy-url", url);

    if (url == "") {
        $.eci.loadurl(tabId, "");
    }
}

$.eci.loadurl = function (tabId, url) {
    $("#" + tabId + "_frame").attr("src", url);
}
 
$.eci.showTab = function (tabId, url) {
    if (url) {
        eci.loadurl(tabId, url);
    }

    var $this = $("#" + tabId);
    var $ecitab = $this.parents(".eci-tab");
    var id = $ecitab.attr("id");

    $this.parent().find("li").removeClass("tabs-selected")

    $this.addClass("tabs-selected");

    var $panels = $ecitab.find(".tabs-panels");

    $panels.find(".panel").hide();

    var toIndex = $this.parent().find("li").index(this);

    var $panel = $panels.find(".panel").eq(toIndex)

    $panel.show()

    $("#" + id + "_ActiveTabIndex").val(toIndex);
}


$.eci.hasChanged = function () {
    return $("#HasChanged").val() == "true";
}

$.eci.hasChangedFlag = function () {
    return "HasChanged=" + $("#HasChanged").val();
}

$.eci.dicConfig = function (obj) {
    var code = $(obj).attr("code");
    var companyCode = $(obj).attr("companyCode");

    var url = eci.webPath + "/App/DIC/ComDicHeadEdit.aspx?code=" + code;
    eci.open(url);
}

$.eci.getURLDomain = function (options) {

    options = $.extend({ port: false }, options);
    var port = options.port;

    var url = this.getURL(true, false);

    var urlWithoutProtocol = url.split('//')[1];

    var domain = urlWithoutProtocol.split('/')[0];

    if (port) return domain;

    return domain.split(':')[0];
}

$.eci.getURL = function (options) {
    options = $.extend({ host: false, param: false }, options);
    var host = options.host;
    var param = options.param;

    var url = document.URL;

    if (!param) {
        url = url.split('?')[0];
    }

    if (!host) {
        url = url.replace('http://', '').replace('https://', '');
        var urlList = url.split('/');
        urlList[0] = '';
        url = urlList.join('/');
    }

    return url;
}

$.eci.keepSession = function () {

    var action = function () {
        var url = "../../Data.ashx";
        var data = { "eciaction": "KeepSession" };

        $.post(url, data, function (r) {
            console.info("KeepSession Successfull");
            if (!r.success) {
                alert(r.message);
            }
        }, "JSON").error(function (a) {
            msg.close();
            //msg.error(lang.M00025);
        })
    }

    setInterval(action, 120000);
}

$.eci.isDev = function () {
    var domain = this.getURLDomain();

    if (domain == 'localhost') return true;

    return false;
}

$.eci.cancelTab = function (obj) {
    $(obj).attr("CancelTab", "true");
}


$.eci.getTipData = function () {
    return eci.tipData;
}

$.eci.tipMaintain = false;

$.eci.tip = function (obj) {

    if ($.eci.tipMaintain) {
        var systemcode = $(obj).attr("systemcode");
        var code = $(obj).attr("code");
        var url = "http://oa.ecidh.com:8010/etip/index.aspx?systemcode=" + systemcode + "&code=" + code;
        eci.open(url);
        return;
    }

    var $this = $(obj);

    var max = $this.attr("max");

    if (max == "true") {
        eci.tipData = {};

        eci.tipData.headerText = $this.attr("HeaderText");
        eci.tipData.content = $this.attr("content");

        var url = $.eci.webPath + "/App/Tip/TipView.aspx";
        $.eci.dialog("系统帮助", url);
    }
}



$.eci.tipManage = function (obj) {

    var e = window.event || arguments.callee.caller.arguments[0];

    var systemcode = $(obj).attr("systemcode");

    if (e.ctrlKey) {
        $.eci.tipMaintain = true;
        $(".eci-tip").show()
        return;
    }

    if (e.shiftKey) {
        var data = { systemcode: systemcode }
        eci.post(eci.webPath + "/Data.ashx", "DownloadETip", data, function (response) {


            if (response.success) {
                msg.alert(response.message, {
                    closed: function () {
                        window.location.reload();
                    }
                })

            }
            else {
                msg.ajax(response);
            }

        });
        return;
    }

    $.eci.tipMaintain = false;

    $(".eci-tip").toggle();
    $(".eci-tip-no").hide();
}

$.eci.tip2 = function (id, obj) {

    var $this = $(obj);

    var options = $this.attr("options");

    if (options) {
        options = strToJson(options);
    }

    var html = $this.find(".eci-tip-content").html().trim();

    eci.textView(html, options);
}

$.eci.fileUpload = function (bizNo, bizType, options) {

    options = $.extend({ title: "附件上传", dialog: true, action: "do" }, options);

    var url = $.eci.webPath + "/App/File/FileUpload.aspx?bizNo=" + bizNo + "&bizType=" + bizType + "&action=" + options.action;

    if (options.dialog) {

        eci.dialog(options.title, url, options);

    } else {
        eci.open(url, options)
    }
}

$.eci.notnull = function (id, flag) {
    var obj = dom(id);
    var $this = $(obj);

    var $td = $this.closest("td").prev();

    var html = $td.html();

    if (flag) {
        $this.addClass("eci-notnull");

        var hasStar = $td.find(".notnull").length > 0

        if (!hasStar) {
            $td.find(".notnull").remove();

            var $tip = $td.find(".eci-tip");
            if ($tip.length > 0) {
                $tip.after("<span class='notnull'>*</span>");
                html = html.replace($tip[0].outerHTML, "");
            }
            else {
                $td.html("<span class='notnull'>*</span>" + html.trim());
            }

            $td.attr("alias", html);
        }

    }
    else {
        $this.removeClass("eci-notnull");
        $td.find(".notnull").remove();
    }


}


$.eci.userActionConfirm = function (message) {

    msg.confirm(message, function () {

        var $lastEventTargt = $("#LAST_EVENTTARGET");
        if ($lastEventTargt.length == 0) {
            msg.error("当前框架版本过低不支持二次确认操作，请联系管理员");

            return;
        }

        var target = $lastEventTargt.val();

        $("#hidUserActionConfirm").val("true");

        postback(target);

    });
}


$.eci.showExportProgress = function (url, title) {
    eci.dialog(title, url, { icon: "function", width: 700, height: 400 });
}

$.eci.textpop = function (id) {
    var url = $.eci.webPath + "/App/Text/TextPop.aspx";

    $.eci.textpopValue = $("#"+id).val();
    $.eci.$textpop = $("#"+id);
 
    eci.dialog("详细内容", url, {
        width: 300, height: 400, icon: "table", onclosed: function () {
            
        }
    })
}

$.eci.textpopCallback=function(value)
{
    eci.$textpop.val(value);
}

$.eci.openPdf = function (pdfUrl) {
    if (eci.isChrome) {
        window.open(pdfUrl);
    }
    else {
        window.open($.eci.webPath + "/Plugin/pdf/web/viewer.html?file=" + pdfUrl);
    }
}
 
$.eci.webPath = $("head").attr("VirtualPath");
if ($.eci.webPath == undefined) { $.eci.webPath = "../.."; }

$.eci.config.focusSelectText = $("head").attr("FocusSelectText") == "true";


window.eci = $.eci;

//3.ECI.EWin.js ===========================================
$.ewin = function () { }
$.ewin.changed = false;
$.ewin.key = "Key";
$.ewin.tabMsg = lang.M00026;
$.ewin.tabMode = false;
$.ewin.isList = false;
$.ewin.refresh = true;

$.ewin.notify = function (key, type) {
    window.parent.ewin.changed = true;
    if ($.ewin.tabMode) {
        window.parent.ewin.setTab(key, type);
    }
}

/// <summary>
/// <para>子页面关闭</para>
/// </summary>
$.ewin.close = function (type) {
    window.parent.ewin.changedTigger(type);
    eci.close();
}

$.ewin.changedTigger = function (type) {
    if ($.ewin.changed == false) { return; }
    $.ewin.onchanged(type);
}

$.ewin.onchanged = function (type) {
    if ($.ewin.isList) {
        postback("btnSearch");
    }
}

//TabMain主页面得到编辑页面的保存通知
$.ewin.setTab = function (key) {
    $("#hid" + $.ewin.key).val(key);
}

window.ewin = $.ewin;
//4.ECI.Drag.js ===========================================
function XCreateElement(tagName,tagParent,attrs)
{
	if(tagName&&arguments.length<2){tagParent=document.body;}

		var oTemp=document.createElement(tagName);
		if(attrs&&attrs.constructor==Object)
		{
		  for(var o in attrs)
			  {
				oTemp.setAttribute(o,attrs[o]);
			  }
			
		}
		tagParent.appendChild(oTemp);
		return oTemp;

}
function XSetCss(obj,cssArgs){
	if(arguments.length==2)
	{ 
	  if(cssArgs.constructor==Object){
	  for(var o in cssArgs)
			{
				if(obj.style[o]!="undefiend")
				{
				  obj.style[o]=cssArgs[o];			
				}	 	  
			} 
		}
	 if(cssArgs.constructor==Array&&cssArgs.length==2){
				obj.style[cssArgs[0]]=cssArgs[1];			
	 
	 }
	}

}
function XslideUp(obj,type,mX,num) {
            if(!type){return;}
			try{
				XSetCss(obj,[type,XgetOffset(obj)[type]-num+"px"]);
				dom("aa").innerHTML=XgetOffset(obj)[type];
			if(XgetOffset(obj)[type]>mX){			
			 setTimeout(function(){XslideUp(obj,type,mX,num);},1);			
			}
			else{
				  XSetCss(obj,[type,mX])
			 }
			}
			catch(e){}
		}
function XslideDown(obj,type,mX,num) {
            if(!type){return;}
			try{
				XSetCss(obj,[type,XgetOffset(obj)[type]+num+"px"]);
				dom("aa").innerHTML=XgetOffset(obj)[type];
			if(XgetOffset(obj)[type]<mX){			
			 setTimeout(function(){XslideDown(obj,type,mX,num);},1);			
			}
			else{
				  XSetCss(obj,[type,mX])
			 }
			}
			catch(e){}
		}
function XgetOffset (obj) {
		 return {height:obj.offsetHeight,width:obj.offsetWidth}
}
/*移动函数*/
/*o:element   l: left t:top*/
function Xmove(o,l,t){
  o.style.position="absolute";
  var a=1;
  var ol=parseInt(o.offsetLeft);
  var ot=parseInt(o.offsetTop);
  var iTimer=setInterval(function(){
   if(a==10)
    {
		Xtransp(o,"end");
		clearInterval(iTimer);
	 }
   o.style.left=ol+a*(l-ol)/10+"px";
   o.style.top=ot+a*(t-ot)/10+"px";
   a++;
},20);
}
/* 取消事件冒泡*/
function XcancleBubble(e)
{
 var e = window.event || e;
 if (e.preventDefault) e.preventDefault();
 else e.returnValue = false;
}
/*设置透明度函数 o: dom 节点  mode: start:设置 开始   end 设置结束 , num: 透明度 1-100 内 整数*/
function Xtransp(o,mode,num){
           if(mode=="start"){
          
			if(document.all){
				o.style.filter = "Alpha(Opacity="+num+")";
			}else{
				o.style.opacity = num/100;
			}
			}
		  else {
		    if(document.all){
				o.style.filter = "Alpha(Opacity=100)";
			}else{
				o.style.opacity = 1;
			}
		  
		  
		  }

}
function Xvisible(obj,start,end,step,interval,callback)
		{
			var st = start > end;
			//步进start
			st ? start-=step : start+=step;	
			//当start和end的关系发生变化时停止运行
			if((start<end ^ st)){
				try
				{
					obj.style.filter="alpha(opacity="+start+")";//IE
					obj.style.MozOpacity=start/100;//FF
				}
				catch(e){};
				setTimeout(function(){visible(obj,start,end,step,interval,callback);},interval);				
			}
			//执行回调		
			else		
				callback ? callback() : "";
		}
var XgetScroll=function(){
	return{height:document.documentElement.scrollHeight,top:document.documentElement.scrollTop};
};
function getOffset(evt)
{
  var target = evt.target;
  if (target.offsetLeft == undefined)
  {
    target = target.parentNode;
  }
  var pageCoord = getPageCoord(target);
  var eventCoord =
  {
    x: window.pageXOffset + evt.clientX,
    y: window.pageYOffset + evt.clientY
  };
  var offset =
  {
    offsetX: eventCoord.x - pageCoord.x,
    offsetY: eventCoord.y - pageCoord.y
  };
  return offset;
}
function getPageCoord(element)
{
  var coord = {x: 0, y: 0};
  while (element)
  {
    coord.x += element.offsetLeft;
    coord.y += element.offsetTop;
    element = element.offsetParent;
  }
  return coord;
}

function getEventOffset(evt)
{
  var msg = "";
  if (evt.offsetX == undefined)
  {
    var evtOffsets = getOffset(evt);
	msg={offsetX:evtOffsets.offsetX,offsetY:evtOffsets.offsetY};
  }
  else
  {
	msg={offsetX:evt.offsetX,offsetY:evt.offsetY};
  }
  return msg;
}
function fDragStart(XEle)
{
	switch(fCkBrs())
	{
		 case 3:
			 window.getSelection().removeAllRanges();
			 break;
				
			default:
			 XEle.setCapture();
			 break;
	}
}
function fDragEnd(XEle)
{
	switch(fCkBrs())
	{
		 case 3:
			 window.getSelection().removeAllRanges();
			 break;
				
			default:
			 XEle.releaseCapture();
			 break;
	}
}
function fCkBrs()
{
 switch (navigator.appName)
 {
  case 'Opera': return 2;
  case 'Netscape': return 3;
  default: return 1;
 }
} 
function getOffsete (e,o) {
	var e=e||window.event;
	var eSrc=e.srcElement||e.target;
	if(eSrc!=o){getOffsete(e.offsetParent)}

}
var DragZindexNumber=2000;

function Xdrag(obj,odrag){
var ex,xy,tag=0;
var odrag=odrag?odrag:obj
odrag.style.cursor="move";
if(tag==0){

odrag.onmousedown=function(e)
	{   
		obj.style.zIndex=DragZindexNumber++;
	    Xtransp(obj,"start")
		tag=1;
		var e = e||window.event;
		ex=e.clientX-obj.offsetLeft;
		ey=e.clientY-obj.offsetTop;
		var tempDiv=XCreateElement("div");
		XSetCss(tempDiv,{width:obj.offsetWidth+"px",
						height:obj.offsetHeight+"px",
						border:"1px dotted red",
						position:"absolute",
						left:obj.offsetLeft+"px",
						top:obj.offsetTop+"px",
						zIndex:9999
			});
		this.ele=tempDiv;
		fDragStart(tempDiv);
		document.body.onmousemove=function(e){
		if(tag==1)
		 { 
			var e=e||window.event;
			XSetCss(tempDiv,{left:e.clientX-ex+"px",top:e.clientY-ey+"px"})
		 }
		else{if(!tempDiv==null)tempDiv.parentNode.removeChild(tempDiv)}
		}
	   tempDiv.onmouseup=function(e)
		{
		var e=e||window.event;
		fDragEnd(tempDiv);
		obj.style.position="absolute";
		Xtransp(obj,"end");
		Xmove(obj,tempDiv.offsetLeft,tempDiv.offsetTop);
		tempDiv.parentNode.removeChild(tempDiv);
		tag=0;
		}
	 }
 }
}
function Xcover(color,num){/*color:遮罩的背景色 eg: red/#cbcbcb, num:1-100内的整数*/
    var cDiv={};
	this.color=color;
	this.num=num;
	this.start=function(){
		cDiv=XCreateElement("div");
		XSetCss(cDiv,
				{
					position:"absolute",
					top:"0px",
					left:"0px",
					zIndex:2000,
					width:"0px",
					margin:"0px auto",
					background:this.color,
					filter:"Alpha(Opacity="+this.num+")",
					opacity:this.num/100
				})

		cDiv.innerText="<h3>双击关闭</h3>";
		XslideDown(cDiv,"width",getCover().X-25,50);
		XslideDown(cDiv,"height",getCover().H,30);
		cDiv.ondblclick=function(){
			cDiv.parentNode.removeChild(cDiv);
			}

		};
	this.stop=function(){
			cDiv.parentNode.removeChild(cDiv);

	};
}
function getCover(){
	var m={}
     m.H=screen.availHeight>document.documentElement.scrollHeight?screen.availHeight:document.documentElement.scrollHeight;
     m.X=screen.availwidth>document.documentElement.scrollWidth?screen.availWidth:document.documentElement.scrollWidth;
	return m;
}
//拖动 End

var key = null;
var tablewidth, tableheight, tabletop, tableleft, searchwidth, searchheight, searchtop, searchleft;
//初始化，保存div初始值
function Init() {
    var tablediv = document.getElementById("table");
    var searchdiv = document.getElementById("search");

    tablewidth = tablediv.style.width;
    tableheight = tablediv.style.height;
    tabletop = tablediv.style.top;
    tableleft = tablediv.style.left;

    searchwidth = searchdiv.style.width;
    searchheight = searchdiv.style.height;
    searchtop = searchdiv.style.top;
    searchleft = searchdiv.style.left;
}

//自动适应大小函数
function setsize() {
    var divgis = document.getElementById("gis");

    if ((document.body) && (document.body.clientWidth))
        divgis.style.width = document.body.clientWidth;
    if ((document.body) && (document.body.clientHeight))
        divgis.style.height = document.body.clientHeight;

    if (document.documentElement && document.documentElement.clientWidth && document.documentElement.clientHeight) {
        divgis.style.height = document.documentElement.clientHeight;
        divgis.style.width = document.documentElement.clientWidth;
    }
}


//实现可拖动div效果



function Drag(element, e) {
    e = e || event;
    if (document.addEventListener) {
        document.addEventListener("mousemove", StartDrag, true);
        document.addEventListener("mouseup", StopDrag, true);
    }
    else {
        document.onmousemove = StartDrag;
        document.onmouseup = StopDrag;
    }


    var deltaX = e.clientX - parseInt(element.parentElement.style.left);
    var deltaY = e.clientY - parseInt(element.parentElement.style.top);
    
    
    function StartDrag(e) {
        e = e || event;
        element.parentElement.style.left = e.clientX - deltaX + "px";
        element.parentElement.style.top = e.clientY - deltaY + "px";
    };
    
    

    function StopDrag() {
        if (document.removeEventListener) {
            document.removeEventListener("mousemove", StartDrag, true);
            document.removeEventListener("mouseup", StopDrag, true);
        }
        else {
            document.onmousemove = "";
            document.onmouseup = "";
        }

        var oDiv = document.getElementsByTagName("div");
    };

    return true;
};

function setFocus(elementId) {
    var oDiv = document.getElementsByTagName("div");
    for (var i = 0; i < oDiv.length; i++) {
        if (oDiv[i].id == elementId) {
            oDiv[i].style.zIndex = 2000;
        }
        else {
            oDiv[i].style.zIndex = 1999;
        }
    }
};

function CloseDiv(id) {
    var a = document.getElementById(id);
    document.getElementById(id).style.display = 'none';
    if (id == 'table') {
        a.style.width = tablewidth;
        a.style.height = tableheight;
        a.style.top = tabletop;
        a.style.left = tableleft;
    }
    if (id == 'search') {
        a.style.width = searchwidth;
        a.style.height = searchheight;
        a.style.top = searchtop;
        a.style.left = searchleft;
    }
}

var DivDragMainHeight;
function SmallDiv(e, id) {
    var div = id;
    id = id + "Main";
    var a = document.getElementById(id);
    if (a.style.display == 'none') {
        a.style.display = 'block';
        e.className = "btnMin";
        dom(div).style.height = DivDragMainHeight;
    }
    else {
        a.style.display = 'none';
        e.className = "btnMax";
        DivDragMainHeight = dom(div).style.height;
        dom(div).style.height="0px"
    }
}




//5.ECI.Msg.js ===========================================

$.msg = function () { }
var $message, $loading, $messagecontent, $validatecontent, $trmessage, $command, $msgicon, okfun, cancelfun, closed;
$.msg.focusId = "";
$.msg.first = true;
$.msg.defaults = { timeout: 3000 };

$.msg.init = function () {
    var maskhtml = '';
    maskhtml += '    <div id="mask" class="eci-mask"  ></div>';
    maskhtml += '    <div id="msgtip" class="tip-background" style="position: absolute;display:none;">';
    maskhtml += '         <span id="msgtipcontent" class="tip-text"></span>';
    maskhtml += '     </div>';

    var html = "";
    html += '<div id="msgInfo" class="tip" style="display:none;">';
    html += '            <div class="tiptop"><span style="width:400px;">' + lang.M00004 + '</span><a class="cancel"></a></div>';
    html += '            <div class="tipinfo">';
    html += '               <div class="trmessage">';
    html += '                <div id="msgicon" class="msg-icon msg-error"></div>';
    html += '                <div class="tipright ">';

    html += '                   <table style="width: 100%;" id="msgValidateTable">';
    html += '                       <tr>';
    html += '                            <td class="validatecontent notnull"></td>';
    html += '                        </tr>';
    html += '                        <tr>';
    html += '                            <td style="padding-top: 4px;">';
    html += '                                <div style="float: left; margin: 4px 0px 0px 0px;">';
    html += '                                    ' + lang.M00008 + '：';
    html += '                                </div>';
    html += '                                <div style="float: left;">';
    html += '                                    <input id="msgValidateCode" type="text" maxlength="3" style="width:60px"  class="text-input">';
    html += '                                </div>';
    html += '                                <div style="float: left; margin-left: 4px">';
    html += '                                    <img id="msgValidateImag" onclick="refreshValidateImage();" title="' + lang.M00009 + '" alt="' + lang.M00009 + '" style="height: 25px; width: 54px; border-width: 0px;">';
    html += '                                </div>';
    html += '                                <div style="float: left; margin: 4px 0px 0px 10px;">';
    html += '                                    <a href="javascript:refreshValidateImage();">' + lang.M00010 + '</a>';
    html += '                                </div>';
    html += '                                <div id="msgValidateCodeEmpty" style="float: left;padding-left:5px;" class="notnull">' + lang.M00011 + '</div>';
    html += '                            </td>';
    html += '                        </tr>';
    html += '                     </table>';


    html += '                    <div class="messagecontent"></div>';

    html += '                </div>';
    html += '             </div>';
    html += '            </div>';

    html += '            <div class="tipbtn command">';
    html += '                <input type="button" class="sure messageconfirm" value="' + lang.M00005 + '" />&nbsp;';
    html += '                <input type="button" class="cancel messagecancel" value="' + lang.M00006 + '" />';
    html += '            </div>';
    html += '        </div>';

    var loadingHtml = '<div id="loading-content" style="display:none; position: absolute;margin-left:auto;margin-right:auto;">' +
         '<img  src="' + eci.webPath + '/Themes/Default/Images/msg/loading.gif" style="width: 80px;height:80px;" /><br>' +
         '<span style="color:white; font-size:28px;line-height: 80px;">' + lang.M00007 + '</span>' +
         '</div>';


    $(document.body).append(maskhtml + html + loadingHtml);

    var $message = $("#msgInfo");
    var my = this;

    this.timeoutHandler = 0;
    this.$mask = $('#mask');
    this.$msgtip = $('#msgtip');
    this.$msgtipcontent = $('#msgtipcontent');
    this.$message = $message;
    this.$loading = $("#loading-content");
    this.$messagecontent = $message.find(".messagecontent");
    this.$validatecontent = $message.find(".validatecontent");

    this.$trmessage = $message.find(".trmessage");
    this.$command = $message.find(".command");
    this.$msgicon = $message.find("#msgicon");

    $message.find(".sure").click(function () {

        if (!$("#msgValidateTable").is(":hidden")) {
            if (!msg.checkValidate()) {
                $("#msgValidateCode").val("").focus();
                return false;
            }
        }

        my.close();

        if (my.okfun) {
            my.okfun();
        }
    })

    $message.find(".cancel").click(function () {
        my.close();
        if (my.cancelfun) {
            my.cancelfun();
        }
    })

    $("#msgValidateCode").bind("keydown", function (e) {
        var key = e.which;

        $("#msgValidateCodeEmpty").hide();

        if (key == 13) {

            e.preventDefault();

            if (msg.checkValidate()) {
                my.close();
                if (my.okfun) {
                    my.okfun();
                }
            }
        }
    });
}

$.msg.checkValidate = function () {
    var validateCode = $("#msgValidateCode").val().trim();

    if (validateCode == "") {
        $("#msgValidateCodeEmpty").show();
        $("#msgValidateCode").val("").focus();
        return false;
    }

    $("#hidValidateCode").val(validateCode);

    return true;
}

$.msg.drag = function () {
    Xdrag($(".tip")[0], $(".tiptop").find("span")[0]);
}

$.msg.ajax = function (r, o) {
    msg.closeloading();
    if (r.success) {
        $.msg.tip(r.message);
    }
    else {
        $.msg.error(r.message, o);
    }
}

$.msg.ajaxAlert = function (r, o) {
    msg.closeloading();
    if (r.success) {
        $.msg.alert(r.message);
    }
    else {
        $.msg.error(r.message, o);
    }
}

$.msg.focus = function () {
    if ($.msg.focusId) {
        $.msg.focusId.focus();
    }
}

$.msg.mask = function () {
    var height = $(document).height();
    $('#mask').height(height);

    $('#mask').show();
}

$.msg.top = function () {
    $('#mask').css("z-index", "3000");
}

$.msg.closemask = function () {
    var l = $(".needmask:visible").length;

    if (l == 0) {
        $('#mask').hide();
    }
}

$.msg.close = function () {

    if ($.msg.accessError) {
        return;
    }


    this.closemask();

    this.closetip();

    this.$message.hide();

    this.$loading.hide();

    eci.focus(msg.focusId);

    if (this.closed) {
        this.closed();
    }
}

$.msg.closeloading = function () {
    this.closemask();
    this.$loading.hide();
}

$.msg.closetip = function () {

    $("#msgtip").fadeOut(1000);
}

$.msg.tip = function (m, options) {

    options = $.extend({}, options);

    msg.middle();

    this.$msgtip.fadeIn();
    this.$msgtipcontent.html(m);

    clearTimeout(this.timeoutHandler);

    this.timeoutHandler = setTimeout($.msg.closetip, $.msg.defaults.timeout);

    msg.middle();

    $.eci.focus(options.focusId);
}


$.msg.middle = function () {

    var h = msg.$msgtip.height();
    var w = msg.$msgtip.width();
    var l = (eci.width() - w) / 2;
    var t = (eci.height() - h) / 2;

    if (t < 0) t = 0;
    if (l < 0) l = 0;

    msg.$msgtip.css({ left: l + "px", top: t + "px" });
}

$.msg.alert = function (m, options) {
    this.seticon("info");
    this.showmessage(m, options);
    return false;
}

$.msg.warning = function (m, options) {
    this.seticon("warning");
    $.msg.showmessage(m, options);
    return false;
}

$.msg.error = function (m, options) {
    this.seticon("error");
    this.showmessage(m, options);

    return false;
}

$.msg.showmessage = function (m, options) {

    $.msg.first = false;
    $("#msgValidateTable").hide();

    this.closetip();
    options = $.extend({}, $.msg.defaults, options);

    $.msg.accessError = false;

    if (options.accessError) {
        $.msg.accessError = true;

        $.msg.$message.find(".sure").css("width", "140");
        $.msg.$message.find(".sure").val("提示窗口无法关闭");
 
    }

    var defaultFocusId = $.msg.focusId;

    $.msg.focusId = options.focusId;

    if ($.msg.first) {
        if ($.msg.focusId == undefined || $.msg.focusId == "") {
            $.msg.focusId = defaultFocusId;
        }
    }

    this.mask();
    this.closed = options.closed;
    this.okfun = undefined;
    this.cancelfun = undefined;
    this.$message.find(".messagecancel").hide();
    this.$messagecontent.html(m);
    this.$validatecontent.html(m);

    eci.middle(this.$message[0]);

    this.$loading.hide();

    this.$message.show();
    this.$messagecontent.show();

    $("#msgValidateTable").hide();

    this.$trmessage.show();
    this.$command.show();
    this.$message.find("cite").hide();
    this.$message.find(".messageconfirm").focus();

    var obj = this.$messagecontent[0];

    if (obj.scrollHeight > obj.clientHeight || obj.offsetHeight > obj.clientHeight) {
        this.$messagecontent.css("overflow-y", "scroll");
    }
    else {
        this.$messagecontent.css("overflow-y", "hidden");
    }
}

$.msg.progress = function (taskId, type, options) {

    options = $.extend({ width: 680, height: 300, close: false }, options);

    if (eci.hasFunction("taskOpen")) {
        taskOpen(type, options);
    }

    var url = eci.webPath + "/App/Progress/Progress.aspx?taskId=" + taskId + "&type=" + type;
    if (options.close) {
        url += "&close=true";
    }

    eci.dialog(lang.M00012, url, { width: options.width, height: options.height, showclose: false });
}

$.msg.validate = function (m, okfun, options) {
    refreshValidateImage();
    $.msg.confirm(m, okfun, options);

    $("#msgValidateCodeEmpty").hide();

    this.$messagecontent.hide();
    $("#msgValidateTable").show();
    $("#msgValidateCode").val("").focus();

    return false;
}

$.msg.confirm = function (m, okfun, options) {

    options = $.extend({ gridId: 'gvData' }, options);
    var selectRow = options.selectRow;
    var selectOneRow = options.selectOneRow;
    var gridId = options.gridId;

    if (selectRow) {
        if (!egrid.selectRow(gridId)) { return false; }
    }

    if (selectOneRow) {
        if (!egrid.selectOneRow(gridId)) { return false; }
    }

    if (okfun == undefined) {
        this.alert(m);
        this.seticon("question");
        this.cancelfun = options.cancelfun;
        this.$message.find(".messagecancel").show();
        this.$message.find("cite").show();

        return false;
    }

    if (typeof (okfun) == "function") {
        $.msg.focusId = "";

        this.alert(m);
        this.seticon("question");

        this.okfun = okfun;
        this.cancelfun = options.cancelfun;

        this.$message.find(".messagecancel").show();
        this.$message.find("cite").show();
    }
    else {
        msg.confirm(m, function () { postback(okfun); }, options)
    }

    return false;
}

$.msg.seticon = function (icon) {
    this.$msgicon.removeClass("msg-warning").removeClass("msg-question").removeClass("msg-error").removeClass("msg-info");
    this.$msgicon.addClass("msg-" + icon);
}

$.msg.loading = function (m) {
    if (!m) {
        m = lang.M00007;
    }
    this.closetip();
    this.mask();
    this.$loading.show();
}

window.msg = $.msg;
//6.ECI.EGrid.js ===========================================
$.egrid = function (content, options) { }

$.egrid.scroll = function (obj, id) {

    $("#" + id + "ColumnView")[0].scrollLeft = obj.scrollLeft;

    var width = $(obj).find(".eci-grid-table").width();
    var columnViewWidth = $("#" + id + "ColumnView").width();

    if (obj.scrollLeft > width - columnViewWidth) {
        $("#" + id + "ColumnView").find(".eci-grid-headerCell-last").find(".eci-grid-headerCell-inner").css("width", "50px").css("padding-left", "30px").html("&nbsp;");
        $("#" + id + "ColumnView")[0].scrollLeft = obj.scrollLeft;
    }
}

$.egrid.scrollToKey = function (id, key) {

    var target = $("#" + id + "Table").find("tr[key=" + key + "]");
    if (target.length == 0) {
        return;
    }
    var offsetTop = target[0].offsetTop;
    target.addClass("eci-highlight");

    $("#" + id + "RowView")[0].scrollTop = offsetTop - 30;
}

$.egrid.selectAll = function (obj) {
    var id = $(obj).attr("tag");

    if (obj.checked) {
        $("." + id + "-check-item").filter(function () { return $(this).attr("disabled") != "disabled" }).attr("checked", "checked");
        $("#" + id + "Table tr").addClass("eci-grid-row-selected");
    }
    else {
        $("." + id + "-check-item").filter(function () { return $(this).attr("disabled") != "disabled" }).removeAttr("checked");
        $("#" + id + "Table tr").removeClass("eci-grid-row-selected");
    }
}

$.egrid.page = function (obj) {
    var $go = $(obj);
    var id = $go.attr("data");
    var p = $go.parent().find(".eci-pager-num").val().trim();
    if (p == "") {
        msg.warning("请输入要跳转的页码");
        $go.parent().find(".eci-pager-num").focus();
        return false;
    }

    var max = $go.attr("max");
    var current = $go.attr("current");
    //检查输入的是否正确
    if (p == current) {
        msg.warning(lang.M00035.replace("{w1}", p));
        return false;
    }

    postback(id, "Page$" + p);
}

$.egrid.pageTo = function (id, num, obj) {
    $(obj).removeAttr("onclick");

    __doPostBack(id, num);

}


$.egrid.sort = function (obj, id, s) {
    if (!$.egrid.hasRow(id)) return;

    obj = $(obj).parent()[0];

    var hasAsc = $(obj).hasClass("eci-grid-asc");
    var hasDesc = $(obj).hasClass("eci-grid-desc");

    $(obj).addClass("eci-grid-asc");
    var sorttype = "Asc";

    if (hasAsc || hasDesc) {
        if (hasAsc) {
            $(obj).removeClass("eci-grid-asc").addClass("eci-grid-desc");
            sorttype = "Desc";
        }
        else {
            $(obj).removeClass("eci-grid-desc").addClass("eci-grid-asc");
            sorttype = "Asc";
        }
    }

    $(obj).find("span").addClass("eci-grid-sortIcon");

    var name = $("#" + id).attr("name");

    postback(name, "Sort$" + s + "$" + sorttype)
}


$.egrid.designAlign = function (id) {

    var url = eci.webPath + "/App/Design/GridAlign.aspx?id=" + id;
    eci.dialog("列表内容对齐设置", url, { full: true,icon:"function" });
}

$.egrid.comSort = function (gridId) {
   
    var url = eci.webPath + "/App/ComAttr/ComGridSort.aspx?gridId=" + gridId;

    var configValue = $("#hidComGridSort").val();

    configValue= encodeURIComponent(configValue);

    var data = { config: configValue };
 
    eci.dialog("列表企业自定义设置", url, { icon: "sort", width: 600, height: 300, post: true, data: data });
}
 
$.egrid.dblclick = function (key, tr, gridId) {
    egridClick(key, tr, gridId);
}

$.egrid.selectRow = function (id) {
    if (!egrid.hasRow(id)) return false;
    var $gvData = $("#" + id + "Table");
    var count = $gvData.find(".check-item:checked").length;
    if (count == 0) { msg.error(lang.C00001); return false; }
    return true;
}

$.egrid.selectOneRow = function (id) {
    if (!egrid.hasRow(id)) return false;
    var $gvData = $("#" + id + "Table");
    var count = $gvData.find(".check-item:checked").length;
    if (count == 0) { msg.error(lang.C00001); return false; } else if (count > 1) { msg.error(lang.C00003); return false; }
    return true;
}

$.egrid.hasRow = function (gridId) {
    var count = $("#" + gridId + "Table .eci-grid-row").length;
    if (count == 0) { msg.error(lang.C00002); return false; } else { return true; }
}

$.egrid.selectedKey = function (gridId) {
    return $.map($("#" + gridId + "Table .check-item:checked"), function (a) { return $(a).parents("tr").attr("key") }).join(",");
}

$.egrid.notSelectedKey = function (gridId) {
    return $.map($("#" + gridId + "Table .check-item").not(":checked"), function (a) { return $(a).parents("tr").attr("key") }).join(",");
}

$.egrid.selectedField = function (gridId, columnName) {
    return $.map($("#" + gridId + "Table .check-item:checked"), function (a) { return $(a).parents("tr").find("." + columnName).text() }).join(",");
}
 
window.egrid = $.egrid;

function EGrid() { }

EGrid.prototype.data;

EGrid.prototype.layout = function () {
    logEnd("EGrid.layout add Td……");

    //经过测试，此代码不可以省略.
    this.data.each(function () {

        if (!$(this).hasClass("init")) {
            $(this).addClass("init");
            var id = $(this).attr("id").replace("Main", "")
            var $table = $("#" + id + "Table");
            var td = '<td>&nbsp;</td>';
            if (IE8) { td = '<td>&nbsp;</td>'; }

            $table.find(".eci-grid-row").append(td);
        }
    });
    logEnd("EGrid.layout add Td");


    logEnd("EGrid.layout execute……");
    this.data.each(function (index) {

        try {
            var $this = $(this);
            var h;

            var $parent = $this.parent();

            var w = $parent.width() - 2;

            var fitwindow = $this.attr("fitWindow");

            if (fitwindow == "Y") {
                var layoutHeight = eci.layoutHeight($this);
                h = eci.height() - layoutHeight;
            }
            else {
                h = $this.height();
            }

            var minHeight = 50;
            h = h <= minHeight ? minHeight : h;

            var id = $this.attr("id").replace("Main", "")

            $this.css("width", w);

            if (fitwindow == "Y") {
                $this.css("height", h - 4);
            }

            var pagerHeight = $this.find(".eci-grid-pager").height();
            var headerHeight = $this.find(".eci-grid-table-header").height() + 4;

            if (!pagerHeight) {
                pagerHeight = 0;
            }

            var divRowHeight = h - headerHeight - pagerHeight;


            $("#" + id + "Row").css("height", divRowHeight);

            //判断是否产生滚动条
            var scrollbarWidth = 0;
            if ($(".workarea").length > 0) {
                $(".workarea")[0].scrollTop = 1;
                if ($(".workarea")[0].scrollTop == 1) {
                    $this.css("width", dataGridWidth - 17);
                }
            }


        }
        catch (error) { }
    });
    logEnd("EGrid.layout execute");
}

EGrid.prototype.initEvent = function () {
    this.data.each(function (index) {
        var $tr = $(this).find(".eci-grid-row");
        $tr.each(function (index) { $(this).attr("index", index); });
        $(this).find(".eci-grid-row").filter(function () { return $(this).find(".check-item:checked").length == 1 }).addClass("eci-grid-row-selected");

        if ($(this).attr("EnableClickSelectRow") == "Y") {
            $tr.bind("click", function (event) {

                var ctrl = event.ctrlKey;
                var index = $(this).attr("index");
                var selectMode = $(this).attr("selectMode");

                var $grid = $(this).parents(".eci-grid");

                var lastIndex = $grid.attr("shiftIndex");

                $grid.attr("shiftIndex", index);

                //Shift选择
                if (event.shiftKey) {

                    index = parseFloat(index);
                    lastIndex = parseFloat(lastIndex);

                    var startIndex = 0;
                    var endIndex = 0;

                    if (index > lastIndex) {
                        startIndex = lastIndex;
                        endIndex = index;
                    }
                    else {
                        startIndex = index;
                        endIndex = lastIndex;
                    }

                    $grid.find(".eci-grid-row").each(function (idx) {
                        if (idx >= startIndex && idx <= endIndex) {
                            var checkItem = $(this).addClass("eci-grid-row-selected").children().find(".check-item");
                             
                            if (checkItem.length > 0) {
                                if (checkItem.attr("disabled") != "disabled") {
                                    checkItem[0].checked = true;
                                }
                            }
                        }

                    });

                    return;
                }

                if (!selectMode) {

                    selectMode = $grid.attr("selectMode");

                    if (!selectMode) {
                        selectMode = "Default";
                    }

                    $(this).attr("selectMode", selectMode);
                }

                //已经选择了的：取消
                if (event.altKey) {
                    $(this).removeClass("eci-grid-row-selected").children().find(".check-item").removeAttr("checked");
                }
                else {
                    if (!$(this).children().find(".check-item").attr("checked")) {
                        if (!ctrl) {
                            if (selectMode == "Default") {
                                $(this).siblings().removeClass("eci-grid-row-selected").children().find(".check-item").removeAttr("checked");
                            }
                        }

                        var checkItem = $(this).addClass("eci-grid-row-selected").children().find(".check-item");

                        if (checkItem.length > 0) {
                             
                            if (checkItem.attr("disabled") != "disabled") {
                                checkItem[0].checked = true;
                            }

                        }
                    }
                }


            });
        }

        $tr.each(function (index) {
            $(this).children('td').eq(0).click(function (event) {
                $(this).find(".check-item").click();
                event.stopPropagation();
            });
        });

        $(this).find(".check-item").click(function (event) {
            this.checked ? $(this).parents("tr").addClass("eci-grid-row-selected") : $(this).parents("tr").removeClass("eci-grid-row-selected");
            event.stopPropagation();
        });

        $tr.hover(function () {
            var enableHover = $(this).parents(".eci-grid").attr("EnableHover");

            if (enableHover == "false") { return; }
            $(this).addClass("eci-grid-row-hover");
        }, function () {
            $(this).removeClass("eci-grid-row-hover");
        });

        $(this).find(".eci-grid-rows-view").each(function () {

            var fixedInit = false;
            var $trs = $(this).find("table").find("tr[class*='eci-grid-row']");
            var $tdFixedCell = $trs.find("td[class*='eci-grid-cell-fixed']");
            var $tdFixedHeadCell = $(this).parents(".eci-grid").find("th[class*='eci-grid-header-fixed']");

            $(this).scroll(function () {

                var left = $(this).scrollLeft();

                if (fixedInit == false && left > 0) {
                    fixedInit = true;
                    var cssFixed = { "position": "relative", "top": "0px", "z-index": "500" }

                    $tdFixedCell.css(cssFixed);
                    $tdFixedHeadCell.css(cssFixed);

                    $tdFixedCell.each(function (i) {
                        var alter = $(this).parents("tr").hasClass("eci-grid-row-alter");

                        if (alter) {
                            $(this).addClass("eci-grid-row-alter");
                        }
                        else {
                            $(this).css("background-color", "white");
                        }
                    });
                }

                var css = { "left": left }
                $tdFixedCell.css(css);
                $tdFixedHeadCell.css(css);
            });
        })



    });



}

$.fn.eGrid = function () {
    var grid = new EGrid();
    grid.data = this;
    return grid;
}

$.fn.getField = function (field) {

    var tagName = this[0].tagName;

    var $this = this;

    if (tagName != "TR") {
        $this = $this.parents("tr");
    }

    var length = $this.find("." + field).length;

    if (length == 0) {
        alert("数据读取异常，列表中没有[" + field + "]数据");
    }

    var value = $this.find("." + field).html();

    if (value == "&nbsp;") {
        value = "";
    }
    else {
        if (length == 1) {
            value = $this.find("." + field).text();
        }
        else if (length > 1) {

            value = $($this.find("." + field)[0]).text();
        }
    }

    return value;
}

$.fn.getKey = function (key) {

    if (this.length == 0) {
        if (this.selector) {
            return this.selector;
        }
    }

    var tagName = this[0].tagName;

    var $this = this;

    if (tagName != "TR") {
        $this = $this.parents("tr");
    }

    var value = $this.attr("key");

    return value;
}

$.fn.datatoken = function (key) {

    if (this.length == 0) {
        alert("获取数据令牌失败!");
        return "";
    }

    var tagName = this[0].tagName;

    var $this = this;

    if (tagName != "TR") {
        $this = $this.parents("tr");
    }

    var value = $this.attr("datatoken");

    return value;
}

$.fn.getRow = function () {

    var tagName = this[0].tagName;

    var $this = this;

    if (tagName != "TR") {
        $this = $this.parents("tr");
    }

    return $this;
}
//7.ECI.Button.js ===========================================
//EButton
function EButton() { }

EButton.prototype.data;

//设置按钮失效
EButton.prototype.disable = function (option) {
    this.data.each(function (index) {
        $(this).addClass("disabled");
        $(this).attr("onclickback", $(this).attr("onclick")).removeAttr("onclick");
    });
}

//设置按钮生效
EButton.prototype.enable = function (option) {
    this.data.each(function (index) {
        $(this).removeClass("disabled");
        $(this).attr("onclick", $(this).attr("onclickback")).removeAttr("onclickback");
    });
}

$.fn.ebutton = function () {
    var obj = new EButton();
    obj.data = this;
    return obj;
}

//8.ECI.TextBox.js ===========================================
function ETextBox() { }

ETextBox.prototype.data;
 
ETextBox.prototype.notnull = function (value) {
    this.data.each(function (index) {
        $(this).addClass("disabled");
        $(this).attr("onclickback", $(this).attr("onclick")).removeAttr("onclick");
    });
}

$.fn.etextbox = function () {
    var obj = new ETextBox();
    obj.data = this;
    return obj;
}

//9.ECI.MenuGroup.js ===========================================
function EMenuGroup() {
}

EMenuGroup.initUI = function () {
    $(".eci-menu-group").emenugroup().init();
}

EMenuGroup.prototype.data;

var $openMenuContent;

function closeContextMenu() {
    if ($openMenuContent) {
        $openMenuContent.hide();
    }
}
//初始化
EMenuGroup.prototype.init = function (option) {

    this.data.each(function (index) {

        var id = this.id;

        var $this = $(this);
        var $menuContent = $("#" + id + "Content");

        var $menuItems = $menuContent.find(".eci-menu-item");
        var $btn = $this.find(".btn");
 
        $menuItems.click(function (event) {

            event.stopPropagation();

            if ($(this).hasClass("eci-menu-item-disabled")) {
                return;
            }
            else {
                $openMenuContent.hide();
            }
        });

        $this.click(function () {

            if ($openMenuContent) {
                $openMenuContent.hide();
            }

            $menuContent.show();

            $openMenuContent = $menuContent;

            var e = event || window.event;
            var x = e.screenX;
            var y = e.screenY;

            x = getAbsoluteLeft(this);
            y = getAbsoluteTop(this);

            //x += $(this).width()-1;
            y += $(this).height()-1;

            if (x <= 0) { x = 0; }
            if (y <= 0) { y = 0; }

            var menuHeight = $menuContent.height();
            var winHeight = eci.height();

            if (menuHeight + y > winHeight) {
                y = winHeight - menuHeight -15;// y - menuHeight - $(this).height() / 2;
            }

            $menuContent.css("left", x);
            $menuContent.css("top", y);

            setTimeout(function () { $menuContent.show(); }, 1)
        })
    });
}

$.fn.emenugroup = function () {
    var obj = new EMenuGroup();
    obj.data = this;
    return obj;
}

$(document).click(function () {
    closeContextMenu();
})
//10.ECI.ComboxEx.js ===========================================
function EComboxEx() {
}

EComboxEx.initUI = function () {
    $(".eci-combox-ex").ecomboxex().init();
}

EComboxEx.prototype.data;

//初始化
EComboxEx.prototype.init = function (option) {

    this.data.each(function (index, comboxEx) {

        var $this = $(this);
        var id = this.id;

        var $div = $("#" + id + "Div");//全选
        var $all = $("#" + id + "All");//全选
        var $value = $("#" + id + "Value");//值
        var $select = $div.find(".eci-combox-ex-select");//浮动层
        var $checkbox = $("#" + id + " input[type='checkbox']");//项

        $checkbox.parent().css('border', 'none');

        $this.css('border', 'none');


        $all.click(function () {
            $checkbox.attr("checked", this.checked);
            setValue();
        })

        $checkbox.click(function () {
            setValue();
        });

        function getOffsetTop(el) {
            return el.offsetParent
             ? el.offsetTop + getOffsetTop(el.offsetParent)
             : el.offsetTop
        }

        $value.click(function () {
            $select.css("width", $value.css("width"))
            $select.toggle();

            var top = getOffsetTop($value[0]) + $value.height() + 2;
            $select.css("top", top);
            $select.css("position", "absolute");

        });

        $div.mouseleave(function () {
            $select.slideUp("fast");
        });

        var setValue = function () {
            var value = "";
            $all[0].checked = true;
            $checkbox.each(function () {
                if (this.checked) {
                    if (value != "") { value += ","; }
                    value += $(this).next().text();
                }
                else {
                    $all[0].checked = false;
                }
            });


            $value.val(value);
        }

    });
}

$.fn.ecomboxex = function () {
    var obj = new EComboxEx();
    obj.data = this;
    return obj;
}
//11.ECI.Choose.js ===========================================
$.choose = function () { }

var hasOpen = false;
var cc = "";
var fv = "";
var level = 0; //如果是0级，空则不验证
var redFieldName = "";//检测时异常的字段中文名

$.choose.setColor = function (t) {
    dom(t).style.color = "red";
}

$.choose.removeColor = function (t) {
    dom(t).style.color = "black";
}

$.choose.enable = function (t) {
    var d = dom(t);
    d.readOnly = false;
}

$.choose.disable = function (t) {
    var d = dom(t);
    d.style.background = "#A4A4A4";
    d.readOnly = true;
}

$.choose.toInput = function (id) {
    $("#" + id + "ChooseIcon").hide();
    $("#" + id).attr("plain", "true");
}

$.choose.toChoose = function (id) {
    $("#" + id + "ChooseIcon").show();
    $("#" + id).removeAttr("plain");
}

$.choose.changeType = function (id, type) {
    var dom = $("#" + id);
    var domClear = $("#" + id + "ChooseClear");
    var domIcon = $("#" + id + "ChooseIcon");

    dom.attr('ecitype', type);
    dom.attr('onkeypress', '$.choose.keypress("' + type + '", "' + id + '")');
    dom.attr('ondblclick', '$.choose.open("' + type + '", "' + id + '")');
    dom.attr('onblur', '$.choose.servercheck("' + type + '", "' + id + '")');

    if (domIcon.length > 0) {
        domIcon.attr('onclick', 'return $.choose.open("' + type + '", "' + id + '")');
    }

    if (domClear.length > 0) {
        domClear.attr('onclick', 'return $.choose.clear("' + type + '", "' + id + '")');
    }
}

$.choose.keypress = function (type, t) {
    if (event.ctrlKey || event.altKey) {
        if (event.keyCode == 10) {
            $.choose.open(type, t);
        }
        else {
            return false;
        }
    }
}

$.choose.clear = function (type, t) {
    var d = dom(t);
    var clearedValue = $(d).attr("ClearedValue");
    var codeBehind = $(d).attr("CodeBehind") == "true";

    if (!clearedValue) { clearedValue = ""; }

    if (codeBehind) {
        $("#" + t + "Value").val(clearedValue.code());
        $(d).val(clearedValue.name()).focus();
    }
    else {
        $(d).val(clearedValue).focus();
    }

}

$.choose.open = function (type, t) {

    var d = dom(t);
    var $d = $(d);

    var enableChoose = $d.attr("EnableChoose") == "true";
    var multi = $d.attr("Multi") == "true";
    var plain = $d.attr("plain") == "true";
    var target = $d.attr("target");

    if (target == undefined)
    {
        target = "_choose";
    }
 
    if (plain) { return; }

    if (!enableChoose) {
        if (d.disabled) { return; }
        if (d.readOnly) { return; }
    }

    var chooseUrl = $d.attr("Url");

    if (!chooseUrl && type == "") {
        $d.css("background", "pink");
        msg.warning(lang.E00001 + "," + lang.M00016 + ":" + t);
        return;
    }

    var mv = "";
    var c = d.value.split('|')[0];

    if (!$choose_conn(t)) return;

    hasOpen = true;

    try {
        c = encodeURIComponent(c);
        c = c.length == 0 ? "" : "&conn=" + c;

        var fixconndition = $(d).attr("Condition");

        var complex = $(d).attr("complex");

        var page = "Choose.aspx";

        if (complex) {
            page = "ChooseEx.aspx";
        }

        var url = eci.webPath + "/App/Common/" + page + "?p=" + type + "&t=" + t + c + cc;

        var enableEdit = $(d).attr("EnableEdit");


        if (enableEdit) {
            url += "&EnableEdit=" + enableEdit;
        }

        if (chooseUrl) {

            if (chooseUrl.indexOf('?') < 0) {
                url = chooseUrl + "?t=" + t + c + cc;
            }
            else {
                url = chooseUrl + "&t=" + t + c + cc;
            }
        }

        if (multi) {
            url += "&multi=true";
        }

        if (fixconndition) {
            url += "&" + fixconndition;
        }

        url += "&dsp=" + eci.guid();

        var options = { height: 600, width: 800 };

        var screenWidth = window.screen.availWidth;
        var screenHeight = window.screen.availHeight;

        var config = $(d).attr("Config");

        if (config) {
            config = strToJson(config);
            options = $.extend(options, config);

            if (config.width == "full") {
                options.width = screenWidth;
            }

            if (config.height == "full") {
                options.height = screenHeight;
            }
        }

        var l = (screenWidth - options.width) / 2;
        var t = (screenHeight - options.height) / 2;

        if (eci.isChrome || eci.isFirefox) {
            var f = "height=" + options.height + "px, width=" + options.width + "px, top=" + t + " , left=" + l + ",location=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes, status=no";
            var w = window.open(url, target, f);
            w.focus();
        }
        else {
            var w = window.showModalDialog(url, window, "dialogHeight: " + options.height + "px; dialogWidth: " + options.width + "px; dialogTop: " + t + "px; dialogLeft:" + l + "px; edge: Raised; center: Yes; help: No; resizable:No; status:No;scrollbar=No;");
        }
    }
    catch (e) {
        msg.error(e.message);
    }

    hasOpen = false;
}

$.choose.response = function (d, t) {
    var code = d.code;
    var name = d.name;
    if (!name) name = "";

    if (!code) {
        alert(lang.E00002);
        return false;
    }

    var codeBehind = $("#" + t).attr("CodeBehind");
    var codeOnly = $("#" + t).attr("CodeOnly");
    var NameControlId = $("#" + t).attr("NameControlId");

    if (code && name) {
        if (codeOnly == "true") {
            dom(t).value = code;
        }
        else {
            dom(t).value = code + "|" + name;
        }

        if (codeBehind == "true") {
            dom(t + "Value").value = code;
            dom(t).value = name;
        }
    }
    else {
        dom(t).value = code;
    }

    if (NameControlId) {
        dom(NameControlId).value = name;
    }

    $.choose.removeColor(t);

    $choose_choose(d, t);
}

$.choose.servercheck = function (type, txtName) {

    var d = dom(txtName);
    var plain = $(d).attr("plain") == "true";

    if (plain) { return; }

    if (d.disabled) { return; }
    if (d.readOnly) { return; }

    var chooseUrl = $(d).attr("Url");
    var NotValidate = $(d).attr("NotValidate");
    var ServerCheck = $(d).attr("ServerCheck");

    var v = d.value;

    if (!chooseUrl && type == "") {
        $("#" + txtName).css("background", "pink");
        msg.warning(lang.E00001 + ",异常控件:" + txtName);
        return;
    }

    if (level == 0) {
        if (fv == v) return;
    }

    if (NotValidate == "true") {

        if (ServerCheck == "true") {
            //contiune try get data from server
        }
        else {
            return;
        }
    }
    else {
        $.choose.setColor(txtName);
    }

    var a = v.split('|');
    if (a[0].trim() == "") {
        $.choose.removeColor(txtName);
        if (a.length >= 2) {
            $.choose.setColor(txtName);
        }

        $choose_empty(txtName);

        if (level == 0) {
            return;
        }
    }

    level = 0;

    c = a[0].trim();

    if (!$choose_conn(txtName)) return;

    c = encodeURIComponent(c);

    var url = eci.webPath + "/Action.ashx?dsp=" + eci.guid() + "&action=PT.ChooseValidate&p=" + type + "&conn=" + c + cc;

    if (chooseUrl) {
        url = chooseUrl + "?dsp=" + eci.guid() + "&eciaction=ChooseCheck&conn=" + c + cc;
    }

    var fixconndition = $(d).attr("Condition");

    if (fixconndition) {
        url += "&" + fixconndition;
    }

    $.post(url, {}, function (r) {

        if (r.success == "N") {
            msg.error("放大镜后台发生异常:" + r.message);
            return;
        }

        var result = r.flag;

        if (NotValidate == "true") {
            if (result == "S") {
                $.choose.response(r, txtName);
            }
            else if (result == "M") {
                $.choose.open(type, txtName);
            }

            return;
        }

        if (result == "N") {
            if (NotValidate == "true") {
                $.choose.setColor(txtName);
            }
            $choose_error(txtName);
            return;
        }
        else if (result == "S") {
            $.choose.response(r, txtName);
            return;
        }
        else if (result == "M") {
            $.choose.open(type, txtName);
        }
        else if (result == "E") {
            $.msg.error(r.message);
        }
        else {
            $.msg.error(lang.M00015 + ":" + result);
        }
    }, "JSON");
}

$.choose.focus = function () {

    try {
        var event = window.event || arguments.callee.caller.arguments[0];

        var srcElement = event.srcElement;

        if (!srcElement) {
            srcElement = event.target;
        }

        fv = srcElement.value;
    }
    catch (e) {

    }
}

$.choose.validate = function (options) {

    return $.choose.validateImplement(true, options);
}

$.choose.validateImplement = function (errorBreak, options) {
    $.choose.redFieldName = "";
    options = $.extend({ validateId: "form1" }, options);

    var v = $("#form1").attr("validate");
    if (!v) return true;

    //v = "";
    //if (options.validateId != "form1") {
    //    $("#" + options.validateId).find("input[ischoose=true]").each(function () {
    //        v += ":" + this.id;
    //    })
    //}

    var a = v.split(':');
    var n = "";
    var r = "";

    for (i = 0; i < a.length; i++) {
        var id = a[i];
        var d = dom(id);

        var NotValidate = $(d).attr("NotValidate");

        if ($(d).is(":hidden")) { continue; }

        if (NotValidate == "true") { continue; }

        if (id != "" && d != null) {
            if (d.style.color == "red") {
                if (errorBreak) {
                    if (!d.disabled) {
                        $.eci.focus(id);

                        $.choose.redFieldName = getAlias(d);//给检测不通过的控制找到名称

                        return false;
                    }
                }

                n += ":" + id;

                if (!d.disabled) r = "n";
            }
        }
    }

    $("#hidValidate").val(n);

    return r == "";
}

$.choose.validateBack = function () {
    var v = $("#hidValidate").val();
    if (!v || v == "") { return; }

    var a = v.split(':');

    for (i = 0; i < a.length; i++) {
        if (a[i] != "") {
            var d = dom(a[i]);
            if (d != null && d.value.trim() != "") d.style.color = "red";
        }
    }
}

//==========复写======================

var $choose_choose = function (data, txtName) {//放大镜回填值

    if (eci.hasFunction(txtName + "_choose")) {
        eval(txtName + "_choose(data)");
    }
    else {
        var dataType = $("#" + txtName).attr("ECIType");
        choose_choose(dom(txtName), dataType, data);
    }
}

var $choose_empty = function (txtName) {//用来进行关联数据的清除

    var NameControlId = $("#" + txtName).attr("NameControlId");

    if (NameControlId) {
        dom(NameControlId).value = "";
    }

    if (eci.hasFunction(txtName + "_empty")) {
        eval(txtName + "_empty()");
    }
    else {

        var dataType = $("#" + txtName).attr("ECIType");

        choose_empty(dom(txtName), dataType);
    }
}

var $choose_error = function (txtName) { //输入的数据不正确
    if (eci.hasFunction(txtName + "_error")) {
        eval(txtName + "_error()");
    }
    else {
        var dataType = $("#" + txtName).attr("ECIType");
        choose_error(dom(txtName), dataType);
    }
}

var $choose_conn = function (txtName) { //获取条件
    try {
        var conn = {};

        var result = false;

        if (!eci.hasFunction(txtName + "_conn")) {

            var dataType = $("#" + txtName).attr("ECIType");

            result = choose_conn(dom(txtName), dataType, conn);
        }
        else {
            result = eval(txtName + "_conn(conn)");
        }

        cc = "";
        if (result) {
            for (var key in conn) {
                cc += "&" + key + "=" + encodeURIComponent(conn[key]);
            }
        }

        return result;
    }
    catch (e) { }

    return true;
}

function choose_choose(obj, type, data) {
}

function choose_empty(obj, type) {

}

function choose_error(obj, type) {

}

function choose_conn(obj, type, conn) {
    return true;
}

//====================================

window.choose = $.choose;

function selectDataM() {
    try {
        var chooseCode = $("#hidChooseCode").val().toUpperCase();
        var chooseName = $("#hidChooseName").val().toUpperCase();

        var data = {};

        if (chooseCode == chooseName) {
            chooseName = "#";
        }

        var code = eci.selectedField(chooseCode);
        var name = eci.selectedField(chooseName);

        data.code = code;
        data.name = name;

        returnValue(data);

        window.close();
    }
    catch (error) {
        alert(error.message);
    }
}

function selectData(key, tr) {

    try {
        var chooseCode = $("#hidChooseCode").val();
        var chooseName = $("#hidChooseName").val();

        var data = {};

        if (chooseCode == chooseName) {
            chooseName = "#";
        }

        $(tr).find("td[class]").each(function () {
            var field = $(this).attr("class").toLowerCase();
            var value = $(this).html() == "&nbsp;" ? "" : $(this).text().trim();

            data[field] = value;

            if (field == chooseCode) {
                data["code"] = value;
            }

            if (field == chooseName) {
                data["name"] = value;
            }
        });

        returnValue(data);

        window.close();
    }
    catch (error) {
        alert(error.message);
    }
}

function returnValue(data) {

    var txtId = $("#hidTId").val();

    if (typeof (dialogArguments) == "object") {
        var d = dialogArguments;
        d.$.choose.response(data, txtId);
    }
    else {
        window.opener.$.choose.response(data, txtId);
    }
}





//12.ECI.ChooseEx.js ===========================================
$(function () {

    $(".eci-choose-ex").each(function () {

        var id = this.id;
        var $this = $(this);
        var eciType = $this.attr("ecitype");
        var codebehind = $this.attr("codebehind") !=null && $this.attr("codebehind") == "true";
       
        var codeonly = $this.attr("codeonly") !=null && $this.attr("codeonly") == "true";
       
        $(this).autocomplete({

            source: function (request, response) {
                $.ajax({
                    async: false,
                    type: "POST",
                    url: eci.webPath + "/Action.ashx?action=EChooseEx&p=" + eciType,
                    dataType: "json",
                    data: {
                        "conn": $this.val()
                    },
                    success: function (data) {
                        if (data.json == "") {
                            $this.val("");
                            return;
                        }
                        var rs = JSON.parse(data.json);
                        response($.map(rs,
                        function (item) {
                            return {
                                label: item.CODE + "-" + item.NAME,
                                code: item.CODE,
                                name: item.NAME
                            }
                        }));
                    }
                })
            },
            autoFocus: true,
            minLength: 0,
            focus: function (event, ui) {

                return false;
            },
            close: function (event, ui) {
                var sv = $this.val();
                var code="";
                var name="";
                if (sv == "") {
                    return false;
                }
                else if ($("[data-name='" + sv + "']")[0]) {
                    name = sv;
                    code = $("[data-name='" + sv + "']").attr("data-code");
                }
                else if ($("[data-code='" + sv + "']")[0]) {
                    code = sv;
                    name = $("[data-code='" + sv + "']").attr("data-name");
                }
                else if ($("[data-label='" + sv + "']")[0]) {
                    code = $("[data-label='" + sv + "']").attr("data-code");
                    name = $("[data-label='" + sv + "']").attr("data-name");
                }
                else {
                    if ($("[data-area='" + id + "'].ui-menu-selected").length > 0) {
                       
                        var v = $("[data-area='" + id + "'].ui-menu-selected").attr("data-name")
                        name = v;
                        code = $("[data-area='" + id + "'].ui-menu-selected").attr("data-code");
                    }
                    else {
                      
                        var v = $("[data-area='" + id + "']").first().attr("data-name");
                        name = v;
                        code=$("[data-area='" + id + "']").first().attr("data-code")
                    }
                }

                if (codeonly) {
                    $this.val(code);
                }
                else {
                    $this.val(code + "|" + name);
                }

                if (codebehind) {
                    $("#" + id + "Value").val(code);
                    $this.val(name);
                }
                return false;
            },
            select: function (event, ui) {
                $this.val(ui.item.name);
                $("#" + id + "Value").val(ui.item.code);

                return false;
            }
        }).data("ui-autocomplete")._renderItem = function (ul, item) {
            return $("<li>").attr("data-area", id).attr("data-code", item.code).attr("data-name", item.name).attr("data-label", item.label).append($("<div>").text(item.label)).appendTo(ul);
        }

    })


})
//13.ECI.Form.js ===========================================

$.eciform = function () { }

$.eciform.defaults = {
    formId: "form1",
    validateId: "form1",
    closed: function () { $.eci.focus($.msg.focusId); }
};

$.eciform.data = function (options) {
    options = $.extend({}, $.eciform.defaults, options);
    var formId = options.formId;
    var $form = $("#" + formId);

    var data = $form.serializeArray();
    var serializeObj = {};

    $(data).each(function (index) {
        if (!(this.name[0] == "_")) {
            $this = $("#" + this.name);
            if ($this) {
                var dataField = $this.attr("dataField");
                if (dataField) {
                    this.name = dataField;
                }
            }

            serializeObj[this.name] = this.value;
        }
    });

    $form.find("input[type=checkbox][datafield]").each(function () {
        $this = $(this);
        var dataField = $this.attr("dataField");

        if (this.checked) {
            var value = $this.attr("truevalue");
            serializeObj[dataField] = value;
        }
        else {
            var value = $this.attr("falsevalue");
            serializeObj[dataField] = value;
        }
    });

    return serializeObj;
};

$.eciform.validate = function (options) {
    options = $.extend({}, $.eciform.defaults, options);

    var form = eci.form(options.formId);

    form.validate(options);

    if (form.notpass()) {
        msg.error(form.getErrorText(), { focusId: msg.focusId });
        return false;
    }
    return true;
}

window.eciform = $.eciform;

function EForm(formId) {
    validateId = formId;
    errorText = "";
    hasError = false;
    form = null;
}

EForm.prototype.pass = function () {
    return !hasError;
}

EForm.prototype.notpass = function () {
    return hasError;
}

EForm.prototype.focus = function (focusId) {
    if (!msg.focusId) {
        msg.focusId = focusId;
    }
}

EForm.prototype.addErrorText = function (message) {
    if (errorText.length == 0) {
        errorText = message;
    }
    hasError = true;
}

EForm.prototype.getErrorText = function () {
    return errorText;
}

EForm.prototype.validate = function (options) {
    validateId = options.validateId;
    errorText = "";
    form = this;
    msg.focusId = "";

    var $target = $("#" + validateId);

    options = $.extend({ G: '' }, options);

    $target.find("input").each(function () {
        this.pass = true;
    });

    //////不可以为空-检测
    $target.find("input[notnull=true],textarea[notnull=true],select[notnull=true]").each(function () {

        var G = $(this).attr("G");
        if (options.G != "" && options.G != G) return;
        if ($(this).is(":hidden")) { return;}

        //if (this.disabled || (this.attributes["readonly"] && this.attributes["readonly"].value == "readonly")) {  return; }

        if ($(this).val() == null || $(this).val().trim().isnull()) {
            var message = "[" + getAlias(this) + "]-" + lang.M00001;
            form.addErrorText(message);
            form.focus(this.id);
            showError(this, message);
            this.pass = false;
        }
        else {
            removeError(this);
        }

    });

    $target.find("textarea[regex],input[regex]").each(function () {
        var G = $(this).attr("G");
        if (options.G != "" && options.G != G) return;

        if (this.pass == false) return;

        if ($(this).val() == null || $(this).val().trim().isnull()) {
            removeError(this);
        }
        else {

            var regex = $(this).attr("regex");
            var value = $(this).val();

            var re = new RegExp(regex);
            if (re.test(value)) {
                removeError(this);
            }
            else {
                var message = $(this).attr("RegexMessage");
                if (!message) {
                    message = "[" + getAlias(this) + "]" + lang.M00002;
                }

                form.addErrorText(message);
                form.focus(this.id);
                showError(this, message);
            }
        }
    });

    //////检查放大镜
    if (!$.choose.validate({ validateId: options.validateId })) {
        var errorText = lang.M00003;
        if ($.choose.redFieldName) {
            errorText += " -【" + $.choose.redFieldName + "】";
        }
        form.addErrorText(errorText);
        hasError = true;
    }
}

function showError(obj, message) {
    var $this = $(obj);

    if (!$this.attr("IsDate")) {
        //$this.attr("title", message);
        var readonly = $this.attr("readonly")
        if (!readonly) {
            $this.addClass("text-invalid");
        }
    }
}

function removeError(obj) {
    var $this = $(obj);
    $this.attr("title", "");

    var readonly = $this.attr("readonly")
    if (!readonly) {
        $this.removeClass("text-invalid");
    }
}

$.fn.validate = function (options) {

    options = $.extend({}, options);

    if (this.length == 0) {
        msg.error(lang.M00013 + this.selector);
        return false;
    }
    else if (this.length > 1) {
        msg.error(lang.M00014 + this.selector);
        return false;
    }
    else {
        var id = $(this[0]).attr("id");
        options.validateId = id;
        return $.eciform.validate(options);
    }
}

$.fn.getFormData = function (options) {

    options = $.extend({}, options);

    if (this.length == 0) {
        msg.error(lang.M00013 + this.selector);
        return false;
    }
    else if (this.length > 1) {
        msg.error(lang.M00014 + this.selector);
        return false;
    }
    else {
        var id = $(this[0]).attr("id");
        options.formId = id;
        return $.eciform.data(options);
    }
}
//14.ECI.Dialog.js ===========================================
$.eci.dialog = function (title, url, option) {

    var defaults = { height: eci.height() - 100, icon: "function", width: eci.width() - 100, target: "_blank", showclose: true };

    option = $.extend(defaults, option);

    option.target = option.target + "_" + title.replaceAll(" ", "");

    option.title = title;
    option.url = url;

    if (option.id == undefined) {
        option.id = eci.guid();
    }
    option.mask = true;

    if (option.full) {
        option.height = eci.height() - 30;
        option.width = eci.width() - 30;
    }

    var onclosed = option.onclosed;

    if (!url) {
        alert(lang.M00020);
        return;
    }

    //判断Target的dialog 是否存在
    var targetframe = $(".dialog-target-" + option.target);
 
    if (option.post) {
        eci.action = url;
        eci.data = option.data;
        option.url = eci.webPath + "/App/Common/PostTransfer.html?dsp=" + eci.guid();
    }


    var width = option['width'] ? option['width'] : 600;
    var height = option['height'] ? option['height'] : 400;
 
    if (targetframe.length == 1) {
        targetframe.attr("src", option.url);
        option.id = targetframe.attr("tag");

        $this = $("#" + option.id);

        $this.find(".e-tool-toggle")[0].click();

        $.eci.openedDialog = $(this).find(".eci-dialog");

        $this.show();

        var $this = $("#" + option.id);
        $this.css("width", option.width);
        $this.css("height", option.height);
        $this.attr("eheight", option.height);
        $this.find(".eci-window-content").height($this.height() - 28);

        $.eci.middle(option.id);
    }
    else {
        option.html = "<iframe  src='" + option.url + "' border='0' frameborder='0' style='width:100%;height:100%;z-index:2000;'  class='needmask eci-dialog-frame dialog-target-" + option.target + "' tag='" + option.id + "'>";
 
        var html = '<div id="' + option.id + '" class="eci-dialog" style="z-index:1000;">';
        html += '     <div class="e-panel-header">';

        if (option.showclose) {
            html += '        <div class="e-tool e-tool-close" style="float:right;" >&nbsp;</div>';
        }
  
        html += '        <div class="e-tool e-tool-restore" style="float:right;display:none;">&nbsp;</div>';
        html += '        <div class="e-tool e-tool-toggle" style="float:right;">&nbsp;</div>';
        html += '        <span class="eci-window-header-text e-panel-header-icon" style="background:url(' + eci.webPath + '/Icon/' + option.icon + '.png) no-repeat;"></span>';
        html += '     </div>';
        html += '     <div class="eci-window-body" style="background:white;">';
        html += '         <div class="eci-window-content" ></div>';
        html += '     </div>';
        html += '  </div>';

        $(window.document.body).append(html);

        var $this = $("#" + option.id);

        $.eci.openedDialog = $(this).find(".eci-dialog");

        $this.find(".eci-window-content").html(option.html);

        $this.css("width", option.width);
        $this.css("height", option.height);
        $this.attr("eheight", option.height);
        $this.find(".eci-window-content").height($this.height() - 28);

        $.eci.middle(option.id);

        $this.find(".eci-window-header-text").html(option.title);

        $this.find(".e-tool-toggle").click(function () {

            if ($this.find(".eci-window-body").is(":hidden")) {
                $this.find(".eci-window-body").show();
                $this.css("height", $this.attr("eheight"));
            }
            else {
                $this.find(".eci-window-body").hide();
                $this.css("height", "26px");
            }
        });

        $this.find(".e-tool-close").click(function () {

            if (onclosed) {
                var value = onclosed();
                if (value == false) { return; }
            }

            $(this).closest(".eci-dialog").hide();
            $(this).closest(".eci-dialog").find("iframe").attr("src", "");

            $.msg.closemask();
        });
    }

    if (option.mask) {
        msg.mask();
    }
}
//15.ECI.Tab.js ===========================================
$(function () {
    $(".eci-tab").find(".tabs").find("li").click(function () {

        var $this = $(this);

        if ($this.hasClass("tabs-selected"))
        {
            return;
        }

        var $ecitab = $this.parents(".eci-tab");
        var id = $ecitab.attr("id");

        var fromIndex = $("#" + id + "_ActiveTabIndex").val();
        var toIndex = $this.parent().find("li").index(this);
        var toTabItem = $this.attr("tabItemId");
    

        try {

            var data = {}
            data.toTabItem = toTabItem;

            var r = true;

            try {
                r = eval(id + "_select(fromIndex,toIndex,data)");
            } catch (ex) { }

            if(r==false)
            {
                return;
            }

            var isFrame = $(this).attr("frame") == "true";

            if (isFrame) {
                //如果是frame 则考虑LazyLoad的情况
                var lazyUrl = $this.attr("lazy-url");
                $this.removeAttr("lazy-url");
                $this.attr("lazy-url-last", lazyUrl);

                if (lazyUrl) {
                    var $targetFrame = $("#" + toTabItem + "_frame");
                    var oldSrc = $targetFrame.attr("src");
 
                    $targetFrame.attr("src", lazyUrl)
                }
            }


            //if (isFrame) {
            //    //如果是frame 则考虑LazyLoad的情况
            //    var lazyUrl = $this.attr("lazy-url");

            //    if (lazyUrl) {
            //        var $targetFrame = $("#" + toTabItem + "_frame");
            //        var oldSrc = $targetFrame.attr("src");

            //        if (oldSrc == "") {
            //            $targetFrame.attr("src", $this.attr("lazy-url"))
            //        }
            //    }
            //}
 
        }
        catch (e) { }

        $(this).parent().find("li").removeClass("tabs-selected")

        $(this).addClass("tabs-selected");

        var $panels = $ecitab.find(".tabs-panels");

        $panels.find(".panel").hide();

        var $panel = $panels.find(".panel").eq(toIndex)

        $panel.show()

        $("#" + id + "_ActiveTabIndex").val(toIndex);

        var src = $this.attr("src");

        if(src)
        {
            var $iframe = $panel.find("iframe");

            var iframeSrc = $iframe.attr("src");

            if (!iframeSrc) {

                $iframe.attr("src", src);
            }
        }

        layout();

    });
});



function ETab() { }

ETab.layout = function (option) {
    alert("ETab layout");
}

EGrid.prototype.data;

ETab.prototype.showTab = function () {
    alert("showTab");
}

ETab.prototype.reloadTab = function () {
    alert("reloadTab");
}
//16.ECI.Load.js ===========================================
function layout() {
    $workarea = $(".workarea");
    var layoutHeight = eci.layoutHeight($workarea);
    $workarea.height(eci.height() - layoutHeight);
    $workarea.css("overflow-y", "auto").css("overflow-x", "auto");

    fitH();
    fitW();

    $(".eci-tab").each(function () {
        var my = $(this);
        var height = $(this).attr("height");

        if (!height) { height = 0; }

        if (height == 0) { height = $(this).parent().height() - 0; }

        $(this).css("height", height);

        $(this).find(".tabs-panels").find(".panel-body").css("height", height - 35);
    });

    try {
        if (ecigridSelector) {
            $(ecigridSelector).eGrid().layout();
            function ecigridInitEvent() {
                $(".eci-datagrid").eGrid().initEvent();
            }
            setTimeout(ecigridInitEvent, 1);
        }
    }
    catch (e) {
    }
}

function fitH() {
    $(".fitH").each(function () {
        $this = $(this);

        var layoutHeight = eci.layoutHeight($this);

        $this.height(eci.height() - layoutHeight);
    });
}

function fitW() {
    $(".fitW").each(function () {
        $this = $(this);

        var layoutWidth = eci.layoutWidth($this);

        $this.width(eci.width() - layoutWidth);
    });
}

function validateImp() {
    $.choose.validateImplement();

    return true;
}

function W3CKeyDown() {
    var items = $(".text-input,.eci-select,.eci-check,.text-area");

    items.bind("keydown", function (e) {

        var key = e.which;
        if (key == 13) {

            if (this.tagName == "TEXTAREA") { return; }

            e.preventDefault();

            var ignore = $(this).attr("IgnoreEnterToTab") == "true";
            if (ignore) return;

            var cancelTab = $(this).attr("CancelTab") == "true";
            $(this).removeAttr("CancelTab");
            if (cancelTab) {
                return;
            }

            var trace = {}

            var next = getNextFocusElement(items, this, trace);
            if (next == null || next.length == 0) { return; }

            next.focus();

            if (eci.config.focusSelectText) {
                next.select();
            }

            //console.info("NextFocus:" + next.attr("id"));
        }
        else if ((event.keyCode == 27 || event.keyCode == 13 || event.keyCode == 32) && window.isMain) {
            $.msg.close();
            $.msg.closetip(0);
        }
    });
}


function firstFocus() {
    var items = $(".text-input,.eci-select");
    var next = items.eq(0);

    var id = next.attr("id");
    var readonly = next.attr("readonly");
    var disabled = next.attr("disabled");

    var trace = {}
    trace[0] = id;

    if (readonly == "readonly" || disabled == "disabled") {
        next = getNextFocusElement(items, next[0], trace);
    }

    if (next == null || next.length == 0) { return; }

    next.focus();

    if (eci.config.focusSelectText) {
        next.select();
    }

    //console.info("FirstFocus:" + next.attr("id"));
}

function getNextFocusElement(items, obj, trace) {

    var e = window.event || arguments.callee.caller.arguments[0];

    var shift = false;

    if (e) {
        shift = e.shiftKey;
    }

    var currentIndex = items.index(obj);

    var nextIndex = 0;

    if (shift) {
        nextIndex = currentIndex - 1;

        if (nextIndex < 0) {
            nextIndex = 0;
        }
    }
    else {
        nextIndex = currentIndex + 1;

        if (nextIndex == items.length) {
            nextIndex = 0;
        }
    }

    if (trace[nextIndex] != null) {
        return null;
    }

    var next = items.eq(nextIndex);

    if (next.length == 0) {
        return null;
    }
    else {
        var id = next.attr("id");
        var readonly = next.attr("readonly");
        var disabled = next.attr("disabled");
        var ignoreEnterToTab = next.attr("ignoreEnterToTab");

        var hasDisabledClass = next.hasClass("select-disabled");

        var isHidden = next.is(":hidden");

        if (hasDisabledClass || isHidden || ignoreEnterToTab == "true") {
            disabled = "disabled";
        }

        if (trace[nextIndex]) {
            return null;
        }

        trace[nextIndex] = id;

        if (id == "msgValidateCode" || readonly == "readonly" || disabled == "disabled") {
            next = getNextFocusElement(items, next[0], trace);
        }
    }

    return next;
}


$(function () {

    if (eci.hasFunction("webInit")) {
        eval("webInit()");
    }

    if ($("#JavascriptLog").length > 0) {
        window.JavascriptLog = $("#JavascriptLog").val() == "Y";
    }

    logBegin("begin");

    var $form = $("#form1")

    firstFocus();

    $('.eci-tip-tooltip').poshytip({ alignX: 'right' });
    $('.eci-tip-manager').poshytip({ alignX: 'right' });

    ecigridSelector = $form.attr("ecigridSelector");
    menugroupSelector = $form.attr("menugroupSelector");
    comboxexSelector = $form.attr("comboxexSelector");

    if ($("hidValidate") && $("#form1").attr("validate")) {
        document.forms[0].onsubmit = validateImp;
        $.choose.validateBack();
    }

    logEnd("EMenuGroup.initUI……");

    if (menugroupSelector) { EMenuGroup.initUI(); }
    if (comboxexSelector) { EComboxEx.initUI(); }

    logEnd("submit……");
    $("form").submit(function (e) {
        $("select[disabled]").removeAttr("disabled");
        msg.loading();
        msg.top();


    });

    var tbQuery = $("#tbQuery");
    if (tbQuery) tbQuery.css("display", "");

    $(".eci-toggle-control").each(function () {
        $.eci.toggleSet(this);

    })

    if (eci.isIE8 && ecigridSelector) {
        $(ecigridSelector).hide();
    }

    logEnd("layout……");
    layout();
    logEnd("layout");

    setTimeout(layout, 100);

    if (eci.isIE8 && ecigridSelector) {
        $(ecigridSelector).show();
    }

    $(window).resize(function () {
        layout();
        setTimeout(layout, 100);
    });

    logEnd("msg……");
    $.msg.init();
    logEnd("msg init");
    //$.msg.close();
    logEnd("msg");

    function eciwindowInit() {
        $(".e-window[show=true]").each(function () {
            var id = $(this).attr("target");
            eci.window(id);
        });


        $(".e-window-header-text").each(function () {
            Xdrag($(this).parents(".e-window")[0], this);
        });
    }

    function keyDownEventBind() {
        W3CKeyDown();

        //其它标准浏览器
        $(window).keydown(function () {
            if (event.keyCode == 27) {
                msg.close();
                msg.closetip();
            }
        });

        //IE-兼容模式
        $(document).keydown(function () {
            if (event.keyCode == 27) {
                msg.close();
                msg.closetip();
            }
        });
    }

    function inputNotNull(obj) {
        var html = $(obj).html();

        var $tip = $(obj).find(".eci-tip");
        if ($tip.length > 0) {
            $tip.after("<span class='notnull'>*</span>");

            html = html.replace($tip[0].outerHTML, "");
        }
        else {
            $(obj).html("<span class='notnull'>*</span>" + html.trim());
        }

        $(obj).attr("alias", html);
    }

    function funNotnullInitDOM() {
        $("input[notnull=true]").closest("td").prev().each(function () {
            inputNotNull(this);
        });

        $("textarea[notnull=true]").closest("td").prev().each(function () {
            inputNotNull(this);
        });

        $("select[notnull=true]").closest("td").prev().each(function () {
            inputNotNull(this);
        });
    }

    logEnd("funNotnullInitDOM……")

    funNotnullInitDOM();//这个方法不能延迟操作，界面感觉迟钝

    logEnd("funNotnullInitDOM")

    function inputFocus() {
        if (!this.focusValue) {
            this.focusValue = this.value;
            if (this.value == "") {
                this.focusValue = "_^_";
            }
        }
    }

    function funInputFocusEventBind() {
        $("input[notnull=true]").focus(function () {
            inputFocus();
        });

        $("input[vtype]").focus(function () {
            inputFocus();
        });
    }

    function funInputOnBlurEventBind() {
        $(".text-input").blur(function () {
            this.pass = true;
        });
    }

    function funFloatEventBind() {

        function IsNum(s) {
            if (s != null) {
                var r, re;
                re = /\d*/i; //\d表示数字,*表示匹配多个数字
                r = s.match(re);
                return (r == s) ? true : false;
            }
            return false;
        }
 
        $("input[float=Y]").keyup(function () {
            var format = $(this).attr("format");
            if (format) {
                var config = format.split('.');

                var integerNumber = parseFloat(config[0]);
                var decimalNumber = parseFloat(config[1]);

                var currentValue = this.value.split('.');

                if (currentValue[0].length > integerNumber && integerNumber > 0) {
                    var lastvalue = $(this).attr("lastvalue");
                    $(this).val(lastvalue);
                    return;
                }

                if (currentValue.length > 1 && currentValue[1].length > decimalNumber && decimalNumber>0) {
                     
                    var txt = currentValue[0] + "." + currentValue[1].substring(0, decimalNumber);

                    $(this).val(txt);
  
                    return;
                }

                $(this).attr("lastvalue", this.value)
            }
        });
    }

    function notnullOnBlur(obj) {
        var $this = $(obj);
        if (!this.disabled) {

            if ($this.val() == null || $this.val().trim().isnull()) {
                showError(obj, "此信息为必输项!");
                obj.pass = false;
            }
            else {
                removeError(obj);
            }
        }

    }

    function funNotnullEventBind() {

        $("input[notnull=true]").blur(function () {
            notnullOnBlur(this);
        });

        $("textarea[notnull=true]").blur(function () {
            notnullOnBlur(this);
        });

        $("select[notnull=true]").blur(function () {
            notnullOnBlur(this);
        });
    }

    function funRegexEventBind() {
        $("input[regex]").blur(function () {

            if (this.pass == false) return;

            if ($(this).val() == null || $(this).val().trim().isnull()) {
                removeError(this);
                return;
            }

            var regex = $(this).attr("regex");
            var value = $(this).val();

            var re = new RegExp(regex);
            if (re.test(value)) {
                removeError(this);
            }
            else {
                var regexMessage = $(this).attr("RegexMessage");

                if (!regexMessage) {
                    regexMessage = "验证不通过";
                }

                showError(this, regexMessage);
            }
        });
    }

    function needCheckFunction(obj) {
        var G = $(obj).attr("G");
        var validateId = $(obj).attr("ValidateId");

        var options = { G: "" };

        if (G && G != "" && G != undefined) {
            options.G = G;
        }

        if (validateId && validateId != "" && validateId != undefined) {
            options.validateId = validateId;
        }

        return $.eciform.validate(options);
    }

    function funNeedCheckEventBind() {
        $("input[type=submit][needcheck=true]").click(function () {
            return needCheckFunction(this);
        });

        $("a[needcheck=true]").click(function () {
            return needCheckFunction(this);
        });
    }

    function funAutoConfirmEventBind() {
        $("input[type=submit][autoconfirm=true],a[autoconfirm=true]").click(function () {
            if ($(this).hasClass("disabled")) { return false; }
            var message = $(this).attr("confirmmessage");
            if (!message) {
                msg.error("程序异常，自动确认执行消息为空");
                return false;
            }

            var obj = this;

            msg.confirm(message, function () { postback(obj) });

            return false;
        });
    }

    function funIsClient() {
        $("input[type=submit][IsClient]").click(function () {
            return false;
        });
    }

    function funTipCellEventBind() {
        $(".grid-tip-cell").dblclick(function (event) {
            msg.alert($(this).text());
        })
    }

    function funAccessEventBind() {

        var LogCatchView = $("#LogCatchView").val();
        if (LogCatchView == "Y") {
            $(window).keyup(function (e) {

                try {
                    e = e || event;

                    if (event.altKey) {
                        if (event.keyCode == 72) {//H
                            $(".eci-tip").toggle();
                        }
                    }

                    if (event.ctrlKey && event.altKey) {

                        if (event.keyCode == 76) {//L
                            var id = $("#PageAccessId").val();
                            var url = eci.webPath + "/App/LogCatch/LogCatchView.aspx?Id=" + id;
                            eci.open(url, { full: true });
                        }
                        else if (event.keyCode == 84) {//T
                            var url = eci.webPath + "/App/Tool/Debug.aspx?action=quick";
                            eci.open(url, { width: 640, height: 280 });
                        }
                        else if (event.keyCode == 75) {//K
                            if ($("#ExecuteErrorInfo").length > 0) {
                                var executeErrorInfo = $("#ExecuteErrorInfo").val();
                                eci.textView(executeErrorInfo);
                            }
                            else {
                                msg.tip("没有错误信息");
                            }
                        }
                    }
                }
                catch (e) {

                }
            })

            $(window).click(function (e) {
                try {
                    e = e || event;
                    if (event.altKey) {

                        var id = $("#PageAccessId").val();
                        var url = eci.webPath + "/App/LogCatch/LogCatchView.aspx?Id=" + id;
                        eci.open(url, { full: true });
                    }
                }
                catch (e) {

                }
            })
        }
    }

    function timeoutExecute() {
        $.msg.drag();
        eciwindowInit();
        keyDownEventBind();
        funInputFocusEventBind();
        funInputOnBlurEventBind();
        funFloatEventBind();
        funNotnullEventBind();
        funRegexEventBind();
        funNeedCheckEventBind();
        funAutoConfirmEventBind();
        funIsClient();
        funTipCellEventBind();
        funAccessEventBind();
    }

    setTimeout(timeoutExecute, 200);

    logCompleted();
});
//17.ECI.Exp.js ===========================================
$.exp = function () { }

$.exp.open = function (txtId) {
    var $this = $("#" + txtId)
    var isCondition =$this.attr("IsCondition");

    var code = $("#" + txtId + "Value").val();

    var url = "../../AppEXP/Exp/frmExp.aspx?dsp=" + eci.guid();
 
    eci.open(url, { post: true, data: { code: code, IsCondition: isCondition, txtId: txtId } });
}

$.exp.callback = function (txtId, data) {
    $("#" + txtId).val(data.name);
    $("#" + txtId+"Value").val(data.code);
    $("#" + txtId).attr("title", data.name);
}

window.exp = $.exp;

//18.ECI.Rule.js ===========================================
 
$.rule = function () { }

$.rule.open = function (txtId) {
    var $this = $("#" + txtId);

    var ruleNo = $("#" + txtId).val();
    var url = "../../AppEXP/Rule/frmExpRuleEditor.aspx?t=" + txtId;

    var isSys = $this.attr("IsSys");

    if (ruleNo != "")
    {
        url+= "&ruleNo=" + ruleNo;
    }

    if (isSys == "true") {
        url += "&IsSys=true";
    }

    eci.open(url, {width:800});
}

$.rule.view = function (ruleNo) {

    var url = "../../AppEXP/Rule/frmExpRuleEditor.aspx?ruleNo=" + ruleNo + "&view=view";

    eci.open(url, { width: 800 });
}




$.rule.callback = function (txtId, ruleNo) {
    $("#" + txtId).val(ruleNo);
}

window.rule = $.rule;

//19.ECI.EQuery.js ===========================================
function advanceQueryExecute(obj) {
    var commandId = $(obj).attr("CommandId");
  
    $("#" + commandId)[0].click();
 
}

function showAdvanceQuery(id) {
    eci.window(id + 'Window')
    $(".queryGroup-conn:first").focus();
}

function resetAdvanceQuery(id) {
    eci.reset(id + 'Table')
    $(".queryGroup-conn:first").focus();
}

function initByField(obj, change, define) {

    var queryId = $(obj).parents(".eci-equery").attr("data-id");

    var script = "";
    var $conn = $(obj).parent().parent().find(".queryGroup-conn");
    var $queryType = $(obj).parent().parent().find(".queryGroup-queryType");

    var connId = $conn.attr("id");

    var code = $(obj).val();

    if (code == "") { return; }

    var itemDefine = define[code];
    itemDefine = strToJson(itemDefine);

    var uiType = itemDefine.UI_TYPE;
    var uiTypeConfig = itemDefine.UI_TYPE_CONFIG

    $conn.removeAttr("onkeypress");
    $conn.removeAttr("ondblclick");
    $conn.removeAttr("onblur");

    if (change) {
        choose.removeColor(connId);
        $conn.val("");
    }
    if (uiType == "CHOOSE") {
        choose.toChoose(connId);

        var chooseImg = $("#" + connId + "ChooseIcon");

        script = "return $.choose.open('" + uiTypeConfig + "', '" + connId + "')";

        chooseImg.attr("onclick", script);
        $conn.attr("ondblclick", script);

        script = "return $.choose.servercheck('" + uiTypeConfig + "', '" + connId + "')";
        $conn.attr("onblur", script);
    }
    else if (uiType == "DATE") {
        choose.toInput(connId);
        $conn.addClass("Wdate");
        script = 'WdatePicker({ dateFmt: "yyyy-MM-dd" })';

        $conn.attr("onclick", script);

        //如果是日期框，且是选择下拉框触发的改变
        if (change) {

        }
    }

    else {

        $conn.removeAttr("onclick");
        $conn.removeClass("Wdate");
        choose.toInput(connId);
    }
}

function addUserQuery(obj) {
    var controlId = $(obj).attr("data-id");
    eci.window(controlId + "Window");

    $("#" + controlId + "Name").focus();
}

function saveUserQuery(obj) {
     
    var $name = $(obj).parents("table").find(".user-query-name");
 
    var name = $name.val();
    if (name == "") {
        $name.focus();
        return false;
    }
    eci.closewindow(obj);
}

$(function () {

    $(".eci-equery").each(function () {

        var $this = $(this);
        var queryId = $this.attr("data-id");

        var define = eval(queryId + "Define");

        $this.find(".queryGroup-dataField").change(function () {
            initByField(this, true, define);
        });

        $this.find(".queryGroup-dataField").each(function () {
            initByField(this, false, define);
        });

    })



})
