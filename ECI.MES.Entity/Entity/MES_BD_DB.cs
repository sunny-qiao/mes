#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_DB : EntityBase
	{
	     public MES_BD_DB()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_DB" };
		    base.Columns = MES_BD_DB_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_DB(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_DB(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_DB(EntityBase entityBase)
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
                    ///  电表编码
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
                    ///  电表名
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
                    ///  电表位置
                    /// </summary>
                    public string WZ
                    {
                        get
                        {
                            return this.TextAccess["WZ"];
                        }
                        set
                        {
                            this.TextAccess["WZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  电表倍率
                    /// </summary>
                    public System.Nullable<double> BL
                    {
                        get
                        {
                            return this.DoubleAccess["BL"];
                        }
                        set
                        {
                            this.DoubleAccess["BL"] = value;
                        }
                    }
                    /// <summary>
                    ///  电表状态
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
                    ///  电表启用日期
                    /// </summary>
                    public System.Nullable<DateTime> QYRQ
                    {
                        get
                        {
                            return this.DateAccess["QYRQ"];
                        }
                        set
                        {
                            this.DateAccess["QYRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  电表停用日期
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
                    ///  电表计量偏差百分比
                    /// </summary>
                    public string JLPCBFB
                    {
                        get
                        {
                            return this.TextAccess["JLPCBFB"];
                        }
                        set
                        {
                            this.TextAccess["JLPCBFB"] = value;
                        }
                    }
                    /// <summary>
                    ///  电表默认查表时间
                    /// </summary>
                    public System.Nullable<DateTime> CPSJ
                    {
                        get
                        {
                            return this.DateAccess["CPSJ"];
                        }
                        set
                        {
                            this.DateAccess["CPSJ"] = value;
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
        public MES_BD_DB SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_DB>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_DB SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_DB>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_DB> ToList()
        {
             return new EntityBuilder<MES_BD_DB>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_DB> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_DB>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_DB SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_DB SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_DB> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_DB> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_DB> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_DB>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_DB> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_DB>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_DB, MES_BD_DB_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_DB, MES_BD_DB_FIELD>();
            }
        }
		
	    public static MES_BD_DB_FIELD Fields
        {
            get { return MES_BD_DB_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_DB> EntityBuilder = new EntityBuilder<MES_BD_DB>();
    }

	internal class MES_BD_DB_COLUMN : BaseColumn
    {
        public static MES_BD_DB_COLUMN Instance;

        static MES_BD_DB_COLUMN()
        {
            Instance = new MES_BD_DB_COLUMN();
        }

        private MES_BD_DB_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "WZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BL", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "STATUS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "QYRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TYRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JLPCBFB", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CPSJ", Type = "DATE"  });
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
	
  public class  MES_BD_DB_FIELD
  {
       private static MES_BD_DB_FIELD instance;

        public static MES_BD_DB_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_DB_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string BH = "BH";
        public readonly string NAME = "NAME";
        public readonly string WZ = "WZ";
        public readonly string BL = "BL";
        public readonly string STATUS = "STATUS";
        public readonly string QYRQ = "QYRQ";
        public readonly string TYRQ = "TYRQ";
        public readonly string JLPCBFB = "JLPCBFB";
        public readonly string CPSJ = "CPSJ";
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