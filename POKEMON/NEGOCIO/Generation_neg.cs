using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DOMINIO;
using DAO;

namespace NEGOCIO
{
    public class Generation_neg
    {
        public List<generation> getGenerations()
        {
            generation_dao generation_Dao = new generation_dao();
            return generation_Dao.getGenerations();
        }
    }
}
