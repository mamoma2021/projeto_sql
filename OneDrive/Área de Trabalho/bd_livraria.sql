create database livraria;
use livraria;
desc table livros;
select * from livros;

create table livros (
nome_livro varchar(60),
nome_autor varchar(60),
sexo_autor enum ('M','F'),
numero_pg int,
nome_editora varchar(60),
valor int,
Uf_editora varchar(2),
ano_publi year);

alter table livros
	add column id int not null auto_increment primary key first;
    
insert into livros values
	('Cavaleiro Real','Ana Claudia','F','465','Atlas','49.9','RJ','2009'),
	('SQL para leigos','João Nunes','M','450','Addison','98.0','SP','2018'),
	('Receitas Caseiras','Celia Tavares','F','210','Atlas','45.0','RJ','2008'),
	('Pessoas Efetivas','Eduardo Santos','M','390','Beta','78.99','RJ','2018'),
	('Habitos Saudáveis','Eduardo Santos','M','630','Beta','150.98','RJ','2019'),
	('A Casa Marrom','Hermes Macedo','M','250','Bubba','60.0','MG','2016'),
	('Estácio Querido','Geraldo Francisco','M','310','Insignia','100.0','ES','2015'),
	('Pra sempre amigas','Leda Silva','F','510','Insignia','78.98','ES','2011'),
	('Copas Inesqueciveis','Marco Alcantara','M','200','Larson','130.98','RS','2018'),
	('O poder da mente','Clara Mafra','F','120','Continental','56.58','SP','2017');

Select * from livros; -- 1

Select nome_livro, nome_editora from livros; -- 2

Select nome_livro, uf_editora from livros where sexo_autor = 'M'; -- 3

select nome_livro, numero_pg from livros where sexo_autor = 'F'; -- 4

select valor from livros where uf_editora = 'SP'; -- 5

select nome_autor, sexo_autor, nome_editora,Uf_editora from livros where sexo_autor = 'M' and uf_editora = 'SP' or sexo_autor = 'M' and uf_editora = 'RJ'; -- 6
