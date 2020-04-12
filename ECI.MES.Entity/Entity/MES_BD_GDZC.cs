#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_GDZC : EntityBase
	{
	     public MES_BD_GDZC()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_GDZC" };
		    base.Columns = MES_BD_GDZC_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_GDZC(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_GDZC(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_GDZC(EntityBase entityBase)
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
                    ///  固定资产/设备编号
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
                    ///  固定资产/设备名
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
                    ///  对应物料名
                    /// </summary>
                    public string WL
                    {
                        get
                        {
                            return this.TextAccess["WL"];
                        }
                        set
                        {
                            this.TextAccess["WL"] = value;
                        }
                    }
                    /// <summary>
                    ///  增加方式
                    /// </summary>
                    public string ZJFS
                    {
                        get
                        {
                            return this.TextAccess["ZJFS"];
                        }
                        set
                        {
                            this.TextAccess["ZJFS"] = value;
                        }
                    }
                    /// <summary>
                    ///  供货人
                    /// </summary>
                    public string GHR
                    {
                        get
                        {
                            return this.TextAccess["GHR"];
                        }
                        set
                        {
                            this.TextAccess["GHR"] = value;
                        }
                    }
                    /// <summary>
                    ///  规格型号
                    /// </summary>
                    public string GGXH
                    {
                        get
                        {
                            return this.TextAccess["GGXH"];
                        }
                        set
                        {
                            this.TextAccess["GGXH"] = value;
                        }
                    }
                    /// <summary>
                    ///  制造厂商
                    /// </summary>
                    public string ZZCS
                    {
                        get
                        {
                            return this.TextAccess["ZZCS"];
                        }
                        set
                        {
                            this.TextAccess["ZZCS"] = value;
                        }
                    }
                    /// <summary>
                    ///  制造厂商联系方式
                    /// </summary>
                    public string ZZCS_TEL
                    {
                        get
                        {
                            return this.TextAccess["ZZCS_TEL"];
                        }
                        set
                        {
                            this.TextAccess["ZZCS_TEL"] = value;
                        }
                    }
                    /// <summary>
                    ///  制造号码
                    /// </summary>
                    public string ZZHM
                    {
                        get
                        {
                            return this.TextAccess["ZZHM"];
                        }
                        set
                        {
                            this.TextAccess["ZZHM"] = value;
                        }
                    }
                    /// <summary>
                    ///  制造日期
                    /// </summary>
                    public System.Nullable<DateTime> ZZRQ
                    {
                        get
                        {
                            return this.DateAccess["ZZRQ"];
                        }
                        set
                        {
                            this.DateAccess["ZZRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  购置日期
                    /// </summary>
                    public System.Nullable<DateTime> GZRQ
                    {
                        get
                        {
                            return this.DateAccess["GZRQ"];
                        }
                        set
                        {
                            this.DateAccess["GZRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  录入日期
                    /// </summary>
                    public System.Nullable<DateTime> LRRQ
                    {
                        get
                        {
                            return this.DateAccess["LRRQ"];
                        }
                        set
                        {
                            this.DateAccess["LRRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  录入人
                    /// </summary>
                    public string LRR
                    {
                        get
                        {
                            return this.TextAccess["LRR"];
                        }
                        set
                        {
                            this.TextAccess["LRR"] = value;
                        }
                    }
                    /// <summary>
                    ///  停用日期
                    /// </summary>
                    public System.Nullable<DateTime> TYRQ
                    {
                        get
                        {
                            return this.DateAccess["TYRQ"];
                        }
                        set
                        {
                            this.DateAccess["TYRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  注销日期
                    /// </summary>
                    public System.Nullable<DateTime> ZXRQ
                    {
                        get
                        {
                            return this.DateAccess["ZXRQ"];
                        }
                        set
                        {
                            this.DateAccess["ZXRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  注销原因
                    /// </summary>
                    public string ZXYY
                    {
                        get
                        {
                            return this.TextAccess["ZXYY"];
                        }
                        set
                        {
                            this.TextAccess["ZXYY"] = value;
                        }
                    }
                    /// <summary>
                    ///  开始使用日期
                    /// </summary>
                    public System.Nullable<DateTime> KSSYRQ
                    {
                        get
                        {
                            return this.DateAccess["KSSYRQ"];
                        }
                        set
                        {
                            this.DateAccess["KSSYRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  计量单位
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
                    ///  个数
                    /// </summary>
                    public System.Nullable<double> QTY
                    {
                        get
                        {
                            return this.DoubleAccess["QTY"];
                        }
                        set
                        {
                            this.DoubleAccess["QTY"] = value;
                        }
                    }
                    /// <summary>
                    ///  电功率/W
                    /// </summary>
                    public System.Nullable<double> DGL
                    {
                        get
                        {
                            return this.DoubleAccess["DGL"];
                        }
                        set
                        {
                            this.DoubleAccess["DGL"] = value;
                        }
                    }
                    /// <summary>
                    ///  固定资产/设备类别
                    /// </summary>
                    public string SBLB
                    {
                        get
                        {
                            return this.TextAccess["SBLB"];
                        }
                        set
                        {
                            this.TextAccess["SBLB"] = value;
                        }
                    }
                    /// <summary>
                    ///  单价
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
                    ///  原值
                    /// </summary>
                    public System.Nullable<double> YZ
                    {
                        get
                        {
                            return this.DoubleAccess["YZ"];
                        }
                        set
                        {
                            this.DoubleAccess["YZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  预计净残值
                    /// </summary>
                    public System.Nullable<double> YJJCZ
                    {
                        get
                        {
                            return this.DoubleAccess["YJJCZ"];
                        }
                        set
                        {
                            this.DoubleAccess["YJJCZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  净残值率
                    /// </summary>
                    public System.Nullable<double> JCZL
                    {
                        get
                        {
                            return this.DoubleAccess["JCZL"];
                        }
                        set
                        {
                            this.DoubleAccess["JCZL"] = value;
                        }
                    }
                    /// <summary>
                    ///  预计总折旧额
                    /// </summary>
                    public System.Nullable<double> YJZZJE
                    {
                        get
                        {
                            return this.DoubleAccess["YJZZJE"];
                        }
                        set
                        {
                            this.DoubleAccess["YJZZJE"] = value;
                        }
                    }
                    /// <summary>
                    ///  预计总折旧率
                    /// </summary>
                    public System.Nullable<double> YJZZJL
                    {
                        get
                        {
                            return this.DoubleAccess["YJZZJL"];
                        }
                        set
                        {
                            this.DoubleAccess["YJZZJL"] = value;
                        }
                    }
                    /// <summary>
                    ///  预计使用寿命
                    /// </summary>
                    public System.Nullable<double> YJSYSM
                    {
                        get
                        {
                            return this.DoubleAccess["YJSYSM"];
                        }
                        set
                        {
                            this.DoubleAccess["YJSYSM"] = value;
                        }
                    }
                    /// <summary>
                    ///  预计使用寿命的年数总和
                    /// </summary>
                    public System.Nullable<double> YJNSZH
                    {
                        get
                        {
                            return this.DoubleAccess["YJNSZH"];
                        }
                        set
                        {
                            this.DoubleAccess["YJNSZH"] = value;
                        }
                    }
                    /// <summary>
                    ///  折旧方法
                    /// </summary>
                    public string ZJFF
                    {
                        get
                        {
                            return this.TextAccess["ZJFF"];
                        }
                        set
                        {
                            this.TextAccess["ZJFF"] = value;
                        }
                    }
                    /// <summary>
                    ///  预计工作量对应生产线
                    /// </summary>
                    public string YJSCX
                    {
                        get
                        {
                            return this.TextAccess["YJSCX"];
                        }
                        set
                        {
                            this.TextAccess["YJSCX"] = value;
                        }
                    }
                    /// <summary>
                    ///  预计工作量
                    /// </summary>
                    public string YJGZL
                    {
                        get
                        {
                            return this.TextAccess["YJGZL"];
                        }
                        set
                        {
                            this.TextAccess["YJGZL"] = value;
                        }
                    }
                    /// <summary>
                    ///  预计工作量对应单位
                    /// </summary>
                    public string YJGZL_UNIT
                    {
                        get
                        {
                            return this.TextAccess["YJGZL_UNIT"];
                        }
                        set
                        {
                            this.TextAccess["YJGZL_UNIT"] = value;
                        }
                    }
                    /// <summary>
                    ///  单位工作量折旧额
                    /// </summary>
                    public string DWGZLZJE
                    {
                        get
                        {
                            return this.TextAccess["DWGZLZJE"];
                        }
                        set
                        {
                            this.TextAccess["DWGZLZJE"] = value;
                        }
                    }
                    /// <summary>
                    ///  对应已生产工作量
                    /// </summary>
                    public string DYYSCZGL
                    {
                        get
                        {
                            return this.TextAccess["DYYSCZGL"];
                        }
                        set
                        {
                            this.TextAccess["DYYSCZGL"] = value;
                        }
                    }
                    /// <summary>
                    ///  工作量计算总折旧额
                    /// </summary>
                    public string GZLJSZZJE
                    {
                        get
                        {
                            return this.TextAccess["GZLJSZZJE"];
                        }
                        set
                        {
                            this.TextAccess["GZLJSZZJE"] = value;
                        }
                    }
                    /// <summary>
                    ///  上次结账日期
                    /// </summary>
                    public System.Nullable<DateTime> SCJZRQ
                    {
                        get
                        {
                            return this.DateAccess["SCJZRQ"];
                        }
                        set
                        {
                            this.DateAccess["SCJZRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  当期起始日期对应折旧年份值
                    /// </summary>
                    public string DQQSRQ
                    {
                        get
                        {
                            return this.TextAccess["DQQSRQ"];
                        }
                        set
                        {
                            this.TextAccess["DQQSRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  起始日期对应折旧年份年折旧额
                    /// </summary>
                    public string QSRQDY
                    {
                        get
                        {
                            return this.TextAccess["QSRQDY"];
                        }
                        set
                        {
                            this.TextAccess["QSRQDY"] = value;
                        }
                    }
                    /// <summary>
                    ///  当期终止日期对应折旧年份值
                    /// </summary>
                    public string DQZZRQDY
                    {
                        get
                        {
                            return this.TextAccess["DQZZRQDY"];
                        }
                        set
                        {
                            this.TextAccess["DQZZRQDY"] = value;
                        }
                    }
                    /// <summary>
                    ///  终止日期对应折旧年份年折旧额
                    /// </summary>
                    public string ZZRQDY
                    {
                        get
                        {
                            return this.TextAccess["ZZRQDY"];
                        }
                        set
                        {
                            this.TextAccess["ZZRQDY"] = value;
                        }
                    }
                    /// <summary>
                    ///  本账期折旧额/当月折旧额
                    /// </summary>
                    public string BZQZJE
                    {
                        get
                        {
                            return this.TextAccess["BZQZJE"];
                        }
                        set
                        {
                            this.TextAccess["BZQZJE"] = value;
                        }
                    }
                    /// <summary>
                    ///  当月折旧率
                    /// </summary>
                    public string DYZJL
                    {
                        get
                        {
                            return this.TextAccess["DYZJL"];
                        }
                        set
                        {
                            this.TextAccess["DYZJL"] = value;
                        }
                    }
                    /// <summary>
                    ///  日折旧额
                    /// </summary>
                    public string YZJE
                    {
                        get
                        {
                            return this.TextAccess["YZJE"];
                        }
                        set
                        {
                            this.TextAccess["YZJE"] = value;
                        }
                    }
                    /// <summary>
                    ///  已计提年份
                    /// </summary>
                    public string YJTNF
                    {
                        get
                        {
                            return this.TextAccess["YJTNF"];
                        }
                        set
                        {
                            this.TextAccess["YJTNF"] = value;
                        }
                    }
                    /// <summary>
                    ///  已计提月份
                    /// </summary>
                    public string YJTYF
                    {
                        get
                        {
                            return this.TextAccess["YJTYF"];
                        }
                        set
                        {
                            this.TextAccess["YJTYF"] = value;
                        }
                    }
                    /// <summary>
                    ///  该固定资产/设备已结账年份折旧额
                    /// </summary>
                    public string YJZNFZJE
                    {
                        get
                        {
                            return this.TextAccess["YJZNFZJE"];
                        }
                        set
                        {
                            this.TextAccess["YJZNFZJE"] = value;
                        }
                    }
                    /// <summary>
                    ///  累计折旧
                    /// </summary>
                    public string LJZJ
                    {
                        get
                        {
                            return this.TextAccess["LJZJ"];
                        }
                        set
                        {
                            this.TextAccess["LJZJ"] = value;
                        }
                    }
                    /// <summary>
                    ///  净值
                    /// </summary>
                    public string JZ
                    {
                        get
                        {
                            return this.TextAccess["JZ"];
                        }
                        set
                        {
                            this.TextAccess["JZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  对应折旧科目
                    /// </summary>
                    public string DYZJKM
                    {
                        get
                        {
                            return this.TextAccess["DYZJKM"];
                        }
                        set
                        {
                            this.TextAccess["DYZJKM"] = value;
                        }
                    }
                    /// <summary>
                    ///  存放地点
                    /// </summary>
                    public string CFDD
                    {
                        get
                        {
                            return this.TextAccess["CFDD"];
                        }
                        set
                        {
                            this.TextAccess["CFDD"] = value;
                        }
                    }
                    /// <summary>
                    ///  建筑面积/m^2
                    /// </summary>
                    public System.Nullable<double> JZMJ
                    {
                        get
                        {
                            return this.DoubleAccess["JZMJ"];
                        }
                        set
                        {
                            this.DoubleAccess["JZMJ"] = value;
                        }
                    }
                    /// <summary>
                    ///  出售价格
                    /// </summary>
                    public string CSJG
                    {
                        get
                        {
                            return this.TextAccess["CSJG"];
                        }
                        set
                        {
                            this.TextAccess["CSJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  盘盈/亏额
                    /// </summary>
                    public string PYKE
                    {
                        get
                        {
                            return this.TextAccess["PYKE"];
                        }
                        set
                        {
                            this.TextAccess["PYKE"] = value;
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
        public MES_BD_GDZC SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_GDZC>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_GDZC SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_GDZC>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_GDZC> ToList()
        {
             return new EntityBuilder<MES_BD_GDZC>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_GDZC> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_GDZC>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_GDZC SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_GDZC SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_GDZC> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_GDZC> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_GDZC> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_GDZC>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_GDZC> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_GDZC>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_GDZC, MES_BD_GDZC_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_GDZC, MES_BD_GDZC_FIELD>();
            }
        }
		
	    public static MES_BD_GDZC_FIELD Fields
        {
            get { return MES_BD_GDZC_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_GDZC> EntityBuilder = new EntityBuilder<MES_BD_GDZC>();
    }

	internal class MES_BD_GDZC_COLUMN : BaseColumn
    {
        public static MES_BD_GDZC_COLUMN Instance;

        static MES_BD_GDZC_COLUMN()
        {
            Instance = new MES_BD_GDZC_COLUMN();
        }

        private MES_BD_GDZC_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "WL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZJFS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GHR", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GGXH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZZCS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZZCS_TEL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZZHM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZZRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GZRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LRRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LRR", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TYRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZXRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZXYY", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "KSSYRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "UNIT", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "QTY", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DGL", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SBLB", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PRICE", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YJJCZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JCZL", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YJZZJE", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YJZZJL", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YJSYSM", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YJNSZH", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZJFF", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YJSCX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YJGZL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YJGZL_UNIT", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DWGZLZJE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DYYSCZGL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GZLJSZZJE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCJZRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DQQSRQ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "QSRQDY", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DQZZRQDY", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZZRQDY", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BZQZJE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DYZJL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YZJE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YJTNF", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YJTYF", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YJZNFZJE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LJZJ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DYZJKM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CFDD", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JZMJ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CSJG", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PYKE", Type = "TEXT"  });
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
	
  public class  MES_BD_GDZC_FIELD
  {
       private static MES_BD_GDZC_FIELD instance;

        public static MES_BD_GDZC_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_GDZC_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string BH = "BH";
        public readonly string NAME = "NAME";
        public readonly string WL = "WL";
        public readonly string ZJFS = "ZJFS";
        public readonly string GHR = "GHR";
        public readonly string GGXH = "GGXH";
        public readonly string ZZCS = "ZZCS";
        public readonly string ZZCS_TEL = "ZZCS_TEL";
        public readonly string ZZHM = "ZZHM";
        public readonly string ZZRQ = "ZZRQ";
        public readonly string GZRQ = "GZRQ";
        public readonly string LRRQ = "LRRQ";
        public readonly string LRR = "LRR";
        public readonly string TYRQ = "TYRQ";
        public readonly string ZXRQ = "ZXRQ";
        public readonly string ZXYY = "ZXYY";
        public readonly string KSSYRQ = "KSSYRQ";
        public readonly string UNIT = "UNIT";
        public readonly string QTY = "QTY";
        public readonly string DGL = "DGL";
        public readonly string SBLB = "SBLB";
        public readonly string PRICE = "PRICE";
        public readonly string YZ = "YZ";
        public readonly string YJJCZ = "YJJCZ";
        public readonly string JCZL = "JCZL";
        public readonly string YJZZJE = "YJZZJE";
        public readonly string YJZZJL = "YJZZJL";
        public readonly string YJSYSM = "YJSYSM";
        public readonly string YJNSZH = "YJNSZH";
        public readonly string ZJFF = "ZJFF";
        public readonly string YJSCX = "YJSCX";
        public readonly string YJGZL = "YJGZL";
        public readonly string YJGZL_UNIT = "YJGZL_UNIT";
        public readonly string DWGZLZJE = "DWGZLZJE";
        public readonly string DYYSCZGL = "DYYSCZGL";
        public readonly string GZLJSZZJE = "GZLJSZZJE";
        public readonly string SCJZRQ = "SCJZRQ";
        public readonly string DQQSRQ = "DQQSRQ";
        public readonly string QSRQDY = "QSRQDY";
        public readonly string DQZZRQDY = "DQZZRQDY";
        public readonly string ZZRQDY = "ZZRQDY";
        public readonly string BZQZJE = "BZQZJE";
        public readonly string DYZJL = "DYZJL";
        public readonly string YZJE = "YZJE";
        public readonly string YJTNF = "YJTNF";
        public readonly string YJTYF = "YJTYF";
        public readonly string YJZNFZJE = "YJZNFZJE";
        public readonly string LJZJ = "LJZJ";
        public readonly string JZ = "JZ";
        public readonly string DYZJKM = "DYZJKM";
        public readonly string CFDD = "CFDD";
        public readonly string JZMJ = "JZMJ";
        public readonly string CSJG = "CSJG";
        public readonly string PYKE = "PYKE";
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