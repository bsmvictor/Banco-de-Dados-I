drop database if exists prova4;
create database prova4;
use prova4;

create table Cliente(
   id int,
   nome varchar(50),
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

#Questão 1
DELIMITER $$
CREATE PROCEDURE calcula_gasto(IN preco_ingresso FLOAT,IN preco_pipoca FLOAT,IN preco_refri FLOAT,IN id INT)
BEGIN
    DECLARE preco_total FLOAT;
    SET preco_total = preco_ingresso + preco_pipoca + preco_refri;

    INSERT INTO Cinema (preco_ingresso, preco_pipoca, preco_refri, preco_total, idCliente)
    VALUES (preco_ingresso, preco_pipoca, preco_refri, preco_total, idCliente);
END $$
DELIMITER $$

#Questão 2
DELIMITER $$
CREATE FUNCTION preco_com_desconto(preco_ingresso FLOAT,preco_pipoca FLOAT,preco_refri FLOAT) returns float
deterministic
BEGIN
    DECLARE preco_total FLOAT;
    SET preco_total = preco_ingresso + preco_pipoca + preco_refri;
    SET preco_total = preco_total * 0.8;

    RETURN preco_total;
END $$
DELIMITER $$


#Questão 3
SELECT c.nome, c.idade, c.saldo FROM Cliente c 
INNER JOIN Cinema cm
ON c.id = cm.id;

#Questão 4
SELECT c.nome, sum(cm.preco_ingresso) AS total_gasto_ingressos, sum(cm.preco_pipoca) AS total_gasto_pipocas, sum(cm.preco_refri) AS total_gasto_refrigerantes
FROM Cliente c
JOIN Cinema cm ON c.id = cm.id
GROUP BY c.nome;
