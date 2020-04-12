using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using PL.Base;
using ECI.MES.Entity;

namespace ECI.MES.DAL
{
    public class MesBdScxDAL : BaseDAL
    {
      public MES_BD_SCX Get(string guid)
        {
            return Get(guid, null);
        }

        public MES_BD_SCX Get(string guid, object ts)
        {
            return MES_BD_SCX.DAL.Select().Where(a => a.GUID = guid).SingleOrDefault(ts);
        }

        public   DataTable Load(BLLContext context, string guid)
        {
           string sql = @"SELECT A.GUID,A.BH,A.NAME,A.CODE,A.SSCJ
                           ,A.CJNSCX_CODE,A.GX,A.SCX_NAME1,A.JYSCX,A.SCX_NAME2
                           ,A.BC_NAME3,A.SCX_NAME3,A.GZ1_CODE,A.GZ2_CODE,A.GZ3_CODE
                           ,A.GZ4_CODE,A.GZ5_CODE,A.SXHD,A.SXGD,A.SXKD
                           ,A.SXMD,A.LLSSH,A.LLTSSH,A.KYMJLX,A.KYMJLX1
                           ,A.KYMJLX2,A.KYMJLX3,A.PL1,A.PL2,A.PL3
                           ,A.PL4,A.PL5,A.PL6,A.PL7,A.PL8
                           ,A.PL1_PARAM,A.PL2_PARAM,A.PL3_PARAM,A.PL4_PARAM,A.PL5_PARAM
                           ,A.PL6_PARAM,A.PL7_PARAM,A.PL8_PARAM,A.PL1_DYCSBZ,A.PL2_DYCSBZ
                           ,A.PL3_DYCSBZ,A.PL4_DYCSBZ,A.PL5_DYCSBZ,A.PL6_DYCSBZ,A.PL7_DYCSBZ
                           ,A.PL8_DYCSBZ,A.PL1_CKCK,A.PL2_CKCK,A.PL3_CKCK,A.PL4_CKCK
                           ,A.PL5_CKCK,A.PL6_CKCK,A.PL7_CKCK,A.PL8_CKCK,A.CP1
                           ,A.CP2,A.CP3,A.CP4,A.CP5,A.CP6
                           ,A.CP7,A.CP8,A.CP1_PARAM,A.CP2_PARAM,A.CP3_PARAM
                           ,A.CP4_PARAM,A.CP5_PARAM,A.CP6_PARAM,A.CP7_PARAM,A.CP8_PARAM
                           ,A.CP1_DYCSBZ,A.CP2_DYCSBZ,A.CP3_DYCSBZ,A.CP4_DYCSBZ,A.CP5_DYCSBZ
                           ,A.CP6_DYCSBZ,A.CP7_DYCSBZ,A.CP8_DYCSBZ,A.CP1_JSGS,A.CP2_JSGS
                           ,A.CP3_JSGS,A.CP4_JSGS,A.CP5_JSGS,A.CP6_JSGS,A.CP7_JSGS
                           ,A.CP8_JSGS,A.CP1_RKCK,A.CP2_RKCK,A.CP3_RKCK,A.CP4_RKCK
                           ,A.CP5_RKCK,A.CP6_RKCK,A.CP7_RKCK,A.CP8_RKCK,A.REMARK
                           ,A.CREATE_USER,A.CREATE_USER_NAME,A.CREATE_DATE,A.UPDATE_USER,A.UPDATE_USER_NAME
                           ,A.UPDATE_DATE,A.COMPANY_CODE,A.COMPANY_NAME ";
           sql +=" FROM MES_BD_SCX A ";
           sql +=" WHERE A.GUID=" + cmn.SQLQ(guid);

           DataTable data = DBHelper.GetDataTable(sql);
 
           return data;
        }
 
        public SearchResult Search(BLLContext context, Paging paging, EntityBase queryEntity)
        {
            SearchResult result = new SearchResult();

            string sql = @"SELECT A.GUID,A.BH,A.NAME,A.CODE,A.SSCJ
                           ,A.CJNSCX_CODE,A.GX,A.SCX_NAME1,A.JYSCX,A.SCX_NAME2
                           ,A.BC_NAME3,A.SCX_NAME3,A.GZ1_CODE,A.GZ2_CODE,A.GZ3_CODE
                           ,A.GZ4_CODE,A.GZ5_CODE,A.SXHD,A.SXGD,A.SXKD
                           ,A.SXMD,A.LLSSH,A.LLTSSH,A.KYMJLX,A.KYMJLX1
                           ,A.KYMJLX2,A.KYMJLX3,A.PL1,A.PL2,A.PL3
                           ,A.PL4,A.PL5,A.PL6,A.PL7,A.PL8
                           ,A.PL1_PARAM,A.PL2_PARAM,A.PL3_PARAM,A.PL4_PARAM,A.PL5_PARAM
                           ,A.PL6_PARAM,A.PL7_PARAM,A.PL8_PARAM,A.PL1_DYCSBZ,A.PL2_DYCSBZ
                           ,A.PL3_DYCSBZ,A.PL4_DYCSBZ,A.PL5_DYCSBZ,A.PL6_DYCSBZ,A.PL7_DYCSBZ
                           ,A.PL8_DYCSBZ,A.PL1_CKCK,A.PL2_CKCK,A.PL3_CKCK,A.PL4_CKCK
                           ,A.PL5_CKCK,A.PL6_CKCK,A.PL7_CKCK,A.PL8_CKCK,A.CP1
                           ,A.CP2,A.CP3,A.CP4,A.CP5,A.CP6
                           ,A.CP7,A.CP8,A.CP1_PARAM,A.CP2_PARAM,A.CP3_PARAM
                           ,A.CP4_PARAM,A.CP5_PARAM,A.CP6_PARAM,A.CP7_PARAM,A.CP8_PARAM
                           ,A.CP1_DYCSBZ,A.CP2_DYCSBZ,A.CP3_DYCSBZ,A.CP4_DYCSBZ,A.CP5_DYCSBZ
                           ,A.CP6_DYCSBZ,A.CP7_DYCSBZ,A.CP8_DYCSBZ,A.CP1_JSGS,A.CP2_JSGS
                           ,A.CP3_JSGS,A.CP4_JSGS,A.CP5_JSGS,A.CP6_JSGS,A.CP7_JSGS
                           ,A.CP8_JSGS,A.CP1_RKCK,A.CP2_RKCK,A.CP3_RKCK,A.CP4_RKCK
                           ,A.CP5_RKCK,A.CP6_RKCK,A.CP7_RKCK,A.CP8_RKCK,A.REMARK
                           ,A.CREATE_USER,A.CREATE_USER_NAME,A.CREATE_DATE,A.UPDATE_USER,A.UPDATE_USER_NAME
                           ,A.UPDATE_DATE,A.COMPANY_CODE,A.COMPANY_NAME ";
            sql +=" FROM MES_BD_SCX A ";
            sql +=" WHERE 1=1";

            string condition ="";

            condition += QueryHelper.BuildCommonSQL(queryEntity);
 
            sql += condition;
            result = SearchHelper.Search(sql, paging);
 
            return result;
        }

    }

}
