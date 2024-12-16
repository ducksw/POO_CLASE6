Use Negocios2024
go

create table tb_alumno(
	codAlumno int primary key,
	nomAlumno varchar(255),
	dirAlumno varchar(255),
	idpais char(3) references tb_paises
)

create or alter proc usp_alumno
As
Select * from tb_alumno
go

create or alter proc usp_paises
as
select * from tb_paises
go

create or alter proc usp_alumnos_agregar
@cod int,
@nom varchar(255),
@dir varchar(255),
@idpais char(3)
as
Insert tb_alumno Values(@cod, @nom, @dir, @idpais)
go
create or alter proc usp_alumnos_actualizar
@cod int,
@nom varchar(255),
@dir varchar(255),
@idpais char(3)
as
Update tb_alumno Set nomAlumno=@nom, dirAlumno=@dir, idpais=@idpais
where codAlumno=@cod

create or alter proc usp_alumnos_eliminar
@cod int
as
delete tb_alumno where codAlumno = @cod