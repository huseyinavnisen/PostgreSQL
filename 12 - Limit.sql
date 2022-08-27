-- LIMIT --

select * from kisiler;

--	Kişiler tablosundan ilk 5 veriyi listele
select * from kisiler limit 5;

--İlk iki veriden sonraki 5 veriyi listele
select * from kisiler limit 5 OFFSET 2

-- id değeri 5 den büyük olan ilk iki veriyi listeleyiniz
select * from kisiler  where id>5 limit 2;

--  MAAŞ'ı en yüksek 3 kişinin bilgilerini listeleyiniz
select * from kisiler order by maas desc limit 3

-- En yüksek maaşı alan 4. 5.  6. kişilerin bilgilerini listeleyiniz
select * from kisiler order by maas desc limit 3 offset 3;



