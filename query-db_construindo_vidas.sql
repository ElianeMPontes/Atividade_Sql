-- Crie um banco de dados para um serviço de uma loja de Material de Construção. O nome do Banco de dados deverá ter o seguinte nome db_construindo_vidas
CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

-- Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

-- Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
-- Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    quantidade INT ,
    marca VARCHAR(100),
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

-- Insira 5 registros na tabela tb_categorias.
INSERT INTO tb_categorias (nome, descricao) VALUES
("Hidráulica", "Produtos relacionados a encanamento e água"),
("Elétrica", "Materiais elétricos e fiações"),
("Ferramentas", "Ferramentas manuais e elétricas"),
("Tintas", "Tintas e acessórios para pintura"),
("Pisos e Revestimentos", "Materiais para pisos e paredes");

-- Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
INSERT INTO tb_produtos (nome, valor, quantidade, marca, id_categoria)VALUES
("Cano PVC 100mm", 120.00, 50, "Tigre", 1),
("Fio Elétrico 2,5mm", 80.00, 100, "Cobrex", 2),
("Martelo de Unha", 45.00, 30, "Tramontina", 3),
("Tinta Branca Fosco 18L", 250.00, 20, "Suvinil", 4),
("Porcelanato 60x60cm", 95.00, 200, "Portinari", 5),
("Chuveiro Elétrico", 150.00, 15, "Lorenzetti", 2),
("Serra Circular", 300.00, 10, "Bosch", 3),
("Argamassa Colante", 70.00, 80, "Votomassa", 5);

-- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 100,00.
SELECT * FROM tb_produtos WHERE valor > 100.00;

-- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00.
SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT p.*, c.nome AS categorias_nome, c.descricao FROM tb_produtos p INNER JOIN tb_categorias c ON p.id_categoria = c.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria hidráulica).
SELECT p.*, c.nome AS categorias_nome, c.descricao FROM tb_produtos p INNER JOIN tb_categorias c ON p.id_categoria = c.id WHERE c.nome= "Hidráulica";