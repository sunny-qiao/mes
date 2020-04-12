#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_JYGD : EntityBase
	{
	     public MES_BD_JYGD()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_JYGD" };
		    base.Columns = MES_BD_JYGD_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_JYGD(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_JYGD(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_JYGD(EntityBase entityBase)
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
                    ///  检验工段编号
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
                    ///  检验工段名
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
                    ///  默认上级车间
                    /// </summary>
                    public string SJCJ
                    {
                        get
                        {
                            return this.TextAccess["SJCJ"];
                        }
                        set
                        {
                            this.TextAccess["SJCJ"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认出库仓库
                    /// </summary>
                    public string CKCK
                    {
                        get
                        {
                            return this.TextAccess["CKCK"];
                        }
                        set
                        {
                            this.TextAccess["CKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认成品入库仓库
                    /// </summary>
                    public string RKCK
                    {
                        get
                        {
                            return this.TextAccess["RKCK"];
                        }
                        set
                        {
                            this.TextAccess["RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品1
                    /// </summary>
                    public string FP1
                    {
                        get
                        {
                            return this.TextAccess["FP1"];
                        }
                        set
                        {
                            this.TextAccess["FP1"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品1入库仓库
                    /// </summary>
                    public string FP1_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP1_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP1_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品1处理结果
                    /// </summary>
                    public string FP1_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP1_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP1_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品1处理结果入库仓库
                    /// </summary>
                    public string FP1_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP1_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP1_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品2
                    /// </summary>
                    public string FP2
                    {
                        get
                        {
                            return this.TextAccess["FP2"];
                        }
                        set
                        {
                            this.TextAccess["FP2"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品2入库仓库
                    /// </summary>
                    public string FP2_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP2_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP2_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品2处理结果
                    /// </summary>
                    public string FP2_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP2_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP2_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品2处理结果入库仓库
                    /// </summary>
                    public string FP2_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP2_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP2_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品3
                    /// </summary>
                    public string FP3
                    {
                        get
                        {
                            return this.TextAccess["FP3"];
                        }
                        set
                        {
                            this.TextAccess["FP3"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品3入库仓库
                    /// </summary>
                    public string FP3_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP3_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP3_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品3处理结果
                    /// </summary>
                    public string FP3_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP3_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP3_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品3处理结果入库仓库
                    /// </summary>
                    public string FP3_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP3_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP3_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品4
                    /// </summary>
                    public string FP4
                    {
                        get
                        {
                            return this.TextAccess["FP4"];
                        }
                        set
                        {
                            this.TextAccess["FP4"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品4入库仓库
                    /// </summary>
                    public string FP4_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP4_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP4_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品4处理结果
                    /// </summary>
                    public string FP4_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP4_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP4_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品4处理结果入库仓库
                    /// </summary>
                    public string FP4_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP4_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP4_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品5
                    /// </summary>
                    public string FP5
                    {
                        get
                        {
                            return this.TextAccess["FP5"];
                        }
                        set
                        {
                            this.TextAccess["FP5"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品5入库仓库
                    /// </summary>
                    public string FP5_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP5_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP5_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品5处理结果
                    /// </summary>
                    public string FP5_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP5_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP5_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品5处理结果入库仓库
                    /// </summary>
                    public string FP5_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP5_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP5_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品6
                    /// </summary>
                    public string FP6
                    {
                        get
                        {
                            return this.TextAccess["FP6"];
                        }
                        set
                        {
                            this.TextAccess["FP6"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品6入库仓库
                    /// </summary>
                    public string FP6_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP6_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP6_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品6处理结果
                    /// </summary>
                    public string FP6_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP6_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP6_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品6处理结果入库仓库
                    /// </summary>
                    public string FP6_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP6_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP6_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品7
                    /// </summary>
                    public string FP7
                    {
                        get
                        {
                            return this.TextAccess["FP7"];
                        }
                        set
                        {
                            this.TextAccess["FP7"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品7入库仓库
                    /// </summary>
                    public string FP7_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP7_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP7_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品7处理结果
                    /// </summary>
                    public string FP7_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP7_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP7_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品7处理结果入库仓库
                    /// </summary>
                    public string FP7_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP7_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP7_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品8
                    /// </summary>
                    public string FP8
                    {
                        get
                        {
                            return this.TextAccess["FP8"];
                        }
                        set
                        {
                            this.TextAccess["FP8"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品8入库仓库
                    /// </summary>
                    public string FP8_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP8_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP8_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品8处理结果
                    /// </summary>
                    public string FP8_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP8_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP8_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品8处理结果入库仓库
                    /// </summary>
                    public string FP8_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP8_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP8_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品9
                    /// </summary>
                    public string FP9
                    {
                        get
                        {
                            return this.TextAccess["FP9"];
                        }
                        set
                        {
                            this.TextAccess["FP9"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品9入库仓库
                    /// </summary>
                    public string FP9_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP9_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP9_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品9处理结果
                    /// </summary>
                    public string FP9_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP9_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP9_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品9处理结果入库仓库
                    /// </summary>
                    public string FP9_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP9_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP9_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品10
                    /// </summary>
                    public string FP10
                    {
                        get
                        {
                            return this.TextAccess["FP10"];
                        }
                        set
                        {
                            this.TextAccess["FP10"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品10入库仓库
                    /// </summary>
                    public string FP10_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP10_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP10_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品10处理结果
                    /// </summary>
                    public string FP10_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP10_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP10_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品10处理结果入库仓库
                    /// </summary>
                    public string FP10_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP10_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP10_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品11
                    /// </summary>
                    public string FP11
                    {
                        get
                        {
                            return this.TextAccess["FP11"];
                        }
                        set
                        {
                            this.TextAccess["FP11"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品11入库仓库
                    /// </summary>
                    public string FP11_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP11_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP11_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品11处理结果
                    /// </summary>
                    public string FP11_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP11_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP11_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品11处理结果入库仓库
                    /// </summary>
                    public string FP11_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP11_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP11_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品12
                    /// </summary>
                    public string FP12
                    {
                        get
                        {
                            return this.TextAccess["FP12"];
                        }
                        set
                        {
                            this.TextAccess["FP12"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品12入库仓库
                    /// </summary>
                    public string FP12_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP12_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP12_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品12处理结果
                    /// </summary>
                    public string FP12_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP12_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP12_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品12处理结果入库仓库
                    /// </summary>
                    public string FP12_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP12_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP12_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品13
                    /// </summary>
                    public string FP13
                    {
                        get
                        {
                            return this.TextAccess["FP13"];
                        }
                        set
                        {
                            this.TextAccess["FP13"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品13入库仓库
                    /// </summary>
                    public string FP13_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP13_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP13_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品13处理结果
                    /// </summary>
                    public string FP13_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP13_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP13_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品13处理结果入库仓库
                    /// </summary>
                    public string FP13_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP13_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP13_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品14
                    /// </summary>
                    public string FP14
                    {
                        get
                        {
                            return this.TextAccess["FP14"];
                        }
                        set
                        {
                            this.TextAccess["FP14"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品14入库仓库
                    /// </summary>
                    public string FP14_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP14_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP14_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品14处理结果
                    /// </summary>
                    public string FP14_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP14_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP14_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品14处理结果入库仓库
                    /// </summary>
                    public string FP14_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP14_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP14_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品15
                    /// </summary>
                    public string FP15
                    {
                        get
                        {
                            return this.TextAccess["FP15"];
                        }
                        set
                        {
                            this.TextAccess["FP15"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品15入库仓库
                    /// </summary>
                    public string FP15_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP15_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP15_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品15处理结果
                    /// </summary>
                    public string FP15_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP15_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP15_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品15处理结果入库仓库
                    /// </summary>
                    public string FP15_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP15_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP15_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品16
                    /// </summary>
                    public string FP16
                    {
                        get
                        {
                            return this.TextAccess["FP16"];
                        }
                        set
                        {
                            this.TextAccess["FP16"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品16入库仓库
                    /// </summary>
                    public string FP16_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP16_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP16_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品16处理结果
                    /// </summary>
                    public string FP16_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP16_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP16_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品16处理结果入库仓库
                    /// </summary>
                    public string FP16_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP16_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP16_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品17
                    /// </summary>
                    public string FP17
                    {
                        get
                        {
                            return this.TextAccess["FP17"];
                        }
                        set
                        {
                            this.TextAccess["FP17"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品17入库仓库
                    /// </summary>
                    public string FP17_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP17_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP17_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品17处理结果
                    /// </summary>
                    public string FP17_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP17_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP17_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品17处理结果入库仓库
                    /// </summary>
                    public string FP17_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP17_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP17_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品18
                    /// </summary>
                    public string FP18
                    {
                        get
                        {
                            return this.TextAccess["FP18"];
                        }
                        set
                        {
                            this.TextAccess["FP18"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品18入库仓库
                    /// </summary>
                    public string FP18_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP18_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP18_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品18处理结果
                    /// </summary>
                    public string FP18_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP18_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP18_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品18处理结果入库仓库
                    /// </summary>
                    public string FP18_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP18_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP18_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品19
                    /// </summary>
                    public string FP19
                    {
                        get
                        {
                            return this.TextAccess["FP19"];
                        }
                        set
                        {
                            this.TextAccess["FP19"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品19入库仓库
                    /// </summary>
                    public string FP19_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP19_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP19_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品19处理结果
                    /// </summary>
                    public string FP19_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP19_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP19_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品19处理结果入库仓库
                    /// </summary>
                    public string FP19_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP19_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP19_CLJG_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认废品20
                    /// </summary>
                    public string FP20
                    {
                        get
                        {
                            return this.TextAccess["FP20"];
                        }
                        set
                        {
                            this.TextAccess["FP20"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品20入库仓库
                    /// </summary>
                    public string FP20_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP20_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP20_RKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品20处理结果
                    /// </summary>
                    public string FP20_CLJG
                    {
                        get
                        {
                            return this.TextAccess["FP20_CLJG"];
                        }
                        set
                        {
                            this.TextAccess["FP20_CLJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  废品20处理结果入库仓库
                    /// </summary>
                    public string FP20_CLJG_RKCK
                    {
                        get
                        {
                            return this.TextAccess["FP20_CLJG_RKCK"];
                        }
                        set
                        {
                            this.TextAccess["FP20_CLJG_RKCK"] = value;
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
        public MES_BD_JYGD SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_JYGD>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_JYGD SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_JYGD>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_JYGD> ToList()
        {
             return new EntityBuilder<MES_BD_JYGD>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_JYGD> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_JYGD>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_JYGD SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_JYGD SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_JYGD> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_JYGD> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_JYGD> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_JYGD>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_JYGD> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_JYGD>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_JYGD, MES_BD_JYGD_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_JYGD, MES_BD_JYGD_FIELD>();
            }
        }
		
	    public static MES_BD_JYGD_FIELD Fields
        {
            get { return MES_BD_JYGD_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_JYGD> EntityBuilder = new EntityBuilder<MES_BD_JYGD>();
    }

	internal class MES_BD_JYGD_COLUMN : BaseColumn
    {
        public static MES_BD_JYGD_COLUMN Instance;

        static MES_BD_JYGD_COLUMN()
        {
            Instance = new MES_BD_JYGD_COLUMN();
        }

        private MES_BD_JYGD_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SJCJ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP1_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP1_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP1_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP2_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP2_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP2_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP3_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP3_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP3_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP4", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP4_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP4_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP4_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP5", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP5_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP5_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP5_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP6", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP6_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP6_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP6_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP7", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP7_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP7_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP7_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP8", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP8_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP8_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP8_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP9", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP9_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP9_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP9_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP10", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP10_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP10_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP10_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP11", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP11_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP11_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP11_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP12", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP12_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP12_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP12_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP13", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP13_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP13_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP13_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP14", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP14_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP14_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP14_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP15", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP15_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP15_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP15_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP16", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP16_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP16_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP16_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP17", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP17_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP17_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP17_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP18", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP18_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP18_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP18_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP19", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP19_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP19_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP19_CLJG_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP20", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP20_RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP20_CLJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FP20_CLJG_RKCK", Type = "TEXT"  });
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
	
  public class  MES_BD_JYGD_FIELD
  {
       private static MES_BD_JYGD_FIELD instance;

        public static MES_BD_JYGD_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_JYGD_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string BH = "BH";
        public readonly string NAME = "NAME";
        public readonly string SJCJ = "SJCJ";
        public readonly string CKCK = "CKCK";
        public readonly string RKCK = "RKCK";
        public readonly string FP1 = "FP1";
        public readonly string FP1_RKCK = "FP1_RKCK";
        public readonly string FP1_CLJG = "FP1_CLJG";
        public readonly string FP1_CLJG_RKCK = "FP1_CLJG_RKCK";
        public readonly string FP2 = "FP2";
        public readonly string FP2_RKCK = "FP2_RKCK";
        public readonly string FP2_CLJG = "FP2_CLJG";
        public readonly string FP2_CLJG_RKCK = "FP2_CLJG_RKCK";
        public readonly string FP3 = "FP3";
        public readonly string FP3_RKCK = "FP3_RKCK";
        public readonly string FP3_CLJG = "FP3_CLJG";
        public readonly string FP3_CLJG_RKCK = "FP3_CLJG_RKCK";
        public readonly string FP4 = "FP4";
        public readonly string FP4_RKCK = "FP4_RKCK";
        public readonly string FP4_CLJG = "FP4_CLJG";
        public readonly string FP4_CLJG_RKCK = "FP4_CLJG_RKCK";
        public readonly string FP5 = "FP5";
        public readonly string FP5_RKCK = "FP5_RKCK";
        public readonly string FP5_CLJG = "FP5_CLJG";
        public readonly string FP5_CLJG_RKCK = "FP5_CLJG_RKCK";
        public readonly string FP6 = "FP6";
        public readonly string FP6_RKCK = "FP6_RKCK";
        public readonly string FP6_CLJG = "FP6_CLJG";
        public readonly string FP6_CLJG_RKCK = "FP6_CLJG_RKCK";
        public readonly string FP7 = "FP7";
        public readonly string FP7_RKCK = "FP7_RKCK";
        public readonly string FP7_CLJG = "FP7_CLJG";
        public readonly string FP7_CLJG_RKCK = "FP7_CLJG_RKCK";
        public readonly string FP8 = "FP8";
        public readonly string FP8_RKCK = "FP8_RKCK";
        public readonly string FP8_CLJG = "FP8_CLJG";
        public readonly string FP8_CLJG_RKCK = "FP8_CLJG_RKCK";
        public readonly string FP9 = "FP9";
        public readonly string FP9_RKCK = "FP9_RKCK";
        public readonly string FP9_CLJG = "FP9_CLJG";
        public readonly string FP9_CLJG_RKCK = "FP9_CLJG_RKCK";
        public readonly string FP10 = "FP10";
        public readonly string FP10_RKCK = "FP10_RKCK";
        public readonly string FP10_CLJG = "FP10_CLJG";
        public readonly string FP10_CLJG_RKCK = "FP10_CLJG_RKCK";
        public readonly string FP11 = "FP11";
        public readonly string FP11_RKCK = "FP11_RKCK";
        public readonly string FP11_CLJG = "FP11_CLJG";
        public readonly string FP11_CLJG_RKCK = "FP11_CLJG_RKCK";
        public readonly string FP12 = "FP12";
        public readonly string FP12_RKCK = "FP12_RKCK";
        public readonly string FP12_CLJG = "FP12_CLJG";
        public readonly string FP12_CLJG_RKCK = "FP12_CLJG_RKCK";
        public readonly string FP13 = "FP13";
        public readonly string FP13_RKCK = "FP13_RKCK";
        public readonly string FP13_CLJG = "FP13_CLJG";
        public readonly string FP13_CLJG_RKCK = "FP13_CLJG_RKCK";
        public readonly string FP14 = "FP14";
        public readonly string FP14_RKCK = "FP14_RKCK";
        public readonly string FP14_CLJG = "FP14_CLJG";
        public readonly string FP14_CLJG_RKCK = "FP14_CLJG_RKCK";
        public readonly string FP15 = "FP15";
        public readonly string FP15_RKCK = "FP15_RKCK";
        public readonly string FP15_CLJG = "FP15_CLJG";
        public readonly string FP15_CLJG_RKCK = "FP15_CLJG_RKCK";
        public readonly string FP16 = "FP16";
        public readonly string FP16_RKCK = "FP16_RKCK";
        public readonly string FP16_CLJG = "FP16_CLJG";
        public readonly string FP16_CLJG_RKCK = "FP16_CLJG_RKCK";
        public readonly string FP17 = "FP17";
        public readonly string FP17_RKCK = "FP17_RKCK";
        public readonly string FP17_CLJG = "FP17_CLJG";
        public readonly string FP17_CLJG_RKCK = "FP17_CLJG_RKCK";
        public readonly string FP18 = "FP18";
        public readonly string FP18_RKCK = "FP18_RKCK";
        public readonly string FP18_CLJG = "FP18_CLJG";
        public readonly string FP18_CLJG_RKCK = "FP18_CLJG_RKCK";
        public readonly string FP19 = "FP19";
        public readonly string FP19_RKCK = "FP19_RKCK";
        public readonly string FP19_CLJG = "FP19_CLJG";
        public readonly string FP19_CLJG_RKCK = "FP19_CLJG_RKCK";
        public readonly string FP20 = "FP20";
        public readonly string FP20_RKCK = "FP20_RKCK";
        public readonly string FP20_CLJG = "FP20_CLJG";
        public readonly string FP20_CLJG_RKCK = "FP20_CLJG_RKCK";
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