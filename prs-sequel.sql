use master;
go
drop database if exists prssql;
go
create database prssql;
go
use prssql;
go
create table [User] (
	Id int not null identity(1, 1) primary key,
	Username nvarchar(30) not null, 
	Password nvarchar(30) not null,
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Phone nvarchar(12) not null,
	Email nvarchar(255) not null,
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0,
	Active bit not null default 1
);
go
create unique index uix_username on [User](Username);
go
insert [User]
	(Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin, Active)
	Values
	('fieldsmu', 'password', 'marcus', 'fields', '513-370-8421', 'fieldsmu@gmail.com', 1, 1, 1);

insert [User]
	(Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin, Active)
	Values
	('rachelfr', 'password', 'rachel', 'freking', '513-720-9421', 'rachelfr@gmail.com', 1, 0, 1);

insert [User]
	(Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin, Active)
	Values
	('marysadd', 'password', 'mary', 'saddler', '513-254-3769', 'marysadd@gmail.com', 0, 0, 1);
go
create table Vendor (
	Id int not null identity(1, 1) primary key,
	Code nvarchar(30) not null, 
	Name nvarchar(255) not null, 
	Address nvarchar(255) not null,
	City nvarchar(255) not null,
	State nvarchar(2) not null,
	Zip nvarchar(5) not null,
	Phone nvarchar(12) not null,
	Email nvarchar(255) not null,
	IsPreApproved bit not null default 0,
	Active bit not null default 1
);
go 
create unique index uix_code on Vendor(Code);
go
insert Vendor 
		(Code, Name, Address, City, State, Zip, Phone, Email, IsPreApproved, Active)
		values
		('12156', 'name', '7736 scioto court', 'cincinnati', 'OH', '45069', '513-444-4444', 'joebob@gmail.com', 0, 1);
go
create table Product (
	Id int not null identity(1, 1) primary key,
	VendorId int not null foreign key references Vendor(Id),
	PartNumber nvarchar(50) not null,
	Name nvarchar(150) not null,
	Price decimal(10, 2) not null default 10,
	Unit nvarchar(25) not null default 'each',
	PhotoPath nvarchar(255),
	Active bit not null default 1
);
go
insert Product 
	(VendorId, PartNumber, Name, Price, Unit, PhotoPath, Active)
	values
	('1', '1010101', 'steel beam', 999, 'each', 'path goes here', 1);
go
create unique index uix_partnumber on Product(PartNumber);
go
create table PurchaseRequest (
	Id int not null primary key identity(1, 1),
	UserId int not null foreign key references [User],
	Description nvarchar(100) not null,
	Justification nvarchar(255) not null,
	DeliveryMode nvarchar(25) not null,
	Status nvarchar(10) not null default 'NEW',
	Total decimal(10, 2) not null default 0,
	Active bit default 1,
	ReasonForRejection nvarchar(100)
);
go
select * from [User];
select * from Vendor;
select * from Product;