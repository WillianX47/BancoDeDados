/*
Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco
deverá ter o seguinte nome db_farmacia_do_bem, onde o sistema trabalhará com as
informações dos produtos desta empresa.
*/

CREATE DATABASE db_farmacia_do_bem

USE db_farmacia_do_bem

/*
Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.
*/

CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT NOT NULL,
	tipo_remedio VARCHAR(30) NOT NULL,
	lote_remedio VARCHAR(30) NOT NULL,
	laboratorio_remedio VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);

/*
Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço deste farmacia(não
esqueça de criar a foreign key de tb_categoria nesta tabela).
*/

CREATE TABLE tb_produto(
	id BIGINT AUTO_INCREMENT NOT NULL,
	nome_produto VARCHAR(30) NOT NULL,
	valor_produto DECIMAL(10,2) NOT NULL,
	volume_produto DECIMAL(10,2) NOT NULL,
	capsula_produto BIGINT,
	prescricao_medica_produto VARCHAR(30),
	categoria_id BIGINT DEFAULT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

/*
Popule esta tabela Categoria com até 5 dados.
*/

INSERT INTO tb_categoria(tipo_remedio, lote_remedio, laboratorio_remedio)
VALUES("Generico", "Abril", "Canadense");
INSERT INTO tb_categoria(tipo_remedio, lote_remedio, laboratorio_remedio)
VALUES("Similar", "Julho", "Globo");
INSERT INTO tb_categoria(tipo_remedio, lote_remedio, laboratorio_remedio)
VALUES("Original", "Maio", "Shckerbatzki");
INSERT INTO tb_categoria(tipo_remedio, lote_remedio, laboratorio_remedio)
VALUES("Generico", "Agosto", "Stinson");
INSERT INTO tb_categoria(tipo_remedio, lote_remedio, laboratorio_remedio)
VALUES("Original", "Janeiro", "Queiroga");

/*
Popule esta tabela Produto com até 8 dados.
*/

INSERT INTO tb_produto(nome_produto, valor_produto, volume_produto, capsula_produto, prescricao_medica_produto, categoria_id)
VALUES("Enrologic", 15.55, 200, null, "Sim", 1);
INSERT INTO tb_produto(nome_produto, valor_produto, volume_produto, capsula_produto, prescricao_medica_produto, categoria_id)
VALUES("Dipirona", 25.50, 350, null, "Não", 3);
INSERT INTO tb_produto(nome_produto, valor_produto, volume_produto, capsula_produto, prescricao_medica_produto, categoria_id)
VALUES("Paracetamal", 18.50, 350, null, "Sim", 2);
INSERT INTO tb_produto(nome_produto, valor_produto, volume_produto, capsula_produto, prescricao_medica_produto, categoria_id)
VALUES("Dorflex", 2.50, 50, 4, "Não", 2);
INSERT INTO tb_produto(nome_produto, valor_produto, volume_produto, capsula_produto, prescricao_medica_produto, categoria_id)
VALUES("Omeprazol", 27.50, 20, 56, "Sim", 1);
INSERT INTO tb_produto(nome_produto, valor_produto, volume_produto, capsula_produto, prescricao_medica_produto, categoria_id)
VALUES("Ritmoneuran", 25.50, 20, 20, "Não", 1);
INSERT INTO tb_produto(nome_produto, valor_produto, volume_produto, capsula_produto, prescricao_medica_produto, categoria_id)
VALUES("Nervocalm", 200.50, 100, 200, "Não", 3);
INSERT INTO tb_produto(nome_produto, valor_produto, volume_produto, capsula_produto, prescricao_medica_produto, categoria_id)
VALUES("Polivitaminico", 17.50, 200, null, "Não", 1);

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
Faça um select utilizando LIKE buscando os Produtos com a letra B.
*/

SELECT * FROM tb_produto
WHERE nome_produto LIKE "%B%";

/*
Faça um um select com Inner join entre tabela categoria e produto.
*/

SELECT * FROM tb_categoria
INNER JOIN tb_produto ON tb_produto.categoria_id = tb_categoria.id;

/*
Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são cosméticos).
*/

SELECT tb_produto.nome_produto, tb_categoria.tipo_remedio, tb_categoria.lote_remedio
FROM tb_produto
INNER JOIN tb_categoria ON tb_produto.categoria_id = tb_categoria.id;

