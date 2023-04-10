namespace WebbanHang.Types
{
    public class EntityType
    {
        public int groupID { get; set; }
        public string nameEntity { get; set; }
        public List<AttributeType> attributes { get; set; }
        public List<ValueType> values { get; set; }
        public decimal gia { get; set; }
        public string mota { get; set; }
        public int maNCC { get; set; }
        public int soluong { get; set; }
        public string anh { get; set; }
        public int maGiamGia { get; set; }
        public int daban { get; set; }


        public EntityType(int groupID, string nameEntity, List<AttributeType> attributes, List<ValueType> values,
            decimal gia, string mota, int maNCC, int soluong, string anh, int maGiamGia, int daban)
        {
            this.groupID = groupID;
            this.nameEntity = nameEntity;
            this.attributes = attributes;
            this.values = values;
            this.gia = gia;
            this.mota = mota;
            this.maNCC = maNCC;
            this.soluong = soluong;
            this.anh = anh;
            this.maGiamGia = maGiamGia;
            this.daban = daban;
        }
    }
}
