<%@ page language="C#" autoeventwireup="true" inherits="App_File_FileUpload, ECI.Web" enableviewstatemac="false" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>文件上传</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var bizNo = $("#hidBizNo").val();
            var bizType = $("#hidBizType").val();
            var url = "FileUploadEdit.aspx?bizNo=" + bizNo + "&bizType=" + bizType;
            eci.dialog("文件上传", url);
        }

        //判断IE
        function judgeIE() {
            var isIE = false;
            var browserType = eci.getBrowserType();
            if (browserType.indexOf("IE") != -1) {
                isIE = true;
            }
            return isIE;
        }

        function downloadAction(obj) {
            var guid = $(obj).data("guid");
            var isIE = judgeIE();
            var download = true;
            var url = "FileView.aspx?guid=" + guid + "&isIE=" + isIE + "&download=" + download;
            var IFrameRequest = document.createElement("iframe");

            IFrameRequest.id = "IFrameRequest";
            IFrameRequest.src = url;
            IFrameRequest.style.display = "none";
            document.body.appendChild(IFrameRequest);
        }

        function msgError() {
            msg.error("下载错误,请刷新后重试!");
        }

        $(function () {
            $(".fileName").click(function () {
                var guid = $(this).data("guid");
                var isIE = judgeIE();
                var download = false;
                eci.open("FileView.aspx?guid=" + guid + "&isIE=" + isIE + "&download=" + download);
            });
        });

        $(function () {

            $("#btnAdd").focus();

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
        <input type="hidden" runat="server" id="hidBizNo" />
        <input type="hidden" runat="server" id="hidBizType" />

        <div id="root">
            <div id="divQuery" style="width: 100%;">
                <table id="tbQuery" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>

                    </tr>
                </table>
            </div>
            <div id="toolbar">
                <asp:EButton runat="server" ID="btnAdd" Text="上传附件" Icon="Add" OnClientClick="addAction();" IsClient="true" />
                <asp:EButton runat="server" ID="btnSearch" Text="刷新" Icon="refresh" />
                <asp:EButton runat="server" ID="btnClose" Text="关闭" Icon="close" IsClient="true" OnClientClick="eci.close()" />
            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar" runat="server"
                    FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="false" EnableClickSelectRow="true"
                    Width="1000px" KeyField="GUID" HAlign="center" OnRowDataBound="gvData_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:EButton runat="server" Icon="down" ID="btnDownoad" Text="下载" IsClient="true" OnClientClick="downloadAction(this);" data-guid='<%#Eval("GUID") %>' />
                                <asp:EButton runat="server" Icon="Delete" ID="btnDelete" Text="删除" IsClient="true" OnClientClick="return deleteAction(this);" CommandArgument='<%#Eval("GUID")%>' OnClick="btnDelete_Click" />

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="BIZ_NO" HeaderText="业务单号" SortExpression="BIZ_NO" ItemStyle-Width="150"></asp:BoundField>
                        <asp:TemplateField HeaderText="文件名称" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="400">
                            <ItemTemplate>
                                <a href="javascript:;" class="fileName" data-guid='<%#Eval("GUID") %>'><%#Eval("FILE_NAME_ORI") %></a>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="SEQ" HeaderText="序号" SortExpression="SEQ" ItemStyle-Width="100"></asp:BoundField>

                        <asp:BoundField DataField="CREATE_USER" HeaderText="上传人" SortExpression="CREATE_USER" ItemStyle-Width="100"></asp:BoundField>
                        <asp:BoundField DataField="CREATE_DATE" HeaderText="上传日期" SortExpression="CREATE_DATE" ItemStyle-Width="130" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"></asp:BoundField>

                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
