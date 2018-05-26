drop procedure if exists adduser;
go
create procedure adduser 
	@username nvarchar(30), @password nvarchar(30) = 'password', @firstname nvarchar(30) = 'firstname',
	@lastname nvarchar(30) = 'lastname', @phone nvarchar(12) = '513-000-000', 
	@email nvarchar(255) = 'john@email.com', @isreviewer bit = 0, @isadmin bit = 0, @active bit = 1
	as
	BEGIN
		insert [User]
		(username, password, firstname, lastname, phone, email, isreviewer, isadmin, active)
		values
		(@username, @password, @firstname, @lastname, @phone, @email, @isreviewer, @isadmin, @active)
	END
go
exec adduser @username = 'username3';
go
drop procedure if exists addvendor;
go
create procedure addvendor
	@code nvarchar(35), @name nvarchar(255) = 'name',
	@address nvarchar(255) = '0000 sunny ave', @city nvarchar(255) = 'city', 
	@state nvarchar(2) = 'XX', @zip nvarchar(5) = '00000', 
	@phone nvarchar(12) = '513-000-0000', @email nvarchar(255) = 'john@email.com', @ispreapproved bit = 0, @active bit = 1
	as
	BEGIN
		insert vendor
		(code, name, address, city, state, zip, phone, email, ispreapproved, active)
		values
		(@code, @name, @address, @city, @state, @zip, @phone, @email, @ispreapproved, @active)
	END
go
exec addvendor @code = '10000';
go
drop procedure if exists addproduct;
go
create procedure addproduct
	@vendorid int, @partnumber nvarchar(50) = '10101', 
	@name nvarchar(150) = 'thing', @price decimal(10, 2) = 999.999,
	@unit nvarchar(25) = 'each', @photopath nvarchar(255) = 'photopath', @active bit = 1
	as
	BEGIN	
		insert product 
		(vendorid, partnumber, name, price, unit, photopath, active)
		values
		(@vendorid, @partnumber, @name, @price, @unit, @photopath, @active)
	END
go
exec addproduct @vendorid = '10000';
go
drop procedure if exists addpurchaserequest;
go
create procedure addpurchaserequest
	@userid int, @description nvarchar(100) = 'description', 
	@justification nvarchar(255) = 'justification', @deliverymode nvarchar(25) = 'deliverymode',
	@status nvarchar(10) = 'NEW', @total decimal(10, 2) = 999.99, @active bit = 1, @reasonforrejection nvarchar(100) = 'reason for rejection'
	as
	BEGIN
		insert purchaserequest
		(userid, description, justification, deliverymode, status, total, active, reasonforrejection)
		values
		(@userid, @description, @justification, @deliverymode, @status, @total, @active, @reasonforrejection)
	END
go
exec addpurchaserequest @userid = '10000';
go
drop procedure if exists addpurchaserequestlineitem;
go
create procedure addpurchaserequestlineitem
	@purchaserequestid int, @productid int, @quantity int = 1, @active bit = 1
	as
	BEGIN
	insert purchaserequestlineitem
	(purchaserequestid, productid, quantity, active)
	values
	(@purchaserequestid, @productid, @quantity, @active)
	END
go
exec addpurchaserequestlineitem @purchaserequestid = '10000', @productid = '10000';
/*
go
delete from [User];
go
delete from vendor;
go
delete from product;
go
delete from purchaserequest;
go
delete from purchaserequestlineitem;
go
*/
