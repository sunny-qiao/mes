#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_SCX_BC_TQYJL : EntityBase
	{
	     public MES_BD_SCX_BC_TQYJL()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_SCX_BC_TQYJL" };
		    base.Columns = MES_BD_SCX_BC_TQYJL_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_SCX_BC_TQYJL(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_SCX_BC_TQYJL(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_SCX_BC_TQYJL(EntityBase entityBase)
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
                    ///  MES_BD_SCX_BC.GUID
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
                    ///  MES_BD_SCX.GUID
                    /// </summary>
                    public string SCX_GUID
                    {
                        get
                        {
                            return this.TextAccess["SCX_GUID"];
                        }
                        set
                        {
                            this.TextAccess["SCX_GUID"] = value;
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
                    ///  对应班次名
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
                    ///  启用日期
                    /// </summary>
                    public System.Nullable<DateTime> QY_DATE
                    {
                        get
                        {
                            return this.DateAccess["QY_DATE"];
                        }
                        set
                        {
                            this.DateAccess["QY_DATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  停用日期
                    /// </summary>
                    public System.Nullable<DateTime> TY_DATE
                    {
                        get
                        {
                            return this.DateAccess["TY_DATE"];
                        }
                        set
                        {
                            this.DateAccess["TY_DATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  启用原因
                    /// </summary>
                    public string QY_YY
                    {
                        get
                        {
                            return this.TextAccess["QY_YY"];
                        }
                        set
                        {
                            this.TextAccess["QY_YY"] = value;
                        }
                    }
                    /// <summary>
                    ///  停用原因
                    /// </summary>
                    public string TY_YY
                    {
                        get
                        {
                            return this.TextAccess["TY_YY"];
                        }
                        set
                        {
                            this.TextAccess["TY_YY"] = value;
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
        public MES_BD_SCX_BC_TQYJL SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_SCX_BC_TQYJL>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_SCX_BC_TQYJL SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_SCX_BC_TQYJL>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_SCX_BC_TQYJL> ToList()
        {
             return new EntityBuilder<MES_BD_SCX_BC_TQYJL>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_SCX_BC_TQYJL> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_SCX_BC_TQYJL>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_SCX_BC_TQYJL SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_SCX_BC_TQYJL SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_SCX_BC_TQYJL> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_SCX_BC_TQYJL> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_SCX_BC_TQYJL> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_SCX_BC_TQYJL>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_SCX_BC_TQYJL> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_SCX_BC_TQYJL>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_SCX_BC_TQYJL, MES_BD_SCX_BC_TQYJL_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_SCX_BC_TQYJL, MES_BD_SCX_BC_TQYJL_FIELD>();
            }
        }
		
	    public static MES_BD_SCX_BC_TQYJL_FIELD Fields
        {
            get { return MES_BD_SCX_BC_TQYJL_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_SCX_BC_TQYJL> EntityBuilder = new EntityBuilder<MES_BD_SCX_BC_TQYJL>();
    }

	internal class MES_BD_SCX_BC_TQYJL_COLUMN : BaseColumn
    {
        public static MES_BD_SCX_BC_TQYJL_COLUMN Instance;

        static MES_BD_SCX_BC_TQYJL_COLUMN()
        {
            Instance = new MES_BD_SCX_BC_TQYJL_COLUMN();
        }

        private MES_BD_SCX_BC_TQYJL_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FGUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCX_GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BCM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "QY_DATE", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TY_DATE", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "QY_YY", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TY_YY", Type = "TEXT"  });
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
	
  public class  MES_BD_SCX_BC_TQYJL_FIELD
  {
       private static MES_BD_SCX_BC_TQYJL_FIELD instance;

        public static MES_BD_SCX_BC_TQYJL_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_SCX_BC_TQYJL_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string FGUID = "FGUID";
        public readonly string SCX_GUID = "SCX_GUID";
        public readonly string SCX = "SCX";
        public readonly string BCM = "BCM";
        public readonly string QY_DATE = "QY_DATE";
        public readonly string TY_DATE = "TY_DATE";
        public readonly string QY_YY = "QY_YY";
        public readonly string TY_YY = "TY_YY";
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