using FastMember;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Reflection;


namespace WebbanHang.Common
{
    public static class ConvertEntity
    {
        public static T ConvertToEntityNew<T>(SqlDataReader reader) where T : new()
        {
            T entity = new T();

            for (int i = 0; i < reader.FieldCount; i++)
            {
                string propertyName = reader.GetName(i);
                PropertyInfo propertyInfo = typeof(T).GetProperty(propertyName);
                if (propertyInfo != null && reader.GetValue(i) != DBNull.Value)
                {
                    propertyInfo.SetValue(entity, reader.GetValue(i), null);
                }
            }

            return entity;
        }

        #region DbToC#
        public static T ConvertToObject<T>(this SqlDataReader rd) where T : class, new()
        {
            Type type = typeof(T);
            var accessor = TypeAccessor.Create(type);
            var members = accessor.GetMembers();
            var t = new T();

            for (int i = 0; i < rd.FieldCount; i++)
            {
                if (!rd.IsDBNull(i))
                {
                    string fieldName = rd.GetName(i);

                    if (members.Any(m => string.Equals(m.Name, fieldName, StringComparison.OrdinalIgnoreCase)))
                    {
                        accessor[t, fieldName] = rd.GetValue(i);
                    }
                }
            }

            return t;
        }
        public static async Task<List<T>> ConvertToListObjectAsync<T>(this SqlDataReader rd) where T : class, new()
        {
            var res = new List<T>();
            while (await rd.ReadAsync())
            {
                var obj = rd.ConvertToObject<T>();

                res.Add(obj);
            }
            return res;
        }
        #endregion

        #region C#ToDb
        public static DataTable ConvertToObject<T>(T obj)
        {
            Type type = typeof(T);
            var properties = type.GetProperties();

            DataTable dataTable = new DataTable();
            dataTable.TableName = typeof(T).FullName;
            foreach (PropertyInfo info in properties)
            {
                dataTable.Columns.Add(new DataColumn(info.Name, Nullable.GetUnderlyingType(info.PropertyType) ?? info.PropertyType));
            }

            object[] values = new object[properties.Length];
            for (int i = 0; i < properties.Length; i++)
            {
                values[i] = properties[i].GetValue(obj);
            }

            dataTable.Rows.Add(values);
            return dataTable;
        }
        public static DataTable ConvertToListObject<T>(IEnumerable<T> list)
        {
            Type type = typeof(T);
            var properties = type.GetProperties();

            DataTable dataTable = new DataTable();
            dataTable.TableName = typeof(T).FullName;
            foreach (PropertyInfo info in properties)
            {
                dataTable.Columns.Add(new DataColumn(info.Name, Nullable.GetUnderlyingType(info.PropertyType) ?? info.PropertyType));
            }

            foreach (T entity in list)
            {
                object[] values = new object[properties.Length];
                for (int i = 0; i < properties.Length; i++)
                {
                    values[i] = properties[i].GetValue(entity);
                }

                dataTable.Rows.Add(values);
            }

            return dataTable;
        }

        #endregion
    }
}
