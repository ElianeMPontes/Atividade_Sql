-- Crie um banco de dados para uma plataforma de Cursos Online (EAD). O nome do Banco de dados deverá ter o seguinte nome db_curso_da_minha_vida
CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

-- Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
CREATE TABLE tb_categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

-- Crie a tabela tb_cursos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
-- Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_cursos.
CREATE TABLE tb_cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    valor DECIMAL(10, 2) NOT NULL,
    duracao INT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

-- Insira 5 registros na tabela tb_categorias.
INSERT INTO tb_categorias (nome, descricao) VALUES
("Programação", "Cursos de desenvolvimento de software e programação"),
("Design", "Cursos de design gráfico e UX/UI"),
("Marketing", "Cursos de marketing digital e estratégias de vendas"),
("Negócios", "Cursos de gestão e empreendedorismo"),
("Idiomas", "Cursos de aprendizado de línguas estrangeiras");

-- Insira 8 registros na tabela tb_cursos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
INSERT INTO tb_cursos (nome, descricao, valor, duracao, id_categoria) VALUES
("Curso de Java", "Aprenda Java do básico ao avançado", 750.00, 60, 1),
("Curso de Python", "Domine Python para análise de dados", 600.00, 50, 1),
("Curso de UX/UI", "Design de interfaces e experiência do usuário", 900.00, 40, 2),
("Curso de Marketing Digital", "Estratégias de marketing online", 450.00, 30, 3),
("Curso de Gestão de Projetos", "Aprenda a gerenciar projetos eficientemente", 800.00, 45, 4),
("Curso de Inglês", "Inglês para iniciantes e intermediários", 300.00, 60, 5),
("Curso de JavaScript", "Desenvolvimento web com JavaScript", 550.00, 35, 1),
("Curso de Design Gráfico", "Fundamentos do design gráfico", 700.00, 40, 2);

-- Faça um SELECT que retorne todes os cursos cujo valor seja maior do que R$ 500,00.
SELECT * FROM tb_cursos WHERE valor > 50.00;

-- Faça um SELECT que retorne todes os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00.
SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os cursos que possuam a letra J no atributo nome.
SELECT * FROM tb_cursos WHERE nome LIKE "%J%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias.
SELECT p.* ,c.nome AS categorias_nome, c.descricao FROM tb_cursos p INNER JOIN tb_categorias c ON p.id_categoria = c.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os cursos que pertencem a categoria Java).
SELECT p.* ,c.nome AS categorias_nome, c.descricao FROM tb_cursos p INNER JOIN tb_categorias c ON p.id_categoria = c.id WHERE c.nome = "PROGRAMAÇÃO";