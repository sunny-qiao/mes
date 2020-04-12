#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_MJ_CP : EntityBase
	{
	     public MES_BD_MJ_CP()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_MJ_CP" };
		    base.Columns = MES_BD_MJ_CP_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_MJ_CP(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_MJ_CP(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_MJ_CP(EntityBase entityBase)
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
                    ///  MES_BD_MJ.GUID
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
                    ///  模具名
                    /// </summary>
                    public string MJM
                    {
                        get
                        {
                            return this.TextAccess["MJM"];
                        }
                        set
                        {
                            this.TextAccess["MJM"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品型式
                    /// </summary>
                    public string CPXS
                    {
                        get
                        {
                            return this.TextAccess["CPXS"];
                        }
                        set
                        {
                            this.TextAccess["CPXS"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认商标
                    /// </summary>
                    public string SB
                    {
                        get
                        {
                            return this.TextAccess["SB"];
                        }
                        set
                        {
                            this.TextAccess["SB"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品单重/kg
                    /// </summary>
                    public System.Nullable<double> CPDZ
                    {
                        get
                        {
                            return this.DoubleAccess["CPDZ"];
                        }
                        set
                        {
                            this.DoubleAccess["CPDZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品个数
                    /// </summary>
                    public System.Nullable<double> CPGS
                    {
                        get
                        {
                            return this.DoubleAccess["CPGS"];
                        }
                        set
                        {
                            this.DoubleAccess["CPGS"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品总重/kg
                    /// </summary>
                    public System.Nullable<double> CPZS
                    {
                        get
                        {
                            return this.DoubleAccess["CPZS"];
                        }
                        set
                        {
                            this.DoubleAccess["CPZS"] = value;
                        }
                    }
                    /// <summary>
                    ///  是否计入模具生产成品率
                    /// </summary>
                    public string IS_SCCPL
                    {
                        get
                        {
                            return this.TextAccess["IS_SCCPL"];
                        }
                        set
                        {
                            this.TextAccess["IS_SCCPL"] = value;
                        }
                    }
                    /// <summary>
                    ///  是否计入工资核算成品率
                    /// </summary>
                    public string IS_GZHSCPL
                    {
                        get
                        {
                            return this.TextAccess["IS_GZHSCPL"];
                        }
                        set
                        {
                            this.TextAccess["IS_GZHSCPL"] = value;
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
        public MES_BD_MJ_CP SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_MJ_CP>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_MJ_CP SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_MJ_CP>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_MJ_CP> ToList()
        {
             return new EntityBuilder<MES_BD_MJ_CP>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_MJ_CP> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_MJ_CP>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_MJ_CP SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_MJ_CP SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_MJ_CP> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_MJ_CP> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_MJ_CP> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_MJ_CP>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_MJ_CP> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_MJ_CP>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_MJ_CP, MES_BD_MJ_CP_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_MJ_CP, MES_BD_MJ_CP_FIELD>();
            }
        }
		
	    public static MES_BD_MJ_CP_FIELD Fields
        {
            get { return MES_BD_MJ_CP_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_MJ_CP> EntityBuilder = new EntityBuilder<MES_BD_MJ_CP>();
    }

	internal class MES_BD_MJ_CP_COLUMN : BaseColumn
    {
        public static MES_BD_MJ_CP_COLUMN Instance;

        static MES_BD_MJ_CP_COLUMN()
        {
            Instance = new MES_BD_MJ_CP_COLUMN();
        }

        private MES_BD_MJ_CP_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FGUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "MJM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CPXS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SB", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CPDZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CPGS", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CPZS", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "IS_SCCPL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "IS_GZHSCPL", Type = "TEXT"  });
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
	
  public class  MES_BD_MJ_CP_FIELD
  {
       private static MES_BD_MJ_CP_FIELD instance;

        public static MES_BD_MJ_CP_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_MJ_CP_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string FGUID = "FGUID";
        public readonly string BH = "BH";
        public readonly string MJM = "MJM";
        public readonly string CPXS = "CPXS";
        public readonly string SB = "SB";
        public readonly string CPDZ = "CPDZ";
        public readonly string CPGS = "CPGS";
        public readonly string CPZS = "CPZS";
        public readonly string IS_SCCPL = "IS_SCCPL";
        public readonly string IS_GZHSCPL = "IS_GZHSCPL";
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