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
    public class MesBdGdzcBLL:SuperBLL
    {
	    private MesBdGdzcDAL dal = new MesBdGdzcDAL();
        private MesBdGdzcVAL val = new MesBdGdzcVAL();

        private static MesBdGdzcBLL instance;

		public  static MesBdGdzcBLL Instance
        {
            get { return instance; }
        }

        static MesBdGdzcBLL()
        {
            instance = new MesBdGdzcBLL();
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
                        MES_BD_GDZC.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_GDZC mesBdGdzc= new MES_BD_GDZC(MES_BD_GDZC.Fields.GUID);
                mesBdGdzc.Data = saveEntity.Data;
                mesBdGdzc.EffectDataFields();

				val.SaveValidate(context,mesBdGdzc,isAdd);

                 if (isAdd)
                 {
                      mesBdGdzc.GUID = Guid.NewGuid().ToString("N");
                      mesBdGdzc.AddUserInfo(context, isAdd);
					 
					  mesBdGdzc.Validate();
                      mesBdGdzc.Insert(context.Transaction);
                 }
                else
                {
                     mesBdGdzc.AddUserInfo(context, isAdd);
					 mesBdGdzc.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdGdzc.Validate();
                     mesBdGdzc.Update(context.Transaction);
                }

               return mesBdGdzc;

         }
	   
    }
}
