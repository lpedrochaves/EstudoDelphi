-- Database: financas

-- DROP DATABASE financas;

CREATE DATABASE financas
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Portuguese_Brazil.1252'
       LC_CTYPE = 'Portuguese_Brazil.1252'
       CONNECTION LIMIT = -1;

--Criar o schema
CREATE SCHEMA IF NOT EXISTS fin;

-- tabela de usuários
CREATE TABLE fin.usuarios (
    id SERIAL PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

--tabela de categorias
CREATE TABLE fin.categorias (
    id SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL
);

-- tabela de tipos de pagamento
CREATE TABLE fin.tipos_pagamento (
    id SERIAL PRIMARY KEY,
    nome_pagamento VARCHAR(100) NOT NULL
);

-- tabela de fluxo de caixa
CREATE TABLE fin.fluxo_caixa (
    id SERIAL PRIMARY KEY,
    categoria_id INTEGER NOT NULL,
    tipo_pagamento_id INTEGER NOT NULL,
    tipo VARCHAR(10) NOT NULL CHECK (tipo IN ('Receita', 'Despesa')),
    data DATE NOT NULL,
    valor NUMERIC(12,2) NOT NULL,
    descricao TEXT,
    
    -- Definir chaves estrangeiras
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id)
        REFERENCES fin.categorias (id) ON DELETE CASCADE,
    
    CONSTRAINT fk_tipo_pagamento FOREIGN KEY (tipo_pagamento_id)
        REFERENCES fin.tipos_pagamento (id) ON DELETE CASCADE
);



INSERT INTO fin.usuarios (usuario,senha) VALUES
('SUPERVISOR','123456');

INSERT INTO fin.categorias (nome_categoria) VALUES
('Alimentação'),
('Educação'),
('Lazer'),
('Saúde'),
('Transporte'),
('Moradia'),
('Salário'),
('Investimentos'),
('Doações'),
('Outros');

INSERT INTO fin.tipos_pagamento (nome_pagamento) VALUES
('Dinheiro'),
('Cartão de Crédito'),
('Cartão de Débito'),
('PIX'),
('Boleto'),
('Transferência Bancária'),
('Cheque'),
('Outros');

INSERT INTO fin.fluxo_caixa (categoria_id, tipo_pagamento_id, tipo, data, valor, descricao) VALUES
(1, 1, 'Despesa', '2025-05-01', 150.00, 'Supermercado da semana'),
(2, 4, 'Despesa', '2025-05-02', 300.00, 'Curso online de inglês'),
(3, 2, 'Despesa', '2025-05-03', 120.00, 'Cinema e jantar'),
(7, 6, 'Receita', '2025-05-05', 3500.00, 'Salário mensal'),
(4, 5, 'Despesa', '2025-05-06', 80.00, 'Remédio na farmácia'),
(5, 3, 'Despesa', '2025-05-07', 50.00, 'Uber para o trabalho'),
(8, 4, 'Receita', '2025-05-10', 500.00, 'Rendimento de ações'),
(9, 1, 'Despesa', '2025-05-11', 200.00, 'Doação para ONG'),
(6, 2, 'Despesa', '2025-05-12', 1200.00, 'Aluguel do mês'),
(10, 8, 'Despesa', '2025-05-13', 90.00, 'Despesas diversas');

