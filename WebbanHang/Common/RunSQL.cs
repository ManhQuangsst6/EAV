using Microsoft.Data.SqlClient;
using System.Data;

namespace WebbanHang.Common
{
    public class RunSQL
    {
        public void exec(string sql1, List<String> listParam)
        {
            string connectionString = "Data Source=PC\\ManhQuang;Initial Catalog=QLSanPham;Integrated Security=True;Encrypt=False";

            SqlConnection sql = new SqlConnection(connectionString);
            sql.Open();

            SqlCommand command = new SqlCommand("deleteProc", sql);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("@masp", SqlDbType.Int).Value = 1;
            //SqlParameter param = new SqlParameter("@masp", SqlDbType.Int);
            //param.Value = masp;
            //command.Parameters.Add(param);
            //command.Parameters.AddWithValue("@masp", "2");
            int num = command.ExecuteNonQuery();
        }
    }
}
