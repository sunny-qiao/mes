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
    public class MesBdWjlbBLL:SuperBLL
    {
	    private MesBdWjlbDAL dal = new MesBdWjlbDAL();
        private MesBdWjlbVAL val = new MesBdWjlbVAL();

        private static MesBdWjlbBLL instance;

		public  static MesBdWjlbBLL Instance
        {
            get { return instance; }
        }

        static MesBdWjlbBLL()
        {
            instance = new MesBdWjlbBLL();
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
                        MES_BD_WJLB.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_WJLB mesBdWjlb= new MES_BD_WJLB(MES_BD_WJLB.Fields.GUID);
                mesBdWjlb.Data = saveEntity.Data;
                mesBdWjlb.EffectDataFields();

				val.SaveValidate(context,mesBdWjlb,isAdd);

                 if (isAdd)
                 {
                      mesBdWjlb.GUID = Guid.NewGuid().ToString("N");
                      mesBdWjlb.AddUserInfo(context, isAdd);
					 
					  mesBdWjlb.Validate();
                      mesBdWjlb.Insert(context.Transaction);
                 }
                else
                {
                     mesBdWjlb.AddUserInfo(context, isAdd);
					 mesBdWjlb.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdWjlb.Validate();
                     mesBdWjlb.Update(context.Transaction);
                }

               return mesBdWjlb;

         }
	   
    }
}
