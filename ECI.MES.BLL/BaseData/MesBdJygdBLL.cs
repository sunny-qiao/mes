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
    public class MesBdJygdBLL:SuperBLL
    {
	    private MesBdJygdDAL dal = new MesBdJygdDAL();
        private MesBdJygdVAL val = new MesBdJygdVAL();

        private static MesBdJygdBLL instance;

		public  static MesBdJygdBLL Instance
        {
            get { return instance; }
        }

        static MesBdJygdBLL()
        {
            instance = new MesBdJygdBLL();
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
                        MES_BD_JYGD.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_JYGD mesBdJygd= new MES_BD_JYGD(MES_BD_JYGD.Fields.GUID);
                mesBdJygd.Data = saveEntity.Data;
                mesBdJygd.EffectDataFields();

				val.SaveValidate(context,mesBdJygd,isAdd);

                 if (isAdd)
                 {
                      mesBdJygd.GUID = Guid.NewGuid().ToString("N");
                      mesBdJygd.AddUserInfo(context, isAdd);
					 
					  mesBdJygd.Validate();
                      mesBdJygd.Insert(context.Transaction);
                 }
                else
                {
                     mesBdJygd.AddUserInfo(context, isAdd);
					 mesBdJygd.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdJygd.Validate();
                     mesBdJygd.Update(context.Transaction);
                }

               return mesBdJygd;

         }
	   
    }
}
