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
    public class MesBdSbDocBLL:SuperBLL
    {
	    private MesBdSbDocDAL dal = new MesBdSbDocDAL();
        private MesBdSbDocVAL val = new MesBdSbDocVAL();

        private static MesBdSbDocBLL instance;

		public  static MesBdSbDocBLL Instance
        {
            get { return instance; }
        }

        static MesBdSbDocBLL()
        {
            instance = new MesBdSbDocBLL();
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
                        MES_BD_SB_DOC.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_SB_DOC mesBdSbDoc= new MES_BD_SB_DOC(MES_BD_SB_DOC.Fields.GUID);
                mesBdSbDoc.Data = saveEntity.Data;
                mesBdSbDoc.EffectDataFields();

				val.SaveValidate(context,mesBdSbDoc,isAdd);

                 if (isAdd)
                 {
                      mesBdSbDoc.GUID = Guid.NewGuid().ToString("N");
                      mesBdSbDoc.AddUserInfo(context, isAdd);
					 
					  mesBdSbDoc.Validate();
                      mesBdSbDoc.Insert(context.Transaction);
                 }
                else
                {
                     mesBdSbDoc.AddUserInfo(context, isAdd);
					 mesBdSbDoc.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdSbDoc.Validate();
                     mesBdSbDoc.Update(context.Transaction);
                }

               return mesBdSbDoc;

         }
	   
    }
}
