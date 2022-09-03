CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers;

/* UNIOUN OPERATOR:
1 - İki sorgu sonucunu birleştirmek için kullanırız
2 - Tekrarsız (unique) recordları verir
3 - Tek bir sütuna çok sütun koyabiliriz
4 -  Tek bir sütuna çok sütun koyarken mevcut data durumuna dikkat etmek gerekir.
*/


-- Salary değeri 3000'den yüksek olan state değerlerini ve
-- Salary değeri 2000'den küçük olan name değerlerini tekrarsız olarak bulun.
select state as "İsim ve Şehir", salary
from workers
where salary>3000 

union  -- bu iki farklı sorguyu birleştirceğiz

select name, salary
from workers
where salary<2000;


--salary değeri 3000'den yüksek olan state değerlerini
-- ve 2000'den küçük olan name değerlerini tekrarlı olarak bulun.
select state as "İsim ve Şehir", salary
from workers
where salary>3000 

union all -- union ile aynı işi yapar ANCAK tekrarlı olanlarıda gösterir

select name, salary
from workers
where salary<2000;


--salary değeri 1000'den yüksek, 2000'den az olan "ortak" name değerlerini bulun.
select name
from workers
where salary >1000

intersect --> İki sorgu (query) sonucunun ORTAK(common) değerlerini verir. Unique(tekrarsız) recordları verir.

select name
from workers
where salary <2000


select * from workers





--Soru4) salary değeri 2000'den az olan ve company değeri  IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.
SELECT name 
FROM workers
WHERE salary < 2000
INTERSECT
SELECT name 
FROM workers
WHERE company IN ('IBM', 'APPLE', 'MICROSOFT')


--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır. 
--Unique(tekrarsız) recordları verir.


--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.
select name
from workers
where salary <3000
except
select name 
from workers
where company='GOOGLE'




