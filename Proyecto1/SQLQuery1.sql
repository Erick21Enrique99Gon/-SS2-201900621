CREATE DATABASE TablasPivotes;
use TablasPivotes;
use TablasPivotes1;
SELECT DB_NAME() AS [Current Database];  
GO 
DROP TABLE pivote_Compras;
DROP TABLE pivote_Ventas;
delete from pivote_Compras;
delete from pivote_Ventas;
CREATE TABLE pivote_Compras (
    Fecha nvarchar(10) null,
    CodProveedor nvarchar(5) null,
    NombreProveedor nvarchar(100) null,
    DireccionProveedor nvarchar(250) null,
    NumeroProveedor nvarchar(15) null,
    WebProveedor nvarchar(1) null,
    CodProducto nvarchar(7) null,
    NombreProducto nvarchar(100) null,
    MarcaProducto nvarchar(100) null,
    Categoria nvarchar(50) null,
    SodSuSursal nvarchar(5) null,
    NombreSucursal nvarchar(100) null,
    DireccionSucursal nvarchar(150) null,
    Region nvarchar(50) null,
    Departamento nvarchar(50) null,
    Unidades nvarchar(10) null,
    CostoU nvarchar(10) null
);


    
CREATE TABLE pivote_Ventas (
    Fecha nvarchar(10) null,
    CodigoCliente nvarchar(5) null,
    NombreCliente nvarchar(100) null,
    TipoCliente nvarchar(50) null,
    DireccionCliente nvarchar(150) null,
    NumeroCliente nvarchar(15) null,
    CodVendedor nvarchar(5) null,
    NombreVendedor nvarchar(50) null,
    Vacacionista nvarchar(5) null,
    CodProducto nvarchar(7) null,
    NombreProducto nvarchar(100) null,
    MarcaProducto nvarchar(100) null,
    Categoria nvarchar(50) null,
    SodSuSursal nvarchar(5) null,
    NombreSucursal nvarchar(100) null,
    DireccionSucursal nvarchar(150) null,
    Region nvarchar(50) null,
    Departamento nvarchar(50) null,
    Unidades nvarchar(10) null,
    PrecioUnitario  nvarchar(10) null
);

truncate table pivote_Compras;
truncate table pivote_Ventas;

BULK INSERT pivote_Compras
FROM 'C:\ArchivosVentas\SGFood01.comp'
WITH (
    FIELDTERMINATOR = '|',  -- Delimitador de campos
    ROWTERMINATOR = '\n',    -- Delimitador de filas
    FIRSTROW = 2             -- Saltar la primera fila si es cabecera
);



BULK INSERT pivote_Compras
FROM 'C:\ArchivosVentas\SGFood02.comp'
WITH (
    FIELDTERMINATOR = '|',  -- Delimitador de campos
    ROWTERMINATOR = '\n',    -- Delimitador de filas
    FIRSTROW = 2             -- Saltar la primera fila si es cabecera
);

BULK INSERT pivote_Compras
FROM 'C:\ArchivosVentas\SGFood03.comp'
WITH (
    FIELDTERMINATOR = '|',  -- Delimitador de campos
    ROWTERMINATOR = '\n',    -- Delimitador de filas
    FIRSTROW = 2             -- Saltar la primera fila si es cabecera
);

-- Cargar datos en TEMP_VENTAS
BULK INSERT pivote_Ventas
FROM 'C:\ArchivosVentas\SGFood01.vent'
WITH (
    FIELDTERMINATOR = '|',  
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


SELECT * FROM pivote_Compras;
SELECT * FROM pivote_Ventas;

delete from pivote_Compras;
delete from  pivote_ventas;

use TablasPivotes;


EXEC sp_help 'pivote_Compras';

use TablasPivotes1;
EXEC sp_help 'pivote_Compras';

use TablasPivotes;


EXEC sp_help 'pivote_Ventas';

SELECT DB_NAME() AS [Current Database];  