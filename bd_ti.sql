create database ti;
use ti;

create table clientes (
		CPF bigint not null primary key,
    nome varchar (30),
    nascimento date,
    endereço varchar (30),
    cep int,
    bairro varchar (30),
    cidade varchar (30),
    UF varchar (2)
);


insert into clientes values
('02296332780','Marcos da Silva','1970-11-25','Rua Pedro Marques','88045968','Santana','Sao Paulo','SP'),
('08285031490','Ana Julia','1985-10-21','Rua Paradigma Novais','99078923','Leblon','Rio de Janeiro','RJ'),
('05550314905','Jorge Soares','1989-03-05','Rua das Banguelas','77048917', 'Copacabana','Rio de Janeiro','RJ'),
('01150314905','Juvenal Soares','1989-04-15','Rua das Tabuinhas','69048917','Minerva','Minas Gerais','MG');
    
alter table clientes
add column DUC date;
update clientes set DUC = '2024-06-16' where cpf = '02296332780';
update clientes set DUC = '2024-06-17' where cpf = '08285031490';
update clientes set DUC = '2024-06-18' where cpf = '05550314905';
update clientes set DUC = '2024-06-19' where cpf = '01150314905';
-- DUC = Data última compra

select * from clientes where cidade = 'Rio de Janeiro';

alter table clientes
add column produtos varchar (40);
update clientes set produtos = 'TV' where cpf = '02296332780';
update clientes set produtos = 'Geladeira' where cpf = '08285031490';
update clientes set produtos = 'Notebook' where cpf = '05550314905';
update clientes set produtos = 'Celular' where cpf = '01150314905';

DELETE FROM ti.clientes WHERE (cidade = 'Sao paulo');
