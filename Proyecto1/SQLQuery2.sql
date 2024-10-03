
CREATE DATABASE seminario2_201900621;
use seminario2_201900621;
SELECT DB_NAME() AS [Current Database];  
GO 

DROP TABLE Proveedor;
DROP TABLE Fecha;
DROP TABLE Sucursal;
DROP TABLE Producto;

SELECT object_id, '['+SCHEMA_NAME(schema_id)+'].['+name+']' AS [schema_table], max_column_id_used, type, type_desc, create_date, modify_date, lock_escalation_desc 
FROM sys.tables

CREATE TABLE Proveedor(
	CodProveedor varchar(5),
    NombreProveedor nvarchar(100),
    DireccionProveedor nvarchar(250),
    NumeroProveedor nvarchar(15),
    WebProveedor nvarchar(1),
	PRIMARY KEY (CodProveedor)
);

CREATE TABLE Producto(
	CodProducto nvarchar(7),
    NombreProducto nvarchar(100),
    MarcaProducto nvarchar(100),
    Categoria nvarchar(50),
	PRIMARY KEY (CodProducto)
);


CREATE TABLE Fecha (
	Fecha date,
	dia int,
	mes int,
	anio int,
	PRIMARY KEY (Fecha)
);

CREATE TABLE Sucursal (
	SodSuSursal nvarchar(5),
    NombreSucursal nvarchar(100),
    DireccionSucursal nvarchar(150),
    Region nvarchar(50),
    Departamento nvarchar(50),
	PRIMARY KEY (SodSuSursal)
);

CREATE TABLE Compra (
	CompraID INT  NOT NULL IDENTITY(1,1),
	Fecha date,
	CodProveedor varchar(5),
	CodProducto nvarchar(7),
	SodSuSursal nvarchar(5),
    Unidades int,
    CostoU  float,
	PRIMARY KEY (CompraID),
	FOREIGN KEY (CodProveedor) REFERENCES Proveedor(CodProveedor),
	FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto),
	FOREIGN KEY (Fecha) REFERENCES Fecha(Fecha),
	FOREIGN KEY (SodSuSursal) REFERENCES Sucursal(SodSuSursal)
);

CREATE TABLE Cliente(
	CodigoCliente nvarchar(5),
    NombreCliente nvarchar(100),
    TipoCliente nvarchar(50),
    DireccionCliente nvarchar(150),
    NumeroCliente nvarchar(15),
	PRIMARY KEY (CodigoCliente)
);

CREATE TABLE Vendedor(
    CodVendedor nvarchar(5),
    NombreVendedor nvarchar(50) NULL,
    Vacacionista nvarchar(5) NULL,
	PRIMARY KEY (CodVendedor)
);

CREATE TABLE Venta (
	VentaID INT  NOT NULL IDENTITY(1,1),
	Fecha date,
	CodigoCliente nvarchar(5),
	CodVendedor nvarchar(5),
	CodProducto nvarchar(7),
	SodSuSursal nvarchar(5),
    Unidades int,
    PrecioUnitario  float,
	PRIMARY KEY (VentaID),
	FOREIGN KEY (CodigoCliente) REFERENCES Cliente(CodigoCliente),
	FOREIGN KEY (CodVendedor) REFERENCES Vendedor(CodVendedor),
	FOREIGN KEY (CodProducto) REFERENCES Producto(CodProducto),
	FOREIGN KEY (Fecha) REFERENCES Fecha(Fecha),
	FOREIGN KEY (SodSuSursal) REFERENCES Sucursal(SodSuSursal)
);

EXEC sp_help 'Compra';
EXEC sp_help 'Vendedor';

SELECT * FROM Proveedor;
SELECT * FROM Producto;
SELECT * FROM Sucursal;
SELECT * FROM Fecha;
SELECT * FROM Compra;

SELECT * FROM Cliente;
SELECT * FROM Vendedor;
SELECT * FROM Venta;

SELECT
  COUNT(*) AS Proveedores
FROM Proveedor;

SELECT
  COUNT(*) AS Productos
FROM Producto;

SELECT
  COUNT(*) AS Sucursales
FROM Sucursal;

SELECT
  COUNT(*) AS Fechas
FROM Fecha;

SELECT
  COUNT(*) AS Compras
FROM Compra;

SELECT
  COUNT(*) AS Vendedores
FROM Vendedor;

SELECT
  COUNT(*) AS Clientes
FROM Cliente;

SELECT
  COUNT(*) AS Ventas
FROM Venta;