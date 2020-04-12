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
    public class MesBdSbdbBLL:SuperBLL
    {
	    private MesBdSbdbDAL dal = new MesBdSbdbDAL();
        private MesBdSbdbVAL val = new MesBdSbdbVAL();

        private static MesBdSbdbBLL instance;

		public  static MesBdSbdbBLL Instance
        {
            get { return instance; }
        }

        static MesBdSbdbBLL()
        {
            instance = new MesBdSbdbBLL();
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
                        MES_BD_SBDB.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_SBDB mesBdSbdb= new MES_BD_SBDB(MES_BD_SBDB.Fields.GUID);
                mesBdSbdb.Data = saveEntity.Data;
                mesBdSbdb.EffectDataFields();

				val.SaveValidate(context,mesBdSbdb,isAdd);

                 if (isAdd)
                 {
                      mesBdSbdb.GUID = Guid.NewGuid().ToString("N");
                      mesBdSbdb.AddUserInfo(context, isAdd);
					 
					  mesBdSbdb.Validate();
                      mesBdSbdb.Insert(context.Transaction);
                 }
                else
                {
                     mesBdSbdb.AddUserInfo(context, isAdd);
					 mesBdSbdb.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdSbdb.Validate();
                     mesBdSbdb.Update(context.Transaction);
                }

               return mesBdSbdb;

         }
	   
    }
}
