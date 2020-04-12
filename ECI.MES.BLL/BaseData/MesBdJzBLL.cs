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
    public class MesBdJzBLL:SuperBLL
    {
	    private MesBdJzDAL dal = new MesBdJzDAL();
        private MesBdJzVAL val = new MesBdJzVAL();

        private static MesBdJzBLL instance;

		public  static MesBdJzBLL Instance
        {
            get { return instance; }
        }

        static MesBdJzBLL()
        {
            instance = new MesBdJzBLL();
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
                        MES_BD_JZ.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_JZ mesBdJz= new MES_BD_JZ(MES_BD_JZ.Fields.GUID);
                mesBdJz.Data = saveEntity.Data;
                mesBdJz.EffectDataFields();

				val.SaveValidate(context,mesBdJz,isAdd);

                 if (isAdd)
                 {
                      mesBdJz.GUID = Guid.NewGuid().ToString("N");
                      mesBdJz.AddUserInfo(context, isAdd);
					 
					  mesBdJz.Validate();
                      mesBdJz.Insert(context.Transaction);
                 }
                else
                {
                     mesBdJz.AddUserInfo(context, isAdd);
					 mesBdJz.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdJz.Validate();
                     mesBdJz.Update(context.Transaction);
                }

               return mesBdJz;

         }
	   
    }
}
