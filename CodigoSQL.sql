-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`empresa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

INSERT INTO `mydb`.`empresa` (`id`, `nombre`, `direccion`, `correo`) VALUES ('1', 'tlvd', 'Chañaral 125', 'tlvd@tlvd.com');


-- -----------------------------------------------------
-- Table `mydb`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proveedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `rep_legal` VARCHAR(45) NULL,
  `telefono1` INT NULL,
  `telefono2` INT NULL,
  `nombrecallcenter` VARCHAR(45) NULL,
  `categoriaproducto` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  `empresa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_proveedores_empresa1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `mydb`.`empresa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `fk_proveedores_empresa1_idx` ON `mydb`.`proveedores` (`empresa_id` ASC) INVISIBLE;

INSERT INTO `mydb`.`proveedores` (`id`, `nombre`, `rep_legal`, `telefono1`, `telefono2`, `nombrecallcenter`, `categoriaproducto`, `correo`, `empresa_id`) VALUES ('1', 'colun', 'macelo lagos', '9564879', '7894561', 'amalia', 'lacteos', 'colun@colun.cl', '1');
INSERT INTO `mydb`.`proveedores` (`id`, `nombre`, `rep_legal`, `telefono1`, `telefono2`, `nombrecallcenter`, `categoriaproducto`, `correo`, `empresa_id`) VALUES ('2', 'angelmo', 'juan duran', '5287531', '9561594', 'carmen', 'mariscos', 'angelo@ngelmo.cl', '1');
INSERT INTO `mydb`.`proveedores` (`id`, `nombre`, `rep_legal`, `telefono1`, `telefono2`, `nombrecallcenter`, `categoriaproducto`, `correo`, `empresa_id`) VALUES ('3', 'tucapel', 'marta milla', '9546984', '7895342', 'maria', 'arroz', 'tucapel@tucapel.cl', '1');
INSERT INTO `mydb`.`proveedores` (`id`, `nombre`, `rep_legal`, `telefono1`, `telefono2`, `nombrecallcenter`, `categoriaproducto`, `correo`, `empresa_id`) VALUES ('4', 'iansa', 'carla mella', '8564594', '9456824', 'juan', 'azucar', 'ians@iansa.cl', '1');
INSERT INTO `mydb`.`proveedores` (`id`, `nombre`, `rep_legal`, `telefono1`, `telefono2`, `nombrecallcenter`, `categoriaproducto`, `correo`, `empresa_id`) VALUES ('5', 'carozzi', 'leon prado', '7895213', '9542813', 'carlos', 'pastas', 'carozzi@carozzi.cl', '1');


-- -----------------------------------------------------
-- Table `mydb`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `direccion` INT NULL,
  `empresa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_clientes_empresa1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `mydb`.`empresa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `mydb`.`clientes` (`id`, `nombre`, `apellido`, `direccion`, `empresa_id`) VALUES ('1', 'Mario', 'Moreno', 'Rosas 121', '1');
INSERT INTO `mydb`.`clientes` (`id`, `nombre`, `apellido`, `direccion`, `empresa_id`) VALUES ('2', 'Juan', 'Martin', 'Mexico 32', '1');
INSERT INTO `mydb`.`clientes` (`id`, `nombre`, `apellido`, `direccion`, `empresa_id`) VALUES ('3', 'Pedro', 'Rojas', 'Castro 25', '1');
INSERT INTO `mydb`.`clientes` (`id`, `nombre`, `apellido`, `direccion`, `empresa_id`) VALUES ('4', 'Miguel', 'Bello', 'Arica 56', '1');
INSERT INTO `mydb`.`clientes` (`id`, `nombre`, `apellido`, `direccion`, `empresa_id`) VALUES ('5', 'Paola', 'Lara', 'Bulnes 67', '1');



CREATE INDEX `fk_clientes_empresa1_idx` ON `mydb`.`clientes` (`empresa_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `precio` FLOAT NULL,
  `categoria` VARCHAR(45) NULL,
  `proveedor` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `stock` INT NULL,
  PRIMARY KEY (`id`));

