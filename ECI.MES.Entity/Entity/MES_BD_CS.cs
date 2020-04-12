#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_CS : EntityBase
	{
	     public MES_BD_CS()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_CS" };
		    base.Columns = MES_BD_CS_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_CS(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_CS(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_CS(EntityBase entityBase)
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
                    ///  参数编号
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
                    ///  参数名
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
                    ///  参数精度
                    /// </summary>
                    public System.Nullable<double> JD
                    {
                        get
                        {
                            return this.DoubleAccess["JD"];
                        }
                        set
                        {
                            this.DoubleAccess["JD"] = value;
                        }
                    }
                    /// <summary>
                    ///  标准参数值
                    /// </summary>
                    public string BZCSZ
                    {
                        get
                        {
                            return this.TextAccess["BZCSZ"];
                        }
                        set
                        {
                            this.TextAccess["BZCSZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  低值下限
                    /// </summary>
                    public string DZXX
                    {
                        get
                        {
                            return this.TextAccess["DZXX"];
                        }
                        set
                        {
                            this.TextAccess["DZXX"] = value;
                        }
                    }
                    /// <summary>
                    ///  偏低下限
                    /// </summary>
                    public string PDXX
                    {
                        get
                        {
                            return this.TextAccess["PDXX"];
                        }
                        set
                        {
                            this.TextAccess["PDXX"] = value;
                        }
                    }
                    /// <summary>
                    ///  正常下限
                    /// </summary>
                    public string ZCXX
                    {
                        get
                        {
                            return this.TextAccess["ZCXX"];
                        }
                        set
                        {
                            this.TextAccess["ZCXX"] = value;
                        }
                    }
                    /// <summary>
                    ///  正常上限
                    /// </summary>
                    public string ZCSX
                    {
                        get
                        {
                            return this.TextAccess["ZCSX"];
                        }
                        set
                        {
                            this.TextAccess["ZCSX"] = value;
                        }
                    }
                    /// <summary>
                    ///  偏高上限
                    /// </summary>
                    public string PGSX
                    {
                        get
                        {
                            return this.TextAccess["PGSX"];
                        }
                        set
                        {
                            this.TextAccess["PGSX"] = value;
                        }
                    }
                    /// <summary>
                    ///  高值上限
                    /// </summary>
                    public string GZSX
                    {
                        get
                        {
                            return this.TextAccess["GZSX"];
                        }
                        set
                        {
                            this.TextAccess["GZSX"] = value;
                        }
                    }
                    /// <summary>
                    ///  偏低颜色
                    /// </summary>
                    public string PDYS
                    {
                        get
                        {
                            return this.TextAccess["PDYS"];
                        }
                        set
                        {
                            this.TextAccess["PDYS"] = value;
                        }
                    }
                    /// <summary>
                    ///  低颜色
                    /// </summary>
                    public string DYS
                    {
                        get
                        {
                            return this.TextAccess["DYS"];
                        }
                        set
                        {
                            this.TextAccess["DYS"] = value;
                        }
                    }
                    /// <summary>
                    ///  超低颜色
                    /// </summary>
                    public string CDYS
                    {
                        get
                        {
                            return this.TextAccess["CDYS"];
                        }
                        set
                        {
                            this.TextAccess["CDYS"] = value;
                        }
                    }
                    /// <summary>
                    ///  正常颜色
                    /// </summary>
                    public string ZCYS
                    {
                        get
                        {
                            return this.TextAccess["ZCYS"];
                        }
                        set
                        {
                            this.TextAccess["ZCYS"] = value;
                        }
                    }
                    /// <summary>
                    ///  偏高颜色
                    /// </summary>
                    public string PGYS
                    {
                        get
                        {
                            return this.TextAccess["PGYS"];
                        }
                        set
                        {
                            this.TextAccess["PGYS"] = value;
                        }
                    }
                    /// <summary>
                    ///  高颜色
                    /// </summary>
                    public string GYS
                    {
                        get
                        {
                            return this.TextAccess["GYS"];
                        }
                        set
                        {
                            this.TextAccess["GYS"] = value;
                        }
                    }
                    /// <summary>
                    ///  超高颜色
                    /// </summary>
                    public string CGYS
                    {
                        get
                        {
                            return this.TextAccess["CGYS"];
                        }
                        set
                        {
                            this.TextAccess["CGYS"] = value;
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
        public MES_BD_CS SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_CS>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_CS SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_CS>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_CS> ToList()
        {
             return new EntityBuilder<MES_BD_CS>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_CS> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_CS>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_CS SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_CS SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_CS> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_CS> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_CS> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_CS>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_CS> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_CS>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_CS, MES_BD_CS_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_CS, MES_BD_CS_FIELD>();
            }
        }
		
	    public static MES_BD_CS_FIELD Fields
        {
            get { return MES_BD_CS_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_CS> EntityBuilder = new EntityBuilder<MES_BD_CS>();
    }

	internal class MES_BD_CS_COLUMN : BaseColumn
    {
        public static MES_BD_CS_COLUMN Instance;

        static MES_BD_CS_COLUMN()
        {
            Instance = new MES_BD_CS_COLUMN();
        }

        private MES_BD_CS_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JD", Type = "NUMBER"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BZCSZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DZXX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PDXX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZCXX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZCSX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PGSX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GZSX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PDYS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "DYS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CDYS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZCYS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PGYS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GYS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CGYS", Type = "TEXT"  });
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
	
  public class  MES_BD_CS_FIELD
  {
       private static MES_BD_CS_FIELD instance;

        public static MES_BD_CS_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_CS_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string BH = "BH";
        public readonly string NAME = "NAME";
        public readonly string JD = "JD";
        public readonly string BZCSZ = "BZCSZ";
        public readonly string DZXX = "DZXX";
        public readonly string PDXX = "PDXX";
        public readonly string ZCXX = "ZCXX";
        public readonly string ZCSX = "ZCSX";
        public readonly string PGSX = "PGSX";
        public readonly string GZSX = "GZSX";
        public readonly string PDYS = "PDYS";
        public readonly string DYS = "DYS";
        public readonly string CDYS = "CDYS";
        public readonly string ZCYS = "ZCYS";
        public readonly string PGYS = "PGYS";
        public readonly string GYS = "GYS";
        public readonly string CGYS = "CGYS";
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