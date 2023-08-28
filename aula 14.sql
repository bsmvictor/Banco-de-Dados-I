drop database if exists aula_14;
create database aula_14;
use aula_14;
/*
DELIMITER $$
drop procedure if exists soma $$
create procedure soma(in num1 int , in num2 int)
begin
    select (num1 + num2) as soma;
end $$

DELIMITER $$
call soma(8,8);


DELIMITER $$
drop procedure if exists testeIf $$
create procedure testeIf(in num1 int, in num2 int)

begin
    declare soma int;
    declare resposta varchar(15);
    
    set soma = num1 + num2;
    
    if soma > 0
        then set resposta = 'POSITIVO';
    elseif soma = 0
        then set resposta = 'NULO';
    else
        set resposta = 'NEGATIVO';
    end if;
    
    select concat("O resultado é: ", resposta) as resultado;
    
end $$
DELIMITER ;

call testeIf(-2,0);


DELIMITER $$
drop procedure if exists teste_while $$
create procedure teste_while(in num int)
begin
    declare res long;
    set res = 1;
    
    while num > 0 do
        set res = res * num;
        set num = num - 1;
    end while;
    
    select res as fatorial;
    
end $$
DELIMITER $$

call teste_while(10);


# FUNCTIONS

DELIMITER $$
drop function if exists mult $$
create function mult(a decimal(10,2), b decimal(10,2)) returns int
deterministic
begin
    return a*b;
end $$
DELIMITER $$

select mult(2.5,5);
*/

# EX 2

DROP DATABASE IF EXISTS Escola;
CREATE DATABASE Escola;
USE Escola;

CREATE TABLE IF NOT EXISTS Aluno (
  id INT auto_increment NOT NULL ,
  nome VARCHAR(45) NOT NULL,
  nota1 INT NULL,
  nota2 INT NULL,
  faltas INT NULL,
  PRIMARY KEY (id)
);

INSERT INTO Aluno(nome,nota1,nota2,faltas) VALUES ('Ana','70','70','2');
INSERT INTO Aluno(nome,nota1,nota2,faltas) VALUES ('Pedro','50','40','15');
INSERT INTO Aluno(nome,nota1,nota2,faltas) VALUES ('Carlos','60','75','10');
INSERT INTO Aluno(nome,nota1,nota2,faltas) VALUES ('Joana','25','20','0');
INSERT INTO Aluno(nome,nota1,nota2,faltas) VALUES ('Maria','100','98','2');
INSERT INTO Aluno(nome,nota1,nota2,faltas) VALUES ('Luis','30','30','4');
INSERT INTO Aluno(nome,nota1,nota2,faltas) VALUES ('Patricia','50','20','0');
INSERT INTO Aluno(nome,nota1,nota2,faltas) VALUES ('João','58','59','2');
INSERT INTO Aluno(nome,nota1,nota2,faltas) VALUES ('Márcio','100','20','2');
INSERT INTO Aluno(nome,nota1,nota2,faltas) VALUES ('Reinaldo','40','40','10');

# select * from Aluno;

DELIMITER $$
drop function if exists SituacaoAluno $$
create function SituacaoAluno(pNota1 int, pNota2 int, pFaltas int) returns varchar(30)
deterministic
begin
    declare situacao varchar(30);
    declare media int;
    
    set media = (pNota1 + pNota2) / 2;
    
    if media >= 60 and pFaltas <= 10
        then set situacao = 'APROVADO';
    elseif (media <= 60 and media >= 30) or pFaltas > 10
        then set situacao = 'NP3';
    else
        set situacao = 'REPROVADO';
    end if;
    
return(situacao);
end $$
DELIMITER $$

select nome as nomeAluno, SituacaoAluno(nota1, nota2, faltas) as resultado from aluno order by nome;