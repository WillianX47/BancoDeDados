/*
Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desse açougue.
*/

CREATE DATABASE db_cidade_das_carnes

USE db_cidade_das_carnes

/*
Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desse açougue.
*/

CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT NOT NULL,
	nome_categoria VARCHAR(30) NOT NULL,
	picado_categoria VARCHAR(30) NOT NULL,
	peca_categoria VARCHAR (30) NOT NULL,
	PRIMARY KEY (id)
);

/*
Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço desse açougue(não esqueça de
criar a foreign key de tb_categoria nesta tabela).
*/

CREATE TABLE tb_produto(
	id BIGINT AUTO_INCREMENT NOT NULL,
	nome_produto VARCHAR(30) NOT NULL,
	valor_produto DECIMAL(10,2) NOT NULL,
	peso_produto DECIMAL (10,2) NOT NULL,
	lote_produto VARCHAR(30) NOT NULL,
	categoria_id BIGINT DEFAULT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

/*
Popule esta tabela Categoria com até 5 dados.
*/

INSERT INTO tb_categoria(nome_categoria, picado_categoria, peca_categoria)
VALUES("Boi", "Não", "Sim");
INSERT INTO tb_categoria(nome_categoria, picado_categoria, peca_categoria)
VALUES("Ave", "Sim", "Sim");
INSERT INTO tb_categoria(nome_categoria, picado_categoria, peca_categoria)
VALUES("Boi", "Sim", "Sim");
INSERT INTO tb_categoria(nome_categoria, picado_categoria, peca_categoria)
VALUES("Ave", "Não", "Sim");
INSERT INTO tb_categoria(nome_categoria, picado_categoria, peca_categoria)
VALUES("Gado", "Não", "Sim");

/*
Popule esta tabela Produto com até 8 dados.
*/

INSERT INTO tb_produto(nome_produto,valor_produto, peso_produto, lote_produto,categoria_id)
VALUES("Picanha", 68.90, 2, "Abril", 1);
INSERT INTO tb_produto(nome_produto,valor_produto, peso_produto, lote_produto,categoria_id)
VALUES("Picanha", 68.90, 1, "Abril", 2);
INSERT INTO tb_produto(nome_produto,valor_produto, peso_produto, lote_produto,categoria_id)
VALUES("Frango", 68.90, 3, "Julho", 4);
INSERT INTO tb_produto(nome_produto,valor_produto, peso_produto, lote_produto,categoria_id)
VALUES("File mignon", 60.90, 4, "Abril", 1);
INSERT INTO tb_produto(nome_produto,valor_produto, peso_produto, lote_produto,categoria_id)
VALUES("Picanha", 68.90, 2.5, "Agosto", 1);
INSERT INTO tb_produto(nome_produto,valor_produto, peso_produto, lote_produto,categoria_id)
VALUES("Coração", 10.90, 1, "Junho", 2);
INSERT INTO tb_produto(nome_produto,valor_produto, peso_produto, lote_produto,categoria_id)
VALUES("Picanha ouro", 89.90, 1, "Outubro", 5);
INSERT INTO tb_produto(nome_produto,valor_produto, peso_produto, lote_produto,categoria_id)
VALUES("Pé galinha", 15.55, 4, "Julho", 4);

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
os produtos que são aves ou legumes).
*/

SELECT tb_categoria.nome_categoria, tb_produto.nome_produto, tb_produto.valor_produto
FROM tb_categoria
INNER JOIN tb_produto WHERE tb_produto.categoria_id = tb_categoria.id
AND tb_produto.categoria_id = 1;
