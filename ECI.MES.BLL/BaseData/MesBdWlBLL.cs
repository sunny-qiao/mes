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
    public class MesBdWlBLL:SuperBLL
    {
	    private MesBdWlDAL dal = new MesBdWlDAL();
        private MesBdWlVAL val = new MesBdWlVAL();

        private static MesBdWlBLL instance;

		public  static MesBdWlBLL Instance
        {
            get { return instance; }
        }

        static MesBdWlBLL()
        {
            instance = new MesBdWlBLL();
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
                        MES_BD_WL.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_WL mesBdWl= new MES_BD_WL(MES_BD_WL.Fields.GUID);
                mesBdWl.Data = saveEntity.Data;
                mesBdWl.EffectDataFields();

				val.SaveValidate(context,mesBdWl,isAdd);

                 if (isAdd)
                 {
                      mesBdWl.GUID = Guid.NewGuid().ToString("N");
                      mesBdWl.AddUserInfo(context, isAdd);
					 
					  mesBdWl.Validate();
                      mesBdWl.Insert(context.Transaction);
                 }
                else
                {
                     mesBdWl.AddUserInfo(context, isAdd);
					 mesBdWl.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdWl.Validate();
                     mesBdWl.Update(context.Transaction);
                }

               return mesBdWl;

         }
	   
    }
}
