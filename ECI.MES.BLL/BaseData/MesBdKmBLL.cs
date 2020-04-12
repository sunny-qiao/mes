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
    public class MesBdKmBLL:SuperBLL
    {
	    private MesBdKmDAL dal = new MesBdKmDAL();
        private MesBdKmVAL val = new MesBdKmVAL();

        private static MesBdKmBLL instance;

		public  static MesBdKmBLL Instance
        {
            get { return instance; }
        }

        static MesBdKmBLL()
        {
            instance = new MesBdKmBLL();
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
                        MES_BD_KM.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_KM mesBdKm= new MES_BD_KM(MES_BD_KM.Fields.GUID);
                mesBdKm.Data = saveEntity.Data;
                mesBdKm.EffectDataFields();

				val.SaveValidate(context,mesBdKm,isAdd);

                 if (isAdd)
                 {
                      mesBdKm.GUID = Guid.NewGuid().ToString("N");
                      mesBdKm.AddUserInfo(context, isAdd);
					 
					  mesBdKm.Validate();
                      mesBdKm.Insert(context.Transaction);
                 }
                else
                {
                     mesBdKm.AddUserInfo(context, isAdd);
					 mesBdKm.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdKm.Validate();
                     mesBdKm.Update(context.Transaction);
                }

               return mesBdKm;

         }
	   
    }
}
