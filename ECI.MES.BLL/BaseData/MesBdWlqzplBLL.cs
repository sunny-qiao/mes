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
    public class MesBdWlqzplBLL:SuperBLL
    {
	    private MesBdWlqzplDAL dal = new MesBdWlqzplDAL();
        private MesBdWlqzplVAL val = new MesBdWlqzplVAL();

        private static MesBdWlqzplBLL instance;

		public  static MesBdWlqzplBLL Instance
        {
            get { return instance; }
        }

        static MesBdWlqzplBLL()
        {
            instance = new MesBdWlqzplBLL();
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
                        MES_BD_WLQZPL.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_WLQZPL mesBdWlqzpl= new MES_BD_WLQZPL(MES_BD_WLQZPL.Fields.GUID);
                mesBdWlqzpl.Data = saveEntity.Data;
                mesBdWlqzpl.EffectDataFields();

				val.SaveValidate(context,mesBdWlqzpl,isAdd);

                 if (isAdd)
                 {
                      mesBdWlqzpl.GUID = Guid.NewGuid().ToString("N");
                      mesBdWlqzpl.AddUserInfo(context, isAdd);
					 
					  mesBdWlqzpl.Validate();
                      mesBdWlqzpl.Insert(context.Transaction);
                 }
                else
                {
                     mesBdWlqzpl.AddUserInfo(context, isAdd);
					 mesBdWlqzpl.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdWlqzpl.Validate();
                     mesBdWlqzpl.Update(context.Transaction);
                }

               return mesBdWlqzpl;

         }
	   
    }
}
