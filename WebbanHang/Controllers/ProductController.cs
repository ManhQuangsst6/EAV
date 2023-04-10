using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Swashbuckle.AspNetCore.Annotations;
using System.Data;
using WebbanHang.Common;
using WebbanHang.Models;
using WebbanHang.Types;

namespace WebbanHang.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        [HttpPost]
        [SwaggerResponse(StatusCodes.Status200OK, Type = typeof(String))]
        public IActionResult Insert([FromBody] EntityType entityType)
        {
            try
            {

                string connectionString = "Data Source=PC\\ManhQuang;Initial Catalog=QuanLySanPham;Integrated Security=True;Encrypt=False";

                SqlConnection sql = new SqlConnection(connectionString);
                sql.Open();


                DataTable table = new DataTable();
                table.Columns.Add("groupID", typeof(int));
                table.Columns.Add("nameEntity", typeof(string));
                table.Columns.Add("gia", typeof(string));
                table.Columns.Add("mota", typeof(string));
                table.Columns.Add("maNCC", typeof(string));
                table.Columns.Add("soluong", typeof(string));
                table.Columns.Add("anh", typeof(string));
                table.Columns.Add("maGiamGia", typeof(string));
                table.Columns.Add("daban", typeof(string));

                DataRow row1 = table.NewRow();

                row1["groupID"] = entityType.groupID;
                row1["nameEntity"] = entityType.nameEntity;
                row1["gia"] = entityType.gia;
                row1["mota"] = entityType.mota;
                row1["maNCC"] = entityType.maNCC;
                row1["soluong"] = entityType.soluong;
                row1["anh"] = entityType.anh;
                row1["maGiamGia"] = entityType.maGiamGia;
                row1["daban"] = entityType.daban;
                table.Rows.Add(row1);

                SqlParameter param = new SqlParameter("@udtEntityType", SqlDbType.Structured);

                param.Value = table;

                SqlParameter param2 = new SqlParameter("@udtAttributesType", SqlDbType.Structured);

                DataTable table1 = new DataTable();
                table1.Columns.Add("nameAttr", typeof(string));
                foreach (var item in entityType.attributes)
                {
                    DataRow row = table1.NewRow();
                    row["nameAttr"] = item.nameAttr;

                    table1.Rows.Add(row);
                }
                param2.Value = table1;

                SqlParameter param3 = new SqlParameter("@udtValuesEAVType", SqlDbType.Structured);

                DataTable table2 = new DataTable();
                table2.Columns.Add("valueEAV", typeof(string));
                foreach (var item in entityType.values)
                {
                    DataRow row = table2.NewRow();
                    row["valueEAV"] = item.valueEAV;

                    table2.Rows.Add(row);
                }
                param3.Value = table2;


                SqlCommand command = new SqlCommand("insertProc", sql);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(param);
                command.Parameters.Add(param2);
                command.Parameters.Add(param3);

                int num = command.ExecuteNonQuery();

                return StatusCode(StatusCodes.Status200OK, "thanh cong");

            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status404NotFound, ex);
            }
        }
        [Route("insertOld")]
        [HttpPost]
        public IActionResult InsertOld([FromBody] EntityType entityTypeInsertOld)
        {

            try
            {

                string connectionString = "Data Source=PC\\ManhQuang;Initial Catalog=QuanLySanPham;Integrated Security=True;Encrypt=False";

                SqlConnection sql = new SqlConnection(connectionString);
                sql.Open();


                DataTable table = new DataTable();
                table.Columns.Add("groupID", typeof(int));
                table.Columns.Add("nameEntity", typeof(string));
                table.Columns.Add("gia", typeof(string));
                table.Columns.Add("mota", typeof(string));
                table.Columns.Add("maNCC", typeof(string));
                table.Columns.Add("soluong", typeof(string));
                table.Columns.Add("anh", typeof(string));
                table.Columns.Add("maGiamGia", typeof(string));
                table.Columns.Add("daban", typeof(string));

                DataRow row1 = table.NewRow();

                row1["groupID"] = entityTypeInsertOld.groupID;
                row1["nameEntity"] = entityTypeInsertOld.nameEntity;
                row1["gia"] = entityTypeInsertOld.gia;
                row1["mota"] = entityTypeInsertOld.mota;
                row1["maNCC"] = entityTypeInsertOld.maNCC;
                row1["soluong"] = entityTypeInsertOld.soluong;
                row1["anh"] = entityTypeInsertOld.anh;
                row1["maGiamGia"] = entityTypeInsertOld.maGiamGia;
                row1["daban"] = entityTypeInsertOld.daban;
                table.Rows.Add(row1);

                SqlParameter param = new SqlParameter("@udtEntityType", SqlDbType.Structured);

                param.Value = table;

                SqlParameter param3 = new SqlParameter("@udtValuesEAVType", SqlDbType.Structured);

                DataTable table2 = new DataTable();
                table2.Columns.Add("valueEAV", typeof(string));

                foreach (var item in entityTypeInsertOld.values)
                {

                    DataRow row = table2.NewRow();
                    row["valueEAV"] = item.valueEAV;

                    table2.Rows.Add(row);
                }
                param3.Value = table2;


                SqlCommand command = new SqlCommand("insertOldProc", sql);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(param);
                command.Parameters.Add(param3);

                int num = command.ExecuteNonQuery();

                return StatusCode(StatusCodes.Status200OK, "thanh cong");

            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status404NotFound, ex);
            }


        }

        [HttpPut]
        public IActionResult updateProduct([FromQuery] int masp, [FromBody] EntityType entityType)
        {
            try
            {
                string connectionString = "Data Source=PC\\ManhQuang;Initial Catalog=QuanLySanPham;Integrated Security=True;Encrypt=False";

                SqlConnection sql = new SqlConnection(connectionString);
                sql.Open();


                DataTable table = new DataTable();
                table.Columns.Add("id", typeof(int));
                table.Columns.Add("groupID", typeof(int));
                table.Columns.Add("nameEntity", typeof(string));
                table.Columns.Add("gia", typeof(string));
                table.Columns.Add("mota", typeof(string));
                table.Columns.Add("maNCC", typeof(string));
                table.Columns.Add("soluong", typeof(string));
                table.Columns.Add("anh", typeof(string));
                table.Columns.Add("maGiamGia", typeof(string));
                table.Columns.Add("daban", typeof(string));

                DataRow row1 = table.NewRow();
                row1["id"] = masp;
                row1["groupID"] = entityType.groupID;
                row1["nameEntity"] = entityType.nameEntity;
                row1["gia"] = entityType.gia;
                row1["mota"] = entityType.mota;
                row1["maNCC"] = entityType.maNCC;
                row1["soluong"] = entityType.soluong;
                row1["anh"] = entityType.anh;
                row1["maGiamGia"] = entityType.maGiamGia;
                row1["daban"] = entityType.daban;
                table.Rows.Add(row1);

                SqlParameter param = new SqlParameter("@udtEntityTypeUpdate", SqlDbType.Structured);

                param.Value = table;

                SqlParameter param3 = new SqlParameter("@udtValuesEAVType", SqlDbType.Structured);

                DataTable table2 = new DataTable();
                table2.Columns.Add("valueEAV", typeof(string));
                foreach (var item in entityType.values)
                {
                    DataRow row = table2.NewRow();
                    row["valueEAV"] = item.valueEAV;

                    table2.Rows.Add(row);
                }
                param3.Value = table2;


                SqlCommand command = new SqlCommand("updateProc", sql);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(param);
                command.Parameters.Add(param3);

                int num = command.ExecuteNonQuery();

                return StatusCode(StatusCodes.Status200OK, "thanh cong");

            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status404NotFound, ex);
            }
        }
        [HttpDelete()]
        public IActionResult Delete([FromQuery] int masp)
        {

            try
            {
                string connectionString = "Data Source=PC\\ManhQuang;Initial Catalog=QuanLySanPham;Integrated Security=True;Encrypt=False";

                SqlConnection sql = new SqlConnection(connectionString);
                sql.Open();

                SqlCommand command = new SqlCommand("deleteProc", sql);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@masp", SqlDbType.Int).Value = masp;
                //SqlParameter param = new SqlParameter("@masp", SqlDbType.Int);
                //param.Value = masp;
                //command.Parameters.Add(param);
                //command.Parameters.AddWithValue("@masp", "2");
                int num = command.ExecuteNonQuery();
                return StatusCode(StatusCodes.Status200OK, "thanh cong");

            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status404NotFound, ex);
            }
        }
        //[HttpGet()]
        //public async Task<IActionResult> getAll([FromQuery] int groupID)
        //{
        //    try
        //    {
        //        string connectionString = "Data Source=PC\\ManhQuang;Initial Catalog=BanHang;Integrated Security=True;Encrypt=False";

        //        SqlConnection sql = new SqlConnection(connectionString);
        //        sql.Open();

        //        SqlCommand command = new SqlCommand("GetEAVData", sql);
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.Parameters.AddWithValue("@idgroup", groupID);
        //        var lst = await command.ExecuteReaderAsync();
        //        int a = 1;
        //        // List<SanPham> sanPhams = new List<SanPham>();
        //        List<SanPham> sanPhams = await ConvertEntity.ConvertToListObjectAsync<SanPham>(lst);

        //        if (lst.HasRows)
        //        {
        //            while (lst.Read())
        //            {
        //                // SanPham sanPham = new SanPham(lst.GetInt32(0), lst.GetInt32(1), lst.GetString(2), lst.GetString(3), lst.GetString(4), lst.GetString(5));
        //                // sanPhams.Add(sanPham);

        //            }
        //        }
        //        return StatusCode(StatusCodes.Status200OK, sanPhams);
        //    }
        //    catch (Exception ex)
        //    {
        //        return StatusCode(StatusCodes.Status404NotFound, "e001");
        //    }

        //}
        [HttpGet("masp")]
        public async Task<IActionResult> getbyID([FromQuery] int masp)
        {
            try
            {
                string connectionString = "Data Source=PC\\ManhQuang;Initial Catalog=QuanLySanPham;Integrated Security=True;Encrypt=False";

                SqlConnection sql = new SqlConnection(connectionString);
                sql.Open();

                SqlCommand command = new SqlCommand("GetEAVDataID", sql);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@masp", SqlDbType.Int).Value = masp;
                // command.Parameters.AddWithValue("@masp", masp);
                var lst = await command.ExecuteReaderAsync();
                //if (lst.HasRows)
                //{
                //    while (lst.Read())
                //    {
                //        entities.Add(new Entity(lst.GetInt32(0), lst.GetInt32(1), lst.GetString(2), lst.GetDecimal(3), lst.GetString(4),
                //            lst.GetInt32(5), lst.GetInt32(6), lst.GetString(7), lst.GetInt32(8), lst.GetInt32(9)));
                //    }
                //}
                SanPham sanPham = ConvertEntity.ConvertToEntityNew<SanPham>(lst);
                // List<SanPham> product = await ConvertEntity.ConvertToListObjectAsync<SanPham>(lst);

                return StatusCode(StatusCodes.Status200OK, sanPham);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status404NotFound, "e001");
            }

        }
        [HttpGet("data")]
        public async Task<IActionResult> getData([FromQuery] int pageSize, [FromQuery] int pageNum)
        {
            try
            {
                string connectionString = "Data Source=PC\\ManhQuang;Initial Catalog=QuanLySanPham;Integrated Security=True;Encrypt=False";

                SqlConnection sql = new SqlConnection(connectionString);
                sql.Open();
                //  string queryString = "select * from GetListData";

                SqlCommand command = new SqlCommand("spPhanTrang_Table", sql);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@PageSize", pageSize);
                command.Parameters.AddWithValue("@PageNumber", pageNum);

                var lst = await command.ExecuteReaderAsync();
                List<Entity> entities = new List<Entity>();
                if (lst.HasRows)
                {
                    while (lst.Read())
                    {
                        entities.Add(new Entity(lst.GetInt32(0), lst.GetInt32(1), lst.GetString(2), lst.GetDecimal(3), lst.GetString(4),
                            lst.GetInt32(5), lst.GetInt32(6), lst.GetString(7), lst.GetInt32(8), lst.GetInt32(9)));
                    }
                }
                // Task<List<Entity>> sanPham = ConvertEntity.ConvertToListObjectAsync<Entity>(lst);

                return StatusCode(StatusCodes.Status200OK, entities);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status404NotFound, "e001");
            }
        }
    }
}
