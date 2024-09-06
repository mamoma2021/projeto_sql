create database comercio;
use comercio;

create table cliente(
idcliente int auto_increment primary key,
nome varchar(30) not null,
sexo enum ('M', 'F') not null,
email varchar(50) unique,
cpf varchar(15) not null unique
);

insert into cliente values
(null, 'João', 'M', 'joão@bol.com', '76984352456'),
(null, 'Carla', 'F', 'carla@bol.com', '76984356699'),
(null, 'Ana', 'F', 'ana@bol.com', '76984357755'),
(null, 'Clara', 'F', 'clara@bol.com', '76984353344'),
(null, 'Jorge', 'M', 'jorge@bol.com', '76984352211'),
(null, 'Celia', 'F', 'celia@bol.com', '76984359988');

create table endereco(
idendereco int primary key auto_increment,
rua varchar(30) not null,
bairro varchar(30) not null,
cidade varchar(30) not null,
estado varchar(2) not null,
id_cliente int,
foreign key(id_cliente) references cliente(idcliente)
);

insert into endereco values
(null,'Rua Antonio Sa', 'Centro', 'B. Horizonte', 'MG',4),
(null,'Rua Capitao Hermes', 'Centro', 'Rio de Janeiro', 'RJ',1),
(null,'Rua Pres Vargas', 'Jardins', 'Sao Paulo', 'SP',3),
(null,'Rua Alfandega', 'Estacio', 'Rio de Janeiro', 'RJ',2),
(null,'Rua do Ouvidor', 'Flamengo', 'Rio de Janeiro','RJ', 6),
(null,'Rua Uruguaiana', 'Centro', 'Vitoria', 'ES',5);

create table telefone(
idtelefone int primary key auto_increment,
tipo enum ('Res', 'Com', 'Cel') not null,
numero varchar(10) not null,
id_cliente int,
foreign key(id_cliente) references cliente(idcliente)
);

insert into telefone values
(null,'cel', '78458743',5),
(null,'res', '56576876',5),
(null,'cel', '87666898',1),
(null,'com', '54768899',2),
(null,'res', '78989765',1),
(null,'cel', '99766676',3),
(null,'cel', '78458743',3),
(null,'com', '66687899',1),
(null,'res', '89986668',5),
(null,'cel', '88687909',2);

select nome, sexo, bairro, cidade from cliente
join endereco
on cliente.idcliente = endereco.id_cliente
where sexo = 'F'
order by nome;

select nome, sexo, bairro, cidade, tipo, numero from cliente
join endereco
on cliente.idcliente = endereco.id_cliente
join telefone
on cliente.idcliente = telefone.id_cliente
order by nome;
create database comercio;
use comercio;

create table cliente(
idcliente int auto_increment primary key,
nome varchar(30) not null,
sexo enum ('M', 'F') not null,
email varchar(50) unique,
cpf varchar(15) not null unique
);

insert into cliente values
(null, 'João', 'M', 'joão@bol.com', '76984352456'),
(null, 'Carla', 'F', 'carla@bol.com', '76984356699'),
(null, 'Ana', 'F', 'ana@bol.com', '76984357755'),
(null, 'Clara', 'F', 'clara@bol.com', '76984353344'),
(null, 'Jorge', 'M', 'jorge@bol.com', '76984352211'),
(null, 'Celia', 'F', 'celia@bol.com', '76984359988');

create table endereco(
idendereco int primary key auto_increment,
rua varchar(30) not null,
bairro varchar(30) not null,
cidade varchar(30) not null,
estado varchar(2) not null,
id_cliente int,
foreign key(id_cliente) references cliente(idcliente)
);

insert into endereco values
(null,'Rua Antonio Sa', 'Centro', 'B. Horizonte', 'MG',4),
(null,'Rua Capitao Hermes', 'Centro', 'Rio de Janeiro', 'RJ',1),
(null,'Rua Pres Vargas', 'Jardins', 'Sao Paulo', 'SP',3),
(null,'Rua Alfandega', 'Estacio', 'Rio de Janeiro', 'RJ',2),
(null,'Rua do Ouvidor', 'Flamengo', 'Rio de Janeiro','RJ', 6),
(null,'Rua Uruguaiana', 'Centro', 'Vitoria', 'ES',5);

create table telefone(
idtelefone int primary key auto_increment,
tipo enum ('Res', 'Com', 'Cel') not null,
numero varchar(10) not null,
id_cliente int,
foreign key(id_cliente) references cliente(idcliente)
);

insert into telefone values
(null,'cel', '78458743',5),
(null,'res', '56576876',5),
(null,'cel', '87666898',1),
(null,'com', '54768899',2),
(null,'res', '78989765',1),
(null,'cel', '99766676',3),
(null,'cel', '78458743',3),
(null,'com', '66687899',1),
(null,'res', '89986668',5),
(null,'cel', '88687909',2);

select nome, sexo, bairro, cidade from cliente
join endereco
on cliente.idcliente = endereco.id_cliente
where sexo = 'F'
order by nome;

select nome, sexo, bairro, cidade, tipo, numero from cliente
join endereco
on cliente.idcliente = endereco.id_cliente
join telefone
on cliente.idcliente = telefone.id_cliente
order by nome;


select nome, sexo, cidade, numero from cliente
join endereco
on cliente.idcliente = endereco.id_cliente
join telefone
on cliente.idcliente = telefone.id_cliente
where sexo = 'M'
order by nome;

select idcliente, email, bairro, cidade, numero from cliente
join endereco
on cliente.idcliente = endereco.id_cliente
join telefone
on cliente.idcliente = telefone.id_cliente
where cidade = 'Rio de Janeiro' and bairro = 'centro'
order by numero;

create view v_relatorio as
select c.nome, c.sexo, c.email, t.tipo, t.numero, e.bairro, e.cidade, e.estado from cliente c
inner join telefone t
on c.idcliente = t.id_cliente
inner join  endereco e
on c.idcliente = e.id_cliente;

select * from v_relatorio;

update v_relatorio
set nome = 'Jose'
where nome = 'Jorge';

select nome, numero, estado from v_relatorio;


select * from  v_relatorio
where sexo = ('F')
order by nome;

alter table cliente add column data_ult_compra date;

select * from cliente;

update cliente set data_ult_compra = '2024-08-01' where idcliente = '1';
update cliente set data_ult_compra = '2024-08-02' where idcliente = '2';
update cliente set data_ult_compra = '2024-08-03' where idcliente = '3';
update cliente set data_ult_compra = '2024-08-04' where idcliente = '4';
update cliente set data_ult_compra = '2024-08-05' where idcliente = '5';
update cliente set data_ult_compra = '2024-08-06' where idcliente = '6';

alter table cliente add column valor_da_compra decimal;

update cliente set valor_da_compra = '1000' where idcliente = '1';
update cliente set valor_da_compra = '2000' where idcliente = '2';
update cliente set valor_da_compra = '3000' where idcliente = '3';
update cliente set valor_da_compra = '4000' where idcliente = '4';
update cliente set valor_da_compra = '5000' where idcliente = '5';
update cliente set valor_da_compra = '6000' where idcliente = '6';

alter view v_relatorio as 
select c.data_ult_compra, c.nome, c.sexo, c.email, t.tipo,
t.numero,e.bairro, e.cidade, e.estado, c.valor_da_compra from
cliente c 
join telefone t
on c.idcliente = t.id_cliente
join endereco e 
on c.idcliente=e.id_cliente;

create view v_compraAcima3000 as
select * from cliente
where valor_da_compra > 3000;

select*from v_compraAcima3000;












