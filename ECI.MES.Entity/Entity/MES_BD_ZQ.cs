#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_ZQ : EntityBase
	{
	     public MES_BD_ZQ()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_ZQ" };
		    base.Columns = MES_BD_ZQ_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_ZQ(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_ZQ(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_ZQ(EntityBase entityBase)
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
                    ///  账期名
                    /// </summary>
                    public string ZQM
                    {
                        get
                        {
                            return this.TextAccess["ZQM"];
                        }
                        set
                        {
                            this.TextAccess["ZQM"] = value;
                        }
                    }
                    /// <summary>
                    ///  账期结账月份
                    /// </summary>
                    public string JZYF
                    {
                        get
                        {
                            return this.TextAccess["JZYF"];
                        }
                        set
                        {
                            this.TextAccess["JZYF"] = value;
                        }
                    }
                    /// <summary>
                    ///  账期起始日期
                    /// </summary>
                    public System.Nullable<DateTime> QSRQ
                    {
                        get
                        {
                            return this.DateAccess["QSRQ"];
                        }
                        set
                        {
                            this.DateAccess["QSRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  账期结账日期
                    /// </summary>
                    public System.Nullable<DateTime> JZRQ
                    {
                        get
                        {
                            return this.DateAccess["JZRQ"];
                        }
                        set
                        {
                            this.DateAccess["JZRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  该账期实际天数
                    /// </summary>
                    public System.Nullable<double> SJTS
                    {
                        get
                        {
                            return this.DoubleAccess["SJTS"];
                        }
                        set
                        {
                            this.DoubleAccess["SJTS"] = value;
                        }
                    }
                    /// <summary>
                    ///  是否已经结账
                    /// </summary>
                    public string IS_JZ
                    {
                        get
                        {
                            return this.TextAccess["IS_JZ"];
                        }
                        set
                        {
                            this.TextAccess["IS_JZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  结账人
                    /// </summary>
                    public string JZR
                    {
                        get
                        {
                            return this.TextAccess["JZR"];
                        }
                        set
                        {
                            this.TextAccess["JZR"] = value;
                        }
                    }
                    /// <summary>
                    ///  审核人
                    /// </summary>
                    public string SHR
                    {
                        get
                        {
                            return this.TextAccess["SHR"];
                        }
                        set
                        {
                            this.TextAccess["SHR"] = value;
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
        public MES_BD_ZQ SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_ZQ>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_ZQ SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_ZQ>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_ZQ> ToList()
        {
             return new EntityBuilder<MES_BD_ZQ>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_ZQ> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_ZQ>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_ZQ SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_ZQ SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_ZQ> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_ZQ> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_ZQ> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_ZQ>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_ZQ> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_ZQ>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_ZQ, MES_BD_ZQ_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_ZQ, MES_BD_ZQ_FIELD>();
            }
        }
		
	    public static MES_BD_ZQ_FIELD Fields
        {
            get { return MES_BD_ZQ_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_ZQ> EntityBuilder = new EntityBuilder<MES_BD_ZQ>();
    }

	internal class MES_BD_ZQ_COLUMN : BaseColumn
    {
        public static MES_BD_ZQ_COLUMN Instance;

        static MES_BD_ZQ_COLUMN()
        {
            Instance = new MES_BD_ZQ_COLUMN();
        }

        private MES_BD_ZQ_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZQM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JZYF", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "QSRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JZRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SJTS", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "IS_JZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JZR", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SHR", Type = "TEXT"  });
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
	
  public class  MES_BD_ZQ_FIELD
  {
       private static MES_BD_ZQ_FIELD instance;

        public static MES_BD_ZQ_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_ZQ_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string BH = "BH";
        public readonly string ZQM = "ZQM";
        public readonly string JZYF = "JZYF";
        public readonly string QSRQ = "QSRQ";
        public readonly string JZRQ = "JZRQ";
        public readonly string SJTS = "SJTS";
        public readonly string IS_JZ = "IS_JZ";
        public readonly string JZR = "JZR";
        public readonly string SHR = "SHR";
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