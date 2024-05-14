-- Criação do banco de dados e das tabelas
CREATE DATABASE IF NOT EXISTS agenda_academica;
USE agenda_academica;

-- Tabela de Departamentos
CREATE TABLE IF NOT EXISTS departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255)
);

-- Tabela de Cursos
CREATE TABLE IF NOT EXISTS cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    departamento_id INT,
    nome VARCHAR(255),
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

-- Tabela de Usuários (Estudantes)
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT,
    nome VARCHAR(255),
    email VARCHAR(255),
    senha VARCHAR(255),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

-- Tabela de Atividades
CREATE TABLE IF NOT EXISTS atividades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    titulo VARCHAR(255),
    descricao TEXT,
    data DATETIME,
    tipo VARCHAR(100),
    complexidade VARCHAR(100),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Inserção de dados fictícios para Departamentos e Cursos
INSERT INTO departamentos (nome) VALUES 
('Ciências da Computação'),
('Engenharia de Software');

INSERT INTO cursos (departamento_id, nome) VALUES 
(1, 'Bacharelado em Ciências da Computação'),
(2, 'Bacharelado em Engenharia de Software');

-- Inserção de dados fictícios para Usuários
INSERT INTO usuarios (curso_id, nome, email, senha) VALUES 
(1, 'Alice Marques', 'alice@example.com', 'senha123'),
(1, 'Bob Silva', 'bob@example.com', 'senha123'),
(2, 'Carla Dias', 'carla@example.com', 'senha123'),
(2, 'David Senna', 'david@example.com', 'senha123'),
(1, 'Eva Lima', 'eva@example.com', 'senha123'),
(2, 'Fernando Gomes', 'fernando@example.com', 'senha123');

-- Inserção de dados fictícios para Atividades
INSERT INTO atividades (usuario_id, titulo, descricao, data, tipo, complexidade) VALUES 
(1, 'Estudar para a prova de Algoritmos', 'Capítulos 3 a 5 do livro', '2023-10-15 10:00:00', 'Prova', 'Alta'),
(2, 'Preparação para apresentação de TCC', 'Slides sobre o projeto', '2023-11-12 15:00:00', 'Apresentação', 'Alta'),
(3, 'Relatório de Projeto de Redes', 'Documentação completa do projeto', '2023-11-10 13:00:00', 'Relatório', 'Média'),
(4, 'Estudar para prova de Banco de Dados', 'Revisar todos os modelos ER', '2023-12-01 09:00:00', 'Prova', 'Alta'),
(5, 'Workshop de Segurança da Informação', 'Participação no workshop organizado pelo departamento', '2023-12-05 14:00:00', 'Workshop', 'Baixa'),
(6, 'Entrega de projeto de Machine Learning', 'Finalizar o código e testes', '2023-12-15 16:00:00', 'Projeto', 'Alta');

-- Tabela de Logs de Acesso (para análise de Big Data)
CREATE TABLE IF NOT EXISTS logs_acesso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    data_hora_acesso DATETIME,
    atividade VARCHAR(255),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Inserção de dados fictícios para Logs de Acesso
INSERT INTO logs_acesso (usuario_id, data_hora_acesso, atividade) VALUES 
(1, NOW(), 'Login'),
(2, NOW(), 'Login'),
(3, NOW(), 'Consulta Atividades'),
(4, NOW(), 'Login'),
(5, NOW(), 'Consulta Atividades'),
(6, NOW(), 'Login');