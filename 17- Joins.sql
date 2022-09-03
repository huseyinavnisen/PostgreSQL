CREATE TABLE my_companies
(
  company_id CHAR(3),
  company_name VARCHAR(20)
);
INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');
SELECT * FROM my_companies;

CREATE TABLE orders
(
  company_id CHAR(3),
  order_id CHAR(3),
  order_date DATE
);
INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');
SELECT * FROM orders;

SELECT * FROM my_companies;
SELECT * FROM orders;

 -- JOINS :
 -- 1) INNER JOIN : İki tablonun Kesişimi
 -- 2) LEFT JOIN : İlk tablonun tüm datası
 -- 3) RIGTH JOIN : İkinci tablonun tüm datası
 -- 4) FULL JOIN : iki tablonun tüm datası - Birleşim Kümesi gibi
 -- 5) SELF JOIN : Tek table üzerinde çalışırken İKİ tble varmış gibi çalışır
 
 
 --Ortak companyler için company_name, order_id ve order_date değerlerini çağırın.
 select company_name, order_id, order_date
 from my_companies inner join orders
 on my_companies.company_id = orders.company_id
 
 --Biraz daha kısa yazimi ( as gibi ama as yazmadık )
 select mc.company_name, ord.order_id, ord.order_date
 from my_companies mc inner join orders ord
 on mc.company_id = ord.company_id;
 
 -- 2) LEFT JOIN
--my_companies table'ındaki companyler için order_id ve order_date değerlerini çağırın.

 select mc.company_name, ord.order_id, ord.order_date
 from my_companies mc left join orders ord
 on mc.company_id = ord.company_id;
 
 
 --3) RIGTH JOIN
 select mc.company_name, ord.company_id, ord.order_date
 from my_companies mc rigth join orders ord
 on mc.company_id = ord.company_id;
 
 
 --4)FULL JOIN
--İki table'dan da company_name, order_id ve order_date değerlerini çağırın.
  select mc.company_name, ord.order_id, ord.order_date
  from orders ord full join my_companies mc
  on mc.company_id = ord.company_id;
  
  --5) SELF JOIN
  
CREATE TABLE workers
(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2)
);
INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);
SELECT * FROM workers;


--workers tablosunu kullanarak çalışanların yöneticilerini gösteren bir tablo hazırlayın.
 

SELECT employee.name AS Employee, manager.name AS Manager
FROM workers employee FULL JOIN workers manager
ON employee.manager_id = manager.id;
