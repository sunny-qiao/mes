using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using ECI.MES.Entity;
using ECI.MES.DAL;
using ECI.MES.VAL;

namespace ECI.MES.BLL
{
    public class MesBdScsjbcsBLL:SuperBLL
    {
	    private MesBdScsjbcsDAL dal = new MesBdScsjbcsDAL();
        private MesBdScsjbcsVAL val = new MesBdScsjbcsVAL();

        private static MesBdScsjbcsBLL instance;

		public  static MesBdScsjbcsBLL Instance
        {
            get { return instance; }
        }

        static MesBdScsjbcsBLL()
        {
            instance = new MesBdScsjbcsBLL();
        }

        public DataTable Load(BLLContext context,string guid)
        {
             return dal.Load(context, guid);
        }

        public SearchResult Search(BLLContext context,Paging paging, EntityBase queryEntity)
        {
            return dal.Search(context, paging, queryEntity);
        }
  
         public void Delete(BLLContext context,List<string> listGuid)
         {
		          

                   foreach (string guid in listGuid)
                    {
					    val.DeleteValidate(context,guid);
                        MES_BD_SCSJBCS.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_SCSJBCS mesBdScsjbcs= new MES_BD_SCSJBCS(MES_BD_SCSJBCS.Fields.GUID);
                mesBdScsjbcs.Data = saveEntity.Data;
                mesBdScsjbcs.EffectDataFields();

				val.SaveValidate(context,mesBdScsjbcs,isAdd);

                 if (isAdd)
                 {
                      mesBdScsjbcs.GUID = Guid.NewGuid().ToString("N");
                      mesBdScsjbcs.AddUserInfo(context, isAdd);
					 
					  mesBdScsjbcs.Validate();
                      mesBdScsjbcs.Insert(context.Transaction);
                 }
                else
                {
                     mesBdScsjbcs.AddUserInfo(context, isAdd);
					 mesBdScsjbcs.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdScsjbcs.Validate();
                     mesBdScsjbcs.Update(context.Transaction);
                }

               return mesBdScsjbcs;

         }
	   
    }
}
