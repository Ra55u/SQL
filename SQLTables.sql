-- kommentaar

create database TARpe22

-- db kustutamine
drop database TARpe22

-- tabeli loomine
create table Gender
(
Id int not null primary key,
Gender nvarchar(10) not null
)

---- andmete sisestamine
insert into Gender (Id, Gender)
values (2, 'Male')
insert into Gender (Id, Gender)
values (1, 'Female')
insert into Gender (Id, Gender)
values (3, 'Unknown')

--- sama Id väärtusega rida ei saa sisestada
select * from Gender

--- teeme uue tabeli
create table Person
(
	Id int not null primary key,
	Name nvarchar(30),
	Email nvarchar(30),
	GenderId int
)

--- vaatame Person tabeli sisu
select * from Person

--- andmete sisestamine
insert into Person (Id, Name, Email, GenderId)
values (1, 'Superman', 's@s.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (2, 'Wonderwoman', 'w@w.com', 1)
insert into Person (Id, Name, Email, GenderId)
values (3, 'Batman', 'b@b.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (4, 'Aquaman', 'a@a.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (5, 'Catwoman', 'c@c.com', 1)
insert into Person (Id, Name, Email, GenderId)
values (6, 'Antman', 'ant@ant.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (8, NULL, NULL, 2)

select * from Person

-- võõrvõtme ühenduse loomine kahe tabeli vahel
alter table Person add constraint tblPerson_GenderId_FK
foreign key (GenderId) references Gender(Id)

--- kui sisestad uue rea andmeid ja ei ole sisestanud GenderId all väärtust, siis
--- see automaatselt sisestab tabelisse väärtuse 3 ja selleks on unknown
alter table Person
add constraint DF_Persons_GenderId
default 3 for GenderId

insert into Person (Id, Name, Email)
values (7, 'Ironman', 'i@i.com')

select * from Person

--piirangu maha võtmine
alter table Person
drop constraint DF_Persons_GenderId

--- lisame uue veeru
alter table Person
add Age nvarchar(10)

--- lisame vanuse piirangu sisestamisel
--- ei saa lisada suuremat väärtust kui 801
alter table Person
add constraint CK_Person_Age check (Age > 0 and Age < 801)

-- rea kustutamine
-- kui paned vale id, siis ei muuda midagi
delete from Person where Id = 9

select * from Person

-- kuidas uuendada andmeid tabelis
update Person
set Age = 50
where Id = 1

-- lisame juurde uue veeru
alter table Person
add City nvarchar(50)

-- kõik, kes elavad Gothami linnas
select * from Person where City = 'Gotham'
-- kõik, kes ei ela Gothami linnas
select * from Person where City != 'Gotham'
-- teine variant
select * from Person where not City = 'Gotham'
-- kolmas variant
select * from Person where City <> 'Gotham'

-- näitab teatud vanusega inimesi
select * from Person where Age = 800 or Age = 35 or Age = 27
select * from Person where Age in (800, 35, 27)

-- näitab teatud vanusevahemikus olevaid inimesi
select * from Person where Age between 20 and 35

-- wildcard e näitab kõik g-tähega linnad
select * from Person where City like 'g%'
-- näitab kõik emailid, milles on @ märk
select * from Person where Email like '%@%'

--- näitab kõiki, kellel ei ole @-märki emailis
select * from Person where Email not like '%@%'

--- Näitab, kellel on emailis ees ja peale @-märki
-- ainult üks täht
select * from Person where Email like '_@_.com'

-- kõik, kellel ei ole nimes esimene täht W, A, C
select * from Person where Name like '[^WAC]%'

--- kes elavad Gothamis ja New Yorkis
select * from Person where (City = 'Gotham' or City = 'New York')

-- kõik kes elavad Gothamis ja New Yorkis ning
-- alla 30 eluaasta
select * from Person where
(City = 'Gotham' or City = 'New York')
and Age >= 30

--- kuvab tähestikulises järjekorras inimesi
--- ja võtab aluseks nime

select * from Person order by Name
-- kuvab vastupidises järjekorras
select * from Person order by Name desc


--- kui sisestad uue rea andmeid ja ei ole sisestanud GenderId all väärtust, siis
--- see automaatselt sisestab tabelisse väärtuse 3 ja selleks on unknown
alter table Person
add constraint DF_Persons_GenderId
default 3 for GenderId

insert into Person (Id, Name, Email)
values (7, 'Ironman', 'i@i.com')

select * from Person

--piirangu maha võtmine
alter table Person
drop constraint DF_Persons_GenderId

--- lisame uue veeru
alter table Person
add Age nvarchar(10)

--- lisame vanuse piirangu sisestamisel
--- ei saa lisada suuremat väärtust kui 801
alter table Person
add constraint CK_Person_Age check (Age > 0 and Age < 801)

-- rea kustutamine
-- kui paned vale id, siis ei muuda midagi
delete from Person where Id = 9

select * from Person

-- kuidas uuendada andmeid tabelis
update Person
set Age = 50
where Id = 1

-- lisame juurde uue veeru
alter table Person
add City nvarchar(50)

-- kõik, kes elavad Gothami linnas
select * from Person where City = 'Gotham'
-- kõik, kes ei ela Gothami linnas
select * from Person where City != 'Gotham'
-- teine variant
select * from Person where not City = 'Gotham'
-- kolmas variant
select * from Person where City <> 'Gotham'

-- näitab teatud vanusega inimesi
select * from Person where Age = 800 or Age = 35 or Age = 27
select * from Person where Age in (800, 35, 27)

-- näitab teatud vanusevahemikus olevaid inimesi
select * from Person where Age between 20 and 35

-- wildcard e näitab kõik g-tähega linnad
select * from Person where City like 'g%'
-- näitab kõik emailid, milles on @ märk
select * from Person where Email like '%@%'

--- näitab kõiki, kellel ei ole @-märki emailis
select * from Person where Email not like '%@%'

--- Näitab, kellel on emailis ees ja peale @-märki
-- ainult üks täht
select * from Person where Email like '_@_.com'

-- kõik, kellel ei ole nimes esimene täht W, A, C
select * from Person where Name like '[^WAC]%'

--- kes elavad Gothamis ja New Yorkis
select * from Person where (City = 'Gotham' or City = 'New York')

-- kõik kes elavad Gothamis ja New Yorkis ning
-- alla 30 eluaasta
select * from Person where
(City = 'Gotham' or City = 'New York')
and Age >= 30

--- kuvab tähestikulises järjekorras inimesi
--- ja võtab aluseks nime

select * from Person order by Name
-- kuvab vastupidises järjekorras
select top 3 * from Person

--- 2 tund
--- muudab Age muutuja int-ks ja näitab vanuselises järjestuses
select * from Person order by CAST(Age as int)

--- kõikide isikute koondvanus
select SUM(CAST(Age as int)) from Person

--- näitab, kõige nooremat isikut
select MIN(CAST(Age as int)) from Person

--- näeme konkreetsetes linnades olevate isikute koondvanust
-- enne oli Age string, aga pärigu ajal muutsime selle int-ks
select City, SUM(cast(Age as int)) as TotalAge from Person group by City

--kuidas saab koodiga muuta tabeli andmetüüpi ja selle pikkust
alter table Person
alter column Name nvarchar(25)

alter table Person
alter column Age int

-- kuvab esimeses reas välja toodud järjestuses ja muudab Age-i TotalAge-ks
-- teeb järjestuse vaatesse: City, GenderId ja järjestab omakorda City veeru järgi
select City, GenderId, SUM(Age) as TotalAge from Person
group by City, GenderId order by City

--- näitab, et mitu rida on selles tabelis
select COUNT(*) from Person

--- veergude lugemine
SELECT COUNT(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Person'

--- näitab tulemust, et mitu inimest on GenderId
--- väärtusega 2 konkreetses linnas
--- arvutab kokku vanuse
select GenderId, City, SUM(Age) as TotalAge, COUNT(Id) as [Total Person(s)]
from Person
where GenderId = '2'
group by GenderId, City

--- näitab, et mitu inimest on vanemad, kui 41 ja kui palju igas linnas
select GenderId, City, SUM(Age) as TotalAge, COUNT(Id) as [Total Person(s)]
from Person
group by GenderId, City having SUM(Age) > 41

-- loome uue tabelid
create table Department
(
Id int primary key,
DepartmentName nvarchar(50),
Location nvarchar(50),
DepartmentHead nvarchar(50)
)

create table Employees
(
Id int primary key,
Name nvarchar(50),
Gender nvarchar(50),
Salary nvarchar(50),
DepartmentId int
)

insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values(1, Tom, Male, 4000, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values(2, Pam, Female, 3000, 3)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values(3, John, Male, 3500, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values(4, Pam, Female, 3000, 3)

--- päring
create table DepartmentSalary
(
Id int primary key,
Name nvarchar(50),
Gender nvarchar(50),
Salary nvarchar(50),
DepartmentName int
)

insert into DepartmentSalary (Id, Name, Gender, Salary, DepartmentName)
values(1, 'James', 'Male', 6500, NULL)
insert into DepartmentSalary (Id, Name, Gender, Salary, DepartmentName)
values(2, 'Russell', 'Male', 8800, NULL)


SELECT Name, Gender, Salary, DepartmentName
FROM tblEmployee E
LEFT JOIN tblDepartment D
ON E DepartmentId = D.Id
WHERE D.Id IS NULL

--- kuidas muuta sp'd võti peale, et keegi teine peale teie
--- ei saaks seda muuta

alter proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
with encryption -- paneb võtme peale
as begin
	select Name, Gender, DepartmentId from Employees where Gender = @Gender
	and DepartmentId = @DepartmentId
end

-- sp tegemine
create proc spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
as begin
	select @EmployeeCount = count(Id) from Employees where Gender = @Gender
end

--- annab tulemuse, kus loendab ära nõuetele vastavad read
--- prindib tulemuse kirja teel
declare @TotalCount int
execute spGetEmployeeCountByGender 'Male', @TotalCount out
if(@TotalCount = 0)
	print '@TotalCount is null'
else
	print '@Total is not null'
print @TotalCount

--- näitab ära, et mitu rida vastab nõuetele
declare @TotalCount int
execute spGetEmployeeCountByGender @EmployeeCount = @TotalCount out, @Gender = 'Male'
print @TotalCount

-- sp sisu vaatamine
sp_help spGetEmployeeCountByGender
-- tabeli info
sp_help Employees
-- kui soovid sp teksti näha
sp_helptext spGetEmployeeCountByGender

-- vaatame, millest sõltub see sp
sp_depends spGetEmployeeCountByGender
--- saame teada, mitu asja sõltub sellest tabelist
sp_depends Employees


create proc spGetNameById
@Id int,
@Name nvarchar(20) output
as begin
	select @Name = Id, @Name = Name from Employees
end

spGetnameById 1, 'Tom'

create proc spTotalCount2
@TotalCount int output
as begin
	select @TotalCount = COUNT(Id) from Employees
end

--- saame teada, et mitu rida andmeid on tabelis
declare @TotalEmployees int
execute spTotalCount2 @TotalEmployees output
select @TotalEmployees

-- mis id all on keegi nime järgi
create proc spGetNameById1
@Id int,
@Name nvarchar(50) output
as begin
	select @Name = Name from Employees where Id = @Id
end

-- annab tulemuse, kus id 1 real on keegi koos nimega
declare @Name nvarchar(50)
execute spGetNameById1 6, @Name output
print 'Name of the employee = ' + @Name


declare
@Name nvarchar(20)
execute spGetNameById1 1, @Name out
print 'Name = ' + @Name


create proc spGetNameById2
@Id int
as begin
	return (select Name from  employees where Id = @Id)
end

--- tuleb veateade kuna kutsusime välja int-i, aga Tom on string andmetüüp
declare @EmployeeName nvarchar(50)
execute @EmployeeName = spGetNameById2 1
print 'Name of the employee = ' + @EmployeeName

---sisseehitatud string funktsioon
--- see konverteerib ASCII tähe väärtuse numbriks
select ASCII('a')
--- näitb A-tähte
select CHAR (65)

--- prindime kogu tähestiku välja
declare @Start int
set @Start = 97
while (@Start <= 122)
begin
	select CHAR (@Start)
	set @Start = @Start+1
end

--- eemaldame tühjad kohad sulgudes (vasakul pool)
select LTRIM('                            Hello')

--- Lisab nimed Employees tabelisse
alter table dbo.Employees
add MiddleName nvarchar(30)

alter table dbo.Employees
add LastName nvarchar(30)

--- tühikute eemaldamine veerust
select * from dbo.Employees

-- tühikute eemaldamine veerust
select LTRIM(Name) as [Name], MiddleName, LastName from Employees

-- paremalt poolt tühjad stringid lõikab ära
select RTRIM('      Hello              ')

--- keerab kooloni sees olevad andmed vastupidiseks
--- vastavalt upper ja lower-ga saan muuta märkide suurust
--- reverse funktsioon pöörab kõik ümber
select REVERSE(UPPER(ltrim(Name))) as Name, MiddleName, LOWER(LastName),
RTRIM(LTRIM(Name)) + ' ' + MiddleName + ' ' + LastName as FullName
from Employees

-- näeb ära, et mitu tähemärki on nimes ja loeb tühikud sisse
select Name, LEN(Name) as [Total Characters] from Employees

--- näeb ära, mitu tähte on sõnal ja ei loe tühikuid sisse
select Name, LEN(ltrim(Name)) as [Total Characters] from Employees


--- left, right, substring
--- vasakult poolt neli esimest tähte
select LEFT('ABCDEF', 4)

--- paremalt poolt kolm tähte
select RIGHT('ABCDEF', 3)

---- kuvab @-tähemärgi asetust
select CHARINDEX('@', 'sara@aaa.com')

--- esimene nr peale komakohta näita, et mitmendast alustab
--- ja siis mitu nr peale seda kuvada
select SUBSTRING('pam@abc.com', 5,4)

--- @-märgist kuvab kolm tähemärki. Viimase nr-ga saab määrata pikkust
select SUBSTRING('pam@bbb.com', CHARINDEX('@', 'pam@bbb.com') + 1, 3)

----peale @-tähemärki
select SUBSTRING('pam@bbb.com', CHARINDEX('@', 'pam@bbb.com') + 2,
LEN('pam@bbb.com') - charindex('@', 'pam@bbb.com'))

--- saame teada domeeninimed emailides
select SUBSTRING (Email, CHARINDEX('@', Email) + 1,
LEN (Email) - charindex('@', Email)) as EmailDomain
from Employees

alter table Employees
add Email nvarchar(20)

update Employees set Email = 'Tom@aaa.com' where Id = 1
update Employees set Email = 'Pam@bbb.com' where Id = 2
update Employees set Email = 'John@aaa.com' where Id = 3
update Employees set Email = 'Sam@bbb.com' where Id = 4
update Employees set Email = 'Todd@bbb.com' where Id = 5
update Employees set Email = 'Ben@ccc.com' where Id = 6
update Employees set Email = 'Sara@ccc.com' where Id = 7
update Employees set Email = 'Valarie@aaa.com' where Id = 8
update Employees set Email = 'James@bbb.com' where Id = 9
update Employees set Email = 'Russel@bbb.com' where Id = 10

select * from Employees


--- lisame *-märgi teatud kohast
select Name, LastName,
SUBSTRING(Email, 1, 2) + REPLICATE('*', 5) + --- peale teist tähemärki paneb viis tärni
SUBSTRING(Email, CHARINDEX('@', Email), len(Email) - charindex('@', Email)+1) as Email
from Employees

--- kolm korda näitab stringis olevat väärtust
select REPLICATE('asd', 3)

--- kuidas sisestada tühikut kahe nime vahele
select SPACE(5)

--- tühikute arv kahe nime vahel
select Name + SPACE(25) + LastName as FullName
from Employees

---PATINDEX
--- sama, mis CHARINDEX, aga dünaamilisem ja saab kasutada wildcardi
select Email, PATINDEX('%@aaa.com', Email) as FirstOccurence
from Employees
where PATINDEX('%@aaa.com', Email) > 0 -- leiab kõik selle domeeni esindajad
-- ja alates mitmendast märgist algab @

--- kõik .com-d asendatakse .net-ga
select Email, REPLACE(Email, '.com', '.net') as ConvertedEmail
from Employees

--- soovin asendada peale esimest märki kolm tähte viie tärniga
select Name, LastName, Email,
	STUFF(Email, 2, 3, '*****') as StuffedEmail
from Employees

--- teeme tabeli
create table DateTime
(
c_time time,
c_date date,
c_smalldatetime smalldatetime,
c_datetime datetime,
c_datetime2 datetime2,
c_datetimeoffset datetimeoffset
)

select * from DateTime

--- konkreetse masina kellaaeg
select GETDATE(), 'GETDATE()'

insert into DateTime
values (GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE())

select * from DateTime

update DateTime set c_datetimeoffset = '2022-04-11 11:52:35.8366667 +00:00'
where c_datetimeoffset = '2023-04-11 11:52:35.8366667 +00:00'

select CURRENT_TIMESTAMP, 'CURRENT_TIMESTAMP' -- aja päring
select SYSDATETIME(), 'SYSDATETIME' -- veel täpsem aja päring
select SYSDATETIMEOFFSET() --- täpne aeg koos ajalise nihkega UTC suhtes
select GETUTCDATE() --- UTC aeg


select ISDATE('asd') -- tagastab 0 kuna string ei ole date
select ISDATE(GETDATE()) --- tagastab 1 kuna on kp
select ISDATE('2023-04-11 11:52:35.8366667') -- tagastab 0 kuna max kolm komakohta
select ISDATE('2023-04-11 11:52:35.836') -- tagastab 1
select DAY(GETDATE()) -- annab tänase päeva numbri
select DAY('03/31/2020') -- annab stringis oleva kp ja järjestus peab olema õige
select MONTH(GETDATE()) -- annab jooksva kuu nr
select MONTH('03/31/2020') -- annab stringis oleva kuu nr
select YEAR(GETDATE()) -- annab jooksva aasta nr
select YEAR('03/31/2020') -- annab stringis oleva aasta nr

select DATENAME(DAY, '2023-04-11 11:52:35.836') -- annab stringis oleva päeva numbri
select DATENAME(WEEKDAY, '2023-04-11 11:52:35.836') -- annab stringis oleva päeva sõnana
select DATENAME(MONTH, '2023-04-11 11:52:35.836') -- annab stringis oleva kuu sõnana

--- 5 tund
create function fnComputerAge(@DOB datetime)
returns nvarchar(50)
as begin
	declare @tempdate datetime, @years int, @months int, @days int
		select @tempdate = @DOB

		select @years = DATEDIFF(YEAR, @tempdate, GETDATE()) - case when (MONTH(@DOB) >
		MONTH(GETDATE())) or (MONTH(@DOB)
		= month(getdate()) and DAY(@DOB) > DAY(GETDATE())) then 1 else 0 end
		select @tempdate = DATEADD(YEAR, @years, @tempdate)

		select @months = DATEDIFF(MONTH, @tempdate, GETDATE()) - case when DAY(@DOB)  DAY(GETDATE)))
		select @tempdate = DATEADD(MONTH, @months, @tempdate)

		select @days = DATEDIFF(DAY, @tempdate, GETDATE())
	declare @Age nvarchar(50)
		set @Age = CAST(@years as nvarchar(4)) + ' Years ' + CAST(@months as nvarchar(4)) + ' Months ' + CAST(@days as nvarchar(4)) + ' Days old '
	return @Age
end

-- saame vaadata kasutajate vanust
select Id, Name, DateOfBirth, dbo.fnComputerAge(DateOfBirth)
as Age from Employees
-- kui kasutame seda funktsiooni, siis saame teada tänase päeva vahe
-- stringis välja toodud kuupäevaga
select dbo.fnComputerAge('11/11/2010')

-- nr peale DateOfBirth muutujat näitab, et mismoodi kuvada DOB
select Id, Name, DateOfBirth,
CONVERT(nvarchar, DateOfBirth, 126) as ConvertedDOB
from Employees

select Id, Name, LastName + ' - ' + CAST(Id as nvarchar)
as [Name-Id] from Employees


select CAST(GETDATE() as date) -- tänane kp
select CONVERT(date, GETDATE()) -- tänane k

-- matemaatilised funktsioonid
select ABS(-101.5)
