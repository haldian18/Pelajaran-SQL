--Binary
Use model;
GO
declare @myVar BINARY(2);
SET @myVar = 12345678;
SET @myVar = @myVar+2;
SELECT  CAST( @myVar AS INT);
GO

-- Varbinary
Use model;
GO
DECLARE @myVar VARBINARY(2);
SET @myVar = 123456789;
SET @myVar = @myVar + 3;
SELECT CAST(@myVar AS INT);
GO

--Char
Use model;
GO
CREATE TABLE myCharTable(a char(25));
GO
INSERT INTO myCharTable VALUES ('abc + def');
GO
SELECT a FROM myCharTable;
GO

-- Varchar
USE model;
GO
DECLARE @myVar AS varchar(20) = 'abc123';
SELECT @myVar as 'My column', DATALENGTH(@myVar) as 'Length';
GO

-- Date 
USE model;
GO 
DECLARE @date date = '08-21-14';
SELECT	@date AS 'Date';
GO

-- Datetime
Use model;
GO 
DECLARE @date date='08-21-14';
DECLARE @datetime datetime = @date;
SELECT @datetime as 'Datetime', @date as 'Date';
GO

-- Smalldatetime
USE model;
GO
DECLARE @smalldatetime smalldatetime = '2014-08-21 11:03:17';
DECLARE @date date = @smalldatetime
SELECT @smalldatetime as 'Smalldatetime', @date as 'Date';
GO

-- Time
USE model;
GO
DECLARE @time time = '08-21-14 10:21:12.123';
SELECT @time AS 'Time';
GO

-- Bigint
USE model;
GO
CREATE TABLE test_table(a bigint);
go
insert into test_table values (9223372036854775807);
go
select a from test_table;
go

-- Int 
Use model;
go
create table myIntTable (b int);
go
insert into myIntTable values(214483647);
go
select b from myIntTable;
go


-- SmallInt
Use model;
go 
create table mySmallintTable (c smallint);
go
insert into mySmallintTable values (32767);
go
select c from mySmallintTable;
go

-- Decimal 
use model;
go
create table myDecTable (b decimal(7,2));
go
insert into myDecTable values (234);
go
select b from myDecTable;
go


-- Numeric
USE model;
GO
CREATE TABLE myNumTable ( a numeric (12,6) );
GO
INSERT INTO myNumTable VALUES (777.123);
GO
SELECT a FROM myNumTable;-- NCharuse model;gocreate table myNcharTable (a nchar(20));goinsert into myNcharTable values ('This is an example');goselect a from myNcharTable;go-- NvarcharUSE model;
GO
CREATE TABLE nvarcharTable ( a nvarchar(25) );
GO
INSERT INTO nvarcharTable VALUES ('This is an example');
GO
SELECT a FROM nvarcharTable;
GO-- RowversionUSE model;
GO
CREATE TABLE myTest (id int PRIMARY KEY, name char(20), test_column
rowversion);
GO
INSERT INTO myTest (id, name) VALUES (1, 'test_1');
GO
INSERT INTO myTest (id, name) VALUES (2, 'test_2');
GO
SELECT * FROM myTest;
GO



-- Uniqueidentifier
USE model;
GO
DECLARE @id_var uniqueidentifier = NEWID();
SELECT @id_var AS 'Result';
GO

Declare @A Int = 10,@B Int = 5,@C Int;	set @C = @A+@B; 		Print 'Penjumlhan 2 Bilangan Bulat = ' + Cast(@c as varchar(10));			Declare @a INT = 2, @b FLOAT = 3.14, @c INT = 2, @d FLOAT;	set @d = @a*@b*@C*@C;		print 'Menghitung luas lingkaran (2.phi.r2) = ' + Cast(@d as varchar(10));			Alter table MAHASISWA  alter column tanggal_lhr nvarchar(10)
SELECT convert(varchar,getdate(),105) AS Konversi_Date_ke_Nvarchar	