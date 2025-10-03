-- index.sql
-- Script completo para PostgreSQL
-- Criação do banco, tabelas, inserção de dados e índices

-- ===============================
-- 1. CRIAÇÃO DO BANCO DE DADOS
-- ===============================
-- *Este comando deve ser executado fora do banco se você ainda não estiver dentro dele
-- CREATE DATABASE loja_online;

-- ===============================
-- 2. CONECTANDO AO BANCO
-- ===============================
-- \c loja_online

-- ===============================
-- 3. CRIAÇÃO DAS TABELAS
-- ===============================

CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco NUMERIC(10,2) NOT NULL,
    categoria_id INT,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(id),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'pendente'
);

CREATE TABLE IF NOT EXISTS itens_pedido (
    id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(id),
    produto_id INT REFERENCES produtos(id),
    quantidade INT NOT NULL,
    preco_unitario NUMERIC(10,2) NOT NULL
);

-- ===============================
-- 4. INSERÇÃO DE DADOS EXEMPLO
-- ===============================

-- Usuários
INSERT INTO usuarios (nome, email, senha) VALUES
('João Silva', 'joao@example.com', 'senha123'),
('Maria Oliveira', 'maria@example.com', 'senha456');

-- Produtos
INSERT INTO produtos (nome, descricao, preco, categoria_id) VALUES
('Notebook', 'Notebook com 16GB RAM', 3500.00, 1),
('Mouse', 'Mouse óptico sem fio', 80.00, 2),
('Teclado', 'Teclado mecânico RGB', 250.00, 2);

-- Pedidos
INSERT INTO pedidos (usuario_id, status) VALUES
(1, 'enviado'),
(2, 'pendente');

-- Itens do pedido
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),
(1, 2, 2, 80.00),
(2, 3, 1, 250.00);

-- ===============================
-- 5. CRIAÇÃO DE ÍNDICES
-- ===============================

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_usuarios_email ON usuarios(email);
CREATE INDEX IF NOT EXISTS idx_pedidos_usuario ON pedidos(usuario_id);
CREATE INDEX IF NOT EXISTS idx_produtos_categoria ON produtos(categoria_id);
CREATE INDEX IF NOT EXISTS idx_itens_pedido_produto ON itens_pedido(produto_id);

-- ===============================
-- FIM DO SCRIPT
-- ===============================
