USE crashcourse;

DROP PROCEDURE IF EXISTS searchProduct;

DELIMITER $$

CREATE PROCEDURE searchProduct(
	in searchString char(255))
	
BEGIN
	SET @searchS = (SELECT CONCAT('%', searchString, '%'));

	SELECT vend_name, prod_name, prod_price, note_text
	FROM vendors v, products p, productnotes n
	WHERE v.vend_id=p.vend_id
	AND p.prod_id=n.prod_id
	AND p.prod_name LIKE @searchS
	ORDER BY p.prod_name;
	
END $$

DELIMITER ;
