-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс.

CREATE TABLE `new_schema`.`telephone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `product_count` INT NOT NULL,
  `price` INT NOT NULL,
  UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC) VISIBLE,
  PRIMARY KEY (`id`));
  
-- Заполните БД данными.

INSERT INTO `new_schema`.`telephone` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('iPhone X', 'Apple', '3', '76000');
INSERT INTO `new_schema`.`telephone` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('iPhone 8', 'Apple', '2', '51000');
INSERT INTO `new_schema`.`telephone` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Galaxy S9', 'Samsung', '2', '56000');
INSERT INTO `new_schema`.`telephone` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Galaxy S8', 'Samsung', '1', '41000');
INSERT INTO `new_schema`.`telephone` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('P 20 Pro', 'Huawei', '5', '36000');

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2

use new_schema;

SELECT manufacturer, Price FROM telephone WHERE product_count <= 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”

SELECT * FROM telephone WHERE manufacturer LIKE "Samsung";


-- 4.*** С помощью регулярных выражений найти: 4.1. Товары, в которых есть упоминание "Iphone"

SELECT * FROM telephone WHERE product_name REGEXP 'Iphone';

-- 4.2. "Samsung"

SELECT * FROM telephone WHERE manufacturer REGEXP 'Samsung';

-- 4.3.  Товары, в которых есть ЦИФРЫ

SELECT * FROM telephone WHERE product_name REGEXP '[:digit:]';

-- 4.4.  Товары, в которых есть ЦИФРА "8" 

SELECT * FROM telephone WHERE product_name REGEXP '[%8%]';