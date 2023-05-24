-- Используя операторы языка SQL, создайте табличку “sales”.
USE testbase1394;

CREATE TABLE sales
(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    bucket INT
);

-- Заполните ее данными, (101 to 300, 101 to 300, less than equal to 100, 101 to 300, greater than 300)

INSERT INTO sales(order_date, bucket)
VALUES
	(DATE '2023-05-1', 151),
	(DATE '2023-05-2', 171),
	(DATE '2023-05-3', 21),
	(DATE '2023-05-4', 121),
	(DATE '2023-05-5', 351),
	(DATE '2023-05-6', 167),
	(DATE '2023-05-7', 187),
	(DATE '2023-05-8', 37),
	(DATE '2023-05-9', 147),
	(DATE '2023-05-10', 367),
	(DATE '2023-05-11', 125),
	(DATE '2023-05-12', 155),
	(DATE '2023-05-13', 25),
	(DATE '2023-05-14', 125),
	(DATE '2023-05-15', 345);

-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT id as "id заказа", order_date as "дата", bucket as "количество",
    IF(bucket < 100, "маленький заказ",
		IF(bucket BETWEEN 100 AND 300, "средний заказ", "большой заказ")) as "тип заказа"
FROM sales;

-- Создайте таблицу “orders”,

USE testbase1394;

CREATE TABLE orders
(
	orderid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	employeeid VARCHAR(3) NOT NULL,
    amount DECIMAL(20, 2) NOT NULL,
    orderstatus VARCHAR(25) NOT NULL
);

-- заполните ее значениями. 

INSERT INTO orders (employeeid, amount, orderstatus)
VALUES
  ("e03",15.00,"OPEN"),
  ("e01",25.50,"OPEN"),
  ("e05",100.70,"CLOSED"),
  ("e02",22.18,"OPEN"),
  ("e04",9.50,"CANCELLED"),
  ("e04",99.99,"OPEN");

-- Покажите “полный” статус заказа, используя оператор CASE

SELECT orderid, orderstatus,
CASE orderstatus
    WHEN "OPEN" THEN 'Order is in open state.'
    WHEN "CLOSED" THEN 'Order is closed.'
    ELSE 'Order is cancelled.'
END AS order_summary
FROM orders;

--- Чем 0 отличается от NULL?

0 - ноль это числовое значение.

NULL - это специальное значение, которое используется в SQL для обозначения отсутствия данных. 
Оно отличается от пустой строки или нулевого значения, так как NULL означает отсутствие какого-либо значения в ячейке таблицы.




