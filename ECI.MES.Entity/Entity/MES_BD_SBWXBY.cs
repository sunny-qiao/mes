#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_SBWXBY : EntityBase
	{
	     public MES_BD_SBWXBY()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_SBWXBY" };
		    base.Columns = MES_BD_SBWXBY_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_SBWXBY(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_SBWXBY(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_SBWXBY(EntityBase entityBase)
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
                    ///  对应设备名
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
                    ///  维修保养内容
                    /// </summary>
                    public string WXBYNR
                    {
                        get
                        {
                            return this.TextAccess["WXBYNR"];
                        }
                        set
                        {
                            this.TextAccess["WXBYNR"] = value;
                        }
                    }
                    /// <summary>
                    ///  维修保养对应工作量调用生产线
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
                    ///  工作量对应单位
                    /// </summary>
                    public string UNIT
                    {
                        get
                        {
                            return this.TextAccess["UNIT"];
                        }
                        set
                        {
                            this.TextAccess["UNIT"] = value;
                        }
                    }
                    /// <summary>
                    ///  维修保养工作量限额
                    /// </summary>
                    public System.Nullable<double> WXBYXE
                    {
                        get
                        {
                            return this.DoubleAccess["WXBYXE"];
                        }
                        set
                        {
                            this.DoubleAccess["WXBYXE"] = value;
                        }
                    }
                    /// <summary>
                    ///  提醒工作量限额
                    /// </summary>
                    public System.Nullable<double> TXXE
                    {
                        get
                        {
                            return this.DoubleAccess["TXXE"];
                        }
                        set
                        {
                            this.DoubleAccess["TXXE"] = value;
                        }
                    }
                    /// <summary>
                    ///  工作量最大限额
                    /// </summary>
                    public System.Nullable<double> ZDXE
                    {
                        get
                        {
                            return this.DoubleAccess["ZDXE"];
                        }
                        set
                        {
                            this.DoubleAccess["ZDXE"] = value;
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
        public MES_BD_SBWXBY SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_SBWXBY>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_SBWXBY SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_SBWXBY>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_SBWXBY> ToList()
        {
             return new EntityBuilder<MES_BD_SBWXBY>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_SBWXBY> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_SBWXBY>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_SBWXBY SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_SBWXBY SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_SBWXBY> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_SBWXBY> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_SBWXBY> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_SBWXBY>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_SBWXBY> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_SBWXBY>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_SBWXBY, MES_BD_SBWXBY_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_SBWXBY, MES_BD_SBWXBY_FIELD>();
            }
        }
		
	    public static MES_BD_SBWXBY_FIELD Fields
        {
            get { return MES_BD_SBWXBY_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_SBWXBY> EntityBuilder = new EntityBuilder<MES_BD_SBWXBY>();
    }

	internal class MES_BD_SBWXBY_COLUMN : BaseColumn
    {
        public static MES_BD_SBWXBY_COLUMN Instance;

        static MES_BD_SBWXBY_COLUMN()
        {
            Instance = new MES_BD_SBWXBY_COLUMN();
        }

        private MES_BD_SBWXBY_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "WXBYNR", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "UNIT", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "WXBYXE", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TXXE", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZDXE", Type = "NUMBER"  });
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
	
  public class  MES_BD_SBWXBY_FIELD
  {
       private static MES_BD_SBWXBY_FIELD instance;

        public static MES_BD_SBWXBY_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_SBWXBY_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string BH = "BH";
        public readonly string NAME = "NAME";
        public readonly string WXBYNR = "WXBYNR";
        public readonly string SCX = "SCX";
        public readonly string UNIT = "UNIT";
        public readonly string WXBYXE = "WXBYXE";
        public readonly string TXXE = "TXXE";
        public readonly string ZDXE = "ZDXE";
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