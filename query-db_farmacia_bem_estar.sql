-- Crie um banco de dados para um serviço de uma Farmácia. O nome do Banco de dados deverá ter o seguinte nome db_farmacia_bem_estar
CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

-- Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);

-- Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
-- Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    data_validade DATE,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);


-- Insira 5 registros na tabela tb_categorias.
INSERT INTO tb_categorias (nome, descricao) VALUES
("Medicamentos", "Produtos para tratamento de saúde"),
("Cosméticos", "Produtos de beleza e cuidados pessoais"),
("Higiene", "Produtos de higiene pessoal"),
("Vitaminas", "Suplementos vitamínicos"),
("Infantil", "Produtos para crianças");


-- Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
INSERT INTO tb_produtos (nome, valor, quantidade, data_validade, id_categoria) VALUES
("Paracetamol 500mg", 15.90, 100, "2024-12-31", 1),
("Shampoo Anticaspa", 25.50, 50, "2025-06-30", 2),
("Creme Dental", 4.99, 200, "2024-09-30", 3),
("Vitamina C 1000mg", 55.00, 30, "2024-11-30", 4),
("Fralda Pampers", 60.00, 80, "2025-01-31", 5),
("Protetor Solar FPS 50", 45.00, 60, "2024-10-31", 2),
("Sabonete Líquido", 7.50, 150, "2024-08-31", 3),
("Dipirona 500mg", 12.00, 120, "2024-12-31", 1);


-- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
SELECT * FROM tb_produtos Where valor > 50;

-- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.
SELECT * FROM tb_produtos WHERE valor BETWEEN 5 AND 60;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
SELECT * FROM tb_produtos WHERE nome_produto LIKE "%C%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT p.id, p.nome, p.valor, p.quantidade, p.data_validade, p.id_categoria , c.nome AS categoria_nome, c.descricao FROM tb_produtos p INNER JOIN tb_categorias c ON p.id_categoria = c.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria cosméticos).
SELECT p.id, p.nome, p.valor, p.quantidade, p.data_validade, p.id_categoria , c.nome AS categoria_nome, c.descricao FROM tb_produtos p INNER JOIN tb_categorias c ON p.id_categoria = c.id WHERE c.nome = "Cosméticos";

