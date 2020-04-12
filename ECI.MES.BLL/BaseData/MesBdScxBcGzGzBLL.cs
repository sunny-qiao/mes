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
    public class MesBdScxBcGzGzBLL:SuperBLL
    {
	    private MesBdScxBcGzGzDAL dal = new MesBdScxBcGzGzDAL();
        private MesBdScxBcGzGzVAL val = new MesBdScxBcGzGzVAL();

        private static MesBdScxBcGzGzBLL instance;

		public  static MesBdScxBcGzGzBLL Instance
        {
            get { return instance; }
        }

        static MesBdScxBcGzGzBLL()
        {
            instance = new MesBdScxBcGzGzBLL();
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
                        MES_BD_SCX_BC_GZ_GZ.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_SCX_BC_GZ_GZ mesBdScxBcGzGz= new MES_BD_SCX_BC_GZ_GZ(MES_BD_SCX_BC_GZ_GZ.Fields.GUID);
                mesBdScxBcGzGz.Data = saveEntity.Data;
                mesBdScxBcGzGz.EffectDataFields();

				val.SaveValidate(context,mesBdScxBcGzGz,isAdd);

                 if (isAdd)
                 {
                      mesBdScxBcGzGz.GUID = Guid.NewGuid().ToString("N");
                      mesBdScxBcGzGz.AddUserInfo(context, isAdd);
					 
					  mesBdScxBcGzGz.Validate();
                      mesBdScxBcGzGz.Insert(context.Transaction);
                 }
                else
                {
                     mesBdScxBcGzGz.AddUserInfo(context, isAdd);
					 mesBdScxBcGzGz.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdScxBcGzGz.Validate();
                     mesBdScxBcGzGz.Update(context.Transaction);
                }

               return mesBdScxBcGzGz;

         }
	   
    }
}
