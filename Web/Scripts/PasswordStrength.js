function passwordStrength(url) {
    if (url == "") {
        window.alert("密码强度太弱,要求重置密码,重置密码页面配置不正确");
    }
    else {

        var t, l;
        var h = 480;
        var w = 640;
        t = (window.screen.availHeight - h) / 2;
        l = (window.screen.availWidth - w) / 2;

        var f = "height=" + h + ", width=" + w + ", top=" + t + " , left=" + l + ",location=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes, status=no";

        window.open(url, "_blank", f);
    }
}