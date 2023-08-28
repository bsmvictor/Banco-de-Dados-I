create database C207;
use C207;

create table alunos(
matricula int,
curso varchar(20),
nome varchar(60),
periodo int,
primary key (matricula, curso)
); 

create user if not exists 'Monitor' identified by '1234';

create user if not exists 'Professor' identified by '4321';

grant Create, Update, Delete on C207.alunos to 'Monitor';

grant all on C207.alunos to 'Professor';

revoke insert on C207.alunos from 'Monitor';

revoke Create, Drop on C207.alunos from 'Professor';

#----------------------------------------------------------------------------------------------------#

drop database if exists banco;

create database if not exists banco;

use banco;

create table if not exists cliente(
id INT NOT NULL,
nome varchar(45),
endereco varchar(90),
primary key(id)
);

insert into cliente (id,nome, endereco)
values
(1,'Bianca','Rua Albuquerque 543 Sao jose dos campos'),
(2,'Victor','Rua Sebastiao 592 Santa rita do sapucai');

ALTER TABLE cliente ADD ano_de_nascimento VARCHAR(20);

update cliente
set ano_de_nascimento = '2003' 
where id = '1';

update cliente
set ano_de_nascimento = '2001'
where id = '2';

DELETE FROM clente WHERE id = '1';

drop table cliente;

