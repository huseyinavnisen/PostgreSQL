create table personel (
pers_id int,					  
isim varchar(30),
	sehir varchar(30),
	maas int,
	sirket varchar(20),
	adres varchar(50)
 );
 
CREATE TABLE personel_adres
AS
SELECT pers_id, sehir, adres FROM personel;

select * from personel

-- DML --> Data Manupulation Lang.
-- INSERT - UPDATE - DELETE
--Tabloya veri ekleme, tablodan veri güncelleme ve silme işlemlerinde kullanılan komutlar
--INSERT
create table student
(
id varchar(4),
st_name varchar(30),
age int
);

insert into student values('1001','Ali Can',25);
insert into student values('1002','veli Can',35);
insert into student values('1003','ayse Can',45);
insert into student values('1004','derya Can',55);
insert into student values('1005','hhh',25);



-- tabloya parçalı bilgi ekle
insert into student(st_name,age) values ('Hüseyin',65);
-- DQL --> DATA QUERY LANG
select * from student;
select st_name from student;

-- SELCT KOMUTU WHERE KOŞULU
--Yaşı >35 olanlar
select * from student WHERE age>35;



