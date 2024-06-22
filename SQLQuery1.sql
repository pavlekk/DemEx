set ansi_nulls on
go

set ansi_padding on
go 

set quoted_identifier on
go

create database [DemoEx]
go

drop database [DemoEx]
go


create table [dbo].[Role](

[ID_Role] [int] not null identity (1,1),
[Name_Role] [varchar] (25) not null,
constraint [PK_ID_Role] primary key
clustered ([ID_Role] ASC) on [PRIMARY],
constraint [UQ_Name_Role] unique ([Name_Role])
)
go

insert into [dbo].[Role] ([Name_Role])
values ('Программист')
go

select * from [Role]
go

create table [dbo].[Employee](

[ID_Employee] [int] not null identity (1,1),
[Role_ID] [int] not null,
[First_Name_Employee] [varchar] (50) not null,
[Second_Name_Employee] [varchar] (50) not null,
[Third_Name_Employee] [varchar] (50)  null default ('-'),
[Login_Employee] [varchar] (50) not null,
[Password_Employee] [varchar] (50) not null,
constraint [PK_ID_Employee] primary key
clustered ([ID_Employee] ASC) on [PRIMARY],
constraint [FK_Role_ID] foreign key
([Role_ID]) references [dbo].[Role] ([ID_Role]),
constraint [UQ_Login_Employee] unique ([Login_Employee]),
constraint [Min_Login_Employee] check (len ([Login_Employee]) >=7 ),
constraint [Min_Password_Employee] check (len ([Password_Employee]) >=7 ),
constraint [Up_Login_Employee] check ([Login_Employee] like ('%[A-Z]%')),
constraint [Down_Login_Employee] check ([Login_Employee] like ('%[a-z]%')),
constraint [Simb_Login_Employee] check ([Login_Employee] like ('%[!@%^$&]%')),
)
go

insert into [dbo].[Employee] ([First_Name_Employee],[Second_Name_Employee],[Third_Name_Employee],[Login_Employee],[Password_Employee], [Role_ID])
values ('Есипов', 'Павел','','loooofffyFyy!','Bebra12355',1)
go

select * from [Employee]
go

