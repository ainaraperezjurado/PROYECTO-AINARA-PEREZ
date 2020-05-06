USE [proyecto hospital]
GO
/*aqui es donde he puesto todas las tablas y los datos*/
/****** Object:  Table [hospital].[INGRESOS]    Script Date: 06/05/2020 9:55:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [hospital].[INGRESOS](
	[Numero de Ingreso] [int] NOT NULL,
	[Numero de historial] [varchar](9) NULL,
	[Codigo Identificacion ] [varchar](4) NULL,
	[Fecha de ingreso] [date] NULL,
	[Numero de Planta] [int] NULL,
	[Numero de Cama] [int] NULL,
	[Alergico] [char](1) NULL,
	[Observaciones] [char](500) NULL,
	[Coste de Ingreso] [money] NULL,
	[Diagnostico] [char](40) NULL,
 CONSTRAINT [PK_INGRESOS] PRIMARY KEY CLUSTERED 
(
	[Numero de Ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hospital].[INGRESOS]  WITH CHECK ADD  CONSTRAINT [CK_INGRESOS] CHECK  (([Numero de Planta]>=(0) AND [Numero de Planta]<=(10)))
GO

ALTER TABLE [hospital].[INGRESOS] CHECK CONSTRAINT [CK_INGRESOS]
GO

ALTER TABLE [hospital].[INGRESOS]  WITH CHECK ADD  CONSTRAINT [CK_INGRESOS_1] CHECK  (([Numero de cama]>=(0) AND [Numero de cama]<=(200)))
GO

ALTER TABLE [hospital].[INGRESOS] CHECK CONSTRAINT [CK_INGRESOS_1]
GO

INSERT INTO [hospital].[INGRESOS]
           ([Numero de Ingreso]
           ,[Numero de historial]
           ,[Codigo Identificacion ]
           ,[Fecha de ingreso]
           ,[Numero de Planta]
           ,[Numero de Cama]
           ,[Alergico]
           ,[Observaciones]
           ,[Coste de Ingreso]
           ,[Diagnostico])
     VALUES
           (1
           ,'10203-F'
           ,'AJH'
           ,'23/01/2009'
           ,5
           ,121
           ,'N'
           ,'EPILEPTICO'
           ,200
           ,'ACCIDENTE DE COCHE')
GO
INSERT INTO [hospital].[INGRESOS]
           ([Numero de Ingreso]
           ,[Numero de historial]
           ,[Codigo Identificacion ]
           ,[Fecha de ingreso]
           ,[Numero de Planta]
           ,[Numero de Cama]
           ,[Alergico]
           ,[Observaciones]
           ,[Coste de Ingreso]
           ,[Diagnostico])
     VALUES
           (2
           ,'15413-S'
           ,'RLQ'
           ,'13/03/2009'
           ,2
           ,5
           ,'S'
           ,'Alegjico a la penicilina'
           ,700
           ,'rotura de tivia y perone')
GO
INSERT INTO [hospital].[INGRESOS]
           ([Numero de Ingreso]
           ,[Numero de historial]
           ,[Codigo Identificacion ]
           ,[Fecha de ingreso]
           ,[Numero de Planta]
           ,[Numero de Cama]
           ,[Alergico]
           ,[Coste de Ingreso]
           ,[Diagnostico])
     VALUES
           (3
           ,'112454-L'
           ,'RLQ'
           ,'25/05/2009'
           ,3
           ,31
           ,'N'
           ,250
           ,'esguinze')
GO

INSERT INTO [hospital].[INGRESOS]
           ([Numero de Ingreso]
           ,[Numero de historial]
           ,[Codigo Identificacion ]
           ,[Fecha de ingreso]
           ,[Numero de Planta]
           ,[Numero de Cama]
           ,[Alergico]
           ,[Observaciones]
           ,[Coste de Ingreso]
           ,[Diagnostico])
     VALUES
           (4
           ,'15413-S'
           ,'CEN'
           ,'13/03/2010'
           ,2
           ,13
           ,'S'
           ,'Alegjico a la penicilina'
           ,120
           ,'rotura de ligamentos curzados')
GO
INSERT INTO [hospital].[INGRESOS]
           ([Numero de Ingreso]
           ,[Numero de historial]
           ,[Codigo Identificacion ]
           ,[Fecha de ingreso]
           ,[Numero de Planta]
           ,[Numero de Cama]
           ,[Alergico]
		   ,[Observaciones]
           ,[Coste de Ingreso]
           ,[Diagnostico])
     VALUES
           (5
           ,'14456-E'
           ,'AJH'
           ,'27/02/2010'
           ,1
           ,5
           ,'S'
           ,'Alergico al Paidoterin'
           ,250
           ,'nariz rota')
GO

/*esta es la tabla de medicos y sus datos*/
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [hospital].[MEDICOS](
	[Codigo identificacion] [varchar](4) NOT NULL,
	[Nombre de Medico] [char](15) NULL,
	[Apellidos de Medico] [char](30) NULL,
	[Especialidad] [char](25) NULL,
	[Fecha Ingreso] [date] NULL,
	[Cargo] [char](25) NULL,
	[Numero de Colegiado] [int] NULL,
	[Observaciones] [char](500) NULL,
 CONSTRAINT [PK_MEDICOS] PRIMARY KEY CLUSTERED 
(
	[Codigo identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT INTO [hospital].[MEDICOS]
           ([Codigo Identificacion]
           ,[Nombre de Medico]
           ,[Apellidos de Medico]
           ,[Especialidad]
           ,[Fecha Ingreso]
           ,[Cargo]
           ,[Numero de Colegiado]
           ,[Observaciones])
     VALUES
           ('AJH'
           ,'Antonio'
           ,'Jaen Hernandez'
           ,'Pediatria'
           ,'12-08-82'
           ,'Adjunto'
           ,'2113'
           ,'esta apunto de juvilarse')
GO

INSERT INTO [hospital].[MEDICOS]
           ([Codigo Identificacion]
           ,[Nombre de Medico]
           ,[Apellidos de Medico]
           ,[Especialidad]
           ,[Fecha Ingreso]
           ,[Cargo]
           ,[Numero de Colegiado]
           )
     VALUES
           ('CEM'
           ,'Carmen'
           ,'Esteril Manrique'
           ,'Psiquiaria'
           ,'13-02-92'
           ,'jefa de planta' /*me parecia mas correcto jefa de planta*/
           ,'1231')
GO

INSERT INTO [hospital].[MEDICOS]
           ([Codigo Identificacion]
           ,[Nombre de Medico]
           ,[Apellidos de Medico]
           ,[Especialidad]
           ,[Fecha Ingreso]
           ,[Cargo]
           ,[Numero de Colegiado]
           )
     VALUES
           ('RQL'
           ,'Rocio'
           ,'Lopez Quijada'
           ,'Mdeico de Familia'
           ,'13-02-92'
           ,'Titular' /*seria el sustituto no che?*/
           ,'1331')
GO

/*esta es la tabla de pacientes*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [hospital].[PACIENTES](
	[N Seguridad Social] [varchar](15) NULL,
	[Nombre] [char](15) NULL,
	[Apellidos] [char](30) NULL,
	[Domicilio] [varchar](30) NULL,
	[Poblacion] [char](25) NULL,
	[Provincia] [char](15) NULL,
	[Codigo Postal] [varchar](5) NULL,
	[Telefono] [varchar](12) NULL,
	[Numero de Historial] [varchar](9) NOT NULL,
	[Sexo] [char](1) NULL,
 CONSTRAINT [PK_PACIENTES] PRIMARY KEY CLUSTERED 
(
	[Numero de Historial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hospital].[PACIENTES]  WITH CHECK ADD  CONSTRAINT [CK_PACIENTES] CHECK  (([Sexo]='h' OR [Sexo]='m' OR [Sexo]='o'))
GO

ALTER TABLE [hospital].[PACIENTES] CHECK CONSTRAINT [CK_PACIENTES]
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
           ,[Sexo])
     VALUES
           ('08/7888888'
           ,'Jose Eduardo'
           ,'Romerales Pinto'
           ,'C/Azorin,37 3o'
           ,'Mostoles'
           ,'Madrid'
           ,'28935'
           ,'913458745'
           ,'10203-F'
           ,'h')
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
           ,[Sexo])
     VALUES
           ('08/7234823'
           ,'Angel'
           ,'Ruiz Picasso'
           ,'C/Salmeron,212'
           ,'Madrid'
           ,'Madrid'
           ,'28028'
           ,'915653433'
           ,'112454-L'
           ,'h')
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
           ,[Sexo])
     VALUES
           ('08/7333333'
           ,'Mercedes'
           ,'Romero Carvajal'
           ,'C/Malaga,13'
           ,'Mostoles'
           ,'Madrid'
           ,'28028'
           ,'914556745'
           ,'14456-E'
           ,'m')
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
           ,[Sexo])
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
           ,'h')
GO