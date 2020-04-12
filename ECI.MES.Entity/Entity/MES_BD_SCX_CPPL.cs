#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_SCX_CPPL : EntityBase
	{
	     public MES_BD_SCX_CPPL()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_SCX_CPPL" };
		    base.Columns = MES_BD_SCX_CPPL_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_SCX_CPPL(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_SCX_CPPL(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_SCX_CPPL(EntityBase entityBase)
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
                    ///  生产线
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
                    ///  产品/配料名
                    /// </summary>
                    public string CPM
                    {
                        get
                        {
                            return this.TextAccess["CPM"];
                        }
                        set
                        {
                            this.TextAccess["CPM"] = value;
                        }
                    }
                    /// <summary>
                    ///  依生产数据用量参数
                    /// </summary>
                    public string YSCSJYLCS
                    {
                        get
                        {
                            return this.TextAccess["YSCSJYLCS"];
                        }
                        set
                        {
                            this.TextAccess["YSCSJYLCS"] = value;
                        }
                    }
                    /// <summary>
                    ///  该参数比值
                    /// </summary>
                    public System.Nullable<double> GCSBZ
                    {
                        get
                        {
                            return this.DoubleAccess["GCSBZ"];
                        }
                        set
                        {
                            this.DoubleAccess["GCSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  依产品/配料1计算
                    /// </summary>
                    public string YCPJS1
                    {
                        get
                        {
                            return this.TextAccess["YCPJS1"];
                        }
                        set
                        {
                            this.TextAccess["YCPJS1"] = value;
                        }
                    }
                    /// <summary>
                    ///  依产品/配料1计算比值
                    /// </summary>
                    public System.Nullable<double> YCPJSBZ1
                    {
                        get
                        {
                            return this.DoubleAccess["YCPJSBZ1"];
                        }
                        set
                        {
                            this.DoubleAccess["YCPJSBZ1"] = value;
                        }
                    }
                    /// <summary>
                    ///  依产品/配料2计算
                    /// </summary>
                    public string YCPJS2
                    {
                        get
                        {
                            return this.TextAccess["YCPJS2"];
                        }
                        set
                        {
                            this.TextAccess["YCPJS2"] = value;
                        }
                    }
                    /// <summary>
                    ///  依产品/配料2计算比值
                    /// </summary>
                    public System.Nullable<double> YCPJSBZ2
                    {
                        get
                        {
                            return this.DoubleAccess["YCPJSBZ2"];
                        }
                        set
                        {
                            this.DoubleAccess["YCPJSBZ2"] = value;
                        }
                    }
                    /// <summary>
                    ///  依产品/配料3计算
                    /// </summary>
                    public string YCPJS3
                    {
                        get
                        {
                            return this.TextAccess["YCPJS3"];
                        }
                        set
                        {
                            this.TextAccess["YCPJS3"] = value;
                        }
                    }
                    /// <summary>
                    ///  依产品/配料3计算比值
                    /// </summary>
                    public System.Nullable<double> YCPJSBZ3
                    {
                        get
                        {
                            return this.DoubleAccess["YCPJSBZ3"];
                        }
                        set
                        {
                            this.DoubleAccess["YCPJSBZ3"] = value;
                        }
                    }
                    /// <summary>
                    ///  依产品/配料4计算
                    /// </summary>
                    public string YCPJS4
                    {
                        get
                        {
                            return this.TextAccess["YCPJS4"];
                        }
                        set
                        {
                            this.TextAccess["YCPJS4"] = value;
                        }
                    }
                    /// <summary>
                    ///  依产品/配料4计算比值
                    /// </summary>
                    public System.Nullable<double> YCPJSBZ4
                    {
                        get
                        {
                            return this.DoubleAccess["YCPJSBZ4"];
                        }
                        set
                        {
                            this.DoubleAccess["YCPJSBZ4"] = value;
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
        public MES_BD_SCX_CPPL SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_SCX_CPPL>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_SCX_CPPL SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_SCX_CPPL>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_SCX_CPPL> ToList()
        {
             return new EntityBuilder<MES_BD_SCX_CPPL>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_SCX_CPPL> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_SCX_CPPL>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_SCX_CPPL SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_SCX_CPPL SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_SCX_CPPL> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_SCX_CPPL> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_SCX_CPPL> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_SCX_CPPL>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_SCX_CPPL> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_SCX_CPPL>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_SCX_CPPL, MES_BD_SCX_CPPL_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_SCX_CPPL, MES_BD_SCX_CPPL_FIELD>();
            }
        }
		
	    public static MES_BD_SCX_CPPL_FIELD Fields
        {
            get { return MES_BD_SCX_CPPL_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_SCX_CPPL> EntityBuilder = new EntityBuilder<MES_BD_SCX_CPPL>();
    }

	internal class MES_BD_SCX_CPPL_COLUMN : BaseColumn
    {
        public static MES_BD_SCX_CPPL_COLUMN Instance;

        static MES_BD_SCX_CPPL_COLUMN()
        {
            Instance = new MES_BD_SCX_CPPL_COLUMN();
        }

        private MES_BD_SCX_CPPL_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FGUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CPM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YSCSJYLCS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GCSBZ", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YCPJS1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YCPJSBZ1", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YCPJS2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YCPJSBZ2", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YCPJS3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YCPJSBZ3", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YCPJS4", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YCPJSBZ4", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CKCK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "RKCK", Type = "TEXT"  });
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
	
  public class  MES_BD_SCX_CPPL_FIELD
  {
       private static MES_BD_SCX_CPPL_FIELD instance;

        public static MES_BD_SCX_CPPL_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_SCX_CPPL_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string FGUID = "FGUID";
        public readonly string SCX = "SCX";
        public readonly string BH = "BH";
        public readonly string CPM = "CPM";
        public readonly string YSCSJYLCS = "YSCSJYLCS";
        public readonly string GCSBZ = "GCSBZ";
        public readonly string YCPJS1 = "YCPJS1";
        public readonly string YCPJSBZ1 = "YCPJSBZ1";
        public readonly string YCPJS2 = "YCPJS2";
        public readonly string YCPJSBZ2 = "YCPJSBZ2";
        public readonly string YCPJS3 = "YCPJS3";
        public readonly string YCPJSBZ3 = "YCPJSBZ3";
        public readonly string YCPJS4 = "YCPJS4";
        public readonly string YCPJSBZ4 = "YCPJSBZ4";
        public readonly string CKCK = "CKCK";
        public readonly string RKCK = "RKCK";
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