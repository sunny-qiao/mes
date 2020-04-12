#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_GX : EntityBase
	{
	     public MES_BD_GX()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_GX" };
		    base.Columns = MES_BD_GX_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_GX(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_GX(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_GX(EntityBase entityBase)
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
                    ///  工序编号
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
                    ///  工序名
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
                    ///  默认入库仓库
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
                    ///  默认出库产品前置名
                    /// </summary>
                    public string CKCPQZM
                    {
                        get
                        {
                            return this.TextAccess["CKCPQZM"];
                        }
                        set
                        {
                            this.TextAccess["CKCPQZM"] = value;
                        }
                    }
                    /// <summary>
                    ///  默认入库产品前置名
                    /// </summary>
                    public string RKCPQZM
                    {
                        get
                        {
                            return this.TextAccess["RKCPQZM"];
                        }
                        set
                        {
                            this.TextAccess["RKCPQZM"] = value;
                        }
                    }
                    /// <summary>
                    ///  表面处理用原料
                    /// </summary>
                    public string BMCLYL
                    {
                        get
                        {
                            return this.TextAccess["BMCLYL"];
                        }
                        set
                        {
                            this.TextAccess["BMCLYL"] = value;
                        }
                    }
                    /// <summary>
                    ///  该表面处理原料密度kg/cm^3
                    /// </summary>
                    public System.Nullable<double> MD
                    {
                        get
                        {
                            return this.DoubleAccess["MD"];
                        }
                        set
                        {
                            this.DoubleAccess["MD"] = value;
                        }
                    }
                    /// <summary>
                    ///  理论表面处理原料损耗百分比
                    /// </summary>
                    public System.Nullable<double> YLSH
                    {
                        get
                        {
                            return this.DoubleAccess["YLSH"];
                        }
                        set
                        {
                            this.DoubleAccess["YLSH"] = value;
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
        public MES_BD_GX SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_GX>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_GX SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_GX>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_GX> ToList()
        {
             return new EntityBuilder<MES_BD_GX>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_GX> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_GX>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_GX SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_GX SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_GX> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_GX> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_GX> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_GX>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_GX> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_GX>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_GX, MES_BD_GX_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_GX, MES_BD_GX_FIELD>();
            }
        }
		
	    public static MES_BD_GX_FIELD Fields
        {
            get { return MES_BD_GX_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_GX> EntityBuilder = new EntityBuilder<MES_BD_GX>();
    }

	internal class MES_BD_GX_COLUMN : BaseColumn
    {
        public static MES_BD_GX_COLUMN Instance;

        static MES_BD_GX_COLUMN()
        {
            Instance = new MES_BD_GX_COLUMN();
        }

        private MES_BD_GX_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "RKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CKCPQZM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "RKCPQZM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BMCLYL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "MD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YLSH", Type = "NUMBER"  });
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
	
  public class  MES_BD_GX_FIELD
  {
       private static MES_BD_GX_FIELD instance;

        public static MES_BD_GX_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_GX_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string BH = "BH";
        public readonly string NAME = "NAME";
        public readonly string CKCK = "CKCK";
        public readonly string RKCK = "RKCK";
        public readonly string CKCPQZM = "CKCPQZM";
        public readonly string RKCPQZM = "RKCPQZM";
        public readonly string BMCLYL = "BMCLYL";
        public readonly string MD = "MD";
        public readonly string YLSH = "YLSH";
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