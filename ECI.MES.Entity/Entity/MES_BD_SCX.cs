#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_SCX : EntityBase
	{
	     public MES_BD_SCX()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_SCX" };
		    base.Columns = MES_BD_SCX_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_SCX(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_SCX(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_SCX(EntityBase entityBase)
            : this()
        {
            this.Data = entityBase.Data;
        }
 
		#region DataMember
		
                                                     /// <summary>
                    ///  
                    /// </summary>
                    public string GUID
                    {
                        get
                        {
                            return this.TextAccess["GUID"];
                        }
                        set
                        {
                            this.TextAccess["GUID"] = value;
                        }
                    }
                    /// <summary>
                    ///  生产线编号
                    /// </summary>
                    public string BH
                    {
                        get
                        {
                            return this.TextAccess["BH"];
                        }
                        set
                        {
                            this.TextAccess["BH"] = value;
                        }
                    }
                    /// <summary>
                    ///  生产线名
                    /// </summary>
                    public string NAME
                    {
                        get
                        {
                            return this.TextAccess["NAME"];
                        }
                        set
                        {
                            this.TextAccess["NAME"] = value;
                        }
                    }
                    /// <summary>
                    ///  生产线代码
                    /// </summary>
                    public string CODE
                    {
                        get
                        {
                            return this.TextAccess["CODE"];
                        }
                        set
                        {
                            this.TextAccess["CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  所属车间
                    /// </summary>
                    public string SSCJ
                    {
                        get
                        {
                            return this.TextAccess["SSCJ"];
                        }
                        set
                        {
                            this.TextAccess["SSCJ"] = value;
                        }
                    }
                    /// <summary>
                    ///  车间内生产线代码
                    /// </summary>
                    public string CJNSCX_CODE
                    {
                        get
                        {
                            return this.TextAccess["CJNSCX_CODE"];
                        }
                        set
                        {
                            this.TextAccess["CJNSCX_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  班次1名
                    /// </summary>
                    public string GX
                    {
                        get
                        {
                            return this.TextAccess["GX"];
                        }
                        set
                        {
                            this.TextAccess["GX"] = value;
                        }
                    }
                    /// <summary>
                    ///  该生产线班次1对应计件生产线名
                    /// </summary>
                    public string SCX_NAME1
                    {
                        get
                        {
                            return this.TextAccess["SCX_NAME1"];
                        }
                        set
                        {
                            this.TextAccess["SCX_NAME1"] = value;
                        }
                    }
                    /// <summary>
                    ///  班次2名
                    /// </summary>
                    public string JYSCX
                    {
                        get
                        {
                            return this.TextAccess["JYSCX"];
                        }
                        set
                        {
                            this.TextAccess["JYSCX"] = value;
                        }
                    }
                    /// <summary>
                    ///  该生产线班次2对应计件生产线名
                    /// </summary>
                    public string SCX_NAME2
                    {
                        get
                        {
                            return this.TextAccess["SCX_NAME2"];
                        }
                        set
                        {
                            this.TextAccess["SCX_NAME2"] = value;
                        }
                    }
                    /// <summary>
                    ///  班次3名
                    /// </summary>
                    public string BC_NAME3
                    {
                        get
                        {
                            return this.TextAccess["BC_NAME3"];
                        }
                        set
                        {
                            this.TextAccess["BC_NAME3"] = value;
                        }
                    }
                    /// <summary>
                    ///  该生产线班次3对应计件生产线名
                    /// </summary>
                    public string SCX_NAME3
                    {
                        get
                        {
                            return this.TextAccess["SCX_NAME3"];
                        }
                        set
                        {
                            this.TextAccess["SCX_NAME3"] = value;
                        }
                    }
                    /// <summary>
                    ///  该生产线工种1
                    /// </summary>
                    public string GZ1_CODE
                    {
                        get
                        {
                            return this.TextAccess["GZ1_CODE"];
                        }
                        set
                        {
                            this.TextAccess["GZ1_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  该生产线工种2
                    /// </summary>
                    public string GZ2_CODE
                    {
                        get
                        {
                            return this.TextAccess["GZ2_CODE"];
                        }
                        set
                        {
                            this.TextAccess["GZ2_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  该生产线工种3
                    /// </summary>
                    public string GZ3_CODE
                    {
                        get
                        {
                            return this.TextAccess["GZ3_CODE"];
                        }
                        set
                        {
                            this.TextAccess["GZ3_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  该生产线工种4
                    /// </summary>
                    public string GZ4_CODE
                    {
                        get
                        {
                            return this.TextAccess["GZ4_CODE"];
                        }
                        set
                        {
                            this.TextAccess["GZ4_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  该生产线工种5
                    /// </summary>
                    public string GZ5_CODE
                    {
                        get
                        {
                            return this.TextAccess["GZ5_CODE"];
                        }
                        set
                        {
                            this.TextAccess["GZ5_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认砂箱厚度/cm(可变)
                    /// </summary>
                    public System.Nullable<double> SXHD
                    {
                        get
                        {
                            return this.DoubleAccess["SXHD"];
                        }
                        set
                        {
                            this.DoubleAccess["SXHD"] = value;
                        }
                    }
                    /// <summary>
                    ///  砂箱高度/cm(固定)
                    /// </summary>
                    public System.Nullable<double> SXGD
                    {
                        get
                        {
                            return this.DoubleAccess["SXGD"];
                        }
                        set
                        {
                            this.DoubleAccess["SXGD"] = value;
                        }
                    }
                    /// <summary>
                    ///  砂箱宽度/cm(固定)
                    /// </summary>
                    public System.Nullable<double> SXKD
                    {
                        get
                        {
                            return this.DoubleAccess["SXKD"];
                        }
                        set
                        {
                            this.DoubleAccess["SXKD"] = value;
                        }
                    }
                    /// <summary>
                    ///  砂箱密度kg/cm^3
                    /// </summary>
                    public System.Nullable<double> SXMD
                    {
                        get
                        {
                            return this.DoubleAccess["SXMD"];
                        }
                        set
                        {
                            this.DoubleAccess["SXMD"] = value;
                        }
                    }
                    /// <summary>
                    ///  理论砂损耗百分比
                    /// </summary>
                    public System.Nullable<double> LLSSH
                    {
                        get
                        {
                            return this.DoubleAccess["LLSSH"];
                        }
                        set
                        {
                            this.DoubleAccess["LLSSH"] = value;
                        }
                    }
                    /// <summary>
                    ///  理论铁水损耗百分比
                    /// </summary>
                    public System.Nullable<double> LLTSSH
                    {
                        get
                        {
                            return this.DoubleAccess["LLTSSH"];
                        }
                        set
                        {
                            this.DoubleAccess["LLTSSH"] = value;
                        }
                    }
                    /// <summary>
                    ///  可用模具类型
                    /// </summary>
                    public string KYMJLX
                    {
                        get
                        {
                            return this.TextAccess["KYMJLX"];
                        }
                        set
                        {
                            this.TextAccess["KYMJLX"] = value;
                        }
                    }
                    /// <summary>
                    ///  优先使用模具类型1
                    /// </summary>
                    public string KYMJLX1
                    {
                        get
                        {
                            return this.TextAccess["KYMJLX1"];
                        }
                        set
                        {
                            this.TextAccess["KYMJLX1"] = value;
                        }
                    }
                    /// <summary>
                    ///  优先使用模具类型2
                    /// </summary>
                    public string KYMJLX2
                    {
                        get
                        {
                            return this.TextAccess["KYMJLX2"];
                        }
                        set
                        {
                            this.TextAccess["KYMJLX2"] = value;
                        }
                    }
                    /// <summary>
                    ///  优先使用模具类型3
                    /// </summary>
                    public string KYMJLX3
                    {
                        get
                        {
                            return this.TextAccess["KYMJLX3"];
                        }
                        set
                        {
                            this.TextAccess["KYMJLX3"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料1名
                    /// </summary>
                    public string PL1
                    {
                        get
                        {
                            return this.TextAccess["PL1"];
                        }
                        set
                        {
                            this.TextAccess["PL1"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料2名
                    /// </summary>
                    public string PL2
                    {
                        get
                        {
                            return this.TextAccess["PL2"];
                        }
                        set
                        {
                            this.TextAccess["PL2"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料3名
                    /// </summary>
                    public string PL3
                    {
                        get
                        {
                            return this.TextAccess["PL3"];
                        }
                        set
                        {
                            this.TextAccess["PL3"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料4名
                    /// </summary>
                    public string PL4
                    {
                        get
                        {
                            return this.TextAccess["PL4"];
                        }
                        set
                        {
                            this.TextAccess["PL4"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料5名
                    /// </summary>
                    public string PL5
                    {
                        get
                        {
                            return this.TextAccess["PL5"];
                        }
                        set
                        {
                            this.TextAccess["PL5"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料6名
                    /// </summary>
                    public string PL6
                    {
                        get
                        {
                            return this.TextAccess["PL6"];
                        }
                        set
                        {
                            this.TextAccess["PL6"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料7名
                    /// </summary>
                    public string PL7
                    {
                        get
                        {
                            return this.TextAccess["PL7"];
                        }
                        set
                        {
                            this.TextAccess["PL7"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料8名
                    /// </summary>
                    public string PL8
                    {
                        get
                        {
                            return this.TextAccess["PL8"];
                        }
                        set
                        {
                            this.TextAccess["PL8"] = value;
                        }
                    }
                    /// <summary>
                    ///  计算配料1用量使用参数
                    /// </summary>
                    public string PL1_PARAM
                    {
                        get
                        {
                            return this.TextAccess["PL1_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["PL1_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  计算配料2用量使用参数
                    /// </summary>
                    public string PL2_PARAM
                    {
                        get
                        {
                            return this.TextAccess["PL2_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["PL2_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  计算配料3用量使用参数
                    /// </summary>
                    public string PL3_PARAM
                    {
                        get
                        {
                            return this.TextAccess["PL3_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["PL3_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  计算配料4用量使用参数
                    /// </summary>
                    public string PL4_PARAM
                    {
                        get
                        {
                            return this.TextAccess["PL4_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["PL4_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  计算配料5用量使用参数
                    /// </summary>
                    public string PL5_PARAM
                    {
                        get
                        {
                            return this.TextAccess["PL5_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["PL5_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  计算配料6用量使用参数
                    /// </summary>
                    public string PL6_PARAM
                    {
                        get
                        {
                            return this.TextAccess["PL6_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["PL6_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  计算配料7用量使用参数
                    /// </summary>
                    public string PL7_PARAM
                    {
                        get
                        {
                            return this.TextAccess["PL7_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["PL7_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  计算配料8用量使用参数
                    /// </summary>
                    public string PL8_PARAM
                    {
                        get
                        {
                            return this.TextAccess["PL8_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["PL8_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料1对应参数比值
                    /// </summary>
                    public System.Nullable<double> PL1_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["PL1_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["PL1_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料2对应参数比值
                    /// </summary>
                    public System.Nullable<double> PL2_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["PL2_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["PL2_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料3对应参数比值
                    /// </summary>
                    public System.Nullable<double> PL3_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["PL3_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["PL3_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料4对应参数比值
                    /// </summary>
                    public System.Nullable<double> PL4_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["PL4_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["PL4_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料5对应参数比值
                    /// </summary>
                    public System.Nullable<double> PL5_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["PL5_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["PL5_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料6对应参数比值
                    /// </summary>
                    public System.Nullable<double> PL6_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["PL6_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["PL6_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料7对应参数比值
                    /// </summary>
                    public System.Nullable<double> PL7_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["PL7_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["PL7_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料8对应参数比值
                    /// </summary>
                    public System.Nullable<double> PL8_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["PL8_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["PL8_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料1默认出库仓库
                    /// </summary>
                    public string PL1_CKCK
                    {
                        get
                        {
                            return this.TextAccess["PL1_CKCK"];
                        }
                        set
                        {
                            this.TextAccess["PL1_CKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料2默认出库仓库
                    /// </summary>
                    public string PL2_CKCK
                    {
                        get
                        {
                            return this.TextAccess["PL2_CKCK"];
                        }
                        set
                        {
                            this.TextAccess["PL2_CKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料3默认出库仓库
                    /// </summary>
                    public string PL3_CKCK
                    {
                        get
                        {
                            return this.TextAccess["PL3_CKCK"];
                        }
                        set
                        {
                            this.TextAccess["PL3_CKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料4默认出库仓库
                    /// </summary>
                    public string PL4_CKCK
                    {
                        get
                        {
                            return this.TextAccess["PL4_CKCK"];
                        }
                        set
                        {
                            this.TextAccess["PL4_CKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料5默认出库仓库
                    /// </summary>
                    public string PL5_CKCK
                    {
                        get
                        {
                            return this.TextAccess["PL5_CKCK"];
                        }
                        set
                        {
                            this.TextAccess["PL5_CKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料6默认出库仓库
                    /// </summary>
                    public string PL6_CKCK
                    {
                        get
                        {
                            return this.TextAccess["PL6_CKCK"];
                        }
                        set
                        {
                            this.TextAccess["PL6_CKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料7默认出库仓库
                    /// </summary>
                    public string PL7_CKCK
                    {
                        get
                        {
                            return this.TextAccess["PL7_CKCK"];
                        }
                        set
                        {
                            this.TextAccess["PL7_CKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  配料8默认出库仓库
                    /// </summary>
                    public string PL8_CKCK
                    {
                        get
                        {
                            return this.TextAccess["PL8_CKCK"];
                        }
                        set
                        {
                            this.TextAccess["PL8_CKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品1名
                    /// </summary>
                    public string CP1
                    {
                        get
                        {
                            return this.TextAccess["CP1"];
                        }
                        set
                        {
                            this.TextAccess["CP1"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品2名
                    /// </summary>
                    public string CP2
                    {
                        get
                        {
                            return this.TextAccess["CP2"];
                        }
                        set
                        {
                            this.TextAccess["CP2"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品3名
                    /// </summary>
                    public string CP3
                    {
                        get
                        {
                            return this.TextAccess["CP3"];
                        }
                        set
                        {
                            this.TextAccess["CP3"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品4名
                    /// </summary>
                    public string CP4
                    {
                        get
                        {
                            return this.TextAccess["CP4"];
                        }
                        set
                        {
                            this.TextAccess["CP4"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品5名
                    /// </summary>
                    public string CP5
                    {
                        get
                        {
                            return this.TextAccess["CP5"];
                        }
                        set
                        {
                            this.TextAccess["CP5"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品6名
                    /// </summary>
                    public string CP6
                    {
                        get
                        {
                            return this.TextAccess["CP6"];
                        }
                        set
                        {
                            this.TextAccess["CP6"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品7名
                    /// </summary>
                    public string CP7
                    {
                        get
                        {
                            return this.TextAccess["CP7"];
                        }
                        set
                        {
                            this.TextAccess["CP7"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品8名
                    /// </summary>
                    public string CP8
                    {
                        get
                        {
                            return this.TextAccess["CP8"];
                        }
                        set
                        {
                            this.TextAccess["CP8"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品1使用参数
                    /// </summary>
                    public string CP1_PARAM
                    {
                        get
                        {
                            return this.TextAccess["CP1_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["CP1_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品2使用参数
                    /// </summary>
                    public string CP2_PARAM
                    {
                        get
                        {
                            return this.TextAccess["CP2_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["CP2_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品3使用参数
                    /// </summary>
                    public string CP3_PARAM
                    {
                        get
                        {
                            return this.TextAccess["CP3_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["CP3_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品4使用参数
                    /// </summary>
                    public string CP4_PARAM
                    {
                        get
                        {
                            return this.TextAccess["CP4_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["CP4_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品5使用参数
                    /// </summary>
                    public string CP5_PARAM
                    {
                        get
                        {
                            return this.TextAccess["CP5_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["CP5_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品6使用参数
                    /// </summary>
                    public string CP6_PARAM
                    {
                        get
                        {
                            return this.TextAccess["CP6_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["CP6_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品7使用参数
                    /// </summary>
                    public string CP7_PARAM
                    {
                        get
                        {
                            return this.TextAccess["CP7_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["CP7_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品8使用参数
                    /// </summary>
                    public string CP8_PARAM
                    {
                        get
                        {
                            return this.TextAccess["CP8_PARAM"];
                        }
                        set
                        {
                            this.TextAccess["CP8_PARAM"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品1对应参数比值
                    /// </summary>
                    public System.Nullable<double> CP1_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["CP1_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["CP1_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品2对应参数比值
                    /// </summary>
                    public System.Nullable<double> CP2_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["CP2_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["CP2_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品3对应参数比值
                    /// </summary>
                    public System.Nullable<double> CP3_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["CP3_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["CP3_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品4对应参数比值
                    /// </summary>
                    public System.Nullable<double> CP4_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["CP4_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["CP4_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品5对应参数比值
                    /// </summary>
                    public System.Nullable<double> CP5_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["CP5_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["CP5_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品6对应参数比值
                    /// </summary>
                    public System.Nullable<double> CP6_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["CP6_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["CP6_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品7对应参数比值
                    /// </summary>
                    public System.Nullable<double> CP7_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["CP7_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["CP7_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品8对应参数比值
                    /// </summary>
                    public System.Nullable<double> CP8_DYCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["CP8_DYCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["CP8_DYCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品1依配料计算公式
                    /// </summary>
                    public string CP1_JSGS
                    {
                        get
                        {
                            return this.TextAccess["CP1_JSGS"];
                        }
                        set
                        {
                            this.TextAccess["CP1_JSGS"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品2依配料计算公式
                    /// </summary>
                    public string CP2_JSGS
                    {
                        get
                        {
                            return this.TextAccess["CP2_JSGS"];
                        }
                        set
                        {
                            this.TextAccess["CP2_JSGS"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品3依配料计算公式
                    /// </summary>
                    public string CP3_JSGS
                    {
                        get
                        {
                            return this.TextAccess["CP3_JSGS"];
                        }
                        set
                        {
                            this.TextAccess["CP3_JSGS"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品4依配料计算公式
                    /// </summary>
                    public string CP4_JSGS
                    {
                        get
                        {
                            return this.TextAccess["CP4_JSGS"];
                        }
                        set
                        {
                            this.TextAccess["CP4_JSGS"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品5依配料计算公式
                    /// </summary>
                    public string CP5_JSGS
                    {
                        get
                        {
                            return this.TextAccess["CP5_JSGS"];
                        }
                        set
                        {
                            this.TextAccess["CP5_JSGS"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品6依配料计算公式
                    /// </summary>
                    public string CP6_JSGS
                    {
                        get
                        {
                            return this.TextAccess["CP6_JSGS"];
                        }
                        set
                        {
                            this.TextAccess["CP6_JSGS"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品7依配料计算公式
                    /// </summary>
                    public string CP7_JSGS
                    {
                        get
                        {
                            return this.TextAccess["CP7_JSGS"];
                        }
                        set
                        {
                            this.TextAccess["CP7_JSGS"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品8依配料计算公式
                    /// </summary>
                    public string CP8_JSGS
                    {
                        get
                        {
                            return this.TextAccess["CP8_JSGS"];
                        }
                        set
                        {
                            this.TextAccess["CP8_JSGS"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品1默认入库仓库
                    /// </summary>
                    public string CP1_RKCK
                    {
                        get
                        {
                            return this.TextAccess["CP1_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["CP1_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品2默认入库仓库
                    /// </summary>
                    public string CP2_RKCK
                    {
                        get
                        {
                            return this.TextAccess["CP2_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["CP2_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品3默认入库仓库
                    /// </summary>
                    public string CP3_RKCK
                    {
                        get
                        {
                            return this.TextAccess["CP3_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["CP3_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品4默认入库仓库
                    /// </summary>
                    public string CP4_RKCK
                    {
                        get
                        {
                            return this.TextAccess["CP4_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["CP4_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品5默认入库仓库
                    /// </summary>
                    public string CP5_RKCK
                    {
                        get
                        {
                            return this.TextAccess["CP5_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["CP5_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品6默认入库仓库
                    /// </summary>
                    public string CP6_RKCK
                    {
                        get
                        {
                            return this.TextAccess["CP6_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["CP6_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品7默认入库仓库
                    /// </summary>
                    public string CP7_RKCK
                    {
                        get
                        {
                            return this.TextAccess["CP7_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["CP7_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品8默认入库仓库
                    /// </summary>
                    public string CP8_RKCK
                    {
                        get
                        {
                            return this.TextAccess["CP8_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["CP8_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  备注
                    /// </summary>
                    public string REMARK
                    {
                        get
                        {
                            return this.TextAccess["REMARK"];
                        }
                        set
                        {
                            this.TextAccess["REMARK"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public string CREATE_USER
                    {
                        get
                        {
                            return this.TextAccess["CREATE_USER"];
                        }
                        set
                        {
                            this.TextAccess["CREATE_USER"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public string CREATE_USER_NAME
                    {
                        get
                        {
                            return this.TextAccess["CREATE_USER_NAME"];
                        }
                        set
                        {
                            this.TextAccess["CREATE_USER_NAME"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public System.Nullable<DateTime> CREATE_DATE
                    {
                        get
                        {
                            return this.DateAccess["CREATE_DATE"];
                        }
                        set
                        {
                            this.DateAccess["CREATE_DATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public string UPDATE_USER
                    {
                        get
                        {
                            return this.TextAccess["UPDATE_USER"];
                        }
                        set
                        {
                            this.TextAccess["UPDATE_USER"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public string UPDATE_USER_NAME
                    {
                        get
                        {
                            return this.TextAccess["UPDATE_USER_NAME"];
                        }
                        set
                        {
                            this.TextAccess["UPDATE_USER_NAME"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public System.Nullable<DateTime> UPDATE_DATE
                    {
                        get
                        {
                            return this.DateAccess["UPDATE_DATE"];
                        }
                        set
                        {
                            this.DateAccess["UPDATE_DATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public string COMPANY_CODE
                    {
                        get
                        {
                            return this.TextAccess["COMPANY_CODE"];
                        }
                        set
                        {
                            this.TextAccess["COMPANY_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public string COMPANY_NAME
                    {
                        get
                        {
                            return this.TextAccess["COMPANY_NAME"];
                        }
                        set
                        {
                            this.TextAccess["COMPANY_NAME"] = value;
                        }
                    }


		#endregion
	 
	    #region Query Method
        public MES_BD_SCX SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_SCX>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_SCX SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_SCX>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_SCX> ToList()
        {
             return new EntityBuilder<MES_BD_SCX>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_SCX> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_SCX>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_SCX SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_SCX SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_SCX> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_SCX> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_SCX> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_SCX>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_SCX> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_SCX>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_SCX, MES_BD_SCX_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_SCX, MES_BD_SCX_FIELD>();
            }
        }
		
	    public static MES_BD_SCX_FIELD Fields
        {
            get { return MES_BD_SCX_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_SCX> EntityBuilder = new EntityBuilder<MES_BD_SCX>();
    }

	internal class MES_BD_SCX_COLUMN : BaseColumn
    {
        public static MES_BD_SCX_COLUMN Instance;

        static MES_BD_SCX_COLUMN()
        {
            Instance = new MES_BD_SCX_COLUMN();
        }

        private MES_BD_SCX_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SSCJ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CJNSCX_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCX_NAME1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JYSCX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCX_NAME2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BC_NAME3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCX_NAME3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GZ1_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GZ2_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GZ3_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GZ4_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GZ5_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SXHD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SXGD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SXKD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SXMD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LLSSH", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LLTSSH", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "KYMJLX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "KYMJLX1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "KYMJLX2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "KYMJLX3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL4", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL5", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL6", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL7", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL8", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL1_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL2_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL3_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL4_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL5_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL6_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL7_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL8_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL1_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL2_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL3_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL4_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL5_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL6_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL7_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL8_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL1_CKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL2_CKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL3_CKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL4_CKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL5_CKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL6_CKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL7_CKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PL8_CKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP4", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP5", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP6", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP7", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP8", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP1_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP2_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP3_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP4_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP5_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP6_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP7_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP8_PARAM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP1_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP2_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP3_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP4_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP5_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP6_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP7_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP8_DYCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP1_JSGS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP2_JSGS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP3_JSGS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP4_JSGS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP5_JSGS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP6_JSGS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP7_JSGS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP8_JSGS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP1_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP2_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP3_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP4_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP5_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP6_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP7_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CP8_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "REMARK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CREATE_USER", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CREATE_USER_NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CREATE_DATE", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "UPDATE_USER", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "UPDATE_USER_NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "UPDATE_DATE", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "COMPANY_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "COMPANY_NAME", Type = "TEXT"  });

        }
    }
	
  public class  MES_BD_SCX_FIELD
  {
       private static MES_BD_SCX_FIELD instance;

        public static MES_BD_SCX_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_SCX_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string BH = "BH";
        public readonly string NAME = "NAME";
        public readonly string CODE = "CODE";
        public readonly string SSCJ = "SSCJ";
        public readonly string CJNSCX_CODE = "CJNSCX_CODE";
        public readonly string GX = "GX";
        public readonly string SCX_NAME1 = "SCX_NAME1";
        public readonly string JYSCX = "JYSCX";
        public readonly string SCX_NAME2 = "SCX_NAME2";
        public readonly string BC_NAME3 = "BC_NAME3";
        public readonly string SCX_NAME3 = "SCX_NAME3";
        public readonly string GZ1_CODE = "GZ1_CODE";
        public readonly string GZ2_CODE = "GZ2_CODE";
        public readonly string GZ3_CODE = "GZ3_CODE";
        public readonly string GZ4_CODE = "GZ4_CODE";
        public readonly string GZ5_CODE = "GZ5_CODE";
        public readonly string SXHD = "SXHD";
        public readonly string SXGD = "SXGD";
        public readonly string SXKD = "SXKD";
        public readonly string SXMD = "SXMD";
        public readonly string LLSSH = "LLSSH";
        public readonly string LLTSSH = "LLTSSH";
        public readonly string KYMJLX = "KYMJLX";
        public readonly string KYMJLX1 = "KYMJLX1";
        public readonly string KYMJLX2 = "KYMJLX2";
        public readonly string KYMJLX3 = "KYMJLX3";
        public readonly string PL1 = "PL1";
        public readonly string PL2 = "PL2";
        public readonly string PL3 = "PL3";
        public readonly string PL4 = "PL4";
        public readonly string PL5 = "PL5";
        public readonly string PL6 = "PL6";
        public readonly string PL7 = "PL7";
        public readonly string PL8 = "PL8";
        public readonly string PL1_PARAM = "PL1_PARAM";
        public readonly string PL2_PARAM = "PL2_PARAM";
        public readonly string PL3_PARAM = "PL3_PARAM";
        public readonly string PL4_PARAM = "PL4_PARAM";
        public readonly string PL5_PARAM = "PL5_PARAM";
        public readonly string PL6_PARAM = "PL6_PARAM";
        public readonly string PL7_PARAM = "PL7_PARAM";
        public readonly string PL8_PARAM = "PL8_PARAM";
        public readonly string PL1_DYCSBZ = "PL1_DYCSBZ";
        public readonly string PL2_DYCSBZ = "PL2_DYCSBZ";
        public readonly string PL3_DYCSBZ = "PL3_DYCSBZ";
        public readonly string PL4_DYCSBZ = "PL4_DYCSBZ";
        public readonly string PL5_DYCSBZ = "PL5_DYCSBZ";
        public readonly string PL6_DYCSBZ = "PL6_DYCSBZ";
        public readonly string PL7_DYCSBZ = "PL7_DYCSBZ";
        public readonly string PL8_DYCSBZ = "PL8_DYCSBZ";
        public readonly string PL1_CKCK = "PL1_CKCK";
        public readonly string PL2_CKCK = "PL2_CKCK";
        public readonly string PL3_CKCK = "PL3_CKCK";
        public readonly string PL4_CKCK = "PL4_CKCK";
        public readonly string PL5_CKCK = "PL5_CKCK";
        public readonly string PL6_CKCK = "PL6_CKCK";
        public readonly string PL7_CKCK = "PL7_CKCK";
        public readonly string PL8_CKCK = "PL8_CKCK";
        public readonly string CP1 = "CP1";
        public readonly string CP2 = "CP2";
        public readonly string CP3 = "CP3";
        public readonly string CP4 = "CP4";
        public readonly string CP5 = "CP5";
        public readonly string CP6 = "CP6";
        public readonly string CP7 = "CP7";
        public readonly string CP8 = "CP8";
        public readonly string CP1_PARAM = "CP1_PARAM";
        public readonly string CP2_PARAM = "CP2_PARAM";
        public readonly string CP3_PARAM = "CP3_PARAM";
        public readonly string CP4_PARAM = "CP4_PARAM";
        public readonly string CP5_PARAM = "CP5_PARAM";
        public readonly string CP6_PARAM = "CP6_PARAM";
        public readonly string CP7_PARAM = "CP7_PARAM";
        public readonly string CP8_PARAM = "CP8_PARAM";
        public readonly string CP1_DYCSBZ = "CP1_DYCSBZ";
        public readonly string CP2_DYCSBZ = "CP2_DYCSBZ";
        public readonly string CP3_DYCSBZ = "CP3_DYCSBZ";
        public readonly string CP4_DYCSBZ = "CP4_DYCSBZ";
        public readonly string CP5_DYCSBZ = "CP5_DYCSBZ";
        public readonly string CP6_DYCSBZ = "CP6_DYCSBZ";
        public readonly string CP7_DYCSBZ = "CP7_DYCSBZ";
        public readonly string CP8_DYCSBZ = "CP8_DYCSBZ";
        public readonly string CP1_JSGS = "CP1_JSGS";
        public readonly string CP2_JSGS = "CP2_JSGS";
        public readonly string CP3_JSGS = "CP3_JSGS";
        public readonly string CP4_JSGS = "CP4_JSGS";
        public readonly string CP5_JSGS = "CP5_JSGS";
        public readonly string CP6_JSGS = "CP6_JSGS";
        public readonly string CP7_JSGS = "CP7_JSGS";
        public readonly string CP8_JSGS = "CP8_JSGS";
        public readonly string CP1_RKCK = "CP1_RKCK";
        public readonly string CP2_RKCK = "CP2_RKCK";
        public readonly string CP3_RKCK = "CP3_RKCK";
        public readonly string CP4_RKCK = "CP4_RKCK";
        public readonly string CP5_RKCK = "CP5_RKCK";
        public readonly string CP6_RKCK = "CP6_RKCK";
        public readonly string CP7_RKCK = "CP7_RKCK";
        public readonly string CP8_RKCK = "CP8_RKCK";
        public readonly string REMARK = "REMARK";
        public readonly string CREATE_USER = "CREATE_USER";
        public readonly string CREATE_USER_NAME = "CREATE_USER_NAME";
        public readonly string CREATE_DATE = "CREATE_DATE";
        public readonly string UPDATE_USER = "UPDATE_USER";
        public readonly string UPDATE_USER_NAME = "UPDATE_USER_NAME";
        public readonly string UPDATE_DATE = "UPDATE_DATE";
        public readonly string COMPANY_CODE = "COMPANY_CODE";
        public readonly string COMPANY_NAME = "COMPANY_NAME";

   }
}