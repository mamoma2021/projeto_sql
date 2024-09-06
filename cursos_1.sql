use ti;

create table if not exists cursos (
nome varchar(30) not null unique,
descricao text,
carga int unsigned,
qtdaulas int unsigned,
ano year default '2024');

alter table cursos
add column id int not null auto_increment primary key first;

insert into cursos values
(default,'Pacote officce', 'Nivel básico','96','40','2000'),
(default,'Excel básico', 'Nivel intermediario','40','32','2012'),
(default,'Excel avançado', 'Nivel avançadp','60','28','2014'),
(default,'Operador de microcomputador', 'Nivel intermediario','160','82','2028'),
(default,'SQL', 'Nivel avançado','120','96','2004'),
(default,'Phyton', 'Nivel avançado','1200','40','2020'),
(default,'Youtuber', 'Nivel intermediario','100','28','2019'),
(default,'Designer', 'Nivel intermediario','80','44','2025');

select * from cursos;

update cursos
set nome = 'Pacote Office'
where id ='1';

select * from cursos order by nome desc;

describe cursos;

select nome, carga, ano from cursos order by nome;
select ano, nome carga from cursos order by ano;

select * from cursos where ano = '2016' order by nome;
select nome, descricao, ano from  cursos where ano  !=2016 order by ano, nome;


