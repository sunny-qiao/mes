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
    public class MesBdScxBcTqyjlBLL:SuperBLL
    {
	    private MesBdScxBcTqyjlDAL dal = new MesBdScxBcTqyjlDAL();
        private MesBdScxBcTqyjlVAL val = new MesBdScxBcTqyjlVAL();

        private static MesBdScxBcTqyjlBLL instance;

		public  static MesBdScxBcTqyjlBLL Instance
        {
            get { return instance; }
        }

        static MesBdScxBcTqyjlBLL()
        {
            instance = new MesBdScxBcTqyjlBLL();
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
                        MES_BD_SCX_BC_TQYJL.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_SCX_BC_TQYJL mesBdScxBcTqyjl= new MES_BD_SCX_BC_TQYJL(MES_BD_SCX_BC_TQYJL.Fields.GUID);
                mesBdScxBcTqyjl.Data = saveEntity.Data;
                mesBdScxBcTqyjl.EffectDataFields();

				val.SaveValidate(context,mesBdScxBcTqyjl,isAdd);

                 if (isAdd)
                 {
                      mesBdScxBcTqyjl.GUID = Guid.NewGuid().ToString("N");
                      mesBdScxBcTqyjl.AddUserInfo(context, isAdd);
					 
					  mesBdScxBcTqyjl.Validate();
                      mesBdScxBcTqyjl.Insert(context.Transaction);
                 }
                else
                {
                     mesBdScxBcTqyjl.AddUserInfo(context, isAdd);
					 mesBdScxBcTqyjl.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdScxBcTqyjl.Validate();
                     mesBdScxBcTqyjl.Update(context.Transaction);
                }

               return mesBdScxBcTqyjl;

         }
	   
    }
}
