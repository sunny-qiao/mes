#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_WL : EntityBase
	{
	     public MES_BD_WL()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_WL" };
		    base.Columns = MES_BD_WL_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_WL(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_WL(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_WL(EntityBase entityBase)
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
                    ///  物料编号
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
                    ///  物料属性/自制/外购
                    /// </summary>
                    public string WLSX_CODE
                    {
                        get
                        {
                            return this.TextAccess["WLSX_CODE"];
                        }
                        set
                        {
                            this.TextAccess["WLSX_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  物料前置品类
                    /// </summary>
                    public string WLQZPL_CODE
                    {
                        get
                        {
                            return this.TextAccess["WLQZPL_CODE"];
                        }
                        set
                        {
                            this.TextAccess["WLQZPL_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  物料品类
                    /// </summary>
                    public string WLPL_CODE
                    {
                        get
                        {
                            return this.TextAccess["WLPL_CODE"];
                        }
                        set
                        {
                            this.TextAccess["WLPL_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  外购物料名
                    /// </summary>
                    public string WG_NAME
                    {
                        get
                        {
                            return this.TextAccess["WG_NAME"];
                        }
                        set
                        {
                            this.TextAccess["WG_NAME"] = value;
                        }
                    }
                    /// <summary>
                    ///  物料全名
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
                    ///  物料代码
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
                    ///  物料英文名
                    /// </summary>
                    public string EN_NAME
                    {
                        get
                        {
                            return this.TextAccess["EN_NAME"];
                        }
                        set
                        {
                            this.TextAccess["EN_NAME"] = value;
                        }
                    }
                    /// <summary>
                    ///  统计类别1
                    /// </summary>
                    public string TJLB1
                    {
                        get
                        {
                            return this.TextAccess["TJLB1"];
                        }
                        set
                        {
                            this.TextAccess["TJLB1"] = value;
                        }
                    }
                    /// <summary>
                    ///  统计类别2
                    /// </summary>
                    public string TJLB2
                    {
                        get
                        {
                            return this.TextAccess["TJLB2"];
                        }
                        set
                        {
                            this.TextAccess["TJLB2"] = value;
                        }
                    }
                    /// <summary>
                    ///  统计类别3
                    /// </summary>
                    public string TJLB3
                    {
                        get
                        {
                            return this.TextAccess["TJLB3"];
                        }
                        set
                        {
                            this.TextAccess["TJLB3"] = value;
                        }
                    }
                    /// <summary>
                    ///  统计类别4
                    /// </summary>
                    public string TJLB4
                    {
                        get
                        {
                            return this.TextAccess["TJLB4"];
                        }
                        set
                        {
                            this.TextAccess["TJLB4"] = value;
                        }
                    }
                    /// <summary>
                    ///  单重/kg
                    /// </summary>
                    public System.Nullable<double> DZ
                    {
                        get
                        {
                            return this.DoubleAccess["DZ"];
                        }
                        set
                        {
                            this.DoubleAccess["DZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  单重精度
                    /// </summary>
                    public System.Nullable<double> DZJD
                    {
                        get
                        {
                            return this.DoubleAccess["DZJD"];
                        }
                        set
                        {
                            this.DoubleAccess["DZJD"] = value;
                        }
                    }
                    /// <summary>
                    ///  长度/m
                    /// </summary>
                    public System.Nullable<double> CD
                    {
                        get
                        {
                            return this.DoubleAccess["CD"];
                        }
                        set
                        {
                            this.DoubleAccess["CD"] = value;
                        }
                    }
                    /// <summary>
                    ///  长度精度
                    /// </summary>
                    public System.Nullable<double> CDJD
                    {
                        get
                        {
                            return this.DoubleAccess["CDJD"];
                        }
                        set
                        {
                            this.DoubleAccess["CDJD"] = value;
                        }
                    }
                    /// <summary>
                    ///  面积/m^2
                    /// </summary>
                    public System.Nullable<double> MJ
                    {
                        get
                        {
                            return this.DoubleAccess["MJ"];
                        }
                        set
                        {
                            this.DoubleAccess["MJ"] = value;
                        }
                    }
                    /// <summary>
                    ///  面积精度
                    /// </summary>
                    public System.Nullable<double> MJJD
                    {
                        get
                        {
                            return this.DoubleAccess["MJJD"];
                        }
                        set
                        {
                            this.DoubleAccess["MJJD"] = value;
                        }
                    }
                    /// <summary>
                    ///  体积/m^3
                    /// </summary>
                    public System.Nullable<double> TJ
                    {
                        get
                        {
                            return this.DoubleAccess["TJ"];
                        }
                        set
                        {
                            this.DoubleAccess["TJ"] = value;
                        }
                    }
                    /// <summary>
                    ///  体积精度
                    /// </summary>
                    public System.Nullable<double> TJJD
                    {
                        get
                        {
                            return this.DoubleAccess["TJJD"];
                        }
                        set
                        {
                            this.DoubleAccess["TJJD"] = value;
                        }
                    }
                    /// <summary>
                    ///  基本计量单位
                    /// </summary>
                    public string UNIT
                    {
                        get
                        {
                            return this.TextAccess["UNIT"];
                        }
                        set
                        {
                            this.TextAccess["UNIT"] = value;
                        }
                    }
                    /// <summary>
                    ///  基本计量单位输入精度
                    /// </summary>
                    public System.Nullable<double> UNIT_JD
                    {
                        get
                        {
                            return this.DoubleAccess["UNIT_JD"];
                        }
                        set
                        {
                            this.DoubleAccess["UNIT_JD"] = value;
                        }
                    }
                    /// <summary>
                    ///  辅助计量单位1
                    /// </summary>
                    public string FZ_UNIT1
                    {
                        get
                        {
                            return this.TextAccess["FZ_UNIT1"];
                        }
                        set
                        {
                            this.TextAccess["FZ_UNIT1"] = value;
                        }
                    }
                    /// <summary>
                    ///  辅助计量单位1对基本计量单位换算率
                    /// </summary>
                    public System.Nullable<double> FZ_UNIT1_RATE
                    {
                        get
                        {
                            return this.DoubleAccess["FZ_UNIT1_RATE"];
                        }
                        set
                        {
                            this.DoubleAccess["FZ_UNIT1_RATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  辅助计量单位1输入精度
                    /// </summary>
                    public System.Nullable<double> FZ_UNIT1_JD
                    {
                        get
                        {
                            return this.DoubleAccess["FZ_UNIT1_JD"];
                        }
                        set
                        {
                            this.DoubleAccess["FZ_UNIT1_JD"] = value;
                        }
                    }
                    /// <summary>
                    ///  辅助计量单位2
                    /// </summary>
                    public string FZ_UNIT2
                    {
                        get
                        {
                            return this.TextAccess["FZ_UNIT2"];
                        }
                        set
                        {
                            this.TextAccess["FZ_UNIT2"] = value;
                        }
                    }
                    /// <summary>
                    ///  辅助计量单位2对基本计量单位换算率
                    /// </summary>
                    public System.Nullable<double> FZ_UNIT2_RATE
                    {
                        get
                        {
                            return this.DoubleAccess["FZ_UNIT2_RATE"];
                        }
                        set
                        {
                            this.DoubleAccess["FZ_UNIT2_RATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  辅助计量单位2输入精度
                    /// </summary>
                    public System.Nullable<double> FZ_UNIT2_JD
                    {
                        get
                        {
                            return this.DoubleAccess["FZ_UNIT2_JD"];
                        }
                        set
                        {
                            this.DoubleAccess["FZ_UNIT2_JD"] = value;
                        }
                    }
                    /// <summary>
                    ///  辅助计量单位3
                    /// </summary>
                    public string FZ_UNIT3
                    {
                        get
                        {
                            return this.TextAccess["FZ_UNIT3"];
                        }
                        set
                        {
                            this.TextAccess["FZ_UNIT3"] = value;
                        }
                    }
                    /// <summary>
                    ///  辅助计量单位3对基本计量单位换算率
                    /// </summary>
                    public System.Nullable<double> FZ_UNIT3_RATE
                    {
                        get
                        {
                            return this.DoubleAccess["FZ_UNIT3_RATE"];
                        }
                        set
                        {
                            this.DoubleAccess["FZ_UNIT3_RATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  辅助计量单位3输入精度
                    /// </summary>
                    public System.Nullable<double> FZ_UNIT3_JD
                    {
                        get
                        {
                            return this.DoubleAccess["FZ_UNIT3_JD"];
                        }
                        set
                        {
                            this.DoubleAccess["FZ_UNIT3_JD"] = value;
                        }
                    }
                    /// <summary>
                    ///  辅助计量单位4
                    /// </summary>
                    public string FZ_UNIT4
                    {
                        get
                        {
                            return this.TextAccess["FZ_UNIT4"];
                        }
                        set
                        {
                            this.TextAccess["FZ_UNIT4"] = value;
                        }
                    }
                    /// <summary>
                    ///  辅助计量单位4对基本计量单位换算率
                    /// </summary>
                    public System.Nullable<double> FZ_UNIT4_RATE
                    {
                        get
                        {
                            return this.DoubleAccess["FZ_UNIT4_RATE"];
                        }
                        set
                        {
                            this.DoubleAccess["FZ_UNIT4_RATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  辅助计量单位4输入精度
                    /// </summary>
                    public System.Nullable<double> FZ_UNIT4_JD
                    {
                        get
                        {
                            return this.DoubleAccess["FZ_UNIT4_JD"];
                        }
                        set
                        {
                            this.DoubleAccess["FZ_UNIT4_JD"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认入库仓库
                    /// </summary>
                    public string RK_WAREHOUSE
                    {
                        get
                        {
                            return this.TextAccess["RK_WAREHOUSE"];
                        }
                        set
                        {
                            this.TextAccess["RK_WAREHOUSE"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认生成部门/来源
                    /// </summary>
                    public string SCBM
                    {
                        get
                        {
                            return this.TextAccess["SCBM"];
                        }
                        set
                        {
                            this.TextAccess["SCBM"] = value;
                        }
                    }
                    /// <summary>
                    ///  最低库存量
                    /// </summary>
                    public System.Nullable<double> ZDKC
                    {
                        get
                        {
                            return this.DoubleAccess["ZDKC"];
                        }
                        set
                        {
                            this.DoubleAccess["ZDKC"] = value;
                        }
                    }
                    /// <summary>
                    ///  低库存量
                    /// </summary>
                    public System.Nullable<double> DKC
                    {
                        get
                        {
                            return this.DoubleAccess["DKC"];
                        }
                        set
                        {
                            this.DoubleAccess["DKC"] = value;
                        }
                    }
                    /// <summary>
                    ///  正常库存量
                    /// </summary>
                    public System.Nullable<double> ZCKC
                    {
                        get
                        {
                            return this.DoubleAccess["ZCKC"];
                        }
                        set
                        {
                            this.DoubleAccess["ZCKC"] = value;
                        }
                    }
                    /// <summary>
                    ///  最高库存量
                    /// </summary>
                    public System.Nullable<double> ZGKC
                    {
                        get
                        {
                            return this.DoubleAccess["ZGKC"];
                        }
                        set
                        {
                            this.DoubleAccess["ZGKC"] = value;
                        }
                    }
                    /// <summary>
                    ///  使用状态
                    /// </summary>
                    public string STATUS
                    {
                        get
                        {
                            return this.TextAccess["STATUS"];
                        }
                        set
                        {
                            this.TextAccess["STATUS"] = value;
                        }
                    }
                    /// <summary>
                    ///  是否为设备
                    /// </summary>
                    public string IS_SB
                    {
                        get
                        {
                            return this.TextAccess["IS_SB"];
                        }
                        set
                        {
                            this.TextAccess["IS_SB"] = value;
                        }
                    }
                    /// <summary>
                    ///  采购单价
                    /// </summary>
                    public System.Nullable<double> PRICE
                    {
                        get
                        {
                            return this.DoubleAccess["PRICE"];
                        }
                        set
                        {
                            this.DoubleAccess["PRICE"] = value;
                        }
                    }
                    /// <summary>
                    ///  单价精度
                    /// </summary>
                    public System.Nullable<double> PRICE_JD
                    {
                        get
                        {
                            return this.DoubleAccess["PRICE_JD"];
                        }
                        set
                        {
                            this.DoubleAccess["PRICE_JD"] = value;
                        }
                    }
                    /// <summary>
                    ///  平均采购单价
                    /// </summary>
                    public System.Nullable<double> PRICE_CG
                    {
                        get
                        {
                            return this.DoubleAccess["PRICE_CG"];
                        }
                        set
                        {
                            this.DoubleAccess["PRICE_CG"] = value;
                        }
                    }
                    /// <summary>
                    ///  存货科目代码
                    /// </summary>
                    public string CH_CODE
                    {
                        get
                        {
                            return this.TextAccess["CH_CODE"];
                        }
                        set
                        {
                            this.TextAccess["CH_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  销售收入科目代码
                    /// </summary>
                    public string XSSR_CODE
                    {
                        get
                        {
                            return this.TextAccess["XSSR_CODE"];
                        }
                        set
                        {
                            this.TextAccess["XSSR_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  销售成本科目代码
                    /// </summary>
                    public string SXCB_CODE
                    {
                        get
                        {
                            return this.TextAccess["SXCB_CODE"];
                        }
                        set
                        {
                            this.TextAccess["SXCB_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  成本差异科目代码
                    /// </summary>
                    public string CBCY_CODE
                    {
                        get
                        {
                            return this.TextAccess["CBCY_CODE"];
                        }
                        set
                        {
                            this.TextAccess["CBCY_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  代管物质科目
                    /// </summary>
                    public string DGWZKM
                    {
                        get
                        {
                            return this.TextAccess["DGWZKM"];
                        }
                        set
                        {
                            this.TextAccess["DGWZKM"] = value;
                        }
                    }
                    /// <summary>
                    ///  税率(%)
                    /// </summary>
                    public System.Nullable<double> RATE
                    {
                        get
                        {
                            return this.DoubleAccess["RATE"];
                        }
                        set
                        {
                            this.DoubleAccess["RATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片1
                    /// </summary>
                    public string PIC1
                    {
                        get
                        {
                            return this.TextAccess["PIC1"];
                        }
                        set
                        {
                            this.TextAccess["PIC1"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片2
                    /// </summary>
                    public string PIC2
                    {
                        get
                        {
                            return this.TextAccess["PIC2"];
                        }
                        set
                        {
                            this.TextAccess["PIC2"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片3
                    /// </summary>
                    public string PIC3
                    {
                        get
                        {
                            return this.TextAccess["PIC3"];
                        }
                        set
                        {
                            this.TextAccess["PIC3"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片4
                    /// </summary>
                    public string PIC4
                    {
                        get
                        {
                            return this.TextAccess["PIC4"];
                        }
                        set
                        {
                            this.TextAccess["PIC4"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片5
                    /// </summary>
                    public string PIC5
                    {
                        get
                        {
                            return this.TextAccess["PIC5"];
                        }
                        set
                        {
                            this.TextAccess["PIC5"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片6
                    /// </summary>
                    public string PIC6
                    {
                        get
                        {
                            return this.TextAccess["PIC6"];
                        }
                        set
                        {
                            this.TextAccess["PIC6"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片7
                    /// </summary>
                    public string PIC7
                    {
                        get
                        {
                            return this.TextAccess["PIC7"];
                        }
                        set
                        {
                            this.TextAccess["PIC7"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片8
                    /// </summary>
                    public string PIC8
                    {
                        get
                        {
                            return this.TextAccess["PIC8"];
                        }
                        set
                        {
                            this.TextAccess["PIC8"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片9
                    /// </summary>
                    public string PIC9
                    {
                        get
                        {
                            return this.TextAccess["PIC9"];
                        }
                        set
                        {
                            this.TextAccess["PIC9"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片10
                    /// </summary>
                    public string PIC10
                    {
                        get
                        {
                            return this.TextAccess["PIC10"];
                        }
                        set
                        {
                            this.TextAccess["PIC10"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片1路径
                    /// </summary>
                    public string PIC1_PATH
                    {
                        get
                        {
                            return this.TextAccess["PIC1_PATH"];
                        }
                        set
                        {
                            this.TextAccess["PIC1_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片2路径
                    /// </summary>
                    public string PIC2_PATH
                    {
                        get
                        {
                            return this.TextAccess["PIC2_PATH"];
                        }
                        set
                        {
                            this.TextAccess["PIC2_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片3路径
                    /// </summary>
                    public string PIC3_PATH
                    {
                        get
                        {
                            return this.TextAccess["PIC3_PATH"];
                        }
                        set
                        {
                            this.TextAccess["PIC3_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片4路径
                    /// </summary>
                    public string PIC4_PATH
                    {
                        get
                        {
                            return this.TextAccess["PIC4_PATH"];
                        }
                        set
                        {
                            this.TextAccess["PIC4_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片5路径
                    /// </summary>
                    public string PIC5_PATH
                    {
                        get
                        {
                            return this.TextAccess["PIC5_PATH"];
                        }
                        set
                        {
                            this.TextAccess["PIC5_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片6路径
                    /// </summary>
                    public string PIC6_PATH
                    {
                        get
                        {
                            return this.TextAccess["PIC6_PATH"];
                        }
                        set
                        {
                            this.TextAccess["PIC6_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片7路径
                    /// </summary>
                    public string PIC7_PATH
                    {
                        get
                        {
                            return this.TextAccess["PIC7_PATH"];
                        }
                        set
                        {
                            this.TextAccess["PIC7_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片8路径
                    /// </summary>
                    public string PIC8_PATH
                    {
                        get
                        {
                            return this.TextAccess["PIC8_PATH"];
                        }
                        set
                        {
                            this.TextAccess["PIC8_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片9路径
                    /// </summary>
                    public string PIC9_PATH
                    {
                        get
                        {
                            return this.TextAccess["PIC9_PATH"];
                        }
                        set
                        {
                            this.TextAccess["PIC9_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品照片10路径
                    /// </summary>
                    public string PIC10_PATH
                    {
                        get
                        {
                            return this.TextAccess["PIC10_PATH"];
                        }
                        set
                        {
                            this.TextAccess["PIC10_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品条形码
                    /// </summary>
                    public string TXM
                    {
                        get
                        {
                            return this.TextAccess["TXM"];
                        }
                        set
                        {
                            this.TextAccess["TXM"] = value;
                        }
                    }
                    /// <summary>
                    ///  附件1
                    /// </summary>
                    public string FILE1
                    {
                        get
                        {
                            return this.TextAccess["FILE1"];
                        }
                        set
                        {
                            this.TextAccess["FILE1"] = value;
                        }
                    }
                    /// <summary>
                    ///  附件1路径
                    /// </summary>
                    public string FILE1_PATH
                    {
                        get
                        {
                            return this.TextAccess["FILE1_PATH"];
                        }
                        set
                        {
                            this.TextAccess["FILE1_PATH"] = value;
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
        public MES_BD_WL SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_WL>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_WL SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_WL>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_WL> ToList()
        {
             return new EntityBuilder<MES_BD_WL>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_WL> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_WL>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_WL SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_WL SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_WL> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_WL> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_WL> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_WL>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_WL> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_WL>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_WL, MES_BD_WL_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_WL, MES_BD_WL_FIELD>();
            }
        }
		
	    public static MES_BD_WL_FIELD Fields
        {
            get { return MES_BD_WL_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_WL> EntityBuilder = new EntityBuilder<MES_BD_WL>();
    }

	internal class MES_BD_WL_COLUMN : BaseColumn
    {
        public static MES_BD_WL_COLUMN Instance;

        static MES_BD_WL_COLUMN()
        {
            Instance = new MES_BD_WL_COLUMN();
        }

        private MES_BD_WL_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "WLSX_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "WLQZPL_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "WLPL_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "WG_NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "EN_NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TJLB1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TJLB2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TJLB3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TJLB4", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DZJD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CDJD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "MJ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "MJJD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TJ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TJJD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "UNIT", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "UNIT_JD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FZ_UNIT1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FZ_UNIT1_RATE", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FZ_UNIT1_JD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FZ_UNIT2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FZ_UNIT2_RATE", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FZ_UNIT2_JD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FZ_UNIT3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FZ_UNIT3_RATE", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FZ_UNIT3_JD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FZ_UNIT4", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FZ_UNIT4_RATE", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FZ_UNIT4_JD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "RK_WAREHOUSE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCBM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZDKC", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DKC", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZCKC", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZGKC", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "STATUS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "IS_SB", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PRICE", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PRICE_JD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PRICE_CG", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CH_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XSSR_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SXCB_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CBCY_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DGWZKM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "RATE", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC4", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC5", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC6", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC7", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC8", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC9", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC10", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC1_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC2_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC3_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC4_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC5_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC6_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC7_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC8_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC9_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC10_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TXM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FILE1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FILE1_PATH", Type = "TEXT"  });
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
	
  public class  MES_BD_WL_FIELD
  {
       private static MES_BD_WL_FIELD instance;

        public static MES_BD_WL_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_WL_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string BH = "BH";
        public readonly string WLSX_CODE = "WLSX_CODE";
        public readonly string WLQZPL_CODE = "WLQZPL_CODE";
        public readonly string WLPL_CODE = "WLPL_CODE";
        public readonly string WG_NAME = "WG_NAME";
        public readonly string NAME = "NAME";
        public readonly string CODE = "CODE";
        public readonly string EN_NAME = "EN_NAME";
        public readonly string TJLB1 = "TJLB1";
        public readonly string TJLB2 = "TJLB2";
        public readonly string TJLB3 = "TJLB3";
        public readonly string TJLB4 = "TJLB4";
        public readonly string DZ = "DZ";
        public readonly string DZJD = "DZJD";
        public readonly string CD = "CD";
        public readonly string CDJD = "CDJD";
        public readonly string MJ = "MJ";
        public readonly string MJJD = "MJJD";
        public readonly string TJ = "TJ";
        public readonly string TJJD = "TJJD";
        public readonly string UNIT = "UNIT";
        public readonly string UNIT_JD = "UNIT_JD";
        public readonly string FZ_UNIT1 = "FZ_UNIT1";
        public readonly string FZ_UNIT1_RATE = "FZ_UNIT1_RATE";
        public readonly string FZ_UNIT1_JD = "FZ_UNIT1_JD";
        public readonly string FZ_UNIT2 = "FZ_UNIT2";
        public readonly string FZ_UNIT2_RATE = "FZ_UNIT2_RATE";
        public readonly string FZ_UNIT2_JD = "FZ_UNIT2_JD";
        public readonly string FZ_UNIT3 = "FZ_UNIT3";
        public readonly string FZ_UNIT3_RATE = "FZ_UNIT3_RATE";
        public readonly string FZ_UNIT3_JD = "FZ_UNIT3_JD";
        public readonly string FZ_UNIT4 = "FZ_UNIT4";
        public readonly string FZ_UNIT4_RATE = "FZ_UNIT4_RATE";
        public readonly string FZ_UNIT4_JD = "FZ_UNIT4_JD";
        public readonly string RK_WAREHOUSE = "RK_WAREHOUSE";
        public readonly string SCBM = "SCBM";
        public readonly string ZDKC = "ZDKC";
        public readonly string DKC = "DKC";
        public readonly string ZCKC = "ZCKC";
        public readonly string ZGKC = "ZGKC";
        public readonly string STATUS = "STATUS";
        public readonly string IS_SB = "IS_SB";
        public readonly string PRICE = "PRICE";
        public readonly string PRICE_JD = "PRICE_JD";
        public readonly string PRICE_CG = "PRICE_CG";
        public readonly string CH_CODE = "CH_CODE";
        public readonly string XSSR_CODE = "XSSR_CODE";
        public readonly string SXCB_CODE = "SXCB_CODE";
        public readonly string CBCY_CODE = "CBCY_CODE";
        public readonly string DGWZKM = "DGWZKM";
        public readonly string RATE = "RATE";
        public readonly string PIC1 = "PIC1";
        public readonly string PIC2 = "PIC2";
        public readonly string PIC3 = "PIC3";
        public readonly string PIC4 = "PIC4";
        public readonly string PIC5 = "PIC5";
        public readonly string PIC6 = "PIC6";
        public readonly string PIC7 = "PIC7";
        public readonly string PIC8 = "PIC8";
        public readonly string PIC9 = "PIC9";
        public readonly string PIC10 = "PIC10";
        public readonly string PIC1_PATH = "PIC1_PATH";
        public readonly string PIC2_PATH = "PIC2_PATH";
        public readonly string PIC3_PATH = "PIC3_PATH";
        public readonly string PIC4_PATH = "PIC4_PATH";
        public readonly string PIC5_PATH = "PIC5_PATH";
        public readonly string PIC6_PATH = "PIC6_PATH";
        public readonly string PIC7_PATH = "PIC7_PATH";
        public readonly string PIC8_PATH = "PIC8_PATH";
        public readonly string PIC9_PATH = "PIC9_PATH";
        public readonly string PIC10_PATH = "PIC10_PATH";
        public readonly string TXM = "TXM";
        public readonly string FILE1 = "FILE1";
        public readonly string FILE1_PATH = "FILE1_PATH";
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