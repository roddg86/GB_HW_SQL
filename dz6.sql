-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER //
CREATE FUNCTION times(seconds INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE days, hours, minutes INT DEFAULT 0;
    DECLARE sec_per_minutes INT DEFAULT 60;
    DECLARE min_per_hours INT DEFAULT 60;
    DECLARE hours_per_days INT DEFAULT 24;
    DECLARE result VARCHAR(60);
    
    SET minutes = seconds DIV sec_per_minutes;
    SET seconds = seconds % sec_per_minutes;
    SET hours = minutes DIV min_per_hours;
    SET minutes = minutes % min_per_hours;
    SET days = hours DIV hours_per_days;
    SET hours = hours % hours_per_days;

    SET result = concat(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds ');
    RETURN result;
END //
DELIMITER ;

SELECT times(123456) AS result;

-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 

DELIMITER //
CREATE PROCEDURE even_numbers(`start` INT, `end` INT)
BEGIN
	DECLARE num INT DEFAULT `start`;
    DECLARE result TEXT DEFAULT NULL;
    WHILE  num<=`end` DO
        IF num%2 = 0 THEN
			IF result IS NULL THEN
				SET result = concat(num);
			ELSE
				SET result = concat(result, ',', num);
			END IF;
		END IF;
        SET num = num + 1;
    END WHILE;
	SELECT result;
END //
DELIMITER ;

CALL even_numbers(1, 10);

