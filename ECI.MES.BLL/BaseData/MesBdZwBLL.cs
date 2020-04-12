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
    public class MesBdZwBLL:SuperBLL
    {
	    private MesBdZwDAL dal = new MesBdZwDAL();
        private MesBdZwVAL val = new MesBdZwVAL();

        private static MesBdZwBLL instance;

		public  static MesBdZwBLL Instance
        {
            get { return instance; }
        }

        static MesBdZwBLL()
        {
            instance = new MesBdZwBLL();
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
                        MES_BD_ZW.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_ZW mesBdZw= new MES_BD_ZW(MES_BD_ZW.Fields.GUID);
                mesBdZw.Data = saveEntity.Data;
                mesBdZw.EffectDataFields();

				val.SaveValidate(context,mesBdZw,isAdd);

                 if (isAdd)
                 {
                      mesBdZw.GUID = Guid.NewGuid().ToString("N");
                      mesBdZw.AddUserInfo(context, isAdd);
					 
					  mesBdZw.Validate();
                      mesBdZw.Insert(context.Transaction);
                 }
                else
                {
                     mesBdZw.AddUserInfo(context, isAdd);
					 mesBdZw.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdZw.Validate();
                     mesBdZw.Update(context.Transaction);
                }

               return mesBdZw;

         }
	   
    }
}
