using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using DOMINIO;

namespace DAO
{
    public class Type_dao
    {
        DataAccess DataAccess = new DataAccess();
        public List<TypeP> GetTypes()
        {
            List<DOMINIO.TypeP> types = new List<TypeP>();
            string query = "SELECT ID, NAME_ FROM TYPES ORDER BY ID";
            DataTable dataTable = DataAccess.GetDataTable("Types", query);
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                TypeP type = new TypeP
                {
                    Id = Convert.ToInt32(dataTable.Rows[i][0]),
                    Name = dataTable.Rows[i][1].ToString(),
                };
                types.Add(type);
            }
            return types;
        }
    }
}
