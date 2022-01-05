create database VT_ALISVERIS
USE VT_ALISVERIS

create  table tblmusteriler(
id int primary key identity(1,1),
isim varchar(30) not null,
soyisim varchar (30) not null,
ceptel varchar(11),
mail varchar(30) not null,

);

create table tblurunkategori(
id int primary key identity(1,1),
kategori varchar(50) not null,

 );

create table tblurunler(
id int primary key identity(1,1),
ad varchar(50) not null,
fiyat float not null,
barkod varchar(50),
urun_kategori_id int foreign key references tblurunkategori(id)


);

create table tblalýsveriskayýt(

alisveris_id int primary key identity(1,1),
musteri_id int foreign key references tblmusteriler(id),
urun_id int foreign key references tblurunler(id),
adet int not null,
tarih datetime default current_timestamp



);

---------------------------

insert into tblmusteriler values('Ali','Kaya','05555555555','alikaya@gmail.com'),
								('Veli','Daðlý','05555555554','velidaglý@gmail.com'),
								('Ayþe','Bilir','05555555553','aysebilir@gmail.com')


insert into tblurunkategori values('Gýda'),
								  ('Þarküteri'),
								  ('Çikolata'),
								  ('Bisküvi'),
								  ('Unlu Mamulleri'),
								  ('Temizlik Ürünleri')
								  
insert into tblurunler values('çay',29.75,'112',1),
							 ('ekmek',1.4,'114',5),
							 ('haley',1.5,'115',4),
							 ('negro',2.5,'116',4),
							 ('deterjan',35.55,'117',6)


							 
insert into tblalýsveriskayýt (musteri_id,urun_id,adet) values	(1,2,5),
																(2,5,3),
																(3,7,10),
																(1,6,4)





----3 tablodan sorgu çekme

select tblmusteriler.id, tblmusteriler.isim,tblmusteriler.soyisim,tblurunler.ad,tblurunler.fiyat,tblalýsveriskayýt.tarih
from((tblalýsveriskayýt inner join tblmusteriler on tblalýsveriskayýt.musteri_id=tblmusteriler.id)
inner join tblurunler on tblalýsveriskayýt.urun_id=tblurunler.id);


select *from tblmusteriler
select *from tblurunler
select *from tblalýsveriskayýt