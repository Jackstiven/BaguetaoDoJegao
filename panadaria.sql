-- apagando banco de dados se existir

drop database dbpanadaria;

-- criando bando de dados

create database dbpanadaria;

-- acessar banco de dados

use dbpanadaria;

create table tbgenero(
cod_gen int not null,
nome_gen varchar(100),
primary key(cod_gen)
);


create table tbfuncionario(
cod_fun int not null auto_increment,
nome_fun varchar(50) not null,
email_fun varchar(50),
tel_fun char(10),
dataNasc_fun datetime,
salario_fun decimal (9,2) default 0 check(salario_fun >= 0),
sexo_fun char(1) default "X" check(sexo_fun in("F","M")),
cod_gen int not null,
primary key(cod_fun),
foreign key(cod_gen)references tbgenero(cod_gen)
);

create table tbusuarios(
cod_usu int not null auto_increment,
nome_usu varchar(50) not null,
senha_usu varchar(12) not null,
cod_fun int not null,
primary key (cod_usu),
foreign key (cod_fun)references tbfuncionario(cod_fun)
);

create table tbCliente(
cod_clie int not null auto_increment,
nome varchar(100) not null,
cpf_clie char(14) not null unique,
email_clie varchar(100),
primary key(cod_clie)
);

create table tbFornecedor(
cod_forn int not null,
nome_forn varchar(100),
email_forn varchar(30),
tel_forn char(10),
primary key(cod_forn)
);

create table tbProdutos(
cod_prod int not null auto_increment,
desc_prod varchar(100),
quant_prod int,
preco_prod decimal(5,2),
dataVal_prod datetime,
lote_prod varchar(10),
cod_forn int not null,
primary key(cod_prod),
foreign key (cod_forn) references tbFornecedor(cod_forn)
);

create table tbvendas(
VenID int not null auto_increment,
VenData date,
VenHorario time,
VenQuant decimal(9,2) default 0 check(VenQuant >0),
VenValor decimal(9,2) default 0 check(VenValor >=0),
VenProdID int not null,
VenUsuID int not null,
VenCliID int not null,
primary key(VenID),
foreign key(VenProdID)references tbProdutos(cod_prod),
foreign key(VenUsuID)references tbusuarios(cod_usu),
foreign key(VenCliID)references tbCliente(cod_clie)
);

show tables;

desc tbusuarios;
desc tbfuncionario;
desc tbgenero;
desc tbFornecedor;
desc tbProdutos;