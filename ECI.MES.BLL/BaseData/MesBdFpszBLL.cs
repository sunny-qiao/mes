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
    public class MesBdFpszBLL:SuperBLL
    {
	    private MesBdFpszDAL dal = new MesBdFpszDAL();
        private MesBdFpszVAL val = new MesBdFpszVAL();

        private static MesBdFpszBLL instance;

		public  static MesBdFpszBLL Instance
        {
            get { return instance; }
        }

        static MesBdFpszBLL()
        {
            instance = new MesBdFpszBLL();
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
                        MES_BD_FPSZ.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_FPSZ mesBdFpsz= new MES_BD_FPSZ(MES_BD_FPSZ.Fields.GUID);
                mesBdFpsz.Data = saveEntity.Data;
                mesBdFpsz.EffectDataFields();

				val.SaveValidate(context,mesBdFpsz,isAdd);

                 if (isAdd)
                 {
                      mesBdFpsz.GUID = Guid.NewGuid().ToString("N");
                      mesBdFpsz.AddUserInfo(context, isAdd);
					 
					  mesBdFpsz.Validate();
                      mesBdFpsz.Insert(context.Transaction);
                 }
                else
                {
                     mesBdFpsz.AddUserInfo(context, isAdd);
					 mesBdFpsz.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdFpsz.Validate();
                     mesBdFpsz.Update(context.Transaction);
                }

               return mesBdFpsz;

         }
	   
    }
}
