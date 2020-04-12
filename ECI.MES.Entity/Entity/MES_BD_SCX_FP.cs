#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_SCX_FP : EntityBase
	{
	     public MES_BD_SCX_FP()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_SCX_FP" };
		    base.Columns = MES_BD_SCX_FP_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_SCX_FP(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_SCX_FP(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_SCX_FP(EntityBase entityBase)
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
                    ///  对应生产线名
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
                    ///  废品名
                    /// </summary>
                    public string FPM
                    {
                        get
                        {
                            return this.TextAccess["FPM"];
                        }
                        set
                        {
                            this.TextAccess["FPM"] = value;
                        }
                    }
                    /// <summary>
                    ///  转为回炉料比例
                    /// </summary>
                    public System.Nullable<double> HLLBL
                    {
                        get
                        {
                            return this.DoubleAccess["HLLBL"];
                        }
                        set
                        {
                            this.DoubleAccess["HLLBL"] = value;
                        }
                    }
                    /// <summary>
                    ///  转为回炉料入库仓库
                    /// </summary>
                    public string HLLRKCK
                    {
                        get
                        {
                            return this.TextAccess["HLLRKCK"];
                        }
                        set
                        {
                            this.TextAccess["HLLRKCK"] = value;
                        }
                    }
                    /// <summary>
                    ///  转为二级品比例
                    /// </summary>
                    public System.Nullable<double> EJPBL
                    {
                        get
                        {
                            return this.DoubleAccess["EJPBL"];
                        }
                        set
                        {
                            this.DoubleAccess["EJPBL"] = value;
                        }
                    }
                    /// <summary>
                    ///  二级片处理工序
                    /// </summary>
                    public string EJPCLGX
                    {
                        get
                        {
                            return this.TextAccess["EJPCLGX"];
                        }
                        set
                        {
                            this.TextAccess["EJPCLGX"] = value;
                        }
                    }
                    /// <summary>
                    ///  转为二级品入库仓库
                    /// </summary>
                    public string EJPRKCK
                    {
                        get
                        {
                            return this.TextAccess["EJPRKCK"];
                        }
                        set
                        {
                            this.TextAccess["EJPRKCK"] = value;
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
        public MES_BD_SCX_FP SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_SCX_FP>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_SCX_FP SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_SCX_FP>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_SCX_FP> ToList()
        {
             return new EntityBuilder<MES_BD_SCX_FP>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_SCX_FP> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_SCX_FP>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_SCX_FP SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_SCX_FP SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_SCX_FP> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_SCX_FP> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_SCX_FP> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_SCX_FP>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_SCX_FP> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_SCX_FP>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_SCX_FP, MES_BD_SCX_FP_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_SCX_FP, MES_BD_SCX_FP_FIELD>();
            }
        }
		
	    public static MES_BD_SCX_FP_FIELD Fields
        {
            get { return MES_BD_SCX_FP_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_SCX_FP> EntityBuilder = new EntityBuilder<MES_BD_SCX_FP>();
    }

	internal class MES_BD_SCX_FP_COLUMN : BaseColumn
    {
        public static MES_BD_SCX_FP_COLUMN Instance;

        static MES_BD_SCX_FP_COLUMN()
        {
            Instance = new MES_BD_SCX_FP_COLUMN();
        }

        private MES_BD_SCX_FP_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FGUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FPM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "HLLBL", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "HLLRKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "EJPBL", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "EJPCLGX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "EJPRKCK", Type = "TEXT"  });
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
	
  public class  MES_BD_SCX_FP_FIELD
  {
       private static MES_BD_SCX_FP_FIELD instance;

        public static MES_BD_SCX_FP_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_SCX_FP_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string FGUID = "FGUID";
        public readonly string SCX = "SCX";
        public readonly string BH = "BH";
        public readonly string FPM = "FPM";
        public readonly string HLLBL = "HLLBL";
        public readonly string HLLRKCK = "HLLRKCK";
        public readonly string EJPBL = "EJPBL";
        public readonly string EJPCLGX = "EJPCLGX";
        public readonly string EJPRKCK = "EJPRKCK";
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