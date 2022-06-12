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
    public class Generation_dao
    {
        DataAccess DataAccess = new DataAccess();
        public List<Generation> getGenerations()
        {
            List<Generation> generations = new List<Generation>();
            string query = "SELECT  GENERATIONS.ID, GENERATIONS.NAME_, GENERATIONS.DATE_, GENERATIONS.INFORMATION, GENERATIONS.IMAGE_URL FROM GENERATIONS";
            DataTable dataTable = DataAccess.GetDataTable("Generations", query);
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                Generation generation = new Generation
                {
                    Id = Convert.ToInt32(dataTable.Rows[i][0]),
                    Name = dataTable.Rows[i][1].ToString(),
                    Date = Convert.ToDateTime(dataTable.Rows[i][2]),
                    Information = dataTable.Rows[i][3].ToString(),
                    Image_URL = dataTable.Rows[i][4].ToString()
                };
                generations.Add(generation);
            }
            return generations;
        }

    }
}
