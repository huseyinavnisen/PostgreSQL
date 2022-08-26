-- AGGREGATE METHOD KULLANIMI
/*
Bu merhodlar ( SUM, COUNT, MIN, MAX, AVG )
Subquery içinde kullanılır. ANCAAAK sorgu tek bir değer döndürmelidir.

SYTNTAX : sum() şeklinde olmalı (*** sum () arada boşluk olmaz ****)

*/
select * from calisanlar2


-- Çalışanlar2 tablosunda en çokk maaş alanın maaşını getir.
select max(maas) from calisanlar2


-- Çalışanlar2 tablosundaki maaşların toplamını getir.
select  avg(maas) from calisanlar2 --2714,292657888
select  round(avg(maas)) from calisanlar2 --2714
select  round(avg(maas),2) from calisanlar2 --2714,29


-- Çalışanlar2 tablosunda kaç kişinin maaş aldığını  getir.
select count(maas) from calisanlar2

-- Soru : Çalışanlar2 listesinde, SQL sorgularını beceremediği için işine son verilen QA'lerin
-- geriye dönük aldığı tüm primlerin toplamını;  kendi adına açılacak tabloda; isminin karşısına  ( SUM kullanabilrsiniz ) yazdıran sorguyu yazınız :)

select * from markalar
-- Her markanin ismini, calisan sayisini ve
-- o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim,calisan_sayisi,(select sum(maas)from calisanlar2 where marka_isim=isyeri) as toplam_maas from markalar;

-- Her markanin ismini, calisan sayisini ve
--O markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

select marka_isim, calisan_sayisi,
(select max(maas) from calisanlar2 where marka_isim=isyeri) as max_maas, 
(select min(maas) from calisanlar2 where marka_isim=isyeri) as min_maas
from markalar

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_isim, marka_id,
(select count(sehir) from calisanlar2 where marka_isim=isyeri )  as msehir_sayisi
from markalar

select * from calisanlar2;
--Interview Question: En yüksek ikinci maas değerini çağırın.
select max(maas) as enyuksek_ikinci_maas from calisanlar2
where maas < (select max(maas) from calisanlar2)

----Interview Question: En düşük ikinci maas değerini çağırın.
select min(maas) as en_dusuk_ikinci_maas from calisanlar2
where maas >(select min(maas) from calisanlar2)

--En yüksek üçüncü maas değerini bulun
select max(maas) as enyuksek_ucuncu_maas from calisanlar2
where maas < (select max(maas) from calisanlar2  where maas < (select max(maas) from calisanlar2 ));

--En düşük üçüncü maas değerini bulun
select min(maas) as en_dusuk_ucuncu_maas from calisanlar2
where maas >(select min(maas) from calisanlar2 where maas >(select min(maas) from calisanlar2))
