-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс.

CREATE TABLE `new_schema`.`telephone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `ProductCount` INT NOT NULL,
  `Price` INT NOT NULL,
  PRIMARY KEY (`id`));
  
-- Заполните БД данными.

INSERT INTO `new_schema`.`telephone` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('iPhone X', 'Apple', '3', '76000');
INSERT INTO `new_schema`.`telephone` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('iPhone 8', 'Apple', '2', '51000');
INSERT INTO `new_schema`.`telephone` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('Galaxy S9', 'Samsung', '2', '56000');
INSERT INTO `new_schema`.`telephone` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('Galaxy S8', 'Samsung', '1', '41000');
INSERT INTO `new_schema`.`telephone` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('P 20 Pro', 'Huawei', '5', '36000');

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2

use new_schema;

SELECT Manufacturer, Price FROM telephone WHERE ProductCount <= 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”

SELECT * FROM telephone WHERE Manufacturer LIKE "Samsung";