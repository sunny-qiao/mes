<%@ page language="C#" autoeventwireup="true" inherits="App_File_FileUploadEdit, ECI.Web" enableviewstatemac="false" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>文件列表维护</title>
    <link href="../../Bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../Bootstrap/css/fileinput.css" rel="stylesheet" />
    <link href="../../Bootstrap/themes/explorer-fas/theme.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../../Bootstrap/css/all.css" rel="stylesheet" />

    <script src="../../Bootstrap/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../../Bootstrap/js/bootstrap.js" type="text/javascript"></script>
    <script src="../../Bootstrap/js/plugins/sortable.js" type="text/javascript"></script>
    <script src="../../Bootstrap/js/fileinput.js" type="text/javascript"></script>
    <script src="../../Bootstrap/themes/fas/theme.js" type="text/javascript"></script>
    <script src="../../Bootstrap/themes/explorer-fas/theme.js" type="text/javascript"></script>
    <script src="../../Bootstrap/js/locales/zh.js" type="text/javascript"></script>

    <script src="../../Scripts/JQuery/jquery-migrate-1.2.1.js" type="text/javascript"></script>
    <script src="../../Scripts/poshytip/jquery.poshytip.js" type="text/javascript"></script>
    <script src="../../Scripts/change.js" type="text/javascript"></script>
    <script id="loader" src="../../Scripts/loader.js?v=648" type="text/javascript"></script>
    <script id="ecijs" src="../../Scripts/ECI-4.0.1.js?v=648" type="text/javascript"></script>
    <script type="text/javascript">

</script>
    <script type="text/javascript">
        $(document).ready(function () {
            var bizNo = $("#hidBizNo").val();
            var bizType = $("#hidBizType").val();
            $("#fileinput").fileinput({
                language: 'zh', //设置语言
                theme: 'explorer-fas',
                uploadUrl:eci.webPath + "/Action.ashx?action=FileUpload",
                overwriteInitial: false,
                initialPreviewAsData: true,
                enctype: 'multipart/form-data',
                uploadExtraData: { bizNo: bizNo, bizType: bizType },
                allowedFileExtensions: null,
                showClose: false,
                allowedPreviewTypes: false,
                fileActionSettings: {
                    showZoom: false,
                    showUpload: false
                }
            }).on('filebatchuploadcomplete', function (event, data, previewId, index) {
                eci.close();
                window.parent.postback("btnSearch");
            });
        });

        $(function () {
            
            $("#fileinput").focus();

            $(window).keyup(function (e) {
                e = e || event;
                if (e.keyCode == 27) {
                    eci.close();
                }
            });

        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidBizNo" runat="server" />
        <input type="hidden" id="hidBizType" runat="server" />

        <div  style="margin:10px;">
            <div class="file-loading">
                <input id="fileinput" type="file" multiple class="file-loading" />
            </div>
        </div>
    </form>
</body>
</html>
