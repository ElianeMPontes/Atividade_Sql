-- Crie um banco de dados para um serviço de um Games Online. O nome do Banco de dados deverá ter o seguinte nome db_generation_game_online. O sistema trabalhará com as informações dos personagens do jogo.
CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

-- Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os personagens do Game Online.
CREATE TABLE tb_classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(100) NOT NULL
);

-- Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, relevantes aos personagens do Game Online.
-- Não esqueça de criar a Foreign Key da tabela tb_classes na tabela tb_personagens.
CREATE TABLE tb_personagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    habilidade VARCHAR(100) NOT NULL,
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id)
);

-- Insira 5 registros na tabela tb_classes.
INSERT INTO tb_classes(nome, tipo) VALUES
("Ninja", "Especialista em ataques rápidos"),
("Guerreiro", "Especialista em ataques com armas"),
("Monge", "Especialista em artes marciais"),
("Deus do Trovão","Especialista em poderes elementais"),
("Mutante", " Especialista em ataques brutais");

-- Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_classes.
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, habilidade, id_classe) VALUES
("Scorpion", 2600, 1700, "Ataques rápidos e fogo infernal", 1),
("Sub-Zero", 2400, 1800, "Mestre em manipulação de gelo", 1),
("Raiden", 2800, 2000, "Habilidades elétricas e teleporte", 4),
("Liu Kang", 2500, 1600, "Artes marciais e chutes poderosos", 3),
("Kitana", 2300, 1500, "Especialista em leques laminados", 2),
("Mileena", 2400, 1400, "Velocidade extrema e presas afiadas", 5),
("Baraka", 2700, 1800, "Usa lâminas retráteis em combate feroz", 5),
("Ashrah", 2200, 1700, "Usa magia celestial contra as trevas",2);

-- Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
SELECT * FROM tb_personagens WHERE nome LIKE "%C%";

--  Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
SELECT p.id, p.nome,p.poder_ataque, p.poder_defesa, p.habilidade, p.id_classe, c.nome AS classe_nome, c.tipo FROM tb_personagens p INNER JOIN tb_classes c ON  p.id_classe = c.id;

 -- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).
SELECT p.id, p.nome,p.poder_ataque, p.poder_defesa, p.habilidade, p.id_classe, c.nome AS classe_nome, c.tipo FROM tb_personagens p INNER JOIN tb_classes c ON  p.id_classe = c.id WHERE c.nome = "Ninja";

