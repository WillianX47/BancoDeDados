/*Crie um banco de dados para um serviço de um game Online , o nome do banco deverá ter
o seguinte nome db_generation_game_online, onde, o sistema trabalhará com as
informações dos personagens desse game.*/

CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

/*O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.

siga exatamente esse passo a passo:

Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos
relevantes da classe para se trabalhar com o serviço desse game Online.*/

CREATE TABLE tb_classe(
	id BIGINT(4) AUTO_INCREMENT NOT NULL,
	nome_classe VARCHAR(30) NOT NULL,
	poder VARCHAR(30) NOT NULL,
	ataque_base BIGINT(30) NOT NULL,
	PRIMARY KEY (id)
);

/*Popule esta tabela classe com até 5 dados.*/

INSERT INTO tb_classe(nome_classe, poder, ataque_base) VALUES ("Mago", "Magia negra", 20);
INSERT INTO tb_classe(nome_classe, poder, ataque_base) VALUES ("Tank", "Escudo para equipe", 10);
INSERT INTO tb_classe(nome_classe, poder, ataque_base) VALUES ("Guerreiro", "Tornado espiral", 50);
INSERT INTO tb_classe(nome_classe, poder, ataque_base) VALUES ("Sacerdote", "Cura em equipe", 15);
INSERT INTO tb_classe(nome_classe, poder, ataque_base) VALUES ("Arqueiro", "Tempestade de flechas", 100);

/*Crie uma tabela tb_personagem e utilizando a habilidade de abstração e determine 5
atributos relevantes dos funcionários para se trabalhar com o serviço desse game Online
(não esqueça de criar a foreign key de tb_classe nesta tabela).*/

CREATE TABLE tb_personagem(
	id BIGINT(4) AUTO_INCREMENT NOT NULL,
	nome_personagem VARCHAR(30) NOT NULL,
	nivel_personagem VARCHAR(30) NOT NULL,
	faccao_personagem VARCHAR(30) NOT NULL,
	idade_personagem int(30) NOT NULL,
	altura_personagem DECIMAL (10,2) NOT NULL,
	classe_id BIGINT(4) DEFAULT NULL,
    PRIMARY KEY (id),
	FOREIGN KEY (classe_id) REFERENCES tb_classe (id)
);

/*Popule esta tabela personagem com até 8 dados.*/

INSERT INTO tb_personagem(nome_personagem, nivel_personagem, faccao_personagem, idade_personagem, altura_personagem, classe_id) 
VALUES("Willian", "25", "Legião arcana", 38, 1.65, 1);
INSERT INTO tb_personagem(nome_personagem, nivel_personagem, faccao_personagem, idade_personagem, altura_personagem, classe_id) 
VALUES("Letisia", "17", "Legião arcana", 15, 1.55, 3);
INSERT INTO tb_personagem(nome_personagem, nivel_personagem, faccao_personagem, idade_personagem, altura_personagem, classe_id) 
VALUES("Lire", "32", "Ilha de eryuell", 23, 1.58, 5);
INSERT INTO tb_personagem(nome_personagem, nivel_personagem, faccao_personagem, idade_personagem, altura_personagem, classe_id) 
VALUES("George", "29", "Tankudos", 28, 1.85, 2);
INSERT INTO tb_personagem(nome_personagem, nivel_personagem, faccao_personagem, idade_personagem, altura_personagem, classe_id) 
VALUES("2B", "45", "YoRHa", 32, 1.75, 3);
INSERT INTO tb_personagem(nome_personagem, nivel_personagem, faccao_personagem, idade_personagem, altura_personagem, classe_id) 
VALUES("Leila", "15", "Legião arcana", 28, 1.69, 4);
INSERT INTO tb_personagem(nome_personagem, nivel_personagem, faccao_personagem, idade_personagem, altura_personagem, classe_id) 
VALUES("A2", "42", "YoRHa", 21, 1.65, 3);
INSERT INTO tb_personagem(nome_personagem, nivel_personagem, faccao_personagem, idade_personagem, altura_personagem, classe_id) 
VALUES("Elesis", "32", "Cavaleiros vermelhos", 23, 1.67, 3);

/*Faça um select que retorne os personagens com o poder de ataque maior do que 2000.
  (Como não existe ataque maior que 2000 irei fazer um update)
*/
UPDATE tb_classe SET ataque_base = 2000 WHERE id = 1;
UPDATE tb_classe SET ataque_base = 1200 WHERE id = 2;
UPDATE tb_classe SET ataque_base = 4500 WHERE id = 3;
UPDATE tb_classe SET ataque_base = 1400 WHERE id = 4;
UPDATE tb_classe SET ataque_base = 8500 WHERE id = 5;

SELECT tb_personagem.nome_personagem, tb_personagem.nivel_personagem, faccao_personagem
FROM tb_personagem
INNER JOIN tb_classe ON tb_classe.id = tb_personagem.classe_id
WHERE tb_classe.ataque_base >= 2000;

/*Faça um select trazendo os personagens com poder de defesa entre 1000 e 2000.
  (Como não existe atributo de defesa dentro da classe, irei fazer um alter table)
*/

ALTER TABLE tb_classe
ADD defesa_base BIGINT;

/*Agora irei fazer um UPDATE na tb_classe*/

UPDATE tb_classe SET tb_classe.defesa_base = 1000 WHERE id = 1;
UPDATE tb_classe SET tb_classe.defesa_base = 5000 WHERE id = 2;
UPDATE tb_classe SET tb_classe.defesa_base = 3500 WHERE id = 3;
UPDATE tb_classe SET tb_classe.defesa_base = 2500 WHERE id = 4;
UPDATE tb_classe SET tb_classe.defesa_base = 500  WHERE id = 5;

/*Agora sim o select:*/

SELECT tb_personagem.nome_personagem, tb_personagem.nivel_personagem, faccao_personagem
FROM tb_personagem
INNER JOIN tb_classe ON tb_classe.id = tb_personagem.classe_id
WHERE tb_classe.defesa_base >= 1000
AND tb_classe.defesa_base <= 2000;

/*Faça um select utilizando LIKE buscando os personagens com a letra C.
  (Como não existe personagem com a letra C irei fazer um UPDATE)
*/

UPDATE tb_personagem SET tb_personagem.nome_personagem = "Canaban" WHERE id = 8;

/*AGORA O SELECT:*/

SELECT tb_personagem.nome_personagem, tb_personagem.nivel_personagem, faccao_personagem
FROM tb_personagem
WHERE tb_personagem.nome_personagem LIKE "%C%";

/*Faça um um select com Inner join entre tabela classe e personagem.*/

SELECT * FROM tb_personagem
INNER JOIN tb_classe ON tb_personagem.classe_id = tb_classe.id;

/*Faça um select onde traga todos os personagem de uma classe específica (exemplo todos
os personagens que são arqueiros).*/

SELECT tb_personagem.nome_personagem, tb_classe.nome_classe, tb_personagem.faccao_personagem
FROM tb_personagem
INNER JOIN tb_classe ON tb_personagem.classe_id = tb_classe.id
WHERE tb_classe.nome_classe = "Arqueiro";