INSERT INTO `mydb`.`productos` (`id`, `nombre`, `precio`, `categoria`, `proveedor`, `color`, `stock`) VALUES ('1', 'arroz', '1500', 'abarrotes', 'tucapel', 'blanco', '2000');
INSERT INTO `mydb`.`productos` (`id`, `nombre`, `precio`, `categoria`, `proveedor`, `color`, `stock`) VALUES ('2', 'leche', '1200', 'lacteos', 'colun', 'blanco', '3000');
INSERT INTO `mydb`.`productos` (`id`, `nombre`, `precio`, `categoria`, `proveedor`, `color`, `stock`) VALUES ('3', 'azucar', '1000', 'abarrotes', 'iansa', 'blanco', '1000');
INSERT INTO `mydb`.`productos` (`id`, `nombre`, `precio`, `categoria`, `proveedor`, `color`, `stock`) VALUES ('4', 'choritos', '1500', 'mariscos', 'angelmo', 'cafe', '2000');
INSERT INTO `mydb`.`productos` (`id`, `nombre`, `precio`, `categoria`, `proveedor`, `color`, `stock`) VALUES ('5', 'espirales', '1000', 'pastas', 'carozzi', 'beige', '1000');
INSERT INTO `mydb`.`productos` (`id`, `nombre`, `precio`, `categoria`, `proveedor`, `color`, `stock`) VALUES ('6', 'tallarines', '1000', 'pastas', 'carozzi', 'beige', '1000');
INSERT INTO `mydb`.`productos` (`id`, `nombre`, `precio`, `categoria`, `proveedor`, `color`, `stock`) VALUES ('7', 'cholgas', '1500', 'mariscos', 'angelmo', 'cafe', '1500');
INSERT INTO `mydb`.`productos` (`id`, `nombre`, `precio`, `categoria`, `proveedor`, `color`, `stock`) VALUES ('8', 'stevia', '4000', 'abarrotes', 'iansa', 'blanco', '2000');
INSERT INTO `mydb`.`productos` (`id`, `nombre`, `precio`, `categoria`, `proveedor`, `color`, `stock`) VALUES ('9', 'corbatas', '1000', 'pastas', 'carozzi', 'beige', '1000');
INSERT INTO `mydb`.`productos` (`id`, `nombre`, `precio`, `categoria`, `proveedor`, `color`, `stock`) VALUES ('10', 'mantequilla', '3000', 'lacteos', 'colun', 'amarillo', '1000');

UPDATE `mydb`.`productos` SET `categoria` = 'pastas' WHERE (`id` = '4');
UPDATE `mydb`.`productos` SET `categoria` = 'mariscos' WHERE (`id` = '4');
UPDATE `mydb`.`productos` SET `categoria` = 'cereales' WHERE (`id` = '1');
-- -----------------------------------------------------
-- Table `mydb`.`proveedores_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proveedores_productos` (
  `proveedores_id1` INT NOT NULL,
  `productos_id` INT NOT NULL,
  CONSTRAINT `fk_proveedores_productos_proveedores1`
    FOREIGN KEY (`proveedores_id1`)
    REFERENCES `mydb`.`proveedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedores_productos_productos1`
    FOREIGN KEY (`productos_id`)
    REFERENCES `mydb`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `fk_proveedores_productos_proveedores1_idx` ON `mydb`.`proveedores_productos` (`proveedores_id1` ASC) VISIBLE;

CREATE INDEX `fk_proveedores_productos_productos1_idx` ON `mydb`.`proveedores_productos` (`productos_id` ASC) VISIBLE;

-- - Cuál es la categoría de productos que más se repite.

SELECT categoria, count(categoria) AS frecuencia FROM mydb.productos GROUP BY categoria order by frecuencia DESC limit 1;



-- Cuáles son los productos con mayor stock
SELECT nombre, stock FROM mydb.productos ORDER BY stock DESC;


-- Qué color de producto es más común en nuestra tienda.
SELECT color, count(color) AS frecuencia FROM mydb.productos GROUP BY color order by frecuencia DESC limit 1;

-- Cual o cuales son los proveedores con menor stock de productos.
SELECT proveedor, stock FROM mydb.productos GROUP BY proveedor ORDER BY stock ASC;

-- Cambien la categoría de productos más popular por ‘Electrónica y computación

SELECT categoria  AS frecuencia FROM mydb.productos GROUP BY categoria order by frecuencia DESC limit 1;

UPDATE productos SET categoria ='electronica y computacion' WHERE categoria= (SELECT categoria  AS frecuencia FROM mydb.productos GROUP BY categoria order by frecuencia DESC limit 1);
SELECT id FROM productos WHERE categoria= (SELECT categoria  AS frecuencia FROM mydb.productos GROUP BY categoria order by frecuencia DESC LIMIT 1 );
UPDATE productos SET categoria = 'electronica y computacion' WHERE (`id` = '5');
UPDATE productos SET categoria = 'electronica y computacion' WHERE (`id` = '6');
UPDATE productos SET categoria = 'electronica y computacion' WHERE (`id` = '9');


