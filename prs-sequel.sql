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
	('rachelfr', 'password', 'rachel', 'freking', '513-720-9421', 'frekinra@gmail.com', 1, 0, 1);

insert [User]
	(Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin, Active)
	Values
	('marysadd', 'password', 'mary', 'saddler', '513-254-3769', 'saddlrma@gmail.com', 0, 0, 1);
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
	Active bit default 1 not null,
	ReasonForRejection nvarchar(100)
);
go
create table PurchaseRequestLineItem (
	Id int not null primary key identity(1, 1),
	PurchaseRequestId int not null foreign key references PurchaseRequest,
	ProductId int not null foreign key references Product,
	Quantity int not null default 1,
	Active bit not null
);
go
select * from [User];
select * from Vendor;
select * from Product;