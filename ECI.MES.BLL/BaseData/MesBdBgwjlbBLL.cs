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
    public class MesBdBgwjlbBLL:SuperBLL
    {
	    private MesBdBgwjlbDAL dal = new MesBdBgwjlbDAL();
        private MesBdBgwjlbVAL val = new MesBdBgwjlbVAL();

        private static MesBdBgwjlbBLL instance;

		public  static MesBdBgwjlbBLL Instance
        {
            get { return instance; }
        }

        static MesBdBgwjlbBLL()
        {
            instance = new MesBdBgwjlbBLL();
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
                        MES_BD_BGWJLB.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_BGWJLB mesBdBgwjlb= new MES_BD_BGWJLB(MES_BD_BGWJLB.Fields.GUID);
                mesBdBgwjlb.Data = saveEntity.Data;
                mesBdBgwjlb.EffectDataFields();

				val.SaveValidate(context,mesBdBgwjlb,isAdd);

                 if (isAdd)
                 {
                      mesBdBgwjlb.GUID = Guid.NewGuid().ToString("N");
                      mesBdBgwjlb.AddUserInfo(context, isAdd);
					 
					  mesBdBgwjlb.Validate();
                      mesBdBgwjlb.Insert(context.Transaction);
                 }
                else
                {
                     mesBdBgwjlb.AddUserInfo(context, isAdd);
					 mesBdBgwjlb.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdBgwjlb.Validate();
                     mesBdBgwjlb.Update(context.Transaction);
                }

               return mesBdBgwjlb;

         }
	   
    }
}
