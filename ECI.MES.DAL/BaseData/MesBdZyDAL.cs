using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using PL.Base;
using ECI.MES.Entity;

namespace ECI.MES.DAL
{
    public class MesBdZyDAL : BaseDAL
    {
      public MES_BD_ZY Get(string guid)
        {
            return Get(guid, null);
        }

        public MES_BD_ZY Get(string guid, object ts)
        {
            return MES_BD_ZY.DAL.Select().Where(a => a.GUID = guid).SingleOrDefault(ts);
        }
        public DataTable GetLower(BLLContext context, string id)
        {
            string sql = "SELECT GUID AS ID,PARENTID,NAME as TEXT,'closed' as STATE,A.GUID AS CODE ";
            sql += " FROM MES_BD_ZY A WHERE PARENTID=" + cmn.SQLQ(id);
            sql += " ORDER BY GH ";

            DataTable data = DBHelper.GetDataTable(sql);

            sql = "SELECT GUID AS ID,PARENTID ,NAME as TEXT,'closed' as STATE ,A.GUID AS CODE ";
            sql += " FROM MES_BD_ZY A WHERE PARENTID=" + cmn.SQLQ(id);
            sql += " AND EXISTS( SELECT 1 FROM MES_BD_ZY B WHERE A.GUID = B.PARENTID )";
            sql += " ORDER BY A.GH";

            DataTable dataHasChildren = DBHelper.GetDataTable(sql);

            data.PrimaryKey = new DataColumn[] { data.Columns["ID"] };
            dataHasChildren.PrimaryKey = new DataColumn[] { dataHasChildren.Columns["ID"] };
            data.Merge(dataHasChildren);

            return data;
        }

        public DataTable Load(BLLContext context, string guid)
        {
           string sql = @"SELECT A.GUID,A.GH,A.CODE,A.NAME,A.STATUS
                           ,A.RZ_DATE,A.LZ_DATE,A.SSCJ,A.SSCSCX,A.ZW
                           ,A.GZ,A.SSBZ,A.TEL,A.ID_CARD,A.KHYH
                           ,A.KHM,A.BANK,A.WHCD,A.BYXX,A.BYZY
                           ,A.BYNF,A.PROVINCE,A.CITY,A.ADDRESS,A.MAIL
                           ,A.REMARK,A.JS1,A.JS1_RELATION,A.JS1_TEL,A.JS1_ADDRESS
                           ,A.JS2,A.JS2_RELATION,A.JS2_TEL,A.JS2_ADDRESS,A.JS3
                           ,A.JS3_RELATION,A.JS3_TEL,A.JS3_ADDRESS,A.JS4,A.JS4_RELATION
                           ,A.JS4_TEL,A.JS4_ADDRESS,A.CAR_NO,A.CAR_TYPE,A.PIC1
                           ,A.PIC1_PATH,A.PIC2,A.PIC2_PATH,A.CREATE_USER,A.CREATE_USER_NAME
                           ,A.CREATE_DATE,A.UPDATE_USER,A.UPDATE_USER_NAME,A.UPDATE_DATE,A.COMPANY_CODE
                           ,A.COMPANY_NAME,A.PARENTID ";
           sql +=" FROM MES_BD_ZY A WHERE 1=1 ";
            if (context.Type.Equals("GetRoot"))
            {
                if (guid.HasValue())
                {
                    sql += " AND A.GUID=" + cmn.SQLQ(guid);
                }
                else
                {
                    sql += " AND A.PARENTID='-'";
                }
            }
            else
            {
                sql += " AND A.GUID=" + cmn.SQLQ(guid);
            }

            DataTable data = DBHelper.GetDataTable(sql);
 
           return data;
        }
 
        public SearchResult Search(BLLContext context, Paging paging, EntityBase queryEntity)
        {
            SearchResult result = new SearchResult();

            string sql = @"SELECT A.GUID,A.GH,A.CODE,A.NAME,A.STATUS
                           ,A.RZ_DATE,A.LZ_DATE,A.SSCJ,A.SSCSCX,A.ZW
                           ,A.GZ,A.SSBZ,A.TEL,A.ID_CARD,A.KHYH
                           ,A.KHM,A.BANK,A.WHCD,A.BYXX,A.BYZY
                           ,A.BYNF,A.PROVINCE,A.CITY,A.ADDRESS,A.MAIL
                           ,A.REMARK,A.JS1,A.JS1_RELATION,A.JS1_TEL,A.JS1_ADDRESS
                           ,A.JS2,A.JS2_RELATION,A.JS2_TEL,A.JS2_ADDRESS,A.JS3
                           ,A.JS3_RELATION,A.JS3_TEL,A.JS3_ADDRESS,A.JS4,A.JS4_RELATION
                           ,A.JS4_TEL,A.JS4_ADDRESS,A.CAR_NO,A.CAR_TYPE,A.PIC1
                           ,A.PIC1_PATH,A.PIC2,A.PIC2_PATH,A.CREATE_USER,A.CREATE_USER_NAME
                           ,A.CREATE_DATE,A.UPDATE_USER,A.UPDATE_USER_NAME,A.UPDATE_DATE,A.COMPANY_CODE
                           ,A.COMPANY_NAME ";
            sql +=" FROM MES_BD_ZY A ";
            sql +=" WHERE 1=1";

            string condition ="";

            condition += QueryHelper.BuildCommonSQL(queryEntity);
 
            sql += condition;
            result = SearchHelper.Search(sql, paging);
 
            return result;
        }

    }

}
