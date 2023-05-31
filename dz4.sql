-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA

SELECT MARK, COLOR, COUNT(COLOR) AS Количество
FROM AUTO 
WHERE MARK IN ('BMW','LADA') 
GROUP BY COLOR, MARK;

-- 2. Вывести на экран марку авто и количество AUTO не этой марки

SELECT MARK,
COUNT(MARK) AS `Число машин данной марки`,
    (SELECT COUNT(MARK) 
    FROM AUTO AS TABLE1 
    WHERE TABLE2.MARK != TABLE1.MARK) AS `Число машин других марок`
FROM AUTO AS TABLE2
GROUP BY MARK;

-- Задание №3.
-- Даны 2 таблицы, созданные следующим образом:
-- create table test_a (id number, data varchar2(1));
-- create table test_b (id number);
-- insert into test_a(id, data) values
-- (10, 'A'),
-- (20, 'A'),
-- (30, 'F'),
-- (40, 'D'),
-- (50, 'C');
-- insert into test_b(id) values
-- (10),
-- (30),
-- (50);
-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.

SELECT * FROM test_a 
LEFT JOIN test_b
ON test_b.id = test_a.id
WHERE test_b.id IS NULL;