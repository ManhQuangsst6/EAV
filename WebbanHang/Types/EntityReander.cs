namespace WebbanHang.Types
{
    public class EntityReander
    {


        public int id { get; set; }
        public int groupID { get; set; }
        public string nameEntity { get; set; }
        public List<ValueType> values { get; set; }
        public EntityReander(int id, int groupID, string nameEntity, List<ValueType> values)
        {
            this.id = id;
            this.groupID = groupID;
            this.nameEntity = nameEntity;
            this.values = values;
        }

    }
}
