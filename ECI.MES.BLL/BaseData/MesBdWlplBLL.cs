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
    public class MesBdWlplBLL:SuperBLL
    {
	    private MesBdWlplDAL dal = new MesBdWlplDAL();
        private MesBdWlplVAL val = new MesBdWlplVAL();

        private static MesBdWlplBLL instance;

		public  static MesBdWlplBLL Instance
        {
            get { return instance; }
        }

        static MesBdWlplBLL()
        {
            instance = new MesBdWlplBLL();
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
                        MES_BD_WLPL.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_WLPL mesBdWlpl= new MES_BD_WLPL(MES_BD_WLPL.Fields.GUID);
                mesBdWlpl.Data = saveEntity.Data;
                mesBdWlpl.EffectDataFields();

				val.SaveValidate(context,mesBdWlpl,isAdd);

                 if (isAdd)
                 {
                      mesBdWlpl.GUID = Guid.NewGuid().ToString("N");
                      mesBdWlpl.AddUserInfo(context, isAdd);
					 
					  mesBdWlpl.Validate();
                      mesBdWlpl.Insert(context.Transaction);
                 }
                else
                {
                     mesBdWlpl.AddUserInfo(context, isAdd);
					 mesBdWlpl.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdWlpl.Validate();
                     mesBdWlpl.Update(context.Transaction);
                }

               return mesBdWlpl;

         }
	   
    }
}
