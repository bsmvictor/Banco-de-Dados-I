#CRIANDO UM NOVO DB
create database novobd;							

#COLOCANDO UM ESQUEMA COMO PADRAO
use novobd;

#CRIAND UMA TABELA EMPREGADO
CREATE TABLE Empregado
(
  PNome VARCHAR(15) NOT NULL,
  MInicial CHAR,
  UNome VARCHAR(15) NOT NULL,
  SSN BIGINT NOT NULL,
  DataNasc DATE,
  Endereco VARCHAR(80),
  Sexo BIT,
  Salario DECIMAL(10,2),
  SSN_Supervisor BIGINT,
  DNumero_Departamento INT NOT NULL,
  
  PRIMARY KEY (SSN),
  CONSTRAINT fk1                                # CONSTRAINT => RESTRIÇÃO (CHAVE EXTRANGEIRA)
	FOREIGN KEY (SSN_Supervisor) 
    REFERENCES empregado (SSN)                  # AUTO RELACIONAMENTO
    ON DELETE SET NULL ON UPDATE CASCADE,       # AO DELETAR CASCATEIE, TDS Q APONTAREM PARA O DELETADO TTERAM SUA CHAVE ESTRANGEIRA NULL
  
  CONSTRAINT fk2
	FOREIGN KEY (DNumero_Departamento) 
    REFERENCES departamento (DNumero) 
    ON DELETE CASCADE ON UPDATE CASCADE         # AO DELETAR|ATUALIZAR CASCATEIE, TDS Q APONTAREM PARA O DELETADO|ATUALIZADO TBM SERA DELETADO|ATUALIZADO
);