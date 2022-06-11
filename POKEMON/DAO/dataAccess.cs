using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;


namespace DAO
{
    class dataAccess
    {
        readonly string routeDB= "Data Source=.\\sqlexpress;Initial Catalog = POKEMON_DB; Integrated Security = True";
        public dataAccess() { }
        private SqlConnection GetSqlConnection()
        {
            SqlConnection cn = new SqlConnection(routeDB);
            try
            {
                cn.Open();
                return cn;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private SqlDataAdapter GetSqlDataAdapter(string query, SqlConnection cn)
        {
            SqlDataAdapter dataAdapter;
            try
            {
                dataAdapter = new SqlDataAdapter(query, cn);
                return dataAdapter;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public DataTable GetDataTable (string tableName, string query)
        {
            DataSet dataSet = new DataSet();
            SqlConnection sqlConnection = GetSqlConnection();
            SqlDataAdapter dataAdapter = GetSqlDataAdapter(query, sqlConnection);
            dataAdapter.Fill(dataSet, tableName);
            sqlConnection.Close();
            return dataSet.Tables[tableName];
        }
        public int ExecQuery(string query)
        {
            SqlCommand sqlCommand = new SqlCommand();
            SqlConnection sqlConnection = GetSqlConnection();
            sqlCommand.Connection = sqlConnection;

            sqlCommand.CommandText = query;
            sqlCommand.CommandType = CommandType.Text;
            int rows = sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
            return rows;
        }
    }
}
