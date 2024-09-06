create database cadastro;
use cadastro;

create table clientes (
	nome varchar(40) not null,
	nascimento date,
  sexo enum ('M','F'),
	peso decimal (5,2), 
	altura decimal (3,2),
  nacionalidade varchar(25) default 'Brasil'
);

alter table clientes
add column id int not null auto_increment primary key first;
	
insert into clientes
(nome,nascimento,sexo,peso,altura,nacionalidade)
values
('Marcelo','1968-11-15','M','88.60','1.85','Brasil'),
('Fernanda','1978-10-28','F','72.5','1.58',default),
('Julio','2010-08-26','M','55.6','1.63',default),
('Davi','2014-06-30','M','72.5','1.48',default),
('Simone','1910-02-21','F','72.5','1.58',default),
('Thiago','2007-07-30','M','52.00','1.72',default);

Select * from clientes;

desc clientes;
show tables;
select * from clientes;
select * from cursos;
select ano, nome, carga from cursos order by nome;
select ano, nome, carga from cursos order by ano;
select ano, nome, carga from cursos order by ano, nome;
select * from cursos order by nome;
select * from cursos order by nome desc;
select * from cursos where ano = '2016' order by nome;
select nome, descricao from cursos where ano <=2015 order by nome;
select nome, ano from cursos where ano !=2016 order by ano, nome;

alter table clientes
add column profissao varchar(20) after nome;
	
update clientes set profissao = 'TI' where id = '1';
update clientes	set profissao = 'Gerente' where id = '3';
update clientes	set profissao = 'ADM' where id = '4';
update clientes	set profissao = 'Assist. Contabilidade' where id = '5';
update clientes	set profissao = 'Aux. ADM' where id = '6';
update clientes	set profissao = 'Designer & DEV' where id = '7';

Create table if not exists Cursos (
nome varchar(30) not null unique,
descricao text,
carga int unsigned,
qtdaula int unsigned,
ano year default '2024');

alter table cursos
add column id int not null auto_increment primary key first;

insert into cursos values
(default,'Pacote officce','Nivel básico','96','40','2000'),
(default,'Excel básico','Nivel intermediário','40','32','2012'),
(default,'Excel avançado','Nivel avançado','60','28','2014'),
(default,'Operador de Microcomputador','Nivel intermediário','160','82','2028'),
(default,'SQL','Nivel avançado','120','96','2004'),
(default,'Python','Nivel avançado','1200','40','2020'),
(default,'Youtuber','Nivel intermediário','100','28','2019'),
(default,'Designer','Nivel intermediário','80','44','2025');

select * from cursos where nome like 'PH%P_';
select distinct nacionalidade from clientes;
select * from cursos;
select count(*) from cursos where carga > 40;
select max(carga) from cursos;
select min(carga) from cursos;
select max(ano) from cursos where ano = 2016;
select sum(carga) from cursos;

select a.nome, a.cursopreferido, c.nome, c.ano	
	from alunos as a join cursos as c
    on c.idcurso = a.cursopreferido
    order by a.nome;
    
create table aluno_assiste_curso (
	id int not null auto_increment,
	data date,
    idalunos int,
    idcurso int,
    primary key (id),
    foreign key (idalunos) references alunos (id),
    foreign key (idcurso) references cursos (idcurso)
    );
    
select * from aluno_assiste_curso;
select * from alunos;
select * from cursos;

insert into aluno_assiste_curso values
(default,'2014-03-01','1','2'),
(default,'2015-12-22','3','6'),
(default,'2014-01-01','22','12'),
(default,'2016-05-12','1','19');


alter table alunos
add column cursopreferido int;

select alunos.nome, aluno_assiste_curso.idcurso from alunos
	join aluno_assiste_curso on alunos.id = aluno_assiste_curso.idalunos;
    
select alunos.nome, cursos.nome from alunos
	join aluno_assiste_curso on alunos.id = aluno_assiste_curso.idalunos
    join cursos on cursos.idcurso = aluno_assiste_curso.idalunos order by alunos.nome;
    
select alunos.nome, cursos.nome from alunos
	left join aluno_assiste_curso on alunos.id = aluno_assiste_curso.idcurso
    left join cursos on cursos.idcurso = aluno_assiste_curso.idcurso;
    
select alunos.nome, cursos.nome from alunos
	right join aluno_assiste_curso on alunos.id = aluno_assiste_curso.idcurso
    right join cursos on cursos.idcurso = aluno_assiste_curso.idcurso;
    
select alunos.nome, cursos.nome from alunos
	left join aluno_assiste_curso on alunos.id = aluno_assiste_curso.idcurso
    left join cursos on cursos.idcurso = aluno_assiste_curso.idcurso
    union
select alunos.nome, cursos.nome from alunos
	right join aluno_assiste_curso on alunos.id = aluno_assiste_curso.idcurso
    right join cursos on cursos.idcurso = aluno_assiste_curso.idcurso;
