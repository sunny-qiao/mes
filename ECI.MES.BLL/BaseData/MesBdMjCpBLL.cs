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
    public class MesBdMjCpBLL:SuperBLL
    {
	    private MesBdMjCpDAL dal = new MesBdMjCpDAL();
        private MesBdMjCpVAL val = new MesBdMjCpVAL();

        private static MesBdMjCpBLL instance;

		public  static MesBdMjCpBLL Instance
        {
            get { return instance; }
        }

        static MesBdMjCpBLL()
        {
            instance = new MesBdMjCpBLL();
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
                        MES_BD_MJ_CP.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_MJ_CP mesBdMjCp= new MES_BD_MJ_CP(MES_BD_MJ_CP.Fields.GUID);
                mesBdMjCp.Data = saveEntity.Data;
                mesBdMjCp.EffectDataFields();

				val.SaveValidate(context,mesBdMjCp,isAdd);

                 if (isAdd)
                 {
                      mesBdMjCp.GUID = Guid.NewGuid().ToString("N");
                      mesBdMjCp.AddUserInfo(context, isAdd);
					 
					  mesBdMjCp.Validate();
                      mesBdMjCp.Insert(context.Transaction);
                 }
                else
                {
                     mesBdMjCp.AddUserInfo(context, isAdd);
					 mesBdMjCp.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdMjCp.Validate();
                     mesBdMjCp.Update(context.Transaction);
                }

               return mesBdMjCp;

         }
	   
    }
}
