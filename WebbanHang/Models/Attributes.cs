namespace WebbanHang.Models
{
    public class Attributes
    {
        private int id;
        private int groupIDEntity;
        private string nameAttr;

        public Attributes(int id, int groupIDEntity, string nameAttr)
        {
            this.id = id;
            this.groupIDEntity = groupIDEntity;
            this.nameAttr = nameAttr;
        }

        public int Id { get => id; set => id = value; }
        public int GroupIDEntity { get => groupIDEntity; set => groupIDEntity = value; }
        public string NameAttr { get => nameAttr; set => nameAttr = value; }
    }
}
