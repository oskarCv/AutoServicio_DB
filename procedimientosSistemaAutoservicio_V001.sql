-- SistemaAutoservicio
-- v0.01
-- Store Procedures 

USE Autoservicio;
delimiter //;
CREATE PROCEDURE registrarArticulo(
	IN idArticulo INT, IN descripcion VARCHAR(100), IN costo DECIMAL(8,2), IN precio DECIMAL(8,2), 
    IN maximos SMALLINT, IN minimos SMALLINT, IN existencia SMALLINT, 
    IN Unidades ENUM ('Pza','Caja','Botella','Paquete','Lts','Kgs'))
	BEGIN
		INSERT INTO Autoservicio.Articulo(IdArticulo,Descripcion,Costo,Precio,Maximos,Minimos,Existencia, Unidades)
        VALUES(idArticulo,descripcion,costo, precio, maximos,minimos, existencia, Unidades);
    END
//;

DELIMITER //;
CREATE PROCEDURE eliminarArticulo(IN IdArticulo INT)
	BEGIN
		IF EXISTS(SELECT ART.IdArticulo FROM Autoservicio.Articulo AS ART WHERE ART.IdArticulo = IdArticulo)
        THEN 
			DELETE  FROM Autoservicio.Articulo WHERE Autoservicio.Articulo.IdArticulo = IdArticulo;
		ELSE
			SELECT 'EL ARTICULO NO EXISTE EN LA BASE DE DATOS' DB_RESPONCE;
		END IF;
	END
//;

DELIMITER //;
CREATE PROCEDURE consultaArticulo(IN IdArticulo INT)
	BEGIN 
		IF EXISTS(SELECT ART.IdArticulo FROM Autoservicio.Articulo AS ART WHERE ART.IdArticulo = IdArticulo)
        THEN 
			SELECT * FROM Autoservicio.Articulo WHERE Autoservicio.Articulo.IdArticulo = IdArticulo;
		ELSE
			SELECT 'EL ARTICULO NO EXISTE EN LA BASE DE DATOS' DB_RESPONCE;
		END IF;
    END
//;

-- -----------------------------------------------------------------------------------
CALL registrarArticulo(1,'CD´s',2.50,3.50,10,2,4,'Pza');
SELECT * FROM Autoservicio.Articulo;
DROP PROCEDURE registrarArticulo;

DROP PROCEDURE eliminarArticulo;

CALL eliminarArticulo(1);
CALL consultaArticulo(1);