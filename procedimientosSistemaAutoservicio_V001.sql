-- SistemaAutoservicio
-- v0.01
-- Store Procedures 

USE Autoservicio;

DELIMITER //;
CREATE PROCEDURE registrarProveedor(nombre VARCHAR(50), IN telefono	VARCHAR(12),
	IN direccion VARCHAR(50), IN ciudad VARCHAR(50), IN email VARCHAR(50), IN RFC VARCHAR(13))
	BEGIN 
		INSERT INTO autoservicio.proveedor(Nombre,Telefono,Direccion,Ciudad,Email,RFC)
        VALUES (nombre, telefono,direccion,ciudad,email,RFC);
    END
//;

DELIMITER //;
CREATE PROCEDURE consultaProveedor(IN IdProveedor INT)
	BEGIN 
		IF EXISTS(SELECT P.IdProveedor FROM Autoservicio.Proveedor AS P WHERE P.IdProveedor = IdProveedor)
        THEN 
			SELECT * FROM Autoservicio.Proveedor WHERE Autoservicio.Proveedor.IdProveedor = IdProveedor;
		ELSE
			SELECT 'EL PROVEEDOR NO EXISTE EN LA BASE DE DATOS' DB_RESPONCE;
		END IF;
    END
//;

DELIMITER //;
CREATE PROCEDURE eliminarProveedor(IN IdProveedor INT)
	BEGIN 
		IF EXISTS(SELECT P.IdProveedor FROM Autoservicio.Proveedor AS P WHERE P.IdProveedor = IdProveedor)
        THEN 
			DELETE FROM Autoservicio.Proveedor WHERE Autoservicio.Proveedor.IdProveedor = IdProveedor;
		ELSE
			SELECT 'EL PROVEEDOR NO EXISTE EN LA BASE DE DATOS' DB_RESPONCE;
		END IF;
    END
//;

DELIMITER //;
CREATE PROCEDURE registrarArticulo(
	IN idArticulo INT, IN descripcion VARCHAR(100), IN costo DECIMAL(8,2), IN precio DECIMAL(8,2), 
    IN maximos SMALLINT, IN minimos SMALLINT, IN existencia SMALLINT, 
    IN Unidades SMALLINT)
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
CALL registrarArticulo(1,'CD´s',2.50,3.50,10,2,4,1);
SELECT * FROM Autoservicio.Articulo;
DROP PROCEDURE registrarArticulo;
DROP PROCEDURE eliminarArticulo;

CALL eliminarArticulo(1);
CALL consultaArticulo(1);
CALL registrarProveedor('Jose','colon #45','123456789012','tala','Jose@ooo.com','qawsed123412w');
CALL consultaProveedor(1);
CALL eliminarProveedor(1);
drop procedure consultaProveedor;
drop procedure eliminarProveedor;