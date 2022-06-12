using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DOMINIO;
using DAO;

namespace NEGOCIO
{
    public class Type_neg
    {
        private Type_dao Type_Dao = new Type_dao();
        public List<TypeP> GetTypes()
        {
            return Type_Dao.GetTypes();
        }
    }
}
