#PRODUTO CARTESIANO
select *
from empregado, departamento;

#JOIN
select *
from empresabd
where supervisor;

#JOIN (AUTO RELACIONAMENTO)
select distinct s.PNome as 'Nome Supervisor'
from empregado as e, empregado as s
where e.SSN_Supervisor = s.SSN;

#BUSCA TEXTUAL
select PNome
from empregado
where PNome like 'J%n';

#SIMULAÇÕES MATEMATICAS
select PNome as 'Nome Funcionario',
 salario as 'Salario Original',
    salario * 1.1 as 'Salario c/aumento'
        from empregado;
        
#FUNÇÕES PRE-PRONTAS DO SQL
select avg(salario) as 'Media dos Salarios',
 max(salario) as 'Maior Salario',
    min(salario ) as 'Menor Salario',
        sum(salario) as 'Somas de todos Salarios',
            count(salario) as 'Quantos serão pagos'
from empregado;