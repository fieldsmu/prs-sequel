create table User (
	Id int not null identity(1, 1) primary key,
	Username nvarchar(30) not null unique, 
	Password nvarchar(30) not null,
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Phone nvarchar(12) not null,
	Email nvarchar(255) not null unique,
	IsReviewer bit not null,
	IsAdmin bit not null,
	Active bit not null
);