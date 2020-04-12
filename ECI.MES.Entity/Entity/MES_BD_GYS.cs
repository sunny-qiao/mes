#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_GYS : EntityBase
	{
	     public MES_BD_GYS()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_GYS" };
		    base.Columns = MES_BD_GYS_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_GYS(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_GYS(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_GYS(EntityBase entityBase)
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
                    ///  供应商/客户编号
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
                    ///  供应商/客户名
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
                    ///  供应商/客户全名
                    /// </summary>
                    public string FULL_NAME
                    {
                        get
                        {
                            return this.TextAccess["FULL_NAME"];
                        }
                        set
                        {
                            this.TextAccess["FULL_NAME"] = value;
                        }
                    }
                    /// <summary>
                    ///  联系人1
                    /// </summary>
                    public string LXR1
                    {
                        get
                        {
                            return this.TextAccess["LXR1"];
                        }
                        set
                        {
                            this.TextAccess["LXR1"] = value;
                        }
                    }
                    /// <summary>
                    ///  联系电话1
                    /// </summary>
                    public string LXDH1
                    {
                        get
                        {
                            return this.TextAccess["LXDH1"];
                        }
                        set
                        {
                            this.TextAccess["LXDH1"] = value;
                        }
                    }
                    /// <summary>
                    ///  联系人2
                    /// </summary>
                    public string LXR2
                    {
                        get
                        {
                            return this.TextAccess["LXR2"];
                        }
                        set
                        {
                            this.TextAccess["LXR2"] = value;
                        }
                    }
                    /// <summary>
                    ///  联系电话2
                    /// </summary>
                    public string LXDH2
                    {
                        get
                        {
                            return this.TextAccess["LXDH2"];
                        }
                        set
                        {
                            this.TextAccess["LXDH2"] = value;
                        }
                    }
                    /// <summary>
                    ///  联系人3
                    /// </summary>
                    public string LXR3
                    {
                        get
                        {
                            return this.TextAccess["LXR3"];
                        }
                        set
                        {
                            this.TextAccess["LXR3"] = value;
                        }
                    }
                    /// <summary>
                    ///  联系电话3
                    /// </summary>
                    public string LXDH3
                    {
                        get
                        {
                            return this.TextAccess["LXDH3"];
                        }
                        set
                        {
                            this.TextAccess["LXDH3"] = value;
                        }
                    }
                    /// <summary>
                    ///  联系人4
                    /// </summary>
                    public string LXR4
                    {
                        get
                        {
                            return this.TextAccess["LXR4"];
                        }
                        set
                        {
                            this.TextAccess["LXR4"] = value;
                        }
                    }
                    /// <summary>
                    ///  联系电话4
                    /// </summary>
                    public string LXDH4
                    {
                        get
                        {
                            return this.TextAccess["LXDH4"];
                        }
                        set
                        {
                            this.TextAccess["LXDH4"] = value;
                        }
                    }
                    /// <summary>
                    ///  联系人5
                    /// </summary>
                    public string LXR5
                    {
                        get
                        {
                            return this.TextAccess["LXR5"];
                        }
                        set
                        {
                            this.TextAccess["LXR5"] = value;
                        }
                    }
                    /// <summary>
                    ///  联系电话5
                    /// </summary>
                    public string LXDH5
                    {
                        get
                        {
                            return this.TextAccess["LXDH5"];
                        }
                        set
                        {
                            this.TextAccess["LXDH5"] = value;
                        }
                    }
                    /// <summary>
                    ///  税率(%)
                    /// </summary>
                    public System.Nullable<double> RATE
                    {
                        get
                        {
                            return this.DoubleAccess["RATE"];
                        }
                        set
                        {
                            this.DoubleAccess["RATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  所属国家
                    /// </summary>
                    public string COUNTRY
                    {
                        get
                        {
                            return this.TextAccess["COUNTRY"];
                        }
                        set
                        {
                            this.TextAccess["COUNTRY"] = value;
                        }
                    }
                    /// <summary>
                    ///  所属省份
                    /// </summary>
                    public string PROVINCE
                    {
                        get
                        {
                            return this.TextAccess["PROVINCE"];
                        }
                        set
                        {
                            this.TextAccess["PROVINCE"] = value;
                        }
                    }
                    /// <summary>
                    ///  所属城市
                    /// </summary>
                    public string CITY
                    {
                        get
                        {
                            return this.TextAccess["CITY"];
                        }
                        set
                        {
                            this.TextAccess["CITY"] = value;
                        }
                    }
                    /// <summary>
                    ///  地址
                    /// </summary>
                    public string ADDRESS
                    {
                        get
                        {
                            return this.TextAccess["ADDRESS"];
                        }
                        set
                        {
                            this.TextAccess["ADDRESS"] = value;
                        }
                    }
                    /// <summary>
                    ///  是否启用限额
                    /// </summary>
                    public string IS_QYXE
                    {
                        get
                        {
                            return this.TextAccess["IS_QYXE"];
                        }
                        set
                        {
                            this.TextAccess["IS_QYXE"] = value;
                        }
                    }
                    /// <summary>
                    ///  限额(应收款限额为正,应付款限额为负)
                    /// </summary>
                    public string XE
                    {
                        get
                        {
                            return this.TextAccess["XE"];
                        }
                        set
                        {
                            this.TextAccess["XE"] = value;
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
        public MES_BD_GYS SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_GYS>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_GYS SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_GYS>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_GYS> ToList()
        {
             return new EntityBuilder<MES_BD_GYS>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_GYS> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_GYS>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_GYS SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_GYS SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_GYS> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_GYS> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_GYS> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_GYS>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_GYS> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_GYS>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_GYS, MES_BD_GYS_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_GYS, MES_BD_GYS_FIELD>();
            }
        }
		
	    public static MES_BD_GYS_FIELD Fields
        {
            get { return MES_BD_GYS_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_GYS> EntityBuilder = new EntityBuilder<MES_BD_GYS>();
    }

	internal class MES_BD_GYS_COLUMN : BaseColumn
    {
        public static MES_BD_GYS_COLUMN Instance;

        static MES_BD_GYS_COLUMN()
        {
            Instance = new MES_BD_GYS_COLUMN();
        }

        private MES_BD_GYS_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FULL_NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LXR1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LXDH1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LXR2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LXDH2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LXR3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LXDH3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LXR4", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LXDH4", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LXR5", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LXDH5", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "RATE", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "COUNTRY", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PROVINCE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CITY", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ADDRESS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "IS_QYXE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "XE", Type = "TEXT"  });
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
	
  public class  MES_BD_GYS_FIELD
  {
       private static MES_BD_GYS_FIELD instance;

        public static MES_BD_GYS_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_GYS_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string BH = "BH";
        public readonly string NAME = "NAME";
        public readonly string FULL_NAME = "FULL_NAME";
        public readonly string LXR1 = "LXR1";
        public readonly string LXDH1 = "LXDH1";
        public readonly string LXR2 = "LXR2";
        public readonly string LXDH2 = "LXDH2";
        public readonly string LXR3 = "LXR3";
        public readonly string LXDH3 = "LXDH3";
        public readonly string LXR4 = "LXR4";
        public readonly string LXDH4 = "LXDH4";
        public readonly string LXR5 = "LXR5";
        public readonly string LXDH5 = "LXDH5";
        public readonly string RATE = "RATE";
        public readonly string COUNTRY = "COUNTRY";
        public readonly string PROVINCE = "PROVINCE";
        public readonly string CITY = "CITY";
        public readonly string ADDRESS = "ADDRESS";
        public readonly string IS_QYXE = "IS_QYXE";
        public readonly string XE = "XE";
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