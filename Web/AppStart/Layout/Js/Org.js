var first = true;

$(function () {

    if (window.error) { return; }

    var selector = "#select-org";

    $(selector).click(function (event) {

        eci.window("AppTop_divOrg", { top: -120 });

        $("#AppTop_divOrg").find(".e-tool-close").show();

        event.stopPropagation();
    });

    var selectOrg = $("#hidSelectOrg").val();

    if (selectOrg == "true") {

        var orgItem = $("#org").find(".orgItem");

        $("#AppTop_divOrg").find(".e-tool-close").hide();

        if (orgItem.length == 1) {
            $(orgItem[0]).find("a").click();
        }
        else {
            eci.window("AppTop_divOrg", { top: -120 });
        }
    }
})

//点击组织机构
function OrgSelect(obj) {

    //先隐藏所有应用
    hideAllApp();

    msg.loading();

    var orgId = $(obj).attr("data-id");
    var code = $(obj).attr("data-code");
    var name = $(obj).attr("data-name");

    $("#select-org").find("a").html("当前机构：" + name);

    window.companycode = code;
    window.companyid = orgId;

    eci.closewindow("AppTop_divOrg");

    if (container) {
        container.hide();
        container.attr("src", "");
    }
 
    eci.post("../../Data.ashx", "GetOrgAppInfo", { orgId: orgId, orgCode: code }, queryedOrgAppInfo);

}

function queryedOrgAppInfo(response)
{
    var app = response.app;

    if (response.success) {

        if (!app) {  app = ""; }

        if (app == "")
        {
            msg.close();
            msg.warning("您在[" + name + "] 没有获取到应用权限");
        }
 
        setOrgApp(name, app);

        openHome();
    }
    else {
        msg.error(response.message);
    }

}

//隐藏所有的应用
function hideAllApp() {
    $("#app").find(".appItem").hide();
}

//显示主页
function openHome() {
    var homeShowType = $("#hidHomeShowType").val();

    if (homeShowType == "2") {
        home();
    }
}

//设置机构对应的应用显示/或不显示
function setOrgApp(name, app) {
    var count = 0;
    $("#app").find(".appItem").each(function () {
        var id = $(this).find("a").attr("data-id");
        if (app.indexOf(id) >= 0) {
            $(this).show();
            count++;
        }
    });

    msg.close();

    var appGroupMode = $("#hidAppGroupMode").val();
 
    if (!first && appGroupMode!="true") {
        $("#app").show();
    }

    msg.tip("请选择您要进入的应用");

    first = false;
}