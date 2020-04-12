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
    public class MesBdWlzplBLL:SuperBLL
    {
	    private MesBdWlzplDAL dal = new MesBdWlzplDAL();
        private MesBdWlzplVAL val = new MesBdWlzplVAL();

        private static MesBdWlzplBLL instance;

		public  static MesBdWlzplBLL Instance
        {
            get { return instance; }
        }

        static MesBdWlzplBLL()
        {
            instance = new MesBdWlzplBLL();
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
                        MES_BD_WLZPL.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_WLZPL mesBdWlzpl= new MES_BD_WLZPL(MES_BD_WLZPL.Fields.GUID);
                mesBdWlzpl.Data = saveEntity.Data;
                mesBdWlzpl.EffectDataFields();

				val.SaveValidate(context,mesBdWlzpl,isAdd);

                 if (isAdd)
                 {
                      mesBdWlzpl.GUID = Guid.NewGuid().ToString("N");
                      mesBdWlzpl.AddUserInfo(context, isAdd);
					 
					  mesBdWlzpl.Validate();
                      mesBdWlzpl.Insert(context.Transaction);
                 }
                else
                {
                     mesBdWlzpl.AddUserInfo(context, isAdd);
					 mesBdWlzpl.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdWlzpl.Validate();
                     mesBdWlzpl.Update(context.Transaction);
                }

               return mesBdWlzpl;

         }
	   
    }
}
