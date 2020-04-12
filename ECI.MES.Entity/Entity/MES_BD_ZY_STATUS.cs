#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_ZY_STATUS : EntityBase
	{
	     public MES_BD_ZY_STATUS()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_ZY_STATUS" };
		    base.Columns = MES_BD_ZY_STATUS_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_ZY_STATUS(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_ZY_STATUS(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_ZY_STATUS(EntityBase entityBase)
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
                    ///  MES_BD_ZY.GUID
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
                    ///  职员
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
                    ///  入职日期
                    /// </summary>
                    public System.Nullable<DateTime> RZ_DATE
                    {
                        get
                        {
                            return this.DateAccess["RZ_DATE"];
                        }
                        set
                        {
                            this.DateAccess["RZ_DATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  离职/转岗日期
                    /// </summary>
                    public System.Nullable<DateTime> LZ_DATE
                    {
                        get
                        {
                            return this.DateAccess["LZ_DATE"];
                        }
                        set
                        {
                            this.DateAccess["LZ_DATE"] = value;
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
                    ///  所属生产线
                    /// </summary>
                    public string SSCSCX
                    {
                        get
                        {
                            return this.TextAccess["SSCSCX"];
                        }
                        set
                        {
                            this.TextAccess["SSCSCX"] = value;
                        }
                    }
                    /// <summary>
                    ///  职务
                    /// </summary>
                    public string ZW
                    {
                        get
                        {
                            return this.TextAccess["ZW"];
                        }
                        set
                        {
                            this.TextAccess["ZW"] = value;
                        }
                    }
                    /// <summary>
                    ///  工种
                    /// </summary>
                    public string GZ
                    {
                        get
                        {
                            return this.TextAccess["GZ"];
                        }
                        set
                        {
                            this.TextAccess["GZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  所属班组
                    /// </summary>
                    public string SSBZ
                    {
                        get
                        {
                            return this.TextAccess["SSBZ"];
                        }
                        set
                        {
                            this.TextAccess["SSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  工种计件工资比例
                    /// </summary>
                    public System.Nullable<double> GZJJGZBL
                    {
                        get
                        {
                            return this.DoubleAccess["GZJJGZBL"];
                        }
                        set
                        {
                            this.DoubleAccess["GZJJGZBL"] = value;
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
        public MES_BD_ZY_STATUS SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_ZY_STATUS>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_ZY_STATUS SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_ZY_STATUS>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_ZY_STATUS> ToList()
        {
             return new EntityBuilder<MES_BD_ZY_STATUS>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_ZY_STATUS> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_ZY_STATUS>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_ZY_STATUS SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_ZY_STATUS SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_ZY_STATUS> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_ZY_STATUS> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_ZY_STATUS> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_ZY_STATUS>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_ZY_STATUS> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_ZY_STATUS>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_ZY_STATUS, MES_BD_ZY_STATUS_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_ZY_STATUS, MES_BD_ZY_STATUS_FIELD>();
            }
        }
		
	    public static MES_BD_ZY_STATUS_FIELD Fields
        {
            get { return MES_BD_ZY_STATUS_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_ZY_STATUS> EntityBuilder = new EntityBuilder<MES_BD_ZY_STATUS>();
    }

	internal class MES_BD_ZY_STATUS_COLUMN : BaseColumn
    {
        public static MES_BD_ZY_STATUS_COLUMN Instance;

        static MES_BD_ZY_STATUS_COLUMN()
        {
            Instance = new MES_BD_ZY_STATUS_COLUMN();
        }

        private MES_BD_ZY_STATUS_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FGUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "RZ_DATE", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LZ_DATE", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SSCJ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SSCSCX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZW", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SSBZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GZJJGZBL", Type = "NUMBER"  });
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
	
  public class  MES_BD_ZY_STATUS_FIELD
  {
       private static MES_BD_ZY_STATUS_FIELD instance;

        public static MES_BD_ZY_STATUS_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_ZY_STATUS_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string FGUID = "FGUID";
        public readonly string NAME = "NAME";
        public readonly string RZ_DATE = "RZ_DATE";
        public readonly string LZ_DATE = "LZ_DATE";
        public readonly string SSCJ = "SSCJ";
        public readonly string SSCSCX = "SSCSCX";
        public readonly string ZW = "ZW";
        public readonly string GZ = "GZ";
        public readonly string SSBZ = "SSBZ";
        public readonly string GZJJGZBL = "GZJJGZBL";
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