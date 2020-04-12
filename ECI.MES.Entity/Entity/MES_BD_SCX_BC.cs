#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_SCX_BC : EntityBase
	{
	     public MES_BD_SCX_BC()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_SCX_BC" };
		    base.Columns = MES_BD_SCX_BC_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_SCX_BC(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_SCX_BC(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_SCX_BC(EntityBase entityBase)
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
                    ///  MES_BD_SCX.GUID
                    /// </summary>
                    public string FGUID
                    {
                        get
                        {
                            return this.TextAccess["FGUID"];
                        }
                        set
                        {
                            this.TextAccess["FGUID"] = value;
                        }
                    }
                    /// <summary>
                    ///  对应生产线
                    /// </summary>
                    public string SCX
                    {
                        get
                        {
                            return this.TextAccess["SCX"];
                        }
                        set
                        {
                            this.TextAccess["SCX"] = value;
                        }
                    }
                    /// <summary>
                    ///  对应部门
                    /// </summary>
                    public string DEPT
                    {
                        get
                        {
                            return this.TextAccess["DEPT"];
                        }
                        set
                        {
                            this.TextAccess["DEPT"] = value;
                        }
                    }
                    /// <summary>
                    ///  是否停用
                    /// </summary>
                    public string IS_TY
                    {
                        get
                        {
                            return this.TextAccess["IS_TY"];
                        }
                        set
                        {
                            this.TextAccess["IS_TY"] = value;
                        }
                    }
                    /// <summary>
                    ///  编号
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
                    ///  班次编号
                    /// </summary>
                    public string BCBH
                    {
                        get
                        {
                            return this.TextAccess["BCBH"];
                        }
                        set
                        {
                            this.TextAccess["BCBH"] = value;
                        }
                    }
                    /// <summary>
                    ///  班次名
                    /// </summary>
                    public string BCM
                    {
                        get
                        {
                            return this.TextAccess["BCM"];
                        }
                        set
                        {
                            this.TextAccess["BCM"] = value;
                        }
                    }
                    /// <summary>
                    ///  班次名简写
                    /// </summary>
                    public string BCM_SHORT
                    {
                        get
                        {
                            return this.TextAccess["BCM_SHORT"];
                        }
                        set
                        {
                            this.TextAccess["BCM_SHORT"] = value;
                        }
                    }
                    /// <summary>
                    ///  上班考勤机编号
                    /// </summary>
                    public string SBKQJBH
                    {
                        get
                        {
                            return this.TextAccess["SBKQJBH"];
                        }
                        set
                        {
                            this.TextAccess["SBKQJBH"] = value;
                        }
                    }
                    /// <summary>
                    ///  上班备用考勤机编号
                    /// </summary>
                    public string BSBYKQJBH
                    {
                        get
                        {
                            return this.TextAccess["BSBYKQJBH"];
                        }
                        set
                        {
                            this.TextAccess["BSBYKQJBH"] = value;
                        }
                    }
                    /// <summary>
                    ///  下班考勤机编号
                    /// </summary>
                    public string XBKQJBH
                    {
                        get
                        {
                            return this.TextAccess["XBKQJBH"];
                        }
                        set
                        {
                            this.TextAccess["XBKQJBH"] = value;
                        }
                    }
                    /// <summary>
                    ///  下班备用考勤机编号
                    /// </summary>
                    public string XBBYKQJBH
                    {
                        get
                        {
                            return this.TextAccess["XBBYKQJBH"];
                        }
                        set
                        {
                            this.TextAccess["XBBYKQJBH"] = value;
                        }
                    }
                    /// <summary>
                    ///  产量考核起始日期差值
                    /// </summary>
                    public string CLKH_QS_RQCZ
                    {
                        get
                        {
                            return this.TextAccess["CLKH_QS_RQCZ"];
                        }
                        set
                        {
                            this.TextAccess["CLKH_QS_RQCZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  产量考核起始时间
                    /// </summary>
                    public System.Nullable<DateTime> CLKH_QS_TIME
                    {
                        get
                        {
                            return this.DateAccess["CLKH_QS_TIME"];
                        }
                        set
                        {
                            this.DateAccess["CLKH_QS_TIME"] = value;
                        }
                    }
                    /// <summary>
                    ///  产量考核结束日期差值
                    /// </summary>
                    public string CLKH_JS_RQCZ
                    {
                        get
                        {
                            return this.TextAccess["CLKH_JS_RQCZ"];
                        }
                        set
                        {
                            this.TextAccess["CLKH_JS_RQCZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  产量考核结束时间
                    /// </summary>
                    public System.Nullable<DateTime> CLKH_JS_TIME
                    {
                        get
                        {
                            return this.DateAccess["CLKH_JS_TIME"];
                        }
                        set
                        {
                            this.DateAccess["CLKH_JS_TIME"] = value;
                        }
                    }
                    /// <summary>
                    ///  #1上班日期差值
                    /// </summary>
                    public string SBRQCZ1
                    {
                        get
                        {
                            return this.TextAccess["SBRQCZ1"];
                        }
                        set
                        {
                            this.TextAccess["SBRQCZ1"] = value;
                        }
                    }
                    /// <summary>
                    ///  #1上班时间
                    /// </summary>
                    public System.Nullable<DateTime> SB_TIME1
                    {
                        get
                        {
                            return this.DateAccess["SB_TIME1"];
                        }
                        set
                        {
                            this.DateAccess["SB_TIME1"] = value;
                        }
                    }
                    /// <summary>
                    ///  #1下班日期差值
                    /// </summary>
                    public string XBRQCZ1
                    {
                        get
                        {
                            return this.TextAccess["XBRQCZ1"];
                        }
                        set
                        {
                            this.TextAccess["XBRQCZ1"] = value;
                        }
                    }
                    /// <summary>
                    ///  #1下班时间
                    /// </summary>
                    public System.Nullable<DateTime> XB_TIME1
                    {
                        get
                        {
                            return this.DateAccess["XB_TIME1"];
                        }
                        set
                        {
                            this.DateAccess["XB_TIME1"] = value;
                        }
                    }
                    /// <summary>
                    ///  #1上班考勤开始时间
                    /// </summary>
                    public System.Nullable<DateTime> SBKQKS_TIME1
                    {
                        get
                        {
                            return this.DateAccess["SBKQKS_TIME1"];
                        }
                        set
                        {
                            this.DateAccess["SBKQKS_TIME1"] = value;
                        }
                    }
                    /// <summary>
                    ///  #1迟到开始时间
                    /// </summary>
                    public System.Nullable<DateTime> CDKS_TIME1
                    {
                        get
                        {
                            return this.DateAccess["CDKS_TIME1"];
                        }
                        set
                        {
                            this.DateAccess["CDKS_TIME1"] = value;
                        }
                    }
                    /// <summary>
                    ///  #1严重迟到开始时间
                    /// </summary>
                    public System.Nullable<DateTime> YZCD_TIME1
                    {
                        get
                        {
                            return this.DateAccess["YZCD_TIME1"];
                        }
                        set
                        {
                            this.DateAccess["YZCD_TIME1"] = value;
                        }
                    }
                    /// <summary>
                    ///  #1上班旷工开始时间
                    /// </summary>
                    public System.Nullable<DateTime> SBKG_TIME1
                    {
                        get
                        {
                            return this.DateAccess["SBKG_TIME1"];
                        }
                        set
                        {
                            this.DateAccess["SBKG_TIME1"] = value;
                        }
                    }
                    /// <summary>
                    ///  #1下班旷工开始时间
                    /// </summary>
                    public System.Nullable<DateTime> XBKG_TIME1
                    {
                        get
                        {
                            return this.DateAccess["XBKG_TIME1"];
                        }
                        set
                        {
                            this.DateAccess["XBKG_TIME1"] = value;
                        }
                    }
                    /// <summary>
                    ///  #1下班严重早退开始时间
                    /// </summary>
                    public System.Nullable<DateTime> XBYZZTKS_TIME1
                    {
                        get
                        {
                            return this.DateAccess["XBYZZTKS_TIME1"];
                        }
                        set
                        {
                            this.DateAccess["XBYZZTKS_TIME1"] = value;
                        }
                    }
                    /// <summary>
                    ///  #1下班早退开始时间
                    /// </summary>
                    public System.Nullable<DateTime> XBZTKS_TIME1
                    {
                        get
                        {
                            return this.DateAccess["XBZTKS_TIME1"];
                        }
                        set
                        {
                            this.DateAccess["XBZTKS_TIME1"] = value;
                        }
                    }
                    /// <summary>
                    ///  #1加班开始时间
                    /// </summary>
                    public System.Nullable<DateTime> JBKS__TIME1
                    {
                        get
                        {
                            return this.DateAccess["JBKS__TIME1"];
                        }
                        set
                        {
                            this.DateAccess["JBKS__TIME1"] = value;
                        }
                    }
                    /// <summary>
                    ///  #1下班终止考勤时间
                    /// </summary>
                    public System.Nullable<DateTime> XBZZKQ_TIME1
                    {
                        get
                        {
                            return this.DateAccess["XBZZKQ_TIME1"];
                        }
                        set
                        {
                            this.DateAccess["XBZZKQ_TIME1"] = value;
                        }
                    }
                    /// <summary>
                    ///  #2上班日期差值
                    /// </summary>
                    public string SBRQCZ2
                    {
                        get
                        {
                            return this.TextAccess["SBRQCZ2"];
                        }
                        set
                        {
                            this.TextAccess["SBRQCZ2"] = value;
                        }
                    }
                    /// <summary>
                    ///  #2上班时间
                    /// </summary>
                    public System.Nullable<DateTime> SB_TIME2
                    {
                        get
                        {
                            return this.DateAccess["SB_TIME2"];
                        }
                        set
                        {
                            this.DateAccess["SB_TIME2"] = value;
                        }
                    }
                    /// <summary>
                    ///  #2下班日期差值
                    /// </summary>
                    public string XBRQCZ2
                    {
                        get
                        {
                            return this.TextAccess["XBRQCZ2"];
                        }
                        set
                        {
                            this.TextAccess["XBRQCZ2"] = value;
                        }
                    }
                    /// <summary>
                    ///  #2下班时间
                    /// </summary>
                    public System.Nullable<DateTime> XB_TIME2
                    {
                        get
                        {
                            return this.DateAccess["XB_TIME2"];
                        }
                        set
                        {
                            this.DateAccess["XB_TIME2"] = value;
                        }
                    }
                    /// <summary>
                    ///  #2上班考勤开始时间
                    /// </summary>
                    public System.Nullable<DateTime> SBKQKS_TIME2
                    {
                        get
                        {
                            return this.DateAccess["SBKQKS_TIME2"];
                        }
                        set
                        {
                            this.DateAccess["SBKQKS_TIME2"] = value;
                        }
                    }
                    /// <summary>
                    ///  #2迟到开始时间
                    /// </summary>
                    public System.Nullable<DateTime> CDKS_TIME2
                    {
                        get
                        {
                            return this.DateAccess["CDKS_TIME2"];
                        }
                        set
                        {
                            this.DateAccess["CDKS_TIME2"] = value;
                        }
                    }
                    /// <summary>
                    ///  #2严重迟到开始时间
                    /// </summary>
                    public System.Nullable<DateTime> YZCD_TIME2
                    {
                        get
                        {
                            return this.DateAccess["YZCD_TIME2"];
                        }
                        set
                        {
                            this.DateAccess["YZCD_TIME2"] = value;
                        }
                    }
                    /// <summary>
                    ///  #2上班旷工开始时间
                    /// </summary>
                    public System.Nullable<DateTime> SBKG_TIME2
                    {
                        get
                        {
                            return this.DateAccess["SBKG_TIME2"];
                        }
                        set
                        {
                            this.DateAccess["SBKG_TIME2"] = value;
                        }
                    }
                    /// <summary>
                    ///  #2下班旷工开始时间
                    /// </summary>
                    public System.Nullable<DateTime> XBKG_TIME2
                    {
                        get
                        {
                            return this.DateAccess["XBKG_TIME2"];
                        }
                        set
                        {
                            this.DateAccess["XBKG_TIME2"] = value;
                        }
                    }
                    /// <summary>
                    ///  #2下班严重早退开始时间
                    /// </summary>
                    public System.Nullable<DateTime> XBYZZTKS_TIME2
                    {
                        get
                        {
                            return this.DateAccess["XBYZZTKS_TIME2"];
                        }
                        set
                        {
                            this.DateAccess["XBYZZTKS_TIME2"] = value;
                        }
                    }
                    /// <summary>
                    ///  #2下班早退开始时间
                    /// </summary>
                    public System.Nullable<DateTime> XBZTKS_TIME2
                    {
                        get
                        {
                            return this.DateAccess["XBZTKS_TIME2"];
                        }
                        set
                        {
                            this.DateAccess["XBZTKS_TIME2"] = value;
                        }
                    }
                    /// <summary>
                    ///  #2加班开始时间
                    /// </summary>
                    public System.Nullable<DateTime> JBKS__TIME2
                    {
                        get
                        {
                            return this.DateAccess["JBKS__TIME2"];
                        }
                        set
                        {
                            this.DateAccess["JBKS__TIME2"] = value;
                        }
                    }
                    /// <summary>
                    ///  #2下班终止考勤时间
                    /// </summary>
                    public System.Nullable<DateTime> XBZZKQ_TIME2
                    {
                        get
                        {
                            return this.DateAccess["XBZZKQ_TIME2"];
                        }
                        set
                        {
                            this.DateAccess["XBZZKQ_TIME2"] = value;
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
        public MES_BD_SCX_BC SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_SCX_BC>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_SCX_BC SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_SCX_BC>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_SCX_BC> ToList()
        {
             return new EntityBuilder<MES_BD_SCX_BC>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_SCX_BC> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_SCX_BC>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_SCX_BC SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_SCX_BC SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_SCX_BC> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_SCX_BC> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_SCX_BC> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_SCX_BC>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_SCX_BC> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_SCX_BC>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_SCX_BC, MES_BD_SCX_BC_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_SCX_BC, MES_BD_SCX_BC_FIELD>();
            }
        }
		
	    public static MES_BD_SCX_BC_FIELD Fields
        {
            get { return MES_BD_SCX_BC_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_SCX_BC> EntityBuilder = new EntityBuilder<MES_BD_SCX_BC>();
    }

	internal class MES_BD_SCX_BC_COLUMN : BaseColumn
    {
        public static MES_BD_SCX_BC_COLUMN Instance;

        static MES_BD_SCX_BC_COLUMN()
        {
            Instance = new MES_BD_SCX_BC_COLUMN();
        }

        private MES_BD_SCX_BC_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FGUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DEPT", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "IS_TY", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BCBH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BCM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BCM_SHORT", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SBKQJBH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BSBYKQJBH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XBKQJBH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XBBYKQJBH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CLKH_QS_RQCZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CLKH_QS_TIME", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CLKH_JS_RQCZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CLKH_JS_TIME", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SBRQCZ1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SB_TIME1", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XBRQCZ1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XB_TIME1", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SBKQKS_TIME1", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CDKS_TIME1", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YZCD_TIME1", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SBKG_TIME1", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XBKG_TIME1", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XBYZZTKS_TIME1", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XBZTKS_TIME1", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JBKS__TIME1", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XBZZKQ_TIME1", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SBRQCZ2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SB_TIME2", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XBRQCZ2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XB_TIME2", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SBKQKS_TIME2", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CDKS_TIME2", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YZCD_TIME2", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SBKG_TIME2", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XBKG_TIME2", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XBYZZTKS_TIME2", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XBZTKS_TIME2", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JBKS__TIME2", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XBZZKQ_TIME2", Type = "DATE"  });
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
	
  public class  MES_BD_SCX_BC_FIELD
  {
       private static MES_BD_SCX_BC_FIELD instance;

        public static MES_BD_SCX_BC_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_SCX_BC_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string FGUID = "FGUID";
        public readonly string SCX = "SCX";
        public readonly string DEPT = "DEPT";
        public readonly string IS_TY = "IS_TY";
        public readonly string BH = "BH";
        public readonly string BCBH = "BCBH";
        public readonly string BCM = "BCM";
        public readonly string BCM_SHORT = "BCM_SHORT";
        public readonly string SBKQJBH = "SBKQJBH";
        public readonly string BSBYKQJBH = "BSBYKQJBH";
        public readonly string XBKQJBH = "XBKQJBH";
        public readonly string XBBYKQJBH = "XBBYKQJBH";
        public readonly string CLKH_QS_RQCZ = "CLKH_QS_RQCZ";
        public readonly string CLKH_QS_TIME = "CLKH_QS_TIME";
        public readonly string CLKH_JS_RQCZ = "CLKH_JS_RQCZ";
        public readonly string CLKH_JS_TIME = "CLKH_JS_TIME";
        public readonly string SBRQCZ1 = "SBRQCZ1";
        public readonly string SB_TIME1 = "SB_TIME1";
        public readonly string XBRQCZ1 = "XBRQCZ1";
        public readonly string XB_TIME1 = "XB_TIME1";
        public readonly string SBKQKS_TIME1 = "SBKQKS_TIME1";
        public readonly string CDKS_TIME1 = "CDKS_TIME1";
        public readonly string YZCD_TIME1 = "YZCD_TIME1";
        public readonly string SBKG_TIME1 = "SBKG_TIME1";
        public readonly string XBKG_TIME1 = "XBKG_TIME1";
        public readonly string XBYZZTKS_TIME1 = "XBYZZTKS_TIME1";
        public readonly string XBZTKS_TIME1 = "XBZTKS_TIME1";
        public readonly string JBKS__TIME1 = "JBKS__TIME1";
        public readonly string XBZZKQ_TIME1 = "XBZZKQ_TIME1";
        public readonly string SBRQCZ2 = "SBRQCZ2";
        public readonly string SB_TIME2 = "SB_TIME2";
        public readonly string XBRQCZ2 = "XBRQCZ2";
        public readonly string XB_TIME2 = "XB_TIME2";
        public readonly string SBKQKS_TIME2 = "SBKQKS_TIME2";
        public readonly string CDKS_TIME2 = "CDKS_TIME2";
        public readonly string YZCD_TIME2 = "YZCD_TIME2";
        public readonly string SBKG_TIME2 = "SBKG_TIME2";
        public readonly string XBKG_TIME2 = "XBKG_TIME2";
        public readonly string XBYZZTKS_TIME2 = "XBYZZTKS_TIME2";
        public readonly string XBZTKS_TIME2 = "XBZTKS_TIME2";
        public readonly string JBKS__TIME2 = "JBKS__TIME2";
        public readonly string XBZZKQ_TIME2 = "XBZZKQ_TIME2";
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