create database if not exists  AV3;

use AV3;

#---------------------------------------- QUESTÃO 1 ----------------------------------------#

#A)
create table if not exists clientes(
	id int not null,
    nome varchar(50) not null,
    Email varchar(100) not null,
    telefone varchar(20),
    primary key(id)
    );
    
#B)
alter table clientes add column endereco varchar(200);

#C)
create table if not exists pedidos(
id int not null,
data date,
valor_total int,
foreign key (cliente_id) references clientes(id)
);

#---------------------------------------- QUESTÃO 2 ----------------------------------------#

#A)
insert into clientes (id,nome,Email,telefone,endereco)
values
('1','João Silva','joao.silva@gmail.com','(11) 9999-8888','Rua A, 123'),
('2','Maria Souza','maria.souza@gmail.com','(21) 8888-7777','Rua B, 456');

#B)
insert into pedidos (id,cliente_id,data,valor_total)
values
('1','1','2023-04-30','49.90'),
('2','2','2023-04-30','89.90 ');

#C)
update clientes set telefone = "(11)9999-9999" where id = '1';

#D)
delete from pedidos where id = '2';   

#---------------------------------------- QUESTÃO 3 ----------------------------------------#

#A) 
create user "atendente" identified by "1234";

#B)
grant select, insert, update, delete on AV3.clientes to "atendente";

#C)
revoke insert, update, delete on AV3.clientes from "atendente";
