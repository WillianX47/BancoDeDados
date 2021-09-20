/*Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as
informações dos estudantes deste registro dessa escola.*/

CREATE DATABASE Escola;
USE Escola;

/*Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos estudantes para se trabalhar com o serviço dessa escola.*/

CREATE TABLE Estudantes (
	id int(4) AUTO_INCREMENT,
	Nome VARCHAR(30) NOT NULL,
	Materia VARCHAR(30) NOT NULL,
	Nota DECIMAL(10,2),
	PRIMARY KEY (id)
);

/*Popule esta tabela com até 8 dados;*/

INSERT INTO estudantes(Nome, Materia, Nota) VALUES("Willian", "Ciência da computação", 9);
INSERT INTO estudantes(Nome, Materia, Nota) VALUES("Letisia", "Design", 8.5);
INSERT INTO estudantes(Nome, Materia, Nota) VALUES("Vitor", "Mecânica", 7.8);
INSERT INTO estudantes(Nome, Materia, Nota) VALUES("Bruno", "Música", 6.8);
INSERT INTO estudantes(Nome, Materia, Nota) VALUES("Rafaela", "Análise de algoritmo", 7.5);
INSERT INTO estudantes(Nome, Materia, Nota) VALUES("Henrique", "Sistemas", 6.5);
INSERT INTO estudantes(Nome, Materia, Nota) VALUES("Geraldo", "Social", 5.8);
INSERT INTO estudantes(Nome, Materia, Nota) VALUES("Vagner", "Psicologia", 8.5);

/*Faça um select que retorne o/as estudantes com a nota maior do que 7.*/

SELECT Nome, Materia, Nota FROM estudantes WHERE Nota > 7;

/*Faça um select que retorne o/as estudantes com a nota menor do que 7.*/

SELECT Nome, Materia, Nota FROM estudantes WHERE nota < 7;

/*Ao término atualize um dado desta tabela através de uma query de atualização.*/

UPDATE estudantes SET Nota = 7 WHERE id = 7;