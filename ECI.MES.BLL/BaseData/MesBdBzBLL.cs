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
    public class MesBdBzBLL:SuperBLL
    {
	    private MesBdBzDAL dal = new MesBdBzDAL();
        private MesBdBzVAL val = new MesBdBzVAL();

        private static MesBdBzBLL instance;

		public  static MesBdBzBLL Instance
        {
            get { return instance; }
        }

        static MesBdBzBLL()
        {
            instance = new MesBdBzBLL();
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
                        MES_BD_BZ.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_BZ mesBdBz= new MES_BD_BZ(MES_BD_BZ.Fields.GUID);
                mesBdBz.Data = saveEntity.Data;
                mesBdBz.EffectDataFields();

				val.SaveValidate(context,mesBdBz,isAdd);

                 if (isAdd)
                 {
                      mesBdBz.GUID = Guid.NewGuid().ToString("N");
                      mesBdBz.AddUserInfo(context, isAdd);
					 
					  mesBdBz.Validate();
                      mesBdBz.Insert(context.Transaction);
                 }
                else
                {
                     mesBdBz.AddUserInfo(context, isAdd);
					 mesBdBz.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdBz.Validate();
                     mesBdBz.Update(context.Transaction);
                }

               return mesBdBz;

         }
	   
    }
}
