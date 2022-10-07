Begin
 -- Declaring a variable
 Declare @v_Result Int;
 -- Declaring a variable with a value of 50
 Declare @v_a Int = 50;
 -- Declaring a variable with a value of 100
 Declare @v_b Int = 100;

 -- Print out Console (For developer).
 -- Using Cast to convert Int to String
 -- Using + operator to concatenate 2 string
 Print 'v_a= ' + Cast(@v_a as varchar(15));
 -- Print out Console
 Print 'v_b= ' + Cast(@v_b as varchar(15));
 -- Sum
 Set @v_Result = @v_a + @v_b;
 -- Print out Console
 Print 'v_Result= ' + Cast(@v_Result as varchar(15));
End;Begin Declare @a Int = 10,@b Int = 5,@c Int = 2,@d Int = 105,@per int;	set @per = @a*@b/@c+@d; 		Print 'Perhitungan : c = 10 x 5 / 2 + 105 = ' + Cast(@per as varchar(10));	End;Begin-- r = 2 x µ x r2Declare @a Int = 2,@µ float = 3.14,@r2 Int = 4, @r int;	SET @r = @a*@µ*@r2*@r2;		Print 'Perhitungan : r = 2 x µ x r2 = ' + Cast(@r as varchar(10));	End;create table Nilai(
Range_Nilai varchar (50) not null,
Huruf_Mutu nvarchar(50) not null
)

insert into Nilai (Range_Nilai, Huruf_Mutu)
values 
('0 s/d 40', 'E')
insert into Nilai (Range_Nilai, Huruf_Mutu)
values 
('41 s/d 50', 'D')
insert into Nilai (Range_Nilai, Huruf_Mutu)
values 
('51 s/d 60', 'C')
insert into Nilai (Range_Nilai, Huruf_Mutu)
values 
('61 s/d 70', 'B')
insert into Nilai (Range_Nilai, Huruf_Mutu)
values 
('71 s/d 100', 'A')


declare @nilai nvarchar(10);
select Range_Nilai, Huruf_Mutu from Nilai WHERE Huruf_Mutu='A'
select @nilai=Huruf_Mutu from Nilai WHERE Huruf_Mutu='A'

if @nilai = 'A'
	print 'Ini Nilai A'
else 
	print 'Ini Nilai A++'