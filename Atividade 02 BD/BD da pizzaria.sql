/*
Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço dessa pizzaria.
*/

CREATE DATABASE db_pizzaria

USE db_pizzaria

CREATE TABLE tb_categoria (
	id BIGINT AUTO_INCREMENT NOT NULL,
	nome_produto VARCHAR(30) NOT NULL,
	valor_produto DECIMAL(10,2) NOT NULL,
	recheio_produto VARCHAR(30) NOT NULL,
	borda_produto VARCHAR(30) NOT NULL,
	tamanho_produto VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);

/*Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço dessa pizzaria(não esqueça de
criar a foreign key de tb_categoria nesta tabela).*/

CREATE TABLE tb_pizza(
	id BIGINT AUTO_INCREMENT NOT NULL,
	nome_cliente_pizza VARCHAR(30) NOT NULL,
	endereco_entrega_pizza VARCHAR(30),
	bairro_entrega_pizza VARCHAR(30),
	numero_casa_entrega_pizza BIGINT,
	pizzaria_id BIGINT DEFAULT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (pizzaria_id) REFERENCES tb_categoria (id)
);

/*
Popule esta tabela Categoria com até 5 dados.
*/

INSERT INTO tb_categoria(nome_produto, valor_produto, recheio_produto, borda_produto, tamanho_produto)
VALUES("Pizza calabresa", 34.50, "Chocolate", "Sem borda", "Média")
INSERT INTO tb_categoria(nome_produto, valor_produto, recheio_produto, borda_produto, tamanho_produto)
VALUES("Pizza portuguesa", 38.59, "Cebola", "Catupiri", "Grande")
INSERT INTO tb_categoria(nome_produto, valor_produto, recheio_produto, borda_produto, tamanho_produto)
VALUES("Pizza chocolate", 38.59, "Chocolate branco", "MM", "Pequena")
INSERT INTO tb_categoria(nome_produto, valor_produto, recheio_produto, borda_produto, tamanho_produto)
VALUES("Pizza queijo", 45.55, "Queijo", "Catupiri", "Grande")
INSERT INTO tb_categoria(nome_produto, valor_produto, recheio_produto, borda_produto, tamanho_produto)
VALUES("Pizza francesa", 52.55, "Chocolate", "Catupiri", "Grande")

/*
Popule esta tabela pizza com até 8 dados.
*/

INSERT INTO tb_pizza(nome_cliente_pizza, endereco_entrega_pizza, bairro_entrega_pizza, numero_casa_entrega_pizza, pizzaria_id)
VALUES("Willian", "bairro1", "endereco1", 52, 1);
INSERT INTO tb_pizza(nome_cliente_pizza, endereco_entrega_pizza, bairro_entrega_pizza, numero_casa_entrega_pizza, pizzaria_id)
VALUES("Letisia", "bairro1", "endereco1", 52, 2);
INSERT INTO tb_pizza(nome_cliente_pizza, endereco_entrega_pizza, bairro_entrega_pizza, numero_casa_entrega_pizza, pizzaria_id)
VALUES("Maria", "bairro5", "endereco3", 42, 4);
INSERT INTO tb_pizza(nome_cliente_pizza, endereco_entrega_pizza, bairro_entrega_pizza, numero_casa_entrega_pizza, pizzaria_id)
VALUES("Geraldo", "bairro5", "endereco2", 32, 5);
INSERT INTO tb_pizza(nome_cliente_pizza, endereco_entrega_pizza, bairro_entrega_pizza, numero_casa_entrega_pizza, pizzaria_id)
VALUES("Mari", "bairro8", "endereco5", 57, 1);
INSERT INTO tb_pizza(nome_cliente_pizza, endereco_entrega_pizza, bairro_entrega_pizza, numero_casa_entrega_pizza, pizzaria_id)
VALUES("Vitor", "bairro4", "endereco3", 25, 3);
INSERT INTO tb_pizza(nome_cliente_pizza, endereco_entrega_pizza, bairro_entrega_pizza, numero_casa_entrega_pizza, pizzaria_id)
VALUES("Macauly", "bairro2", "endereco4", 27, 2);
INSERT INTO tb_pizza(nome_cliente_pizza, endereco_entrega_pizza, bairro_entrega_pizza, numero_casa_entrega_pizza, pizzaria_id)
VALUES("Will", "bairro2", "endereco12", 122, 4);

/*
Faça um select que retorne os Produtos com o valor maior do que 45 reais.
*/

SELECT * FROM tb_categoria
WHERE valor_produto > 45;

/*
Faça um select trazendo os Produtos com valor entre 29 e 60 reais.
*/

SELECT * FROM tb_categoria
WHERE valor_produto > 29
AND valor_produto < 60;

/*
Faça um select utilizando LIKE buscando os Produtos com a letra C.
*/

SELECT tb_categoria.nome_produto, tb_categoria.valor_produto, tb_categoria.recheio_produto
FROM tb_categoria
WHERE tb_categoria.nome_produto LIKE %C%;

/*
Faça um um select com Inner join entre tabela categoria e pizza.
*/

SELECT * FROM tb_categoria
inner join tb_pizza ON tb_pizza.pizzaria_id = tb_categoria.id;

/*
Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são pizza doce).
*/

SELECT tb_pizza.nome_cliente_pizza, tb_categoria.nome_produto, tb_categoria.valor_produto
FROM tb_categoria
INNER JOIN tb_pizza ON tb_pizza.pizzaria_id = tb_categoria.id
WHERE tb_pizza.pizzaria_id = 1;
