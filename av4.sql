drop database if exists prova4;
create database prova4;
use prova4;

create table Cliente(
   id int,
   idade int,
   saldo float,
   primary key(id)
   );

create table Cinema(
 id int auto_increment,
  preco_ingresso float,
  preco_pipoca float,
  preco_refri float,
  preco_total float,
  idCliente int,
  primary key (id),
  constraint fk1
  foreign key(idCliente)
  references Cliente(id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
