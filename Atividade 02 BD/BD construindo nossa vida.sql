/*
Crie um banco de dados para um serviço de uma loja de produtos de construção, o nome
do banco deverá ter o seguinte nome db_construindo_a_nossa_vida, onde o sistema
trabalhará com as informações dos produtos desta empresa.
*/

CREATE DATABASE db_construindo_a_nossa_vida

USE db_construindo_a_nossa_vida

/*
Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço deste ecommerce.
*/

CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT NOT NULL,
	nome_categoria VARCHAR(30) NOT NULL,
	publico_categoria VARCHAR(30) NOT NULL,
	especie_categoria VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);

/*
Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço de uma loja de produtos (não
esqueça de criar a foreign key de tb_categoria nesta tabela).
*/

CREATE TABLE tb_produto(
	id BIGINT AUTO_INCREMENT NOT NULL,
	nome_produto VARCHAR(30) NOT NULL,
	valor_produto DECIMAL(10,2) NOT NULL,
	quantidade_produto BIGINT NOT NULL,
	lote_produto VARCHAR(30) NOT NULL,
	categoria_id BIGINT DEFAULT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

/*
Popule esta tabela Categoria com até 5 dados.
*/

INSERT INTO tb_categoria(nome_categoria, publico_categoria, especie_categoria)
VALUES("Eletrônico", "Adulto", "Humano");
INSERT INTO tb_categoria(nome_categoria, publico_categoria, especie_categoria)
VALUES("Brinquedo", "Criança", "Humano");
INSERT INTO tb_categoria(nome_categoria, publico_categoria, especie_categoria)
VALUES("Brinquedo", "10-15 anos", "Cachorro");
INSERT INTO tb_categoria(nome_categoria, publico_categoria, especie_categoria)
VALUES("Remédio", "Adulto", "Humano");
INSERT INTO tb_categoria(nome_categoria, publico_categoria, especie_categoria)
VALUES("Comida", "Geral", "Humano");

/*
Popule esta tabela Produto com até 8 dados.
*/

INSERT INTO tb_produto(nome_produto, valor_produto, quantidade_produto, lote_produto, categoria_id)
VALUES("Xbox Series X", 5.500, 1, "Abril", 1);
INSERT INTO tb_produto(nome_produto, valor_produto, quantidade_produto, lote_produto, categoria_id)
VALUES("PS5", 5.500, 1, "Abril", 1);
INSERT INTO tb_produto(nome_produto, valor_produto, quantidade_produto, lote_produto, categoria_id)
VALUES("Frisbe", 15.99, 3, "Janeiro", 3);
INSERT INTO tb_produto(nome_produto, valor_produto, quantidade_produto, lote_produto, categoria_id)
VALUES("Hot Wheels", 4.99, 5, "Fevereiro", 2);
INSERT INTO tb_produto(nome_produto, valor_produto, quantidade_produto, lote_produto, categoria_id)
VALUES("Dipirona", 25.50, 1, "Março", 4);
INSERT INTO tb_produto(nome_produto, valor_produto, quantidade_produto, lote_produto, categoria_id)
VALUES("Chocolate Lacta", 6.70, 3, "Outubro", 5);
INSERT INTO tb_produto(nome_produto, valor_produto, quantidade_produto, lote_produto, categoria_id)
VALUES("TV", 2.799, 1, "Maio", 1);
INSERT INTO tb_produto(nome_produto, valor_produto, quantidade_produto, lote_produto, categoria_id)
VALUES("Notebook Asus", 3.999, 1, "Julho", 1);

/*
Faça um select que retorne os Produtos com o valor maior do que 50 reais.
*/

SELECT * FROM tb_produto
WHERE valor_produto > 50;

/*
Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
*/
SELECT * FROM tb_produto
WHERE valor_produto > 3
AND valor_produto < 60;

/*
Faça um select utilizando LIKE buscando os Produtos com a letra C.
*/

SELECT * FROM tb_produto
WHERE nome_produto LIKE "C%";

/*
Faça um um select com Inner join entre tabela categoria e produto.
*/

SELECT * FROM tb_produto
INNER JOIN tb_categoria WHERE tb_produto.categoria_id = tb_categoria.id;

/*
Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são da categoria hidráulica).
*/

SELECT tb_categoria.nome_categoria, tb_produto.nome_produto, tb_produto.valor_produto
FROM tb_categoria
INNER JOIN tb_produto WHERE tb_produto.categoria_id = tb_categoria.id
AND tb_produto.categoria_id = 1;
