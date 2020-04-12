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
    public class MesBdZyBLL : SuperBLL
    {
        private MesBdZyDAL dal = new MesBdZyDAL();
        private MesBdZyVAL val = new MesBdZyVAL();

        private static MesBdZyBLL instance;

        public static MesBdZyBLL Instance
        {
            get { return instance; }
        }

        static MesBdZyBLL()
        {
            instance = new MesBdZyBLL();
        }
        public DataTable GetLower(BLLContext context, string id)
        {
            return dal.GetLower(context, id);
        }
        public DataTable Load(BLLContext context, string guid)
        {
            return dal.Load(context, guid);
        }

        public SearchResult Search(BLLContext context, Paging paging, EntityBase queryEntity)
        {
            return dal.Search(context, paging, queryEntity);
        }

        public void Delete(BLLContext context, List<string> listGuid)
        {


            foreach (string guid in listGuid)
            {
                val.DeleteValidate(context, guid);
                MES_BD_ZY.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
            }
        }

        public EntityBase Save(BLLContext context, EntityBase saveEntity, bool isAdd)
        {


            MES_BD_ZY mesBdZy = new MES_BD_ZY(MES_BD_ZY.Fields.GUID);
            mesBdZy.Data = saveEntity.Data;
            mesBdZy.EffectDataFields();

            val.SaveValidate(context, mesBdZy, isAdd);

            if (isAdd)
            {
                if (context.Type != "tree")
                {
                    mesBdZy.GUID = Guid.NewGuid().ToString("N");
                }
                mesBdZy.AddUserInfo(context, isAdd);

                mesBdZy.Validate();
                mesBdZy.Insert(context.Transaction);
            }
            else
            {
                mesBdZy.AddUserInfo(context, isAdd);
                mesBdZy.NotSave("CREATE_DATE,CREATE_USER");

                mesBdZy.Validate();
                mesBdZy.Update(context.Transaction);
            }

            return mesBdZy;

        }

    }
}
