USE crashcourse;

DROP PROCEDURE IF EXISTS aggProdPrice;

DELIMITER $$

CREATE PROCEDURE aggProdPrice(
	in vendid int(11), in agg char(7),
	out aggResult decimal(8,2))
	
BEGIN

	IF agg = 'Count' THEN
		SET aggResult = (SELECT COUNT(prod_price) FROM products WHERE vend_id = vendid);
	ELSEIF agg = 'Minimum' THEN
		SET aggResult = (SELECT MIN(prod_price) FROM products WHERE vend_id = vendid);
	ELSEIF agg = 'Maximum' THEN
		SET aggResult = (SELECT MAX(prod_price) FROM products WHERE vend_id = vendid);
	ELSEIF agg = 'Average' THEN
		SET aggResult = (SELECT AVG(prod_price) FROM products WHERE vend_id = vendid);
	END IF;
	
END $$

DELIMITER ;