/*Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema
trabalhará com as informações dos funcionaries desta empresa.*/

CREATE DATABASE RH_empresa;

USE RH_empresa;

/*Crie uma tabela de funcionaries e utilizando a habilidade de abstração e determine 5
atributos relevantes dos funcionaries para se trabalhar com o serviço deste RH.*/

CREATE TABLE Funcionarios (
	id INT(4) AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	celular INT(8) NOT NULL,
	email VARCHAR(50),
	endereco VARCHAR (100),
	cpf VARCHAR(14),
	salario DECIMAL(10,2),
	PRIMARY KEY (id)
);

/*Popule esta tabela com até 5 dados;*/

INSERT INTO funcionarios(nome, celular, email, endereco, cpf, salario) VALUES ("Willian", 954518743, "willianx47@gmail.com", "Jardim miranda", 12345678912345, 3500.50);
INSERT INTO funcionarios(nome, celular, email, endereco, cpf, salario) VALUES ("Roberto", 954557843, "roberto@gmail.com", "Jardim zaira", 12345657887934, 2500.99);
INSERT INTO funcionarios(nome, celular, email, endereco, cpf, salario) VALUES ("Lais", 95458878, "lais@gmail.com", "Jardim lais", 12345678978459, 2800.85);
INSERT INTO funcionarios(nome, celular, email, endereco, cpf, salario) VALUES ("Letisia", 789418743, "letisia@gmail.com", "Jardim oliveira", 88795678912345, 3500.50);
INSERT INTO funcionarios(nome, celular, email, endereco, cpf, salario) VALUES ("Geraldo", 954518754, "geraldo@gmail.com", "Jardim geraldo", 12378788912345, 1950.50);

/*Faça um select que retorne os funcionaries com o salário maior do que 2000.*/

SELECT nome, salario FROM funcionarios WHERE salario >= 2000;

/*Faça um select que retorne os funcionaries com o salário menor do que 2000.*/

SELECT nome, salario FROM funcionarios WHERE salario <= 2000;

/*Ao término atualize um dado desta tabela através de uma query de atualização.*/

UPDATE funcionarios SET salario = 2200.00 WHERE id = 5;
