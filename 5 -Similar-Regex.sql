--SELECT - SIMILAR TO - REGEX ( Regular Expression )
/*
SIMILAR TO : Daha karmasik pattern(kalip) ile sorgulama islemi icin kullanilabilir
Sadece PostgreSQL de kullanilir. Buyuk kucuk harf onemlidir

REGEX : Herhangi bir kod, metin içerisinde istenen yazı veya kod parçasının aranıp bulunmasını sağlayan
kendine ait bir söz dizimi olan bir yapıdır.MySQL de(REGEXP_LİKE) olarak kullanılır
PostgreSQL'de "~" karakteri ile kullanılır
*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   INSERT INTO kelimeler VALUES (1018, 'habcdt', 5);
   
   select * from kelimeler;
   
   --  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
   -- veya için | kullanabilirsiniz.
   --SIMILAR TO ile
   select * from kelimeler where kelime similar to '%(at|ot)%'
   -- büyük küçük harfe duyarlı olsun
   select * from kelimeler where kelime similar to '%(at|At|aT|AT|ot|oT|Ot|OT)%'
  
  -- LIKE ile 
   select * from kelimeler where kelime ilike '%at%' or kelime ilike '%ot%'
   
   -- REGEX ile
   select * from kelimeler where kelime ~* 'ot' or kelime ~* 'at'
   
   -- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
    select * from kelimeler where kelime ilike 'ho%' or kelime ilike 'hi%'    -- ilike yerine  ~~* yazabiliriz
	select * from kelimeler where kelime similar to 'ho%|hi%'
	select * from kelimeler where kelime ~* 'h[oi](.*)'  -- h ile başlaayn devamı o veya i olan. Yani hi ve ho
	--Regexte .(nokta) bir karakteri temsil eder
	--Regex'de ikinci karakter için köşeli parantez kullanılır. * hepsi anlamında kullanılır
	
	-- Sonu 't' veya 'm' ile bitenleri listeleyeniz
	  select * from kelimeler where kelime ilike '%t' or kelime ilike '%m' 
	  select * from kelimeler where kelime similar to '%t|%m'
	  select * from kelimeler where kelime ~* '(.*)[tm]$'    -- başı ne olyursa olsun t eya m ile bitenler ( $ bitiş demektir)
	
	-- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
	select * from kelimeler where kelime ~~* 'h_t'
    select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t'
	select * from kelimeler where kelime 
	
	--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan “kelime" değerlerini çağırın.
	
		select kelime  from kelimeler where kelime similar to 'h[a-e]%t'
		select kelime from kelimeler where kelime ~* 'h[a-e](.*)t'
	
	
   --İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
   select * from kelimeler where kelime ~ '^[say](.*)'     -^  başlangıç demek
   select * from kelimeler where kelime similar to 's%'or kelime similar to 'a%' or kelime similar to 'y%'
   
   
   --Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
   select * from kelimeler where kelime similar to '%m'or kelime similar to '%a' or kelime similar to '%f'
   select * from kelimeler where kelime ~ '(.*)[maf]$'
   
   --İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
   select * from kelimeler where kelime similar to 'h[a|i]t';
   select * from kelimeler where kelime ~ '^h[a|i]t$'
   
   -- ilk hrfi b den s ye bir karakter; ikinci karakter herhangi bir karakter
   -- üçüncü harfi l olan kelimeler
   select * from kelimeler where kelime ~ '^[b-s].l(.*)';
   
   
   --içerisinde en az 2 adet o o barındıran kelimelerin tüm bilgilerini listeleyiniz.
   select * from kelimeler where kelime similar to '%[o][o]%'
   select * from kelimeler where kelime similar to '%[o]{2}%'   -- 2 adet o demek
   select * from kelimeler WHERE kelime ILIKE '%o%o%' 
   
   --içerisinde en az 4 adet oooo barındıran kelimelerin tüm bilgilerini listeleyiniz.
    select * from kelimeler where kelime similar to '%[o][o][o][o]%'
	select * from kelimeler where kelime similar to '%[o]{4}%'
	
	--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
	select * from kelimeler where kelime ~ '^[a|s|y](.*)[m|f]$';
   
   
   
   