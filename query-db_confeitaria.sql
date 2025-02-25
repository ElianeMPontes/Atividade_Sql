-- Crie um banco de dados para um e-commerce, onde o sistema trabalhará com as informações dos produtos deste e-commerce. 
CREATE DATABASE Confeitaria;
USE Confeitaria;

-- Crie uma tabela de produtos e determine 5 atributos relevantes dos produtos para se trabalhar com o serviço deste e-commerce.

CREATE TABLE Produtos(
id BIGINT AUTO_INCREMENT,
nome Varchar(255) NOT NULL,
descricao VARCHAR(200),
categoria VARCHAR(100),
preco DECIMAL(5,2),
PRIMARY KEY(id))
;
  
 -- Visualizar tabela
 SELECT *FROM Produtos;

-- Insira nesta tabela no mínimo 8 dados (registros).
INSERT INTO Produtos( nome,descricao, categoria, preco) VALUES
( "Bolo Floresta Negra", "Bolo de chocolate, com recheio de chantily e cereja", "Bolos", 78.5),
( "Bolo Sensação", "Bolo de chocolate, com recheio de morango e chocolate", "Bolos", 98.5),
( "CupCake Arco-Iris", "Massa branca com recheio de creme e cobertura de chantily arco-iris ", "CupCake", 18.5),
( "CupCake Triplo Choc", "Massa de chocolate com recheio de chocolate amargo e cobertura de ganache c/ chocolate branco e ao leite ", "CupCake", 20),
( "Brigadeiro ao leite", "Brigadeiro com chocolate ao leite", "Docinhos", 5),
( "Brigadeiro Amor", "Brigadeiro com choclate ao leite e recheado de morango ", "Docinhos", 10),
( "Kit Festa 1", "3 kg Bolo Floresta Negra + 3 cupCake arco-iris + 3 cupCake Triplo Choc + 20 brigadeiros", "Kits", 530),
( "Kit Festa 2", "3 kg Bolo Sensação + 10 cupCake arco-iris + 10 cupCake Triplo Choc + 20 brigadeiros", "Kits", 720);


-- Faça um SELECT que retorne todes os produtos com o valor maior do que 500.
SELECT *FROM Produtos WHERE preco > 500;

-- Faça um SELECT que retorne todes os produtos com o valor menor do que 500.
SELECT *FROM Produtos WHERE preco < 500;

-- Ao término atualize um registro desta tabela através de uma query de atualização.
UPDATE Produtos SET preco = 620 WHERE nome = "Kit Festa 2";

-- Visualizar tabela
 SELECT *FROM Produtos;
