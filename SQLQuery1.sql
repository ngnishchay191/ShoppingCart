create database CommonSimulation2

use CommonSimulation2

--Customer Table
--id, name, address, mobno, email, password
--CustId identity primary key

create table Customer
(CustId int constraint pk_custid primary key identity,
CustName varchar(30) not null,
CustAddress varchar(100) not null,
MobNo bigint constraint un_mno unique,
EmailId varchar(100) constraint un_em unique,
Password varchar(30) not null)

--Product Table
--id, name, price, stock
--id primary key identity

create table Product
(ProdId int constraint pk_prodid primary key identity,
ProdName varchar(30) not null,
ProdPrice int not null,
ProdStock int constraint def_stock default 0)


--OrderDetails Table
--orderid, date, custID FK, prodID FK, quantity, totalAmt, PaymentMode
--orderid primary key identity

create table OrderDetails
(OrderId int constraint pk_orderid primary key identity,
OrderDate datetime constraint def_OrderDate default getdate(),
CustId int constraint fk_order_custid references Customer(CustId),
ProdId int constraint fk_order_prodid references Product(ProdId),
Quantity int not null,
TotalAmount money not null,
PaymentMode varchar(10) not null)



insert into Product(ProdName, ProdPrice, ProdStock) values('Apple', 2.50, 20)
insert into Product(ProdName, ProdPrice, ProdStock) values('Orange', 1.50, 10)
insert into Product(ProdName, ProdPrice, ProdStock) values('Banana', 1, 30)




create procedure sp_InsertCustomer(@name varchar (30), @add varchar(100), @mno bigint,
@email varchar(50), @pwd varchar(30), @cid int out)
as
begin
insert into Customer values(@name, @add, @mno, @email, @pwd)
select @cid=@@IDENTITY
end

--Login Customer
create proc sp_LoginCustomer(@cid int,@pass varchar(30))
as
begin
select * from Customer where CustId=@cid and Password=@pass
end --begin


create proc sp_InsertOrder(@cid int,@pid int, @qty int,@tamt money, @paymentMode varchar(10),@oid int out)
as
begin
insert into OrderDetails(CustId,ProdId,Quantity, TotalAmount, PaymentMode) values(@cid, @pid, @qty, @tamt, @paymentMode)
update Product set ProdStock=ProdStock-@qty where ProdId=@pid
select @oid=@@IDENTITY
end
