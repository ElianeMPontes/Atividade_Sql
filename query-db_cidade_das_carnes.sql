-- Crie um banco de dados para um serviço de um Açougue ou de um Hortifruti. O nome do Banco de dados deverá ter o seguinte nome db_cidade_das_carnes ou cidade_dos_vegetais.
CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

-- Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

-- Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
-- Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
CREATE TABLE tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

--  5 registros na tabela tb_categorias.
INSERT INTO tb_categorias (nome, descricao) VALUES
("Bovinos", "Carnes bovinas"),
("Suínos", "Carnes suínas"),
("Aves", "Carnes de aves"),
("Peixes", "Peixes e frutos do mar"),
("Outros", "Outros tipos de carnes");

-- Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
INSERT INTO tb_produtos (nome, descricao, preco, quantidade_estoque, categoria_id) VALUES
("Picanha", "Corte nobre bovino", 120.00, 50, 1),
("Linguiça Toscana", "Linguiça suína temperada", 30.00, 100, 2),
("Peito de Frango", "Peito de frango sem osso", 25.00, 200, 3),
("Salmão", "Filé de salmão fresco", 90.00, 30, 4),
("Costela Bovina", "Costela bovina para churrasco", 80.00, 40, 1),
("Bacon", "Fatias de bacon defumado", 20.00, 150, 2),
("Coxa de Frango", "Coxa de frango com osso", 15.00, 300, 3),
("Tilápia", "Filé de tilápia fresco", 40.00, 60, 4);

-- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
SELECT * FROM tb_produtos  WHERE preco > 50.00;


-- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00.
SELECT * FROM tb_produtos  WHERE preco BETWEEN 50.00 AND 150.00;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao FROM tb_produtos p INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria aves ou frutas).
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao FROM tb_produtos p INNER JOIN tb_categorias c ON p.categoria_id = c.id WHERE c.nome= "Bovinos";