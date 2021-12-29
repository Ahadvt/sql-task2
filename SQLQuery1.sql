Create database BooksShop
use BooksShop

Create Table Author(
id int primary key identity,
Name nvarchar(25),
Surname nvarchar(25),
)

Create Table Books(
Id int primary key identity,
AuthorId int foreign key references  Author(id),
[PageCount] int check([PageCount]>=10),
[Name] nvarchar(100) check(len([Name])>=2)
)
insert into Author
values('ahad','taghiyev'),
('hasan','nuruzade'),
('nurlan','mammadli'),
('lale','quliyeva'),
('javid','MELLIM))'),
('Vusal','bagirov')

insert into Books
values (1,15,'bakendin dogusu'),
(2,13,'kosmosa ucus'),
(3,11,'frontun dogusu'),
(4,16,'qocalmag nece hissdir'),
(5,13,'P223un taleyi '),
(6,13,'pislik ve fitnekarligdan ucag')


create view ShowAllBooksAndAuthor
as
select B.Id as ID,B.Name as 'Name',b.PageCount as 'PageCount',(A.Name+ ' '+ A.Surname) as FullName from Author A
 join Books B
on B.AuthorId=A.id

select * from ShowAllBooksAndAuthor


create procedure usp_ShowBookAndAuthorFilterr
@Serach nvarchar(100)
as
select * from ShowAllBooksAndAuthor

where @Serach= ID

exec usp_ShowBookAndAuthorFilterr 4

create procedure DeleteColum
@Name nvarchar(50)
as
delete  from Author
where @Name=Name

exec DeleteColum 'ahad'

create procedure AddColum

@Name nvarchar(50),
@Surname nvarchar(50)
as
insert into Author
values(@Name,@Surname)

exec AddColum 'kamran','mellim'

create procedure UpdateColumm
@Id int,
@Name nvarchar(50) 
as
update Author

set Name=@Name  
where id=@Id and len(@Name)>2

exec UpdateColumm 4,'lal'





Create view vw_GetAuthorAndVie
as

select B.AuthorId as ID,(A.Name+ ' '+ A.Surname) as FullName,count(b.Id)as BookCount ,MAX(B.PageCount) as 'PageCount' from Books B
 join Author A
on B.AuthorId=A.id
group by B.AuthorId, (A.Name + ' '+ A.Surname),B.PageCount


select * from vw_GetAuthorAndVie










 



