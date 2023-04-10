namespace WebbanHang.Models
{
    public class Entity
    {
        private int idProduct;
        private int groupIdEntity;
        private string nameEntity;
        private decimal gia;
        private string mota;
        private int maNCC;
        private int soluong;
        private string anh;
        private int maGiamGia;
        private int daban;

        public Entity(int idProduct, int groupIdEntity, string nameEntity, decimal gia, string mota, int maNCC, int soluong, string anh, int maGiamGia, int daban)
        {
            this.IdProduct = idProduct;
            this.GroupIdEntity = groupIdEntity;
            this.NameEntity = nameEntity;
            this.Gia = gia;
            this.Mota = mota;
            this.MaNCC = maNCC;
            this.Soluong = soluong;
            this.Anh = anh;
            this.MaGiamGia = maGiamGia;
            this.Daban = daban;
        }

        public int IdProduct { get => idProduct; set => idProduct = value; }
        public int GroupIdEntity { get => groupIdEntity; set => groupIdEntity = value; }
        public string NameEntity { get => nameEntity; set => nameEntity = value; }
        public decimal Gia { get => gia; set => gia = value; }
        public string Mota { get => mota; set => mota = value; }
        public int MaNCC { get => maNCC; set => maNCC = value; }
        public int Soluong { get => soluong; set => soluong = value; }
        public string Anh { get => anh; set => anh = value; }
        public int MaGiamGia { get => maGiamGia; set => maGiamGia = value; }
        public int Daban { get => daban; set => daban = value; }
    }
}
