<%@ page language="C#" autoeventwireup="true" inherits="App_System_Dev, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <style type="text/css">
        a {
            text-decoration: none;
            color: #808080;
        }

            a:hover {
                color: red;
            }


        li {
            background: url('../../Icon/cog.png') no-repeat;
            line-height: 28px;
            height: 25px;
            padding-left: 20px;
            background-position: center left;
        }

        ul {
            width: 200px;
        }

        li:hover {
            background: url('../../Icon/cog_start.png') no-repeat;
            line-height: 28px;
            height: 25px;
            padding-left: 20px;
            background-position: center left;
        }
    </style>

    <script type="text/javascript">
        $(function () {

            $(".function").find("li a").click(function () {
                var id = $(this).text();
                var name = $(this).text();
                var url = $(this).attr("data-url");

                window.parent.mainOpenTab(id, name, url);

            });
        });
    </script>
</head>
<body style="overflow-y: hidden;">
    <form id="form1" runat="server">
        <div id="root">
            <div class="workarea">

                <div style="float: left; width: 50%">
                    <asp:EPanel runat="Server" Title="开发平台" Icon="wrench" EnableToggle="true" EnableBackgroundColor="false">
                        <div style="margin: 5px 20px;">


                            <ul class="function" runat="server">
                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/DataHelp/EciDataHelpList.aspx">选择配置</a></li>
                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/DataCache/EciDataCacheList.aspx">数据缓存</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/Basic/Dictionary.aspx">程序设计</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/BasicEdit/Dictionary.aspx">程序设计-企业配置</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/BasicEdit/Dictionary.aspx?queryType=company">程序设计-企业</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/BasicEdit/Dictionary.aspx?queryType=group">程序设计-集团</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/Basic/Sql2Page.aspx">快速开发</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/DIC/DicHeadList.aspx">数据字典</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/Config/EciConfigList.aspx">应用参数</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/Report/ReportList.aspx">报表开发</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/System/EciFeedBackList.aspx">用户反馈</a></li>




                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/Basic/EciDataGroupList.aspx">公共参数</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/Basic/EciDataCodeList.aspx?catelog=TEST">公共参数-TEST</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/Basic/BaseDataList.aspx">基础数据</a></li>



                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/System/EciNoticeList.aspx?type=SYS">系统通知</a></li>


                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/Calendar/Calendar.aspx">日历控件</a></li>


                            </ul>
                        </div>

                    </asp:EPanel>
                </div>

                <div style="float: left; width: 50%">
                    <asp:EPanel runat="Server" Title="辅助工具" Icon="user" EnableToggle="true" EnableBackgroundColor="false">

                        <div style="margin: 5px 20px;">

                            <ul class="function" runat="server">


                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/System/MergerJs.aspx">脚本合并</a></li>
                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/System/RSA.aspx">内容加密</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/System/SourceLine.aspx">代码统计</a></li>
                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/System/Query.aspx">数据查询</a></li>


                            </ul>
                        </div>

                    </asp:EPanel>

                </div>

                <div style="float: left; width: 50%">
                    <asp:EPanel runat="Server" Title="系统版本配置" Icon="user" EnableToggle="true" EnableBackgroundColor="false">

                        <div style="margin: 5px 20px;">

                            <ul class="function" runat="server">

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/Param/EciParamGroupTree.aspx">版本配置管理</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/Param/EciParamTree.aspx">版本配置维护</a></li>
                                <li style="display: none;">
                                    <a href="javascript:void(0);" data-url="../../App/Param/EciParamTree.aspx?SysCode=WMS&InstanceId=WMS-002">系统实例配置</a></li>


                            </ul>
                        </div>

                    </asp:EPanel>


                    <asp:EPanel runat="Server" Title="企业参数配置" Icon="user" EnableToggle="true" EnableBackgroundColor="false">

                        <div style="margin: 5px 20px;">

                            <ul class="function" runat="server">

                                <li>
                                    <a data-url="../../App/ComParam/EciParamGroupTree.aspx" href="javascript:void(0);">企业配置管理</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/ComParam/EciParamTree.aspx">企业配置维护</a></li>
                                <li style="display: none;">
                                    <a href="javascript:void(0);" data-url="../../App/ComParam/EciParamTree.aspx?SysCode=WMS&InstanceId=WMS-002">系统实例配置</a></li>
                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/ComParam/EciParamTree.aspx?groupCode=CUSTOM&InstanceId=2369">关区实例配置</a></li>


                            </ul>
                        </div>

                    </asp:EPanel>


                    <asp:EPanel runat="Server" Title="文件上传" Icon="user" EnableToggle="true" EnableBackgroundColor="false">

                        <div style="margin: 5px 20px;">

                            <ul class="function" runat="server">

                                <li>
                                    <a data-url="../../App/File/BizInfoList.aspx" href="javascript:void(0);">文件上传</a></li>

                                <li>
                                    <a href="javascript:void(0);" data-url="../../App/File/FileTypeList.aspx">上传类型</a></li>

                            </ul>
                        </div>

                    </asp:EPanel>

                    <asp:EPanel runat="Server" Title="业务操作跟踪" Icon="user" EnableToggle="true" EnableBackgroundColor="false">

                        <div style="margin: 5px 20px;">

                            <ul class="function" runat="server">

                                <li>
                                    <a data-url="../../App/System/OperHisList.aspx?bizNo=0001" href="javascript:void(0);">操作历史</a></li>


                            </ul>
                        </div>

                    </asp:EPanel>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
