
--Course databazasi olacaq. 
--Students table (Id, Name,Surname,Age,Email,Address) yaradirsiz, Student table-dan hansisa data silinende      silinmish data  StudentArchives table-na  yazilmalidir. 
--Silinme prosesini procedure sekilinde yazmalisiz.   Qeyd : Butun her sheyi kodlar      vasitesile yazirsiz, butun sorgular faylda olsun. 
--(Databaza yaratmaq daxil olmaq shertile)

use Course2

create procedure usp_createStudent

@name nvarchar(100),
@surname nvarchar(100),
@age int,
@email nvarchar(200),
@adress nvarchar(200)
as
begin
   insert into Students([Name],[Surname],[Age],[Email],[Adress])
   values(@name,@surname,@age,@email,@adress)
end

exec  usp_createStudent 'Behruz' , 'Aliyev ',37,'behruz@gmail.com', 'Kurdaxani'

exec  usp_createStudent 'Ismayil' , 'Ceferli ',26,'ismayil@gmail.com', 'Ehmedli'


exec  usp_createStudent 'Kamran' , 'Muradov ',24,'kamran@gmail.com', 'Sumqayit'


exec  usp_createStudent 'Ilqar' , 'Miriyev',26,'ilqar@gmail.com', 'Yasamal'

select * from Students


select GETDATE()

create table StudentInformationLogs(

[Id] int primary key identity(1,1),
[StudentId] int,
[Name] nvarchar(100),
[Operation] nvarchar(100),
[Date] datetime
)

select * from StudentInformationLogs

create trigger trg_deleteStudentInformationLogs on Students
after delete
as
begin
insert into StudentInformationLogs([StudentId],[Name],[Operation],[Date])
select [Id] , [Name] ,'Delete',GETDATE() from deleted
end

create procedure usp_deleteStudentById

@id int
as
begin
 delete from Students where id = @id
end

exec usp_deleteStudentById 3

exec usp_deleteStudentById 1

select * from Students 

select * from StudentInformationLogs