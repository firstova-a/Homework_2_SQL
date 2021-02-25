create database BuildingCompany;
GO
Use BuildingCompany
GO

create table Employee(
Id int not null identity(1,1) primary key,
Position varchar(50) not null,
FIO varchar(50) not null);
GO

create table Accounters(
Id int not null identity(1,1) primary key,
Stake float not null,
IdEmployee int,
foreign key (IdEmployee) references Employee (Id));

create table Drivers(
Id int not null identity(1,1) primary key,
IdEmployee int,
foreign key (IdEmployee) references Employee (Id));

GO

create table Locations(
Id int not null identity(1,1) primary key,
Address varchar(50) not null,
LocType nchar(1),
CONSTRAINT [CK_Location_LocType] CHECK (UPPER([LocType]) IN ('W', 'O')));

GO

create table BuildObjects(
Id int not null identity(1,1) primary key,
ObjectName varchar(50),
IdManager int unique,
IdLocation int unique,
foreign key (IdLocation) references Locations (Id));

GO

create table Managers(
Id int not null identity(1,1) primary key,
IdObject int unique,
IdEmployee int,
foreign key (IdObject) references BuildObjects (Id),
foreign key (IdEmployee) references Employee (Id));

create table Builders(
Id int not null identity(1,1) primary key,
WorkTime float,
IdObject int,
IdEmployee int,
foreign key (IdObject) references BuildObjects (Id),
foreign key (IdEmployee) references Employee (Id));

create table Resource(
Id int not null identity(1,1) primary key,
ResourceName varchar(50),
Weight float,
IdTransortation int,
IdLocation int,
foreign key (IdLocation) references Locations (Id));

create table Warehouses(
Id int not null identity(1,1) primary key,
IdLocation int unique,
foreign key (IdLocation) references Locations (Id));

create table Suppliers(
Id int not null identity(1,1) primary key,
NameSupplier varchar(50));

GO

create table Contract(
Id int not null identity(1,1) primary key,
DateCreate DateTime,
DateDelivery DateTime,
MoneySum money,
IdManager int,
IdSupplier int,
IdWarehouse int,
foreign key (IdManager) references Managers (Id),
foreign key (IdSupplier) references Suppliers (Id),
foreign key (IdWarehouse) references Warehouses (Id));

create table Transportation(
Id int not null identity(1,1) primary key,
IdFromLocataion int,
IdToLacation int,
IdDriver int,
foreign key (IdDriver) references Drivers (Id));

Alter table BuildObjects
ADD foreign key (IdManager) references Managers (Id);

Alter table Resource
ADD foreign key (IdTransortation) references Transportation (Id);