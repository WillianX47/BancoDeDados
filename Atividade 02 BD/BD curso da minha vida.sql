/*
Crie um banco de dados para um serviço de um site de cursos onlines, o nome do banco
deverá ter o seguinte nome db_cursoDaMinhaVida, onde o sistema trabalhará com as
informações dos produtos desta empresa.
*/

CREATE DATABASE db_cursoDaMinhaVida

USE db_cursoDaMinhaVida

/*
O sistema trabalhará com 2 tabelas tb_curso e tb_categoria.
*/

/*
Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço deste site de cursos onlines.
*/

CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT NOT NULL,
	presencial_online_curso VARCHAR(30) NOT NULL,
	area_curso VARCHAR(30) NOT NULL,
	diploma_curso VARCHAR(30) NOT NULL,
	PRIMARY KEY(id)
);

/*
Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço de um site de cursos
onlines(não esqueça de criar a foreign key de tb_categoria nesta tabela).
*/

CREATE TABLE tb_produto(
	id BIGINT AUTO_INCREMENT NOT NULL,
	nome_curso VARCHAR(30) NOT NULL,
	valor_curso DECIMAL (10,2),
	empresa_curso VARCHAR(30),
	idioma_curso VARCHAR(30),
	categoria_id BIGINT DEFAULT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

/*
Popule esta tabela Categoria com até 5 dados.
*/

INSERT INTO tb_categoria(presencial_online_curso, area_curso, diploma_curso)
VALUES("Presencial", "TI", "Sim");
INSERT INTO tb_categoria(presencial_online_curso, area_curso, diploma_curso)
VALUES("Presencial", "Psicologia", "Sim");
INSERT INTO tb_categoria(presencial_online_curso, area_curso, diploma_curso)
VALUES("Online", "TI", "Sim");
INSERT INTO tb_categoria(presencial_online_curso, area_curso, diploma_curso)
VALUES("Online", "TI", "Não");
INSERT INTO tb_categoria(presencial_online_curso, area_curso, diploma_curso)
VALUES("Presencial", "Culinária", "Sim");

/*
Popule esta tabela Produto com até 8 dados.
*/

INSERT INTO tb_produto(nome_curso, valor_curso, empresa_curso, idioma_curso, categoria_id)
VALUES("C++", NULL, "Microsoft", "Inglês", 1);
INSERT INTO tb_produto(nome_curso, valor_curso, empresa_curso, idioma_curso, categoria_id)
VALUES("Java", 24.50, "Autônomo", "Inglês", 3);
INSERT INTO tb_produto(nome_curso, valor_curso, empresa_curso, idioma_curso, categoria_id)
VALUES("Comida japonêsa", 350.59, NULL, "Japonês", 5);
INSERT INTO tb_produto(nome_curso, valor_curso, empresa_curso, idioma_curso, categoria_id)
VALUES("Comida indiana", 159.59, NULL, "Inglês", 5);
INSERT INTO tb_produto(nome_curso, valor_curso, empresa_curso, idioma_curso, categoria_id)
VALUES("Java", NULL, "Itaú", "Inglês", 1);
INSERT INTO tb_produto(nome_curso, valor_curso, empresa_curso, idioma_curso, categoria_id)
VALUES("Angular", 24.50, NULL, "Português", 4);
INSERT INTO tb_produto(nome_curso, valor_curso, empresa_curso, idioma_curso, categoria_id)
VALUES("JS", NULL, "Microsoft", "Inglês", 1);
INSERT INTO tb_produto(nome_curso, valor_curso, empresa_curso, idioma_curso, categoria_id)
VALUES("Kanti", NULL, NULL, "Inglês", 2);

/*
Faça um select que retorne os Produtos com o valor maior do que 50 reais.
*/

SELECT * FROM tb_produto
WHERE valor_curso > 50;

/*
Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
*/

SELECT * FROM tb_produto
WHERE valor_curso > 3
AND valor_curso < 60;

/*
Faça um select utilizando LIKE buscando os Produtos com a letra J.
*/

SELECT * FROM tb_produto
WHERE nome_curso LIKE "J%";

/*
Faça um um select com Inner join entre tabela categoria e produto.
*/

SELECT * FROM tb_produto
INNER JOIN tb_categoria WHERE tb_produto.categoria_id = tb_categoria.id;

/*
Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são da categoria Java).
*/

SELECT tb_categoria.presencial_online_curso, tb_produto.empresa_curso, tb_produto.nome_curso, tb_produto.valor_curso
FROM tb_categoria
INNER JOIN tb_produto WHERE tb_produto.categoria_id = tb_categoria.id
AND tb_produto.categoria_id = 1;