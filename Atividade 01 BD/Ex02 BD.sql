/*Crie um banco de dados para um e commerce, onde o sistema trabalhará com as
informações dos produtos deste ecommerce.*/

CREATE DATABASE E_Commerce;
USE E_Commerce;

/*Crie uma tabela produtos e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos produtos para se trabalhar com o serviço deste ecommerce.*/

CREATE TABLE produtos (
	id INT(4) AUTO_INCREMENT,
	preco DECIMAL(10,2) NOT NULL,
	nome VARCHAR(30) NOT NULL,
	marca VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);

/*Popule esta tabela com até 8 dados;*/

INSERT INTO produtos(preco, nome, marca) VALUES (550.00, "Tênis", "Nike");
INSERT INTO produtos(preco, nome, marca) VALUES (185.00, "Tênis", "Adidas");
INSERT INTO produtos(preco, nome, marca) VALUES (150.00, "Camisa", "Fatal Surf");
INSERT INTO produtos(preco, nome, marca) VALUES (1175.00, "TV", "TCL");
INSERT INTO produtos(preco, nome, marca) VALUES (4500.00, "PS5", "Sony");
INSERT INTO produtos(preco, nome, marca) VALUES (4550.00, "Xbox series x", "Microsoft");
INSERT INTO produtos(preco, nome, marca) VALUES (2200.00, "S20", "Samsung");
INSERT INTO produtos(preco, nome, marca) VALUES (2.50, "Doce", "Halls");

/*Faça um select que retorne os produtos com o valor maior do que 500.*/

SELECT nome, preco FROM produtos WHERE preco > 500;

/*Faça um select que retorne os produtos com o valor menor do que 500.*/

SELECT nome, preco FROM produtos WHERE preco < 500;

/*Ao término atualize um dado desta tabela através de uma query de atualização.*/

UPDATE produtos SET preco = 4500.00 WHERE id = 6;

