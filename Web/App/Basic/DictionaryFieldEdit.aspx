<%@ page language="C#" autoeventwireup="true" inherits="App_Basic_DictionaryFieldEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>程序元素设置</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function SaveCheck() {
            var name = document.getElementById("txtName").value;
            var mainAlias = document.getElementById("txtMainAlias").value;
            if (name == "") {
                alert("字段名不可以为空");
                return false;
            }

            if (mainAlias == "") {
                alert("显示名不可以为空");
                return false;
            }
            return true;
        }

        function Open(hidFieldKey) {
            var key = hidFieldKey;
            if (key != "") {
                var url = "../../App/Core/Edit.aspx?p=ECI_TABLE_ELEMENT&key=" + key;
                window.location.href = url;
            }
            return false;

            window.setTimeout(temp, 100);
        }

        function temp() {
        }

        function copyAction() {
            $("#hidGuid").val("");
            msg.alert("下面进入新增模式");
        }

    </script>
    <style type="text/css">
        .auto-style1 {
            line-height: 20px;
            font-size: medium;
            font-style: normal;
            font-family: 宋体;
            text-align: right;
            white-space: nowrap;
            padding-right: 4px;
        }

        .tr-title {
            background-color: #C7DDFD;
        }
    </style>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div id="root">
            <!--元素Guid-->
            <input type="hidden" id="hidGuid" runat="server" />
            <!--程序Guid-->
            <input type="hidden" id="hidTableGuid" runat="server" />


            <div id="pagetitle" class="pagetitle">程序元素设置</div>
            <div class="toolbar" id="toolbar">
                <asp:EButton ID="btnSave" runat="server" Text="保存(A)" AccessKey="a" Icon="save"
                    OnClientClick="return SaveCheck(this);" OnClick="btnSave_Click" />
                <asp:EButton ID="btnSaveAndClose" runat="server" Text="保存并关闭" AccessKey="a" Icon="saveclose"
                    OnClientClick="return SaveCheck(this);" OnClick="btnSave_Click" />
                <asp:EButton ID="btnCopy" runat="server" Text="复制" IsClient="true" OnClientClick="copyAction();" Icon="copy" />

                <asp:EButton ID="btnMyClose" runat="server" IsClient="true" Text="关闭(X)" AccessKey="x" Icon="Close"
                    OnClientClick="$.eci.close();" />

            </div>

            <div class="workarea" layout="toolbar,pagetitle">

                <table width="100%">
                    <tr>
                        <td valign="top" width="50%">
                            <table class="grid" cellspacing="0" cellpadding="0" border="1" width="98%">
                                <tr>
                                    <td class="lbl" style="width: 15%">
                                        <span class="notnull">*</span>元素代码
                                    </td>
                                    <td style="width: 85%">
                                        <asp:ETextBox ID="txtCode" DataField="CODE" runat="server" Width="96%" AutoUpper="true" ImeDisabled="true"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">
                                        <span class="notnull">*</span>显示名称
                                    </td>
                                    <td>
                                        <asp:ETextBox ID="txtMainAlias" DataField="MAIN_ALIAS" runat="server" Width="50%" ToolTip="显示名称"></asp:ETextBox>
                                        <asp:ETextBox ID="txtLangCode" DataField="LANG_CODE" runat="server" Width="45%" ToolTip="语言编码"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl" style="width: 15%">转换语句
                                    </td>
                                    <td style="width: 85%">
                                        <asp:ETextBox ID="txtShowConvert" runat="server" Width="96%" DataField="SHOW_CONVERT"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">&nbsp;</td>
                                    <td>
                                        <asp:ECheckBox ID="chkQueryShow" runat="server" Text="查询" DataField="QUERY_SHOW" TrueValue="1" FalseValue="0" />
                                        <asp:ECheckBox ID="chkGridShow" runat="server" Text="显示" DataField="GRID_SHOW" TrueValue="1" FalseValue="0" />
                                        <asp:ECheckBox ID="chkEditShow" runat="server" Text="编辑" DataField="EDIT_SHOW" TrueValue="1" FalseValue="0" />
                                        <asp:ECheckBox ID="chkBatchEdit" runat="server" Text="批量修改" DataField="BATCH_EDIT" TrueValue="1" FalseValue="0" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">顺序设置</td>
                                    <td>
                                        <asp:ETextBox ID="txtQuerySeq" runat="server" Width="31%" ToolTip="查询显示顺序"
                                            DataField="QUERY_SEQ"></asp:ETextBox><asp:ETextBox
                                                ID="txtGridSeq" runat="server"
                                                Width="31%" ToolTip="列表显示顺序" DataField="GRID_SEQ"></asp:ETextBox><asp:ETextBox
                                                    ID="txtEditSeq" runat="server" Width="30%" ToolTip="编辑显示顺序" DataField="EDIT_SEQ"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">字典类型
                                    </td>
                                    <td>
                                        <asp:EDropDownList ID="cboDictionaryType" runat="server" Width="98%" DataField="DICTIONARY_TYPE">
                                            <asp:ListItem>INPUT</asp:ListItem>
                                            <asp:ListItem>INPUT_INT</asp:ListItem>
                                            <asp:ListItem>INPUT_NUMBER</asp:ListItem>
                                            <asp:ListItem>MEMO</asp:ListItem>
                                            <asp:ListItem>DATE</asp:ListItem>
                                            <asp:ListItem>CHOOSE</asp:ListItem>
                                            <asp:ListItem>DROPDOWNLIST</asp:ListItem>
                                            <asp:ListItem>RADIONGROUP</asp:ListItem>
                                            <asp:ListItem>CHECK</asp:ListItem>
                                            <asp:ListItem>CHECKGROUP</asp:ListItem>
                                            <asp:ListItem>EMPTY</asp:ListItem>
                                            <asp:ListItem>LABEL</asp:ListItem>
                                        </asp:EDropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">字典配置</td>
                                    <td>
                                        <asp:ETextBox ID="txtDictionaryTypeConfig" ToolTip="下拉框配置 放大镜配置 多行文本框配置"
                                            runat="server" Width="96%" DataField="DICTIONARY_TYPE_CONFIG" AutoUpper="true"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">查询配置
                                    </td>
                                    <td>
                                        <asp:ETextBox ID="txtSqlAttribute" runat="server" Width="78%" DataField="SQL_ATTRIBUTE"></asp:ETextBox>
                                        <asp:EButton ID="btnQueryConfig" Icon="cog" runat="server" IsClient="true" Text="查询设置" OnClientClick="eci.window('divQueryConfig');$('#txtSQL_ATTRIBUTE_EX').focus();" />

                                    </td>
                                </tr>

                                <tr>
                                    <td class="lbl">系统字段
                                    </td>
                                    <td>
                                        <asp:EDropDownList ID="cboSystemData" runat="server" Width="98%" DataField="SYSTEM_DATA">
                                            <asp:ListItem Value=""></asp:ListItem>
                                            <asp:ListItem Value="{sysdate}">系统日期</asp:ListItem>
                                            <asp:ListItem Value="{UserId}">用户代码</asp:ListItem>
                                            <asp:ListItem Value="{UserName}">用户名称</asp:ListItem>
                                            <asp:ListItem Value="{CompanyCode}">公司代码</asp:ListItem>
                                            <asp:ListItem Value="{CompanyName}">公司名称</asp:ListItem>
                                        </asp:EDropDownList>

                                    </td>
                                </tr>

                                <tr>
                                    <td class="lbl">触发类型</td>
                                    <td>

                                        <asp:ERadioButton runat="server" ID="rbSystemDataTriggerINSERT" GroupName="G" Text="新增触发" />
                                        &nbsp;<asp:ERadioButton runat="server" ID="rbSystemDataTriggerUPDATE" GroupName="G" Text="修改触发" />
                                        &nbsp;<asp:ERadioButton runat="server" ID="rbSystemDataTriggerALL" GroupName="G" Text="全部触发" Checked="true" />


                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">
                                        <asp:ECheckBox ID="chkPrimaryKey" DataField="PRIMARY_KEY" TrueValue="1" FalseValue="0" runat="server" Text="主键" />
                                    </td>
                                    <td>流水号规则
                                        <asp:ETextBox ID="txtPrimaryCreator" DataField="PRIMARY_CREATOR" ToolTip="字段默认值" runat="server" Width="82%"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">备注
                                    </td>
                                    <td>
                                        <asp:ETextBox ID="txtMEMO" runat="server" Rows="4" Width="95%" TextMode="MultiLine" DataField="MEMO"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="padding-left: 50px;">
                                        <asp:ECheckBox ID="chkNullableKey" DataField="NULLABLE_KEY" TrueValue="1" FalseValue="0" runat="server" Text="可空" />
                                        <asp:ECheckBox ID="chkUniqueKey" DataField="UNIQUE_KEY" TrueValue="1" FalseValue="0" runat="server" Text="唯一" />
                                        <asp:ECheckBox ID="chkCopyRemoveData" DataField="COPY_REMOVE_DATA" TrueValue="1" FalseValue="0" runat="server" Text="复制时清除" />
                                        <asp:ECheckBox ID="chkNotSave" DataField="NOT_SAVE" TrueValue="Y" FalseValue="N" runat="server" Text="不保存" />
                                        <asp:ECheckBox ID="chkEditNotSave" DataField="EDIT_NOT_SAVE" TrueValue="Y" FalseValue="N" runat="server" Text="编辑不保存" />
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="padding-left: 50px;">
                                        <asp:ECheckBox ID="chkQueryAddEmpty" DataField="QUERY_ADD_EMPTY" TrueValue="1" FalseValue="0" runat="server" Text="查询增加空值" />
                                        <asp:ECheckBox ID="chkEditHideLabel" DataField="EDIT_HIDE_LABEL" TrueValue="1" FalseValue="0" runat="server" Text="编辑隐藏文本" />
                                        <asp:ECheckBox ID="chkWrap" DataField="WRAP" runat="server" Text="自动换行" TrueValue="Y" FalseValue="N" />
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="padding-left: 50px;">
                                        <asp:ECheckBox ID="chkSHOW_TIP" runat="server" Text="列表显示提示" DataField="SHOW_TIP" TrueValue="Y" FalseValue="N" />
                                        <asp:ECheckBox ID="chkHIDDEN" runat="server" Text="控件隐藏" DataField="HIDDEN" TrueValue="Y" FalseValue="N" />
                                        <asp:ECheckBox ID="chkUDF9" runat="server" Text="空值查询" />
                                        <asp:ECheckBox ID="chkUDF10" runat="server" Text="全角转半角" />
                                        <asp:ECheckBox ID="chkQueryLock" runat="server" Text="查询时只读" DataField="QUERY_LOCK" TrueValue="Y" FalseValue="N" />
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="padding-left: 50px;">&nbsp;</td>
                                </tr>

                            </table>
                        </td>
                        <td valign="top">
                            <table class="grid" cellspacing="0" cellpadding="0" border="1" width="98%">
                                <tr class="tr-title">
                                    <td class="auto-style1"><strong>物理设置</strong></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="lbl" width="33%">
                                        <span class="notnull">*</span>数据字段</td>
                                    <td>
                                        <asp:ETextBox
                                            ID="txtDbField" ToolTip="字段名" runat="server" Width="96%" DataField="DB_FIELD" AutoUpper="true" ImeDisabled="true"></asp:ETextBox>

                                    </td>
                                </tr>

                                <tr>
                                    <td class="lbl" width="33%"><span class="notnull">*</span>物理类型
                                    </td>
                                    <td>
                                        <asp:EDropDownList ID="cboPhysicalType" runat="server" Width="96%" DataField="PHYSICAL_TYPE">
                                            <asp:ListItem>VARCHAR2</asp:ListItem>
                                            <asp:ListItem>CHAR</asp:ListItem>
                                            <asp:ListItem>NUMBER</asp:ListItem>
                                            <asp:ListItem>FLOAT</asp:ListItem>
                                            <asp:ListItem>DATE</asp:ListItem>
                                            <asp:ListItem>CLOB</asp:ListItem>
                                        </asp:EDropDownList>

                                    </td>
                                </tr>

                                <tr>
                                    <td class="lbl" width="33%">字段长度</td>
                                    <td>
                                        <asp:ETextBox ID="txtFIELD_LENGTH" DataField="FIELD_LENGTH" IsNum="true" ToolTip="字段长度"
                                            runat="server" Width="96%"></asp:ETextBox>

                                    </td>
                                </tr>

                                <tr class="tr-title">
                                    <td class="auto-style1"><strong>列表设置</strong></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="lbl">对齐方式</td>
                                    <td>
                                        <asp:EDropDownList ID="cboGRID_ITEM_ALIGN" runat="server" Width="96%" DataField="GRID_ITEM_ALIGN">
                                            <asp:ListItem Value="LEFT">左对齐</asp:ListItem>
                                            <asp:ListItem Value="CENTER">居中对齐</asp:ListItem>
                                            <asp:ListItem Value="RIGHT">右对齐</asp:ListItem>
                                        </asp:EDropDownList></td>
                                </tr>
                                <tr>
                                    <td class="lbl">列表显示格式</td>
                                    <td>
                                        <asp:ETextBox ID="txtDATA_FORMAT_GRID" runat="server" Width="96%" DataField="DATA_FORMAT_GRID"></asp:ETextBox></td>
                                </tr>
                                <tr>
                                    <td class="lbl">列表宽度</td>
                                    <td>
                                        <asp:ETextBox ID="txtWidth" runat="server" Width="96%" DataField="WIDTH"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">链接地址</td>
                                    <td>
                                        <asp:ETextBox ID="txtLINK_URL" runat="server" Width="96%" DataField="LINK_URL"></asp:ETextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="lbl">导出类型</td>
                                    <td>
                                        <asp:EDropDownList ID="cboExportType" runat="server" Width="96%" DataField="EXPORT_TYPE">
                                            <asp:ListItem Value="">默认</asp:ListItem>
                                            <asp:ListItem Value="NONE">不导出</asp:ListItem>
                                            <asp:ListItem Value="TEXT">文本</asp:ListItem>
                                            <asp:ListItem Value="NUMBER">数字</asp:ListItem>
                                        </asp:EDropDownList>
                                    </td>
                                </tr>

                                <tr class="tr-title">
                                    <td class="auto-style1"><strong>编辑设置</strong></td>
                                    <td>&nbsp;</td>
                                </tr>

                                <tr>
                                    <td class="lbl">样式
                                    </td>
                                    <td>
                                        <asp:ETextBox ID="txtCss" runat="server" Width="96%" DataField="CSS"></asp:ETextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="lbl">编辑配置
                                    </td>
                                    <td>
                                        <asp:EDropDownList ID="cboEditLockMode" DataField="EDIT_LOCK_MODE" runat="server" Width="96%">
                                            <asp:ListItem Value=""></asp:ListItem>
                                            <asp:ListItem Value="LOCKFULL">完全只读</asp:ListItem>
                                            <asp:ListItem Value="LOCKADD">新增只读</asp:ListItem>
                                            <asp:ListItem Value="LOCKEDIT">编辑只读</asp:ListItem>
                                        </asp:EDropDownList>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="lbl">所占列数</td>
                                    <td>
                                        <asp:EDropDownList ID="cboColSpan" runat="server" Width="96%" ToolTip="ColSpan" DataField="COLSPAN">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                        </asp:EDropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">控件宽度
                                    </td>
                                    <td>
                                        <asp:ETextBox ID="txtControlWidth" runat="server" Width="96%" DataField="CONTROL_WIDTH"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">数据源</td>
                                    <td>
                                        <asp:ETextBox ID="txtDATA_SOURCE" runat="server" Width="96%" DataField="DATA_SOURCE"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">编辑显示格式</td>
                                    <td>
                                        <asp:ETextBox ID="txtDATA_FORMAT_EDIT" runat="server" Width="96%" DataField="DATA_FORMAT_EDIT"></asp:ETextBox></td>
                                </tr>
                                <tr>
                                    <td class="lbl">编辑默认值</td>
                                    <td>
                                        <asp:ETextBox
                                            ID="txtDefaultValue" ToolTip="字段默认值" runat="server" Width="96%" DataField="DEFAULT_VALUE"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">编辑提示</td>
                                    <td>
                                        <asp:ETextBox ID="txtEDIT_TIP" runat="server" Width="96%" DataField="EDIT_TIP"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">编辑标签链接</td>
                                    <td>
                                        <asp:ETextBox ID="txtEditLabelTip" runat="server" Width="96%" CssClass="text-input" DataField="EDIT_LABEL_TIP"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">上一个元素</td>
                                    <td>
                                        <asp:ETextBox ID="txtAfterElement" runat="server" Width="96%" DataField="AFTER_ELEMENT"></asp:ETextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="lbl">元素间备注</td>
                                    <td>
                                        <asp:ETextBox ID="txtContractText" runat="server" Width="96%" DataField="CONTRACT_TEXT"></asp:ETextBox>
                                    </td>
                                </tr>

                            </table>
                        </td>
                    </tr>
                </table>

            </div>
        </div>

        <asp:EWindow runat="server" Icon="wrench" ID="divQueryConfig" Title="查询设置" Width="600px" Height="380px" EnableBackgroundColor="true">

            <div style='padding: 10px;'>
                查询默认值：
                <asp:ETextBox
                    ID="txtDefaultValueQuery" ToolTip="字段默认值" runat="server" Width="96%" DataField="DEFAULT_VALUE_QUERY"></asp:ETextBox>

                <br />
                查询设置：<asp:ETextBox ID="txtSQL_ATTRIBUTE_EX" ToolTip="字段默认值" runat="server" Height="100" Width="96%" TextMode="MultiLine" DataField="SQL_ATTRIBUTE_EX"></asp:ETextBox>

                <br />
                <asp:EButton ID="EButton2" Icon="cancel" runat="server" Text="确定" IsClient="true" OnClientClick="eci.closewindow('divQueryConfig');" />

                <div class="description">
                    <h3>提示</h3>
                    <ul>
                        <li>1.不需要加 AND </li>
                        <li>2.EXISTS(SELECT 1 FROM ECI_BASE B WHERE B.CODE=A.CODE AND B.NAME LIKE '%#CONN#%' ) </li>
                        <li>3.#CONN#  或者 #conn# </li>
                    </ul>

                </div>

            </div>
        </asp:EWindow>

    </form>
</body>
</html>
