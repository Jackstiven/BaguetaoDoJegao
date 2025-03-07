-- se tem mariaDB deve ter um jesusDB
 
-- deletando banco
drop database dbsapiensselestial;
 
-- criando banco
create database dbsapiensselestial;
 
-- acessando banco
use dbsapiensselestial;
 


-- ________________________________________________________________________________________________________________________________________________________________



--criando as tabelas
create table tbfuncionarios(
FunID int not null auto_increment,
FunNome varchar(20) not null,
FunEmail varchar(25) not null,
FunCell char(15) null,
FunNasci datetime null,
FunDindin decimal(9,2) default 0 check(FunDindin >= 0),
FunSexo char(1) default "F" check(FunSexo in("F","M")),
FuGenero Varchar(100) not null,
primary key(FunID)
);

create table tbusuarios(
UsuID int not null auto_increment,
UsuNome varchar(50) not null,
UsuSenha Varchar(15) not null,
UsuFunID int not null,
primary Key(UsuID),
foreign key(UsuFunID)references tbfuncionarios(FunID)
);

create table tbCliente(
CliID int not null auto_increment,
CliNome varchar(50) not null,
CliCPF char(14) not null,
CliEmail varchar(100) not null,
primary key(CliID)
);

create table tbFornecedor(
ForID int not null auto_increment,
ForNome varchar(50),
ForEmail varchar(50),
ForTell char(15),
primary key(ForID)
);

create table tbprodutos(
ProID int not null auto_increment,
ProDescri varchar(100),
ProQuantidade int,
ProPreco decimal(9,2),
ProVal datetime,
ProLote char(10),
ProForID int not null,
primary key(ProID),
foreign key(ProForID)references tbFornecedor(ForID)
);

create table tbVendas(
VenID int not null auto_increment,
VenDat date,
VenHora time,
VenQuant decimal(9,2) default 0 check(VenQuant > 0),
VenValor decimal(9,2) default 0 check(VenValor >= 0),
VenProdID int not null,
VenUsuID int not null,
VenCliID int not null,
primary key(VenID),
foreign key(VenProdID)references tbProdutos(ProID),
foreign key(VenUsuID)references tbusuarios(UsuID),
foreign key(VenCliID)references tbCliente(CliID)
);
 


-- ________________________________________________________________________________________________________________________________________________________________



-- ver tabelas
show tables;
 


-- ver oq tem na tabela
desc tbfuncionarios;
desc tbusuarios;
desc tbCliente;
desc tbFornecedor;
desc tbProdutos;
desc tbVendas;


-- ________________________________________________________________________________________________________________________________________________________________


-- inserindo nas tabelas

insert into tbfuncionarios(FunNome,FunEmail,FunCell,FunNasci,FunDindin,FunSexo)
	values(
		'Adaujilberto',
		'LindinhaFofs@vaticano.bb',
		'123123',
		'1800-12-10',
		12.50,
		'M'
		);
insert into tbfuncionarios(FunNome,FunEmail,FunCell,FunNasci,FunDindin,FunSexo)
	values(
		'Rogemilda',
		'partecranios@vaticano.bb',
		'564132',
		'2025-1-22',
		12.50,
		'M'
		);




-- _________________________________________________________________________________________________________________________________________________________________




-- conteudos das tabelas

select * from tbfuncionarios;