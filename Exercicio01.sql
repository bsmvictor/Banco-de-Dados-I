CREATE DATABASE usuario;

CREATE TABLE usuarios(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(45),
    email VARCHAR(45),
    senha VARCHAR(45),
    PRIMARY KEY (id)
); 

#A)
INSERT INTO usuarios (nome,email,senha) 
VALUES
('Alexandre', 'alexandre@email.com','1234'),
('Natanael', 'natanael12@email.com','ABCDE'),
('Júlia', 'julia_09@email.com','98765'),
('Fernanda', 'fernanda@email.com','EFGHI');

#B)
UPDATE usuarios SET senha = '54321' WHERE id = '1';

#C)
DELETE FROM usuarios WHERE id = '4';

#D)
SELECT * FROM usuarios;

#E)
SELECT * FROM usuarios WHERE nome LIKE '%N%'; 



