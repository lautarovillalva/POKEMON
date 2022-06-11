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
    public class generation_dao
    {
        dataAccess DataAccess = new dataAccess();
        public List<generation> getGenerations()
        {
            List<generation> generations = new List<generation>();
            string query = "SELECT  GENERATIONS.ID, GENERATIONS.NAME_, GENERATIONS.DATE_, GENERATIONS.INFORMATION, GENERATIONS.IMAGE_URL FROM GENERATIONS";
            DataTable dataTable = DataAccess.GetDataTable("Generations", query);
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                generation generation = new generation
                {
                    id = Convert.ToInt32(dataTable.Rows[i][0]),
                    name = dataTable.Rows[i][1].ToString(),
                    date = Convert.ToDateTime(dataTable.Rows[i][2]),
                    information = dataTable.Rows[i][3].ToString(),
                    image_URL = dataTable.Rows[i][4].ToString()
                };
                generations.Add(generation);
            }
            return generations;
        }

    }
}
