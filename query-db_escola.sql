-- Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as informações dos estudantes deste registro dessa escola. 
CREATE DATABASE Escola;
USE Escola;

-- Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos relevantes dos estudantes para se trabalhar com o serviço dessa escola.
 CREATE TABLE Estudantes (
    id BIGINT AUTO_INCREMENT ,
    nome VARCHAR(200) NOT NULL,
    turma VARCHAR(30),
    nota DECIMAL(3,2),
    situacao VARCHAR(20),
    PRIMARY KEY(id));
 
 -- Visualizar tabela
 SELECT *FROM Produtos;
 
-- Insira nesta tabela no mínimo 8 dados (registros).
INSERT INTO Estudantes (nome, turma, nota, situacao) VALUES
("Lavinea Medeiros", "2B", "9.8", "Aprovado"),
("Lorena Medeiros", "7B", "8.0","Aprovado"),
("Mariana Fernandes", "8A", "7.8", "Aprovado"),
("Liliane Rocha", "2B", "5.5", "Reprovado"),
("Giovana Alves", "2A", "9.5", "Aprovado"),
("Ana Pessoa","1B", "4.8", "Reprovado"),
("Vitoria Santos", "7A", "7.0", "Aprovado"),
("Lucas Gonçalves","9B", "5.9", "Recuperação");

-- Visualizar tabela
 SELECT *FROM estudantes;

 -- Faça um SELECT que retorne todes o/a(s) estudantes com a nota maior do que 7.0.
 SELECT * FROM estudantes WHERE nota > 7.0;
   
-- Faça um SELECT que retorne todes o/a(s) estudantes com a nota menor do que 7.0.
SELECT * FROM estudantes WHERE nota < 7.0;

-- SETANDO CONFIGURAÇÃO (DADO)
SET SQL_SAFE_UPDATES = 0;

-- Ao término atualize um registro desta tabela através de uma query de atualização.
UPDATE estudantes SET nota = 7.5, situacao = "Aprovado" WHERE nome = "Vitoria Santos";

-- Visualizar tabela
 SELECT *FROM estudantes;


