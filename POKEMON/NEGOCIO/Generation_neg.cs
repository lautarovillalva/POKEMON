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
        private Generation_dao generation_Dao = new Generation_dao();
        public List<Generation> getGenerations()
        {
            return generation_Dao.getGenerations();
        }
    }
}
