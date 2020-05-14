/*Nombre y fecha de toma de posesión de los médicos pediatras del hospital.
Nombre de los pacientes residentes en Madrid capital.
Nombre de los médicos que autorizaron ingresos entre enero y febrero de 2010.
Nombres y apellidos de los pacientes que ingresaron entre enero y mayo de 2009 y son alérgicos.
*/

/*1.Nombre y fecha de toma de posesión de los médicos pediatras del hospital.*/
/*primero hacemos una select para ver los que son pediatras*/
	SELECT *
	FROM [hospital].[MEDICOS]

SELECT [Nombre de Medico],[Fecha Ingreso]
FROM [hospital].[MEDICOS]
WHERE Especialidad='Pediatria'

/*2.Nombre de los pacientes residentes en Madrid capital.*/
/*primero hacemos una select para ver los que son de la capital de madrid*/
	SELECT *
	FROM [hospital].[PACIENTES]

SELECT Nombre
FROM [hospital].[PACIENTES]
WHERE [Poblacion]='Madrid'

/*3.Nombre de los médicos que autorizaron ingresos entre enero y febrero de 2010.*/
/*primero hacemos una select para ver los que han sido ingresado entre dos meses*/

	SELECT *
	FROM [hospital].[INGRESOS]

SELECT [Codigo Identificacion ]
FROM [hospital].[INGRESOS]
where [Fecha de ingreso] between '1/02/2010' and '28/02/2010'
(select[Nombre de Medico]
from [hospital].[MEDICOS]
where [Codigo identificacion]='AJH')

/*he hecho una subselect porque no se me ocurria nada mas como podria hacer la consulta mejor?*/

/*4.Nombres y apellidos de los pacientes que ingresaron entre enero y mayo de 2009 y son alérgicos.*/
/*primero hacemos una select para ver los que han sido ingresado entre dos meses*/
SELECT *
	FROM [hospital].[INGRESOS]

SELECT P.Nombre,P.Apellidos 
FROM hospital.PACIENTES AS P
INNER JOIN hospital.INGRESOS AS I 
ON P.[Numero de historial]=I.[Numero de historial]
WHERE (I.[Fecha de ingreso] BETWEEN '01/01/2009' AND '31/05/2009') AND (Observaciones like 'alergico%')

SELECT P.Nombre,P.Apellidos 
FROM hospital.PACIENTES AS P
INNER JOIN hospital.INGRESOS AS I 
ON P.[Numero de historial]=I.[Numero de historial]
WHERE (I.[Fecha de ingreso] BETWEEN '01/01/2009' AND '31/05/2009') AND (Alergico='s')

 /*5.Pacientes cuyo ingreso haya sido autorizado por el doctor Antonio Jaén Hernández.
*/
 
select*
from [hospital].[MEDICOS]

select I.[Fecha de ingreso],P.Nombre
from[hospital].[INGRESOS] AS I 
JOIN hospital.PACIENTES AS P
ON P.[Numero de historial]=I.[Numero de historial] 
WHERE [Codigo Identificacion]='AJH'
	(select[Nombre de Medico]
	from[hospital].[MEDICOS]
	WHERE [Codigo identificacion]='AJH'
	)
	
 /*pProcedimiesntos almacenados
 1ntroducir un médico a la base de datos, con los siguientes restricciones:
Los Números de Colegiado más antiguos son los que son entre 0 y 999. Hoy en día, no se aceptan estos números.
2.Mostrar los nombres y otros datos (fecha, planta, cama, etc..) de los pacientes ingresados entre dos fechas. E.g. EXEC usp_MostrarPacientesIngresados ‘1/1/2009’, 1/2/2009’
 */

 /*Introducir un médico a la base de datos, con los siguientes restricciones:
Los Números de Colegiado más antiguos son los que son entre 0 y 999. Hoy en día, no se aceptan estos números.
*/

CREATE PROCEDURE pr_introducirMedicos
@p_Codigoidentificacion varchar(4),
@p_NombredeMedico char(15),
@p_ApellidosdeMedico char(30),
@p_Especialidad char(25),
@p_FechaIngreso date,
@p_Cargo char(25),
@p_NumerodeColegiado int,
@p_Observaciones char(500)

as

BEGIN
  if @p_NumerodeColegiado between 0 and 999
	return -1

	begin try
		insert into hospital.MEDICOS
		([Codigo identificacion],
		 [Nombre de Medico],
         [Apellidos de Medico] ,    
         [Especialidad],
         [Fecha Ingreso],
		 [Cargo],
		 [Numero de Colegiado],
         Observaciones
		)
		values
		(@p_Codigoidentificacion,
			@p_NombredeMedico,
			@p_ApellidosdeMedico,
			@p_Especialidad,
			@p_FechaIngreso,
			@p_Cargo, 
			@p_NumerodeColegiado,
			@p_Observaciones
		)
		return 0
		end try
		begin catch
			return @@ERROR
		END CATCH
END

/*Mostrar los nombres y otros datos (fecha, planta, cama, etc..) de los pacientes ingresados entre dos fechas. E.g. EXEC usp_MostrarPacientesIngresados ‘1/1/2009’, 1/2/2009’*/
create PROCEDURE usp_MostrarPacientesIngresados 
@p_fechadeinicio date,
@p_fechadefinal date
as
begin 
	select p.Nombre,p.Apellidos,i.[Numero de historial],i.[Fecha de ingreso],i.Diagnostico,i.Alergico,i.Observaciones
	from hospital.INGRESOS as I
	join hospital.PACIENTES as P
	on i.[Numero de historial]=P.[Numero de Historial]
	where i.[Fecha de ingreso] between @p_fechadeinicio and @p_fechadefinal

	end


/*1Contar el número de pacientes en el sistema
2Contar el número de pacientes que son:
	1Hombre
	2Mujeres
*/

/*1Contar el número de pacientes en el sistema*/

CREATE FUNCTION FCONTARPACIENTE(@pacientes tinyint)
returns int
as
BEGIN
	DECLARE @NUMERODEPACIENTES  tinyint
	SELECT @NUMERODEPACIENTES = COUNT([N Seguridad Social])
	FROM hospital.PACIENTES
	RETURN @NUMERODEPACIENTES 
END

select [Numero de Historial],FCONTARPACIENTES(pacientes)
from hospital.PACIENTES


/*2Contar el número de pacientes que son:
	1Hombre
	2Mujeres
*/

CREATE FUNCTION Fsexo
(
	@sexo char
)

returns int 
as 
begin 

/*HACEMOS UNA DECLARACION DE RETURN*/
DECLARE @numerohistorial INT 
/*HACEMOS LA SELECT*/
SELECT @numerohistorial=COUNT([Numero de Historial])
FROM hospital.PACIENTES
WHERE Sexo=@sexo
/*RETURNS*/
RETURN @numerohistorial
END 

select dbo.Fsexo('h')
select dbo.Fsexo('m')
select dbo.Fsexo ('o')

USE [proyecto hospital]
GO

INSERT INTO [hospital].[PACIENTES]
           ([N Seguridad Social]
           ,[Nombre]
           ,[Apellidos]
           ,[Domicilio]
           ,[Poblacion]
           ,[Provincia]
           ,[Codigo Postal]
           ,[Telefono]
           ,[Numero de Historial]
           ,[Sexo]
           ,[foto])
     VALUES
           ('08/7555555'
           ,'Martin'
           ,'Fernandez Lopez'
           ,'C/Sastres,21'
           ,'Madrid'
           ,'Madrid'
           ,'28028'
           ,'913333333'
           ,'15413-S'
           ,'h',
		   (select * from openrowset (blunk 'C:\users\ainara\deskopt\foto\ainara.txt',single_blood)as foto)

