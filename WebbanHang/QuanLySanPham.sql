USE [QLSanPham]
GO
/****** Object:  UserDefinedTableType [dbo].[udtAttributesType]    Script Date: 4/10/2023 4:51:16 PM ******/
CREATE TYPE [dbo].[udtAttributesType] AS TABLE(
	[NameAttr] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[udtAVType]    Script Date: 4/10/2023 4:51:16 PM ******/
CREATE TYPE [dbo].[udtAVType] AS TABLE(
	[NameAttr] [nvarchar](50) NULL,
	[ValueAttr] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[udtEntityType]    Script Date: 4/10/2023 4:51:16 PM ******/
CREATE TYPE [dbo].[udtEntityType] AS TABLE(
	[GroupIdEntity] [int] NULL,
	[NameEntity] [nvarchar](50) NULL,
	[gia] [decimal](19, 4) NULL,
	[mota] [nvarchar](max) NULL,
	[maNCC] [int] NULL,
	[soluong] [int] NULL,
	[Anh] [nvarchar](max) NULL,
	[maGiamGia] [int] NULL,
	[daban] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[udtEntityTypeUpdate]    Script Date: 4/10/2023 4:51:16 PM ******/
CREATE TYPE [dbo].[udtEntityTypeUpdate] AS TABLE(
	[IdProduct] [int] NOT NULL,
	[GroupIdEntity] [int] NULL,
	[NameEntity] [varchar](100) NULL,
	PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[udtEntityTypeUpdate1]    Script Date: 4/10/2023 4:51:16 PM ******/
CREATE TYPE [dbo].[udtEntityTypeUpdate1] AS TABLE(
	[IdProduct] [int] NOT NULL,
	[GroupIdEntity] [int] NULL,
	[NameEntity] [varchar](100) NULL,
	[gia] [decimal](19, 4) NULL,
	[mota] [nvarchar](max) NULL,
	[maNCC] [int] NULL,
	[soluong] [int] NULL,
	[Anh] [nvarchar](max) NULL,
	[maGiamGia] [int] NULL,
	[daban] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[udtValuesEAVType]    Script Date: 4/10/2023 4:51:16 PM ******/
CREATE TYPE [dbo].[udtValuesEAVType] AS TABLE(
	[ValueAttr] [nvarchar](50) NULL
)
GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[IdAttributes] [int] IDENTITY(1,1) NOT NULL,
	[GroupIdEntity] [int] NULL,
	[NameAttr] [nvarchar](50) NULL,
	[isdeleted] [int] NULL,
 CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED 
(
	[IdAttributes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[IdProduct] [int] IDENTITY(1,1) NOT NULL,
	[GroupIdEntity] [int] NULL,
	[NameEntity] [nvarchar](50) NULL,
	[gia] [decimal](19, 4) NULL,
	[mota] [nvarchar](max) NULL,
	[maNCC] [int] NULL,
	[soluong] [int] NULL,
	[Anh] [nvarchar](max) NULL,
	[maGiamGia] [int] NULL,
	[daban] [int] NULL,
	[isdeleted] [int] NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValuesEAV]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValuesEAV](
	[ValueId] [int] IDENTITY(1,1) NOT NULL,
	[IdEntity] [int] NULL,
	[AttrID] [int] NULL,
	[ValueAttr] [nvarchar](50) NULL,
	[isdeleted] [int] NULL,
 CONSTRAINT [PK_ValuesEAV] PRIMARY KEY CLUSTERED 
(
	[ValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetAll]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   View [dbo].[GetAll]
as
select a.IdProduct as IdProduct,a.GroupIdEntity as GroupIdEntity,NameEntity,gia,mota,maNCC,soluong,anh,maGiamGia,daban,NameAttr,ValueAttr,
a.isdeleted as isdeleted from Entity a join ValuesEAV b on a.IdProduct=b.[IdEntity]
join Attributes c on c.IdAttributes=b.AttrID where a.isdeleted=1

GO
/****** Object:  View [dbo].[GetListData]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   View [dbo].[GetListData]
as
select idProduct  ,groupIdEntity,nameEntity,gia,mota,maNCC,soluong,anh,maGiamGia,daban
from Entity where isdeleted=1
GO
/****** Object:  Table [dbo].[GiamGia]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiamGia](
	[MaGiamGia] [int] NOT NULL,
	[TenMaGiamGia] [nvarchar](50) NULL,
	[mota] [nvarchar](max) NULL,
	[HinhThucApDung] [int] NULL,
	[GiaTriApDung] [nvarchar](50) NULL,
	[HanMuc] [decimal](19, 4) NULL,
 CONSTRAINT [PK_GiamGia] PRIMARY KEY CLUSTERED 
(
	[MaGiamGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupProducts]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupProducts](
	[GroupID] [int] NOT NULL,
	[TenGroup] [nvarchar](50) NULL,
 CONSTRAINT [PK_GroupProducts] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
	[SDT] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[taikhoan]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taikhoan](
	[id] [int] NOT NULL,
	[nameUser] [nvarchar](50) NULL,
	[Pass] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[sdt] [nvarchar](50) NULL,
	[dayupdate] [datetime] NULL,
	[isdeleted] [int] NULL,
 CONSTRAINT [PK_taikhoan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[deleteLastOneYearUser]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[deleteLastOneYearUser]
AS
begin 
set nocount on
BEGIN TRY
begin transaction
    

	delete taikhoan where isdeleted=0 and DATEDIFF(day,dayupdate,getdate())>365
	--delete ValuesEAV where [IdEntity]=@masp
	commit transaction
END
TRY  
BEGIN CATCH  
    IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION
    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  
end 
GO
/****** Object:  StoredProcedure [dbo].[deleteMutilProc]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[deleteMutilProc]
    @listMasp nvarchar(max) 
AS
begin 
set nocount on
BEGIN TRY
begin transaction
    -- Do something with the UDTT parameters
	declare @sql1 nvarchar(max) = 'update Entity set isdeleted=0 where  IdProduct in ('+@listMasp+')'
	declare @sql2 nvarchar(max) = 'update ValuesEAV set isdeleted=0 where  [IdEntity] in ('+@listMasp+')'
	EXEC sp_executesql @sql1;
	EXEC sp_executesql @sql2;
	--update ValuesEAV set isdeleted=0 where  [IdEntity]=@masp

	--delete Entity where IdProduct=@masp
	--delete ValuesEAV where [IdEntity]=@masp
	commit transaction
END
TRY  
BEGIN CATCH  
    IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION
    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  
end 
GO
/****** Object:  StoredProcedure [dbo].[deleteProc]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[deleteProc]
    @masp int 
AS
begin 
set nocount on
BEGIN TRY
begin transaction
    -- Do something with the UDTT parameters
	update Entity set isdeleted=0 where  IdProduct=@masp
	update ValuesEAV set isdeleted=0 where  [IdEntity]=@masp

	--delete Entity where IdProduct=@masp
	--delete ValuesEAV where [IdEntity]=@masp
	commit transaction
END
TRY  
BEGIN CATCH  
    IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION
    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  
end 
GO
/****** Object:  StoredProcedure [dbo].[GetEAVData]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetEAVData]
    @idgroup int
AS
begin 
set nocount on
BEGIN TRY
begin transaction
    DECLARE @Attributes NVARCHAR(MAX);
    DECLARE @PivotQuery NVARCHAR(MAX);

    -- Build a comma-separated list of attributes
    SELECT @Attributes = COALESCE(@Attributes + ', ', '') + QUOTENAME(NameAttr)
    FROM Attributes
    WHERE GroupIdEntity=@idgroup

    -- Build the pivot query dynamically
    SET @PivotQuery = N'
        SELECT IdProduct,GroupIdEntity,NameEntity,gia,mota,maNCC,soluong,anh,maGiamGia,daban, ' + @Attributes + '
        FROM (
            SELECT IdProduct,GroupIdEntity,NameEntity,gia,mota,maNCC,soluong,anh,maGiamGia,daban, NameAttr, ValueAttr
            FROM GetAll
            WHERE GroupIdEntity= @idgroup and isdeleted=1
        ) AS SourceTable
        PIVOT (
            Max(ValueAttr)
            FOR NameAttr IN (' + @Attributes + ')
        ) AS PivotTable;
    '

    EXEC sp_executesql @PivotQuery,N'@idgroup INT',@idgroup ;
	commit transaction
END
TRY  
BEGIN CATCH
    IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION
    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[GetEAVDataID]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetEAVDataID]
   -- @udtAVType udtAVType READONLY,
	@masp int
AS
begin 
set nocount on
BEGIN TRY
begin transaction
    DECLARE @Attributes NVARCHAR(MAX);
    DECLARE @PivotQuery NVARCHAR(MAX);

     SELECT @Attributes = COALESCE(@Attributes + ', ', '') + QUOTENAME(NameAttr)
    FROM GetAll
    WHERE IdProduct=@masp

    -- Build the pivot query dynamically
    SET @PivotQuery = N'
        SELECT IdProduct,GroupIdEntity,NameEntity,gia,mota,maNCC,soluong,anh,maGiamGia,daban, ' + @Attributes + '
        FROM (
            SELECT IdProduct,GroupIdEntity,NameEntity,gia,mota,maNCC,soluong,anh,maGiamGia,daban, NameAttr, ValueAttr
            FROM GetAll
            WHERE IdProduct=@masp and isdeleted=1
        ) AS SourceTable
        PIVOT (
            Max(ValueAttr)
            FOR NameAttr IN (' + @Attributes + ')
        ) AS PivotTable;
    '

    EXEC sp_executesql @PivotQuery,N'@masp INT',@masp ;
	commit transaction
END
TRY  
BEGIN CATCH  
    IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION
    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[GetListProduct]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetListProduct]
    @PageSize INT ,
    @PageNumber INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Entity
    ORDER BY IdProduct
    OFFSET (@PageNumber - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertAttrProc]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InsertAttrProc]
    @udtAttributesType dbo.udtAttributesType READONLY,
	@idgroup int
    
AS
begin 
set nocount on
BEGIN TRY
begin transaction
    -- Do something with the UDTT parameters
	insert into Attributes
	select @idgroup,nameAttr,1 from @udtAttributesType
	
	commit transaction
END
TRY  
BEGIN CATCH  
   IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH; 
end
GO
/****** Object:  StoredProcedure [dbo].[insertOldProc]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[insertOldProc]
    @udtEntityType dbo.udtEntityType READONLY,
    @udtValuesEAVType dbo.udtValuesEAVType READONLY
AS
begin 
set nocount on
BEGIN TRY
begin transaction
    -- Do something with the UDTT parameters
	declare @idGroup int =(select [GroupIdEntity] from @udtEntityType)
	insert into Entity 
	select GroupIdEntity,NameEntity,gia,mota,maNCC,soluong,anh,maGiamGia,daban,1 from @udtEntityType
	declare @idEntity int =(SELECT SCOPE_IDENTITY())
	
	DECLARE @subtableA TABLE (id int IDENTITY(1,1),idattr int );
	insert into @subtableA 
	select IdAttributes from Attributes where GroupIdEntity =@idGroup

	DECLARE @subtableV TABLE (id int IDENTITY(1,1),ValueAttr nvarchar(100) )
	insert into @subtableV 
	select ValueAttr from @udtValuesEAVType

	insert into ValuesEAV 
	select @idEntity,a.idattr ,ValueAttr,1  from @subtableA a join @subtableV b
	on a.id=b.id
	 commit transaction
END
TRY  
BEGIN CATCH  
 IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  
end
GO
/****** Object:  StoredProcedure [dbo].[insertProc]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[insertProc]
    @udtEntityType dbo.udtEntityType READONLY,
    @udtAttributesType dbo.udtAttributesType READONLY,
    @udtValuesEAVType dbo.udtValuesEAVType READONLY
AS
BEGIN
SET NOCOUNT ON;
BEGIN TRY
 BEGIN TRANSACTION;
    -- Do something with the UDTT parameters
	declare @idGroup int =(select [GroupIdEntity] from @udtEntityType)
    insert into Entity 
	select GroupIdEntity,NameEntity,gia,mota,maNCC,soluong,anh,maGiamGia,daban,1 from @udtEntityType
	declare @idEntity int =(SELECT SCOPE_IDENTITY())

	DECLARE @insertedIds TABLE (id int );
	insert into Attributes 
	OUTPUT  inserted.IdAttributes INTO @insertedIds
	select @idGroup,NameAttr,1 from @udtAttributesType

	DECLARE @subtableA TABLE (id int IDENTITY(1,1),idattr int );
	insert into @subtableA 
	select id from @insertedIds

	DECLARE @subtableV TABLE (id int IDENTITY(1,1),ValueAttr nvarchar(100) );
	insert into @subtableV 
	select ValueAttr from @udtValuesEAVType

	insert into ValuesEAV 
	select @idEntity,a.idattr ,ValueAttr,1  from @subtableA a join @subtableV b
	on a.id=b.id
	Commit TRANSACTION;
END
TRY  
BEGIN CATCH  
 IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  
END
GO
/****** Object:  StoredProcedure [dbo].[updateProc]    Script Date: 4/10/2023 4:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[updateProc]
    @udtEntityTypeUpdate dbo.udtEntityTypeUpdate1 READONLY,
    @udtValuesEAVType dbo.udtValuesEAVType READONLY
AS
begin 
set nocount on
BEGIN TRY
begin transaction
    -- Do something with the UDTT parameters
	declare @idEntity int =(select IdProduct from @udtEntityTypeUpdate)
	declare @idGroup int =(select GroupIdEntity from @udtEntityTypeUpdate)

	update Entity 
	set NameEntity=(select NameEntity from @udtEntityTypeUpdate),
	gia=(select gia from @udtEntityTypeUpdate),
	mota=(select mota from @udtEntityTypeUpdate),
	maNCC=(select maNCC from @udtEntityTypeUpdate),
	soluong=(select soluong from @udtEntityTypeUpdate),
	anh=(select anh from @udtEntityTypeUpdate),
	maGiamGia=(select maGiamGia from @udtEntityTypeUpdate),
	daban=(select daban from @udtEntityTypeUpdate)
	where IdProduct=@idEntity

	delete ValuesEAV
	where [IdEntity]=@idEntity

	DECLARE @subtableA TABLE (id int IDENTITY(1,1),idattr int );
	insert into @subtableA 
	select IdAttributes from Attributes where GroupIdEntity =@idGroup

	DECLARE @subtableV TABLE (id int IDENTITY(1,1),ValueAttr nvarchar(100) );
	insert into @subtableV 
	select ValueAttr from @udtValuesEAVType

	insert into ValuesEAV 
	select @idEntity,a.idattr ,ValueAttr,1  from @subtableA a join @subtableV b
	on a.id=b.id	
	commit transaction
END
TRY  
BEGIN CATCH  
   IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH; 
end
GO
