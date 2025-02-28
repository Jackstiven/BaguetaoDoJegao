-- apagando banco de dados se existir

drop database dbpanadaria;

-- criando bando de dados

create database dbpanadaria;

-- acessar banco de dados

use dbpanadaria;

create table tbfuncionario(
cod_fun int not null auto_increment,
nome_fun varchar(50) not null,
email_fun varchar(50),
tel_fun char(10),
dataNasc_fun datetime,
salario_fun decimal (9,2) default 0 check(salario_fun >= 0),
sexo_fun char(1) default "X" check(sexo_fun in("F","M")),
primary key(cod_fun)
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
email_clie varchar(100) unique,
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
lote_prod varchar(10) unique,
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
desc tbFornecedor;
desc tbProdutos;

insert into tbCliente(nome,cpf_clie,email_clie)
	values('Androsvaldo',
		'00700700707',
		'rodolfo@vaticano.bb');
insert into tbCliente(nome,cpf_clie,email_clie)
	values('cleuroplene',
		'00800800808',
		'fifi@vaticano.bb');

insert into tbFornecedor(nome_forn,tel_forn,email_forn)
	values('Larineia',
		'001',
		'bibiSapatinha@vaticano.bb');
insert into tbFornecedor(nome_forn,tel_forn,email_forn)
	values('Deudicasprio',
		'002',
		'OMarilene@vaticano.bb');

insert into tbfuncionario(nome_fun,salario_fun,sexo_fun,email_fun,tel_fun,dataNasc_fun)
	values('Adaujilberto',
		12.50,
		'F',
		'LindinhaFofs@vaticano.bb',
		'123123',
		"1800-12-10");
insert into tbfuncionario(nome_fun,salario_fun,sexo_fun,email_fun,tel_fun,dataNasc_fun)
	values('Rogemilda',
		120000.50,
		'M',
		'CaueeeeeKSI@vaticano.bb',
		'145632',
		"2019-8-10");

insert into tbProdutos(desc_prod,lote_prod,preco_prod,quant_prod,dataVal_prod,cod_forn)
	values('Motor a vapor',
		'AER96154A',
		50000.66,
		5,
		'3058-03-09',
		1);
insert into tbProdutos(desc_prod,lote_prod,preco_prod,quant_prod,dataVal_prod,cod_forn)
	values('Extrator de petroleo',
		'd789ghj5',
		402552.46,
		11,
		'5000-09-01',
		1);
insert into tbProdutos(desc_prod,lote_prod,preco_prod,quant_prod,dataVal_prod,cod_forn)
	values('Sezio137/g',
		'AER96154A',
		1.50,
		10000,
		'125-05-12',
		1);

insert into tbvendas(VenData,VenHorario,VenQuant,VenValor,VenProdID,VenUsuID)
	values('2025-02-28',
		'00-35-19',
		1,
		50000.66,
		1,
		1,);
insert into tbvendas(VenData,VenHorario,VenQuant,VenValor,VenProdID,VenUsuID)
	values('2025-02-28',
		'00-35-19',
		2,
		3.00,
		3,
		2,);

select * from tbCliente;
select * from tbfuncionario;
select * from tbFornecedor;
select * from tbProdutos;
select * from tbvendas;
select * from tbusuarios;