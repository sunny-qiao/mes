#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_MJ : EntityBase
	{
	     public MES_BD_MJ()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_MJ" };
		    base.Columns = MES_BD_MJ_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_MJ(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_MJ(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_MJ(EntityBase entityBase)
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
                    ///  模具编号
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
                    ///  模具名
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
                    ///  所属模具类型
                    /// </summary>
                    public string SSMJLX
                    {
                        get
                        {
                            return this.TextAccess["SSMJLX"];
                        }
                        set
                        {
                            this.TextAccess["SSMJLX"] = value;
                        }
                    }
                    /// <summary>
                    ///  模具供应商
                    /// </summary>
                    public string GYS
                    {
                        get
                        {
                            return this.TextAccess["GYS"];
                        }
                        set
                        {
                            this.TextAccess["GYS"] = value;
                        }
                    }
                    /// <summary>
                    ///  模具生产日期
                    /// </summary>
                    public System.Nullable<DateTime> SCRQ
                    {
                        get
                        {
                            return this.DateAccess["SCRQ"];
                        }
                        set
                        {
                            this.DateAccess["SCRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  模具设备读取代码
                    /// </summary>
                    public string DQDM
                    {
                        get
                        {
                            return this.TextAccess["DQDM"];
                        }
                        set
                        {
                            this.TextAccess["DQDM"] = value;
                        }
                    }
                    /// <summary>
                    ///  模具缩略图
                    /// </summary>
                    public string SLT
                    {
                        get
                        {
                            return this.TextAccess["SLT"];
                        }
                        set
                        {
                            this.TextAccess["SLT"] = value;
                        }
                    }
                    /// <summary>
                    ///  模具条形码
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
                    ///  模具二维码
                    /// </summary>
                    public string EWM
                    {
                        get
                        {
                            return this.TextAccess["EWM"];
                        }
                        set
                        {
                            this.TextAccess["EWM"] = value;
                        }
                    }
                    /// <summary>
                    ///  模具缩略图
                    /// </summary>
                    public string SLT_PATH
                    {
                        get
                        {
                            return this.TextAccess["SLT_PATH"];
                        }
                        set
                        {
                            this.TextAccess["SLT_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  模具条形码
                    /// </summary>
                    public string TXM_PATH
                    {
                        get
                        {
                            return this.TextAccess["TXM_PATH"];
                        }
                        set
                        {
                            this.TextAccess["TXM_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  模具二维码
                    /// </summary>
                    public string EWM_PATH
                    {
                        get
                        {
                            return this.TextAccess["EWM_PATH"];
                        }
                        set
                        {
                            this.TextAccess["EWM_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  对应模具类型
                    /// </summary>
                    public string DYMJLX
                    {
                        get
                        {
                            return this.TextAccess["DYMJLX"];
                        }
                        set
                        {
                            this.TextAccess["DYMJLX"] = value;
                        }
                    }
                    /// <summary>
                    ///  模具默认工序
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
                    ///  模具采购价格
                    /// </summary>
                    public System.Nullable<double> CGJG
                    {
                        get
                        {
                            return this.DoubleAccess["CGJG"];
                        }
                        set
                        {
                            this.DoubleAccess["CGJG"] = value;
                        }
                    }
                    /// <summary>
                    ///  成本摊销生产箱数/次数
                    /// </summary>
                    public System.Nullable<double> CBTXSCXS
                    {
                        get
                        {
                            return this.DoubleAccess["CBTXSCXS"];
                        }
                        set
                        {
                            this.DoubleAccess["CBTXSCXS"] = value;
                        }
                    }
                    /// <summary>
                    ///  次均摊成本
                    /// </summary>
                    public System.Nullable<double> CJTCB
                    {
                        get
                        {
                            return this.DoubleAccess["CJTCB"];
                        }
                        set
                        {
                            this.DoubleAccess["CJTCB"] = value;
                        }
                    }
                    /// <summary>
                    ///  模具浇冒系统重/kg
                    /// </summary>
                    public System.Nullable<double> JMXTZ
                    {
                        get
                        {
                            return this.DoubleAccess["JMXTZ"];
                        }
                        set
                        {
                            this.DoubleAccess["JMXTZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  所有产品总重/kg
                    /// </summary>
                    public System.Nullable<double> SYCPZZ
                    {
                        get
                        {
                            return this.DoubleAccess["SYCPZZ"];
                        }
                        set
                        {
                            this.DoubleAccess["SYCPZZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  总铁水用量/kg
                    /// </summary>
                    public System.Nullable<double> ZTSYL
                    {
                        get
                        {
                            return this.DoubleAccess["ZTSYL"];
                        }
                        set
                        {
                            this.DoubleAccess["ZTSYL"] = value;
                        }
                    }
                    /// <summary>
                    ///  出品率/%
                    /// </summary>
                    public System.Nullable<double> CPL
                    {
                        get
                        {
                            return this.DoubleAccess["CPL"];
                        }
                        set
                        {
                            this.DoubleAccess["CPL"] = value;
                        }
                    }
                    /// <summary>
                    ///  标准单次生产工时/s
                    /// </summary>
                    public System.Nullable<double> BZDCSCGS
                    {
                        get
                        {
                            return this.DoubleAccess["BZDCSCGS"];
                        }
                        set
                        {
                            this.DoubleAccess["BZDCSCGS"] = value;
                        }
                    }
                    /// <summary>
                    ///  模具电功率/w
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
                    ///  标准工时生产次数
                    /// </summary>
                    public System.Nullable<double> BZGSSCCS
                    {
                        get
                        {
                            return this.DoubleAccess["BZGSSCCS"];
                        }
                        set
                        {
                            this.DoubleAccess["BZGSSCCS"] = value;
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
        public MES_BD_MJ SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_MJ>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_MJ SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_MJ>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_MJ> ToList()
        {
             return new EntityBuilder<MES_BD_MJ>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_MJ> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_MJ>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_MJ SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_MJ SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_MJ> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_MJ> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_MJ> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_MJ>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_MJ> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_MJ>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_MJ, MES_BD_MJ_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_MJ, MES_BD_MJ_FIELD>();
            }
        }
		
	    public static MES_BD_MJ_FIELD Fields
        {
            get { return MES_BD_MJ_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_MJ> EntityBuilder = new EntityBuilder<MES_BD_MJ>();
    }

	internal class MES_BD_MJ_COLUMN : BaseColumn
    {
        public static MES_BD_MJ_COLUMN Instance;

        static MES_BD_MJ_COLUMN()
        {
            Instance = new MES_BD_MJ_COLUMN();
        }

        private MES_BD_MJ_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SSMJLX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GYS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DQDM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SLT", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TXM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "EWM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SLT_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TXM_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "EWM_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DYMJLX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CGJG", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CBTXSCXS", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CJTCB", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JMXTZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SYCPZZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZTSYL", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CPL", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BZDCSCGS", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DGL", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BZGSSCCS", Type = "NUMBER"  });
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
	
  public class  MES_BD_MJ_FIELD
  {
       private static MES_BD_MJ_FIELD instance;

        public static MES_BD_MJ_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_MJ_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string BH = "BH";
        public readonly string NAME = "NAME";
        public readonly string SSMJLX = "SSMJLX";
        public readonly string GYS = "GYS";
        public readonly string SCRQ = "SCRQ";
        public readonly string DQDM = "DQDM";
        public readonly string SLT = "SLT";
        public readonly string TXM = "TXM";
        public readonly string EWM = "EWM";
        public readonly string SLT_PATH = "SLT_PATH";
        public readonly string TXM_PATH = "TXM_PATH";
        public readonly string EWM_PATH = "EWM_PATH";
        public readonly string DYMJLX = "DYMJLX";
        public readonly string GX = "GX";
        public readonly string CGJG = "CGJG";
        public readonly string CBTXSCXS = "CBTXSCXS";
        public readonly string CJTCB = "CJTCB";
        public readonly string JMXTZ = "JMXTZ";
        public readonly string SYCPZZ = "SYCPZZ";
        public readonly string ZTSYL = "ZTSYL";
        public readonly string CPL = "CPL";
        public readonly string BZDCSCGS = "BZDCSCGS";
        public readonly string DGL = "DGL";
        public readonly string BZGSSCCS = "BZGSSCCS";
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