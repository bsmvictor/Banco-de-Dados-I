use empresabd;
#1)
insert into departamento (DNome,DNumero,DataInicio) values ('TI',45,current_date());
insert into departamento (DNome,DNumero,DataInicio) values ('Vendas',12,current_date());

#2)
insert into departamento (DNome,DNumero) values ('Marketing',18);

#3)
insert into empregado (Pnome,SSN,UNome,DataNasc,Salario) values ('Victor','4','Boaventura','2001-09-14','3800');
insert into empregado (Pnome,SSN,UNome,DataNasc,Sexo) values ('Bianca', '7','Procopio','2003-03-26',1);

insert into empregado values ('Fernando','D','Cleber','8','1990-05-24','Santa Rita do Sapucai,Minas Gerais',1,2300,3,9);
insert into empregado values ('Vinicius','F','Fernandes','9','1970-03-29','Pouso Alegre,Minas Gerais',1,2300,1,16);

#4)
insert into projeto (PNome,PNumero) values ('Predio',6);
insert into projeto (PNome,PNumero) values ('Praça comercial',7);

#5)
update empregado set SSN_Supervisor = 1 where SSN = 8;
update empregado set SSN_Supervisor = 3 where SSN = 7;
update empregado set SSN_Supervisor = 4 where SSN = 9;

#6)
update departamento set SSN_Empregado = 6 where DNumero = 7;
update departamento set SSN_Empregado = 9 where DNumero = 9;
update departamento set SSN_Empregado = 8 where DNumero = 16;

#7)
update projeto set PLocalizacao = 'Santa Rita do Sapucai,Minas Gerais',DNumero_Departamento = 7 where PNumero = 6;
update projeto set PLocalizacao = 'Volta Redonda,Rio de Janeiro',DNumero_Departamento = 16 where PNumero = 7;

#8)
delete from projeto where DNumero_Departamento = 7;






