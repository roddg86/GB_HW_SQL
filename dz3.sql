-- Создание таблиц

CREATE DATABASE seminar_3;
USE seminar_3;

CREATE TABLE `salespeople` (
  `snum` INT NOT NULL,
  `sname` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `comm` DECIMAL(7,2) NOT NULL);
  
SELECT * FROM salespeople;

INSERT INTO salespeople(snum, sname, city, comm)
VALUES
(1001, "Peel", "London", .12),
(1002, "Serres", "San Jose", .13),
(1004, "Motika", "London", .11),
(1007, "Rifkin", "Barcelona", .15),
(1003, "Axelrod", "New York", .10);

SELECT * FROM salespeople;

CREATE TABLE `customers` (
  `cnum` INT NOT NULL,
  `cname` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `snum` INT NOT NULL,
  `rating` INT NOT NULL);
 
SELECT * FROM customers;
 
INSERT INTO customers (cnum, cname, city, snum, rating)
VALUES 
(2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "SanJose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "SanJose", 300, 1007),
(2007, "Pereira", "Rome", 100, 1004);

SELECT * FROM customers;

CREATE TABLE `orders` (
  `onum` INT NOT NULL,
  `amt` DECIMAL(7,2) NOT NULL,
  `odate` DATE NOT NULL,
  `cnum` INT NOT NULL,
  `snum` INT NOT NULL);

SELECT * FROM orders;

INSERT INTO orders(onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, "1990-10-03", 2008, 1007),
(3003, 767.19, "1990-10-03", 2001, 1001),
(3002, 1900.10, "1990-10-03", 2007, 1004),
(3005, 5160.45, "1990-10-03", 2003, 1002),
(3006, 1098.16, "1990-10-03", 2008, 1007),
(3009, 1713.23, "1990-10-04", 2002, 1003),
(3007, 75.75, "1990-10-04", 2004, 1002),
(3008, 4723.00, "1990-10-05", 2006, 1001),
(3010, 1309.95, "1990-10-06", 2004, 1002),
(3011, 9891.88, "1990-10-06", 2006, 1001);

SELECT * FROM orders;

-- 1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)

SELECT city, sname, snum, comm FROM salespeople;

-- 2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)

SELECT rating, cname FROM customers WHERE city = "SanJose";

-- 3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в “snum“ “Продавцы”)

SELECT DISTINCT(snum) AS Продавцы FROM orders; 

-- 4*. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html

SELECT * FROM customers WHERE cname LIKE 'G%';

-- 5. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt” - сумма)

SELECT * FROM orders WHERE amt > 1000;

-- 6. Напишите запрос который выбрал бы наименьшую сумму заказа. (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)

SELECT MIN(amt) FROM orders;

-- 7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме. Задание №2.

SELECT * FROM customers WHERE rating > 100 AND city != "rome";

-- 8. Отсортируйте поле “зарплата” в порядке убывания и возрастания

SELECT sallary FROM staff ORDER BY sallary DESC;
SELECT sallary FROM staff ORDER BY sallary;

-- 9. ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)

SELECT * FROM (SELECT * FROM staff ORDER BY sallary DESC LIMIT 5) AS sallary ORDER BY sallary; 

-- 10. Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000

SELECT speciality, SUM(sallary) FROM staff GROUP BY speciality HAVING SUM(sallary) > 100000;