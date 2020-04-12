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
    public class MesBdMjlxcsBLL:SuperBLL
    {
	    private MesBdMjlxcsDAL dal = new MesBdMjlxcsDAL();
        private MesBdMjlxcsVAL val = new MesBdMjlxcsVAL();

        private static MesBdMjlxcsBLL instance;

		public  static MesBdMjlxcsBLL Instance
        {
            get { return instance; }
        }

        static MesBdMjlxcsBLL()
        {
            instance = new MesBdMjlxcsBLL();
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
                        MES_BD_MJLXCS.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_MJLXCS mesBdMjlxcs= new MES_BD_MJLXCS(MES_BD_MJLXCS.Fields.GUID);
                mesBdMjlxcs.Data = saveEntity.Data;
                mesBdMjlxcs.EffectDataFields();

				val.SaveValidate(context,mesBdMjlxcs,isAdd);

                 if (isAdd)
                 {
                      mesBdMjlxcs.GUID = Guid.NewGuid().ToString("N");
                      mesBdMjlxcs.AddUserInfo(context, isAdd);
					 
					  mesBdMjlxcs.Validate();
                      mesBdMjlxcs.Insert(context.Transaction);
                 }
                else
                {
                     mesBdMjlxcs.AddUserInfo(context, isAdd);
					 mesBdMjlxcs.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdMjlxcs.Validate();
                     mesBdMjlxcs.Update(context.Transaction);
                }

               return mesBdMjlxcs;

         }
	   
    }
}
