#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_WLPL : EntityBase
	{
	     public MES_BD_WLPL()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_WLPL" };
		    base.Columns = MES_BD_WLPL_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_WLPL(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_WLPL(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_WLPL(EntityBase entityBase)
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
                    ///  物料品类编号
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
                    ///  商标
                    /// </summary>
                    public string SB_CODE
                    {
                        get
                        {
                            return this.TextAccess["SB_CODE"];
                        }
                        set
                        {
                            this.TextAccess["SB_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  物料品类名
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
                    ///  物料品类全名
                    /// </summary>
                    public string QNAME
                    {
                        get
                        {
                            return this.TextAccess["QNAME"];
                        }
                        set
                        {
                            this.TextAccess["QNAME"] = value;
                        }
                    }
                    /// <summary>
                    ///  物料品类代码
                    /// </summary>
                    public string CODE
                    {
                        get
                        {
                            return this.TextAccess["CODE"];
                        }
                        set
                        {
                            this.TextAccess["CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  对应产品型式1
                    /// </summary>
                    public string CPXS1
                    {
                        get
                        {
                            return this.TextAccess["CPXS1"];
                        }
                        set
                        {
                            this.TextAccess["CPXS1"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品型式1优先级别
                    /// </summary>
                    public string CPXS1_LEVEL
                    {
                        get
                        {
                            return this.TextAccess["CPXS1_LEVEL"];
                        }
                        set
                        {
                            this.TextAccess["CPXS1_LEVEL"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品型式1备注
                    /// </summary>
                    public string REMARK1
                    {
                        get
                        {
                            return this.TextAccess["REMARK1"];
                        }
                        set
                        {
                            this.TextAccess["REMARK1"] = value;
                        }
                    }
                    /// <summary>
                    ///  对应产品型式2
                    /// </summary>
                    public string CPXS2
                    {
                        get
                        {
                            return this.TextAccess["CPXS2"];
                        }
                        set
                        {
                            this.TextAccess["CPXS2"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品型式2优先级别
                    /// </summary>
                    public string CPXS2_LEVEL
                    {
                        get
                        {
                            return this.TextAccess["CPXS2_LEVEL"];
                        }
                        set
                        {
                            this.TextAccess["CPXS2_LEVEL"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品型式2备注
                    /// </summary>
                    public string REMARK2
                    {
                        get
                        {
                            return this.TextAccess["REMARK2"];
                        }
                        set
                        {
                            this.TextAccess["REMARK2"] = value;
                        }
                    }
                    /// <summary>
                    ///  对应产品型式3
                    /// </summary>
                    public string CPXS3
                    {
                        get
                        {
                            return this.TextAccess["CPXS3"];
                        }
                        set
                        {
                            this.TextAccess["CPXS3"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品型式3优先级别
                    /// </summary>
                    public string CPXS3_LEVEL
                    {
                        get
                        {
                            return this.TextAccess["CPXS3_LEVEL"];
                        }
                        set
                        {
                            this.TextAccess["CPXS3_LEVEL"] = value;
                        }
                    }
                    /// <summary>
                    ///  产品型式3备注
                    /// </summary>
                    public string REMARK3
                    {
                        get
                        {
                            return this.TextAccess["REMARK3"];
                        }
                        set
                        {
                            this.TextAccess["REMARK3"] = value;
                        }
                    }
                    /// <summary>
                    ///  统计类别1
                    /// </summary>
                    public string TJLB1
                    {
                        get
                        {
                            return this.TextAccess["TJLB1"];
                        }
                        set
                        {
                            this.TextAccess["TJLB1"] = value;
                        }
                    }
                    /// <summary>
                    ///  统计类别2
                    /// </summary>
                    public string TJLB2
                    {
                        get
                        {
                            return this.TextAccess["TJLB2"];
                        }
                        set
                        {
                            this.TextAccess["TJLB2"] = value;
                        }
                    }
                    /// <summary>
                    ///  统计类别3
                    /// </summary>
                    public string TJLB3
                    {
                        get
                        {
                            return this.TextAccess["TJLB3"];
                        }
                        set
                        {
                            this.TextAccess["TJLB3"] = value;
                        }
                    }
                    /// <summary>
                    ///  统计类别4
                    /// </summary>
                    public string TJLB4
                    {
                        get
                        {
                            return this.TextAccess["TJLB4"];
                        }
                        set
                        {
                            this.TextAccess["TJLB4"] = value;
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
        public MES_BD_WLPL SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_WLPL>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_WLPL SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_WLPL>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_WLPL> ToList()
        {
             return new EntityBuilder<MES_BD_WLPL>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_WLPL> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_WLPL>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_WLPL SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_WLPL SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_WLPL> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_WLPL> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_WLPL> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_WLPL>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_WLPL> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_WLPL>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_WLPL, MES_BD_WLPL_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_WLPL, MES_BD_WLPL_FIELD>();
            }
        }
		
	    public static MES_BD_WLPL_FIELD Fields
        {
            get { return MES_BD_WLPL_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_WLPL> EntityBuilder = new EntityBuilder<MES_BD_WLPL>();
    }

	internal class MES_BD_WLPL_COLUMN : BaseColumn
    {
        public static MES_BD_WLPL_COLUMN Instance;

        static MES_BD_WLPL_COLUMN()
        {
            Instance = new MES_BD_WLPL_COLUMN();
        }

        private MES_BD_WLPL_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SB_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "QNAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CPXS1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CPXS1_LEVEL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "REMARK1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CPXS2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CPXS2_LEVEL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "REMARK2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CPXS3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CPXS3_LEVEL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "REMARK3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TJLB1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TJLB2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TJLB3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TJLB4", Type = "TEXT"  });
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
	
  public class  MES_BD_WLPL_FIELD
  {
       private static MES_BD_WLPL_FIELD instance;

        public static MES_BD_WLPL_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_WLPL_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string BH = "BH";
        public readonly string SB_CODE = "SB_CODE";
        public readonly string NAME = "NAME";
        public readonly string QNAME = "QNAME";
        public readonly string CODE = "CODE";
        public readonly string CPXS1 = "CPXS1";
        public readonly string CPXS1_LEVEL = "CPXS1_LEVEL";
        public readonly string REMARK1 = "REMARK1";
        public readonly string CPXS2 = "CPXS2";
        public readonly string CPXS2_LEVEL = "CPXS2_LEVEL";
        public readonly string REMARK2 = "REMARK2";
        public readonly string CPXS3 = "CPXS3";
        public readonly string CPXS3_LEVEL = "CPXS3_LEVEL";
        public readonly string REMARK3 = "REMARK3";
        public readonly string TJLB1 = "TJLB1";
        public readonly string TJLB2 = "TJLB2";
        public readonly string TJLB3 = "TJLB3";
        public readonly string TJLB4 = "TJLB4";
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