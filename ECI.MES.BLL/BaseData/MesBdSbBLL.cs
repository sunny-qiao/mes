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
    public class MesBdSbBLL:SuperBLL
    {
	    private MesBdSbDAL dal = new MesBdSbDAL();
        private MesBdSbVAL val = new MesBdSbVAL();

        private static MesBdSbBLL instance;

		public  static MesBdSbBLL Instance
        {
            get { return instance; }
        }

        static MesBdSbBLL()
        {
            instance = new MesBdSbBLL();
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
                        MES_BD_SB.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_SB mesBdSb= new MES_BD_SB(MES_BD_SB.Fields.GUID);
                mesBdSb.Data = saveEntity.Data;
                mesBdSb.EffectDataFields();

				val.SaveValidate(context,mesBdSb,isAdd);

                 if (isAdd)
                 {
                      mesBdSb.GUID = Guid.NewGuid().ToString("N");
                      mesBdSb.AddUserInfo(context, isAdd);
					 
					  mesBdSb.Validate();
                      mesBdSb.Insert(context.Transaction);
                 }
                else
                {
                     mesBdSb.AddUserInfo(context, isAdd);
					 mesBdSb.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdSb.Validate();
                     mesBdSb.Update(context.Transaction);
                }

               return mesBdSb;

         }
	   
    }
}
