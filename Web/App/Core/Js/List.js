function egridClick(key, tr, gridId) {

    var PL_TABLE_NAME = $("#" + gridId + "Main").attr("PL_PAGE_CODE");
    var PL_PAGE_FROM = "";
    var PL_GUID = ""

    var requestParameter = dom("hidRequestParameter").value;
    var url = "edit.aspx?p=" + PL_TABLE_NAME + "&key=" + key + requestParameter;
    eci.open(url);
}

function search() {
    $("#uiListBtnSearch")[0].click();
}

function listDelete(button) {
    var id = button.id;
    try 
    {
        if (eci.selectRow()) {
            msg.confirm(lang.M00034, function () {
                msg.loading();
                __doPostBack(id);
            });
        }
    }
    catch (e) {
    }

    return false;
}

function listAdd(button) {
    var PL_TABLE_NAME = $("#gvDataMain").attr("PL_PAGE_CODE");
    var requestParameter = dom("hidRequestParameter").value;
    var url = "edit.aspx?p=" + PL_TABLE_NAME + requestParameter;
    eci.open(url);

    return false;
}

function saveBatchEdit(btn)
{
    var length = $(".chkBatchEdit:checked").length;

    if (length == 0)
    {
        msg.warning("请选择要修改的数据项！");
        return;
    }

    msg.confirm("确定执行批量修改操作吗?", function () {

        __doPostBack("btnOK");

    });

}

function closeBatchEdit() {
    eci.closewindow("divBatchEdit");
}

function batchEdit()
{
    if (!eci.selectRow()) {
        return;
    }

    eci.window("divBatchEdit");
}
 
$(function () {
    $("#tbQuery").css("display", "");

    $("#uiListBtnSearch").click(function () {
        msg.loading("数据获取中，请稍后……"); return true;
    });

    var len = $("#hidKeepBatchEdit").length;

    if(len==1)
    {
        batchEdit();
    }
});
