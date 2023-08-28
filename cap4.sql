#--------------------------------------------------------------------------------------------------------------
select distinct parentesco 
from dependente;
#--------------------------------------------------------------------------------------------------------------
select UNome, DataNasc 
from empregado 
where Sexo = '1' 
order by DataNasc asc;
#--------------------------------------------------------------------------------------------------------------
select d.Nome_dependente, e.PNome 
from dependente as d, empregado as e
where d.SSN_Empregado = e.SSN;
#--------------------------------------------------------------------------------------------------------------
select AVG(Salario) 
from empregado 
where Endereco like "%São Paulo" and DNumero_Departamento = '1';
#--------------------------------------------------------------------------------------------------------------
select * from empregado;
select S.PNome as "Nome supervisor" ,E.PNome as "Nome empregado",S.Salario - E.Salario as "Diferença salarial"
from Empregado as S, Empregado as E
where S.SSN = E.SSN_Supervisor;
#--------------------------------------------------------------------------------------------------------------
select E.PNome as "Nome do empregado", P.Pnome as "Nome do projeto", T.Horas as "Horas trabalhadas"
from empregado E 
join trabalha_em T on E.SSN = T.SSN_Empregado
join projeto P on P.PNumero = T.PNumero_Projeto;
#--------------------------------------------------------------------------------------------------------------