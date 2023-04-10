namespace WebbanHang.Models
{
    public class ValuesEAV
    {
        private int id;
        private int idEntity;
        private int idAttr;
        private string valueEAV;

        public ValuesEAV(int id, int idEntity, int idAttr, string valueEAV)
        {
            this.id = id;
            this.idEntity = idEntity;
            this.idAttr = idAttr;
            this.valueEAV = valueEAV;
        }

        public int Id { get => id; set => id = value; }
        public int IdEntity { get => idEntity; set => idEntity = value; }
        public int IdAttr { get => idAttr; set => idAttr = value; }
        public string ValueEAV { get => valueEAV; set => valueEAV = value; }
    }
}
