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
    public class MesBdKqjBLL:SuperBLL
    {
	    private MesBdKqjDAL dal = new MesBdKqjDAL();
        private MesBdKqjVAL val = new MesBdKqjVAL();

        private static MesBdKqjBLL instance;

		public  static MesBdKqjBLL Instance
        {
            get { return instance; }
        }

        static MesBdKqjBLL()
        {
            instance = new MesBdKqjBLL();
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
                        MES_BD_KQJ.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_KQJ mesBdKqj= new MES_BD_KQJ(MES_BD_KQJ.Fields.GUID);
                mesBdKqj.Data = saveEntity.Data;
                mesBdKqj.EffectDataFields();

				val.SaveValidate(context,mesBdKqj,isAdd);

                 if (isAdd)
                 {
                      mesBdKqj.GUID = Guid.NewGuid().ToString("N");
                      mesBdKqj.AddUserInfo(context, isAdd);
					 
					  mesBdKqj.Validate();
                      mesBdKqj.Insert(context.Transaction);
                 }
                else
                {
                     mesBdKqj.AddUserInfo(context, isAdd);
					 mesBdKqj.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdKqj.Validate();
                     mesBdKqj.Update(context.Transaction);
                }

               return mesBdKqj;

         }
	   
    }
}
