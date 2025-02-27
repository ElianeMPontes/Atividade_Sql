-- Crie um banco de dados para um serviço de uma Pizzaria. O nome do Banco de dados deverá ter o seguinte nome db_pizzaria_legal.
CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

-- Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar as pizzas.
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

-- Crie a tabela tb_pizzas e determine 4 atributos, além da Chave Primária, relevantes aos produtos da pizzaria.
-- Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_pizzas
CREATE TABLE tb_pizzas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    valor DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(100),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

-- Insira 5 registros na tabela tb_categorias.
INSERT INTO tb_categorias (nome, descricao) VALUES
("Salgada", "Pizzas com sabores salgados"),
("Doce", "Pizzas com sabores doces"),
("Vegetariana", "Pizzas sem carne"),
("Especial", "Pizzas com ingredientes premium"),
("Vegana", "Pizzas sem nenhum ingrediente de origem animal");

-- Insira 8 registros na tabela tb_pizzas, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
INSERT INTO tb_pizzas (nome, descricao, valor, tamanho, id_categoria) VALUES
("Calabresa", "Pizza de calabresa com cebola e azeitonas", 45.00, "Grande", 1),
("Margherita", "Pizza de margherita com tomate, manjericão e mussarela", 50.00, "Média", 1),
("Chocolate", "Pizza de chocolate com morangos", 60.00, "Pequena", 2),
("Brócolis", "Pizza de brócolis com queijo vegano", 55.00, "Grande", 5),
("Portuguesa", "Pizza de portuguesa com presunto, ovos e cebola", 70.00, "Grande", 1),
("Banana", "Pizza de banana com canela e açúcar", 40.00, "Pequena", 2),
("Quatro Queijos", "Pizza de quatro queijos: mussarela, gorgonzola, parmesão e catupiry", 80.00, "Grande", 1),
("Frango com Catupiry", "Pizza de frango desfiado com catupiry", 90.00, "Grande", 1);

-- Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
SELECT * FROM tb_pizzas WHERE valor > 45.00;

-- Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

-- Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.
SELECT * FROM tb_pizzas WHERE nome LIKE "%M%";

--  Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias.
-- SELECT p.nome_pizza, p.descricao_pizza, p.valor, p.tamanho, c.nome_categoria FROM tb_pizzas p INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;
SELECT p.id, p.nome,p.descricao, p.valor, p.tamanho, p.id_categoria, c.nome AS categoria_nome, c.descricao FROM tb_pizzas p INNER JOIN tb_categorias c ON  p.id_categoria = c.id;

 -- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica (Exemplo: Todas as pizzas que são doce).
SELECT p.id,p.nome,p.descricao, p.valor, p.tamanho, p.id_categoria, c.nome AS categoria_nome, c.descricao FROM tb_pizzas p INNER JOIN tb_categorias c ON  p.id_categoria = c.id WHERE c.nome = "Doce";

