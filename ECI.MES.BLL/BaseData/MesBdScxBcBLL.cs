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
    public class MesBdScxBcBLL:SuperBLL
    {
	    private MesBdScxBcDAL dal = new MesBdScxBcDAL();
        private MesBdScxBcVAL val = new MesBdScxBcVAL();

        private static MesBdScxBcBLL instance;

		public  static MesBdScxBcBLL Instance
        {
            get { return instance; }
        }

        static MesBdScxBcBLL()
        {
            instance = new MesBdScxBcBLL();
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
                        MES_BD_SCX_BC.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_SCX_BC mesBdScxBc= new MES_BD_SCX_BC(MES_BD_SCX_BC.Fields.GUID);
                mesBdScxBc.Data = saveEntity.Data;
                mesBdScxBc.EffectDataFields();

				val.SaveValidate(context,mesBdScxBc,isAdd);

                 if (isAdd)
                 {
                      mesBdScxBc.GUID = Guid.NewGuid().ToString("N");
                      mesBdScxBc.AddUserInfo(context, isAdd);
					 
					  mesBdScxBc.Validate();
                      mesBdScxBc.Insert(context.Transaction);
                 }
                else
                {
                     mesBdScxBc.AddUserInfo(context, isAdd);
					 mesBdScxBc.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdScxBc.Validate();
                     mesBdScxBc.Update(context.Transaction);
                }

               return mesBdScxBc;

         }
	   
    }
}
