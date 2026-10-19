using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CrowedBridge
{
    public static class DbHelper
    {
        private static string connString = ConfigurationManager.ConnectionStrings["CrowdBridgeConn"] != null
            ? ConfigurationManager.ConnectionStrings["CrowdBridgeConn"].ConnectionString
            : @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CrowdBridgeDB.mdf;Integrated Security=True;";

        public static SqlConnection GetConnection()
        {
            return new SqlConnection(connString);
        }

        public static int ExecuteNonQuery(string query, SqlParameter[] parameters)
        {
            using (SqlConnection conn = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null) cmd.Parameters.AddRange(parameters);
                    conn.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
        }

        public static DataTable ExecuteSelect(string query, SqlParameter[] parameters)
        {
            using (SqlConnection conn = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null) cmd.Parameters.AddRange(parameters);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }
}