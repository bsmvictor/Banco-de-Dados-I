create database if not exists EXCAP4;
use EXCAP4;

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
  DNumero_Departamento INT,
  
  PRIMARY KEY (SSN),
  CONSTRAINT fk1
	FOREIGN KEY (SSN_Supervisor) REFERENCES Empregado (SSN) 
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  
  CONSTRAINT fk2
	FOREIGN KEY (DNumero_Departamento) REFERENCES Departamento (DNumero)
    ON DELETE SET NULL
    ON UPDATE CASCADE);
    
CREATE TABLE Departamento
(
    DNome VARCHAR(15) NOT NULL,
    DNumero INT NOT NULL,
    DataInicio DATE,
    SSN_Empregado BIGINT,
    
    PRIMARY KEY(DNumero),
    CONSTRAINT fk1
	FOREIGN KEY (SSN_Empregado) REFERENCES Empregado (SSN) 
    ON DELETE SET NULL ON UPDATE CASCADE
);
    
CREATE TABLE Projeto
(
  PNumero INT NOT NULL,
  PNome VARCHAR(15) NULL,
  PLocalizacao VARCHAR(45) NULL,
  Departamento_DNumero INT NOT NULL,
  
  PRIMARY KEY (PNumero),
  CONSTRAINT fk1
    FOREIGN KEY (Departamento_DNumero) REFERENCES Departamento (DNumero)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE  Dependente
(
  Nome_Dependente VARCHAR(45) NOT NULL,
  Sexo VARCHAR(45) NULL,
  DataNasc DATE NULL,
  Parentesco VARCHAR(15) NULL,
  Empregado_SSN BIGINT NOT NULL,
  PRIMARY KEY (Nome_Dependente, Empregado_SSN),
  CONSTRAINT fk1
  FOREIGN KEY (Empregado_SSN) REFERENCES Empregado (SSN)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS Depto_Localizcoes
(
  LNumero INT NOT NULL,
  DLocalizacao VARCHAR(45) NULL,
  Departamento_DNumero INT NOT NULL,
  PRIMARY KEY (LNumero),
  CONSTRAINT fk1
    FOREIGN KEY (Departamento_DNumero) REFERENCES Departamento (DNumero)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE Trabalha_Em
(
  Empregado_SSN BIGINT NOT NULL,
  Projeto_PNumero INT NOT NULL,
  Horas VARCHAR(15) NULL,
  PRIMARY KEY (Empregado_SSN, Projeto_PNumero),
  CONSTRAINT fk1
    FOREIGN KEY (Empregado_SSN) REFERENCES Empregado (SSN)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk2
    FOREIGN KEY (Projeto_PNumero)
    REFERENCES Projeto (PNumero)
    ON DELETE SET NULL
    ON UPDATE CASCADE);