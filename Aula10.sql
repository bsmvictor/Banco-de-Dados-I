# Comando CREATE

create database if not exists aula_10;

use aula_10;

create table if not exists aluno(
	matricula int not null auto_increment primary key,
    curso varchar(45),
    nome varchar(45),
    periodo int
);

create table if not exists filme(
	id int not null auto_increment,
    titulo varchar(45) not null,
    genero varchar(45) not null,
    tempo int not null,
    primary key(id)
);

# Comando ALTER
alter table filme add diretor varchar(45);
alter table filme change titulo nomeFilme varchar(50) not null;
alter table filme drop column diretor;

create user 'monitor1' identified by 'password';
create user 'professor' identified by '12345';

# Comandos DCL
grant insert, update, drop on aula_10.aluno to 'professor';
grant alter, drop, insert, update on aula_10.aluno to 'monitor1';
revoke alter, drop on aula_10.aluno from 'monitor1';

show grants for 'monitor1';
show grants for 'professor';

select * from filme;
select * from aluno;