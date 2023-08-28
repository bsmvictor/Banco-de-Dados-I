#INSERT COMPLETO
insert into departamento
values ('Marketing',7,'2023-05-10',2);

#INSERT PARCIAL
insert  into departamento (Dnome, Dnumero)
values ('T.I',8);

#UPDATE SIMPLES
update departamento
set SSN_Empregado = 1
where  Dnumero = 8;

#UPDATE AVANÇADO
update departamento
set datainicio = '2023-05-10';

#DELETE
delete from departamento
where dnumero >= 7;
