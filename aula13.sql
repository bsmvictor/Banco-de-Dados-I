drop database if exists masterchef;
create database masterchef;

use masterchef;
#RELACIONAMENTO N:M ENTRE JURADO E COMPETIDOR
#JULGAR É A TABELA INTERMEDIARIA
create table Competidor(
	id int not null auto_increment,
    nome varchar(100) not null,
    idade int not null,
    profissao varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(2) not null,
    primary key(id)
);

create table Jurado(
	id int not null auto_increment,
    nome varchar(100) not null,
    paisOrigem varchar(100) not null,
    primary key(id)
);

create table Julgar(
	idCompetidor int not null,
    idJurado int not null,
	CONSTRAINT fk1
    foreign key (idCompetidor) 
    references Competidor (id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    CONSTRAINT fk2
    foreign key (idJurado) 
    references Jurado (id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    PRIMARY KEY(idCompetidor, idJurado)
);

create table Prato(
	id int not null auto_increment,
    tipoCulinaria varchar(50) not null,
    idCompetidor int not null,
    nota float not null,
    primary key(id),
    CONSTRAINT fk3
    foreign key (idCompetidor) 
    references Competidor (id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

insert into Competidor(nome, idade, profissao, cidade, estado) values
('Janaina Caetano', '38', 'Taróloga', 'Diadema', 'SP'),
('Rodrigo Massoni', '33', 'Engenheiro Ambiental', 'Osasco', 'SP'),
('Lorena Dayse', '35', 'Enfermeira', 'Teresina', 'PI'),
('Helton Oliveira', '19', 'Estudante', 'Jacutinga', 'MG'),
('Haila Santuá', '25', 'Publicitária', 'Chapadão do Céu', 'GO'),
('Davi','19', 'Estudante', 'Santa Rita do Sapucai', 'MG');

insert into Jurado(nome, paisOrigem) values
('Paola Carosella', 'Argentina'),
('Érick Jacquin', 'França'),
('Henrique Fogaça', 'Brasil');

insert into Julgar(idJurado, idCompetidor) values
('1', '1'),
('1', '2'),
('1', '3'),
('1', '4'),
('2', '3'),
('2', '5'),
('3', '1'),
('3', '2'),
('3', '4');

insert into Prato(tipoCulinaria, nota, idCompetidor) values
('Japonesa', '9.5', '1'),
('Italiana', '8.7', '1'),
('Francesa', '9.2', '2'),
('Brasileira', '4.6', '3'),
('Francesa', '2.7', '4'),
('Francesa', '8.0', '4'),
('Chinesa', '7.5', '4'),
('Japonesa', '3.0', '5');

drop database if exists masterchef;
create database masterchef;

use masterchef;
#RELACIONAMENTO N:M ENTRE JURADO E COMPETIDOR
#JULGAR É A TABELA INTERMEDIARIA
create table Competidor(
	id int not null auto_increment,
    nome varchar(100) not null,
    idade int not null,
    profissao varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(2) not null,
    primary key(id)
);

create table Jurado(
	id int not null auto_increment,
    nome varchar(100) not null,
    paisOrigem varchar(100) not null,
    primary key(id)
);

create table Julgar(
	idCompetidor int not null,
    idJurado int not null,
	CONSTRAINT fk1
    foreign key (idCompetidor) 
    references Competidor (id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    CONSTRAINT fk2
    foreign key (idJurado) 
    references Jurado (id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    PRIMARY KEY(idCompetidor, idJurado)
);

create table Prato(
	id int not null auto_increment,
    tipoCulinaria varchar(50) not null,
    idCompetidor int not null,
    nota float not null,
    primary key(id),
    CONSTRAINT fk3
    foreign key (idCompetidor) 
    references Competidor (id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

insert into Competidor(nome, idade, profissao, cidade, estado) values
('Janaina Caetano', '38', 'Taróloga', 'Diadema', 'SP'),
('Rodrigo Massoni', '33', 'Engenheiro Ambiental', 'Osasco', 'SP'),
('Lorena Dayse', '35', 'Enfermeira', 'Teresina', 'PI'),
('Helton Oliveira', '19', 'Estudante', 'Jacutinga', 'MG'),
('Haila Santuá', '25', 'Publicitária', 'Chapadão do Céu', 'GO'),
('Davi','19', 'Estudante', 'Santa Rita do Sapucai', 'MG');

insert into Jurado(nome, paisOrigem) values
('Paola Carosella', 'Argentina'),
('Érick Jacquin', 'França'),
('Henrique Fogaça', 'Brasil');

insert into Julgar(idJurado, idCompetidor) values
('1', '1'),
('1', '2'),
('1', '3'),
('1', '4'),
('2', '3'),
('2', '5'),
('3', '1'),
('3', '2'),
('3', '4');

insert into Prato(tipoCulinaria, nota, idCompetidor) values
('Japonesa', '9.5', '1'),
('Italiana', '8.7', '1'),
('Francesa', '9.2', '2'),
('Brasileira', '4.6', '3'),
('Francesa', '2.7', '4'),
('Francesa', '8.0', '4'),
('Chinesa', '7.5', '4'),
('Japonesa', '3.0', '5');

#buscando apenas nomes e idades dos competidores maiores de 25 anos
select c.nome, idade from Competidor as c where idade > 25;

#buscando nota,idade e nome dos competidores, ou seja utilizo mais de uma tabela
select nota,nome,idade from Competidor as c, prato where idCompetidor = c.id and idade > 25;

#mesma coisa porem com inner join
select nota, nome, idade from prato inner join Competidor as c on idCompetidor = c.id and idade > 25; 

#relacionamento n:m
select c.nome, j.nome from julgar, competidor as c, jurado as j where julgar.idCompetidor = c.id and julgar.idJurado = j.id;

#mesma coisa porem com inner join
select c.nome, j.nome from julgar inner join Competidor as c on julgar.idCompetidor = c.id inner  join Jurado as j on julgar.idJurado = j.id;

#EXERCICIOS
#1
select nota, nome, idade, cidae from prato, competidor as c where idCompetidor = c.id and estado = 'SP';
select nota, nome, idade, cidade from prato inner join Competidor as c on idCompetidor = c.id and estado = 'SP';

#2
select nome, idade,profisao from julgar, Competidor as c, jurado as j where julgar.idCompetidor = c.id and julgar.idJurado = j.id and j.nome = 'Paola Carolla';
select j.nome,c.nome,idade,profissao from julgar inner join competidor as c on julgar.idCompetidor = c.id inner join jurado as j on julgar.idJurado = j.id and j.nome = "Paola Carosella";

#3
select avg(nota) from prato, competidor as c where idCompetidor = c.id and profissao like 'E%';
select avg(nota) from prato inner join competidor as c on idCompetidor = c.id and profissao like 'E%';

#4
select max(nota) from prato, competidor as c where idCompetidor = c.id and c.idade < 28;
select max(nota) from prato inner join competidor as c on idCompetidor = c.id and idade <28;










