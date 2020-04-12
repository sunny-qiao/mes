<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdWlEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdWlEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>物料维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function addAction() {

            if (eci.hasSave()) {
                var url = "frmMesBdWlEdit.aspx";

                window.location.href = url;
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />
        <input type="hidden" id="hidPIC1Path" runat="server" />
        <input type="hidden" id="hidPIC1" runat="server" />
        <input type="hidden" id="hidPIC2Path" runat="server" />
        <input type="hidden" id="hidPIC2" runat="server" />
        <input type="hidden" id="hidPIC3Path" runat="server" />
        <input type="hidden" id="hidPIC3" runat="server" />
        <input type="hidden" id="hidPIC4Path" runat="server" />
        <input type="hidden" id="hidPIC4" runat="server" />
        <input type="hidden" id="hidPIC5Path" runat="server" />
        <input type="hidden" id="hidPIC5" runat="server" />
        <input type="hidden" id="hidPIC6Path" runat="server" />
        <input type="hidden" id="hidPIC6" runat="server" />
        <input type="hidden" id="hidPIC7Path" runat="server" />
        <input type="hidden" id="hidPIC7" runat="server" />
        <input type="hidden" id="hidPIC8Path" runat="server" />
        <input type="hidden" id="hidPIC8" runat="server" />
        <input type="hidden" id="hidPIC9Path" runat="server" />
        <input type="hidden" id="hidPIC9" runat="server" />
        <input type="hidden" id="hidPIC10Path" runat="server" />
        <input type="hidden" id="hidPIC10" runat="server" />
        <input type="hidden" id="hidFILE1Path" runat="server" />
        <input type="hidden" id="hidFILE1" runat="server" />


        <div id="root">

            <asp:ETitle runat="server" ID="pagetitle" Title="物料维护"></asp:ETitle>

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
                        <td class="lbl">物料编号</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtBh" DataField="BH" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">物料属性</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboWlsxCode" DataField="WLSX_CODE" AddEmpty="true" ECIType="WLSX" Width="85%"></asp:ECombox></td>
                        <td class="lbl">物料前置品类</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtWlqzplCode" DataField="WLQZPL_CODE" ECIType="WLQZPL" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr>
                        <td class="lbl">物料品类</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtWlplCode" DataField="WLPL_CODE" ECIType="WLPL" Width="85%"></asp:EChoose></td>
                        <td class="lbl">外购物料名</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtWgName" DataField="WG_NAME" NotNull="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">物料全名</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" NotNull="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">物料代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">物料英文名</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtEnName" DataField="EN_NAME" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">统计类别1</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtTjlb1" DataField="TJLB1" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">统计类别2</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtTjlb2" DataField="TJLB2" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">统计类别3</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtTjlb3" DataField="TJLB3" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">统计类别4</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtTjlb4" DataField="TJLB4" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">单重/kg</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtDz" DataField="DZ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">单重精度</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtDzjd" DataField="DZJD" IsNum="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">长度/m</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCd" DataField="CD" IsFloat="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">长度精度</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCdjd" DataField="CDJD" IsNum="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">面积/m^2</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtMj" DataField="MJ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">面积精度</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtMjjd" DataField="MJJD" IsNum="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">体积/m^3</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtTj" DataField="TJ" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">体积精度</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtTjjd" DataField="TJJD" IsNum="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">基本计量单位</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtUnit" DataField="UNIT" ECIType="UNIT" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr>
                        <td class="lbl">基本计量单位输入精度</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUnitJd" DataField="UNIT_JD" IsNum="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">默认入库仓库</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtRkWarehouse" DataField="RK_WAREHOUSE" ECIType="CK" Width="85%"></asp:EChoose></td>
                        <td class="lbl">默认生成部门/来源</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtScbm" DataField="SCBM" ECIType="DEPT" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr>
                        <td class="lbl">最低库存量</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtZdkc" DataField="ZDKC" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">低库存量</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtDkc" DataField="DKC" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">正常库存量</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtZckc" DataField="ZCKC" IsFloat="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">最高库存量</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtZgkc" DataField="ZGKC" IsFloat="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">使用状态</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboStatus" DataField="STATUS" AddEmpty="true" ECIType="USE_STATUS" Width="85%"></asp:ECombox></td>
                        <td class="lbl">是否为设备</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboIsSb" DataField="IS_SB" AddEmpty="true" ECIType="ISUSE" Width="85%"></asp:ECombox></td>

                    </tr>
                    <tr>
                        <td class="lbl">采购单价</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPrice" DataField="PRICE" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">单价精度</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPriceJd" DataField="PRICE_JD" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">平均采购单价</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPriceCg" DataField="PRICE_CG" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">存货科目代码</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtChCode" DataField="CH_CODE" ECIType="KM" Width="85%"></asp:EChoose></td>
                        <td class="lbl">销售收入科目代码</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtXssrCode" DataField="XSSR_CODE" ECIType="KM" Width="85%"></asp:EChoose></td>
                        <td class="lbl">销售成本科目代码</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtSxcbCode" DataField="SXCB_CODE" ECIType="KM" Width="85%"></asp:EChoose></td>

                    </tr>
                    <tr>
                        <td class="lbl">成本差异科目代码</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtCbcyCode" DataField="CBCY_CODE" ECIType="KM" Width="85%"></asp:EChoose></td>
                        <td class="lbl">代管物质科目</td>
                        <td>
                            <asp:EChoose runat="server" ID="txtDgwzkm" DataField="DGWZKM" ECIType="KM" Width="85%"></asp:EChoose></td>
                        <td class="lbl">税率(%)</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtRate" DataField="RATE" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">物料缩略图</td>
                        <td>
                            <asp:FileUpload ID="txtFileUpload" runat="server" DataField="PIC1" Width="85%" /></td>
                        <td class="lbl">物料条形码</td>
                        <td>
                            <asp:FileUpload ID="txtFileUpload2" runat="server" DataField="PIC2" Width="85%" /></td>
                        <td class="lbl">物料二维码</td>
                        <td>
                            <asp:FileUpload ID="txtFileUpload3" runat="server" DataField="PIC3" Width="85%" /></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品照片4</td>
                        <td>
                            <asp:FileUpload ID="txtFileUpload4" runat="server" DataField="PIC4" Width="85%" /></td>
                        <td class="lbl">产品照片5</td>
                        <td>
                            <asp:FileUpload ID="txtFileUpload5" runat="server" DataField="PIC5" Width="85%" /></td>
                        <td class="lbl">产品照片6</td>
                        <td>
                            <asp:FileUpload ID="txtFileUpload6" runat="server" DataField="PIC6" Width="85%" /></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品照片7</td>
                        <td>
                            <asp:FileUpload ID="txtFileUpload7" runat="server" DataField="PIC7" Width="85%" /></td>
                        <td class="lbl">产品照片8</td>
                        <td>
                            <asp:FileUpload ID="txtFileUpload8" runat="server" DataField="PIC8" Width="85%" /></td>
                        <td class="lbl">产品照片9</td>
                        <td>
                            <asp:FileUpload ID="txtFileUpload9" runat="server" DataField="PIC9" Width="85%" /></td>

                    </tr>
                    <tr style="display: none">
                        <td class="lbl">产品照片10</td>
                        <td>
                            <asp:FileUpload ID="txtFileUpload10" runat="server" DataField="PIC10" Width="85%" /></td>
                        <td class="lbl">产品条形码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtTxm" DataField="TXM" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">附件1</td>
                        <td>
                            <asp:FileUpload ID="txtFileUpload11" runat="server" DataField="FILE1" Width="85%" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
