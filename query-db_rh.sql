-- Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema trabalhará com as informações dos colaboradores desta empresa. 
CREATE DATABASE Rh;
USE Rh;

-- Crie uma tabela de colaboradores e determine 5 atributos relevantes dos colaboradores para se trabalhar com o serviço deste RH.
CREATE TABLE Colaboradores (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100) ,
    salario DECIMAL(10,2),
    data_admissão DATE,
    PRIMARY KEY(id)    
);



-- Insira nesta tabela no mínimo 5 dados (registros).
INSERT INTO Colaboradores (nome, cargo, salario, data_admissão) VALUES
("Eliane Medeiros", "Desenvolvedora FullStack", 7000.00,"2024-06-10" ),
("Lavinea Medeiros","Q.A", 4200.00, "2023-07-13" ),
("Lorena  Medeiros", "Recrutadora", 4000.00, "2025-01-06" ),
("Alexandre Pontes", "Coodenador de Rh", 10000.00, "2022-03-12" ), 
("Lucas Pontes","Gerente", 30000.00, "2021-04-12" );

-- consultando 
SELECT * FROM Colaboradores;

-- Faça um SELECT que retorne todes os colaboradores com o salário maior do que 2000.
SELECT * FROM Colaboradores WHERE salario > 2000; 

-- Faça um SELECT que retorne todes os colaboradores com o salário menor do que 2000.
SELECT * FROM Colaboradores WHERE salario < 2000; -- Não há nenhum , na minha empresa todos ganham bem ...kkkk

-- SETANDO CONFIGURAÇÃO (DADO)
SET SQL_SAFE_UPDATES = 0;

-- Ao término atualize um registro desta tabela através de uma query de atualização.
UPDATE Colaboradores SET salario = 5300.00 WHERE nome = "Lavinea Medeiros";

SELECT * FROM Colaboradores;