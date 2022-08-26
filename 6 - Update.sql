--- DML KOMUTLARINDAN --> UPDATE

CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);

INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from tedarikciler;
select * from urunler;

--  vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
update tedarikciler
set firma_ismi='vestel' where vergi_no=102;



-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' 
-- ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
update tedarikciler
set firma_ismi='Casper', irtibat_ismi='Ai Veli' where vergi_no=101;



update tedarikciler
set firma_ismi='Casper', irtibat_ismi='Ai Veli' where vergi_no=101;

--- soru yaz
update urunler
set urun_isim=( select firma_ismi from tedarikciler where irtibat_ismi='Adam Eve')
where musteri_isim='Ali Bak'


-- Urunler tablosunda laptop satin alan musterilerin ismini,
--firma_ismi Apple’in irtibat_isim'i ile degistirin.
update urunler
set musteri_isim=( select irtibat_ismi from tedarikciler where firma_ismi='Apple')
where urun_isim='Laptop'



