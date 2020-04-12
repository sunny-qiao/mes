using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using PL.Base;
using ECI.MES.Entity;

namespace ECI.MES.DAL
{
    public class MesBdScxCpplDAL : BaseDAL
    {
      public MES_BD_SCX_CPPL Get(string guid)
        {
            return Get(guid, null);
        }

        public MES_BD_SCX_CPPL Get(string guid, object ts)
        {
            return MES_BD_SCX_CPPL.DAL.Select().Where(a => a.GUID = guid).SingleOrDefault(ts);
        }

        public   DataTable Load(BLLContext context, string guid)
        {
           string sql = @"SELECT A.GUID,A.FGUID,A.SCX,A.BH,A.CPM
                           ,A.YSCSJYLCS,A.GCSBZ,A.YCPJS1,A.YCPJSBZ1,A.YCPJS2
                           ,A.YCPJSBZ2,A.YCPJS3,A.YCPJSBZ3,A.YCPJS4,A.YCPJSBZ4
                           ,A.CKCK,A.RKCK,A.REMARK,A.CREATE_USER,A.CREATE_USER_NAME
                           ,A.CREATE_DATE,A.UPDATE_USER,A.UPDATE_USER_NAME,A.UPDATE_DATE,A.COMPANY_CODE
                           ,A.COMPANY_NAME ";
           sql +=" FROM MES_BD_SCX_CPPL A ";
           sql +=" WHERE A.GUID=" + cmn.SQLQ(guid);

           DataTable data = DBHelper.GetDataTable(sql);
 
           return data;
        }
 
        public SearchResult Search(BLLContext context, Paging paging, EntityBase queryEntity)
        {
            SearchResult result = new SearchResult();

            string sql = @"SELECT A.GUID,A.FGUID,A.SCX,A.BH,A.CPM
                           ,A.YSCSJYLCS,A.GCSBZ,A.YCPJS1,A.YCPJSBZ1,A.YCPJS2
                           ,A.YCPJSBZ2,A.YCPJS3,A.YCPJSBZ3,A.YCPJS4,A.YCPJSBZ4
                           ,A.CKCK,A.RKCK,A.REMARK,A.CREATE_USER,A.CREATE_USER_NAME
                           ,A.CREATE_DATE,A.UPDATE_USER,A.UPDATE_USER_NAME,A.UPDATE_DATE,A.COMPANY_CODE
                           ,A.COMPANY_NAME ";
            sql +=" FROM MES_BD_SCX_CPPL A ";
            sql +=" WHERE 1=1";

            string condition ="";

            condition += QueryHelper.BuildCommonSQL(queryEntity);
 
            sql += condition;
            result = SearchHelper.Search(sql, paging);
 
            return result;
        }

    }

}
