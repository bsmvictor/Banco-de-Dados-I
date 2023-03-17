
#1)
INSERT INTO usuarios (Nome, Matriula, Curso, Idade, Cidade) VALUES ('João', '1246', 'GEC', '21', 'Santa Rita');	#id = 1
INSERT INTO usuarios (Nome, Matriula, Curso, Idade, Cidade) VALUES ('José', '170', 'GES', '20', 'Pouso Alegre');	#id = 2
INSERT INTO usuarios (Nome, Matriula, Curso, Idade, Cidade) VALUES ('Mariana', '210', 'GES', 'Itajubá');	#id = 3
INSERT INTO usuarios (Nome, Matriula, Curso, Idade, Cidade) VALUES ('Thiago', '214', 'GES', 'Santa Rita');	#id = 4

#2)
UPDATE usuarios SET Curso = 'GEB' WHERE id = '3';
UPDATE usuarios SET Matricula = '342' WHERE id = '3';

#3)
SELECT DISTINCT Cidade FROM usuarios;

#4)
SELECT max(idade), nome FROM usuarios;
SELECT min(idade), nome FROM usuarios;

#5)
DELETE FROM usuarios WHERE id = '1';

#6)
SELECT Nome, Matricula, Curso FROM usuarios WHERE Cidade = 'Santa Rita';

#7)
SELECT * FROM usuarios WHERE Nome LIKE 'J%'; 

#8) (B)
