<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdScxEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdScxEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>生产线维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function addAction() {

            if (eci.hasSave()) {
                var url = "frmMesBdScxEdit.aspx";

                window.location.href = url;
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">

            <asp:ETitle runat="server" ID="pagetitle" Title="生产线维护"></asp:ETitle>

            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

            </div>
            <div>
                <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">生产线编号</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtBh" DataField="BH" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">生产线名</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">生产线代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" NotNull="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">所属车间</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtSscj" DataField="SSCJ" ECIType="DEPT" Width="85%"></asp:EChoose></td>
                        <td class="lbl">对应工序</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtGx" DataField="GX" ECIType="GX" Width="85%"></asp:EChoose></td>

                        <td class="lbl">车间内生产线代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCjnscxCode" DataField="CJNSCX_CODE" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">对应检验生产线</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtJyscx" DataField="JYSCX" Width="85%"></asp:ETextBox></td>

                        <td class="lbl">默认砂箱厚度/cm(可变)</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSxhd" DataField="SXHD" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">砂箱高度/cm(固定)</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSxgd" DataField="SXGD" IsFloat="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">砂箱宽度/cm(固定)</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSxkd" DataField="SXKD" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">砂箱密度kg/cm^3</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSxmd" DataField="SXMD" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">理论砂损耗百分比</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtLlssh" DataField="LLSSH" IsFloat="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">理论铁水损耗百分比</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtLltssh" DataField="LLTSSH" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品默认入库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp1Rkck" DataField="CP1_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品默认入库前置品类名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp2Rkck" DataField="CP2_RKCK" ECIType="WLQZPL" Width="85%"></asp:EChoose></td>
                    </tr>
                    <tr>
                        <td class="lbl">原料产品默认出库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl1Ckck" DataField="PL1_CKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">
                            <asp:ELabel ID="Label1" runat="server" Text="原料产品默认出库前置品类名" ToolTip="原料产品默认出库前置品类名"></asp:ELabel></td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl2Ckck" DataField="PL2_CKCK" ECIType="WLQZPL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">备注</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtRemark" DataField="REMARK" Width="85%"></asp:ETextBox></td>

                    </tr>

                    <tr style="display:none">
                        <td class="lbl">该生产线工种5</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtGz5Code" DataField="GZ5_CODE" ECIType="GZ" Width="85%"></asp:EChoose></td>

                        <td class="lbl">该生产线班次1对应计件生产线名</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtScxName1" DataField="SCX_NAME1" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">该生产线班次2对应计件生产线名</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtScxName2" DataField="SCX_NAME2" Width="85%"></asp:ETextBox></td>

                        <td class="lbl">班次3名</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtBcName3" DataField="BC_NAME3" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">该生产线班次3对应计件生产线名</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtScxName3" DataField="SCX_NAME3" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">该生产线工种1</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtGz1Code" DataField="GZ1_CODE" ECIType="GZ" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display:none">
                        <td class="lbl">该生产线工种2</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtGz2Code" DataField="GZ2_CODE" ECIType="GZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">该生产线工种3</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtGz3Code" DataField="GZ3_CODE" ECIType="GZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">该生产线工种4</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtGz4Code" DataField="GZ4_CODE" ECIType="GZ" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">可用模具类型</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtKymjlx" DataField="KYMJLX" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">优先使用模具类型1</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtKymjlx1" DataField="KYMJLX1" ECIType="MJLX" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">优先使用模具类型2</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtKymjlx2" DataField="KYMJLX2" ECIType="MJLX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">优先使用模具类型3</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtKymjlx3" DataField="KYMJLX3" ECIType="MJLX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">配料1名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl1" DataField="PL1" ECIType="WL" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">配料2名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl2" DataField="PL2" ECIType="WL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">配料3名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl3" DataField="PL3" ECIType="WL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">配料4名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl4" DataField="PL4" ECIType="WL" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">配料5名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl5" DataField="PL5" ECIType="WL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">配料6名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl6" DataField="PL6" ECIType="WL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">配料7名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl7" DataField="PL7" ECIType="WL" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">配料8名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl8" DataField="PL8" ECIType="WL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">计算配料1用量使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl1Param" DataField="PL1_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">计算配料2用量使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl2Param" DataField="PL2_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">计算配料3用量使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl3Param" DataField="PL3_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">计算配料4用量使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl4Param" DataField="PL4_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">计算配料5用量使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl5Param" DataField="PL5_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">计算配料6用量使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl6Param" DataField="PL6_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">计算配料7用量使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl7Param" DataField="PL7_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">计算配料8用量使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl8Param" DataField="PL8_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">配料1对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPl1Dycsbz" DataField="PL1_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">配料2对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPl2Dycsbz" DataField="PL2_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">配料3对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPl3Dycsbz" DataField="PL3_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">配料4对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPl4Dycsbz" DataField="PL4_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">配料5对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPl5Dycsbz" DataField="PL5_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">配料6对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPl6Dycsbz" DataField="PL6_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">配料7对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPl7Dycsbz" DataField="PL7_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">配料8对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPl8Dycsbz" DataField="PL8_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">配料3默认出库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl3Ckck" DataField="PL3_CKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">配料4默认出库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl4Ckck" DataField="PL4_CKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">配料5默认出库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl5Ckck" DataField="PL5_CKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">配料6默认出库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl6Ckck" DataField="PL6_CKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">配料7默认出库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl7Ckck" DataField="PL7_CKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">配料8默认出库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtPl8Ckck" DataField="PL8_CKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品1名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp1" DataField="CP1" ECIType="WL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品2名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp2" DataField="CP2" ECIType="WL" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品3名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp3" DataField="CP3" ECIType="WL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品4名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp4" DataField="CP4" ECIType="WL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品5名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp5" DataField="CP5" ECIType="WL" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品6名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp6" DataField="CP6" ECIType="WL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品7名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp7" DataField="CP7" ECIType="WL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品8名</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp8" DataField="CP8" ECIType="WL" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品1使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp1Param" DataField="CP1_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品2使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp2Param" DataField="CP2_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品3使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp3Param" DataField="CP3_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品4使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp4Param" DataField="CP4_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品5使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp5Param" DataField="CP5_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品6使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp6Param" DataField="CP6_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品7使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp7Param" DataField="CP7_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品8使用参数</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp8Param" DataField="CP8_PARAM" ECIType="SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品1对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp1Dycsbz" DataField="CP1_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品2对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp2Dycsbz" DataField="CP2_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品3对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp3Dycsbz" DataField="CP3_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品4对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp4Dycsbz" DataField="CP4_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品5对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp5Dycsbz" DataField="CP5_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品6对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp6Dycsbz" DataField="CP6_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品7对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp7Dycsbz" DataField="CP7_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品8对应参数比值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp8Dycsbz" DataField="CP8_DYCSBZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品1依配料计算公式</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp1Jsgs" DataField="CP1_JSGS" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品2依配料计算公式</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp2Jsgs" DataField="CP2_JSGS" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品3依配料计算公式</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp3Jsgs" DataField="CP3_JSGS" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品4依配料计算公式</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp4Jsgs" DataField="CP4_JSGS" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品5依配料计算公式</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp5Jsgs" DataField="CP5_JSGS" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品6依配料计算公式</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp6Jsgs" DataField="CP6_JSGS" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品7依配料计算公式</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp7Jsgs" DataField="CP7_JSGS" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">产品8依配料计算公式</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCp8Jsgs" DataField="CP8_JSGS" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品3默认入库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp3Rkck" DataField="CP3_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品4默认入库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp4Rkck" DataField="CP4_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品5默认入库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp5Rkck" DataField="CP5_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品6默认入库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp6Rkck" DataField="CP6_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品7默认入库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp7Rkck" DataField="CP7_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">产品8默认入库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCp8Rkck" DataField="CP8_RKCK" ECIType="CK" Width="85%"></asp:EChoose></td>

                    </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
