CREATE TABLE fin.usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    senha_hash TEXT NOT NULL
);

CREATE TABLE fin.categorias (
    id SERIAL PRIMARY KEY,
    nomeCategoria VARCHAR(50) NOT NULL
);

CREATE TABLE fin.tipos_pagamento (
    id SERIAL PRIMARY KEY,
    nomePagamento VARCHAR(50) NOT NULL
);

CREATE TABLE fin.fluxo_caixa (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES fin.usuarios(id) ON DELETE CASCADE,
    categoria_id INT REFERENCES fin.categorias(id) ON DELETE SET NULL,
    tipo_pagamento_id INT REFERENCES fin.tipos_pagamento(id) ON DELETE SET NULL,
    tipo VARCHAR(10) CHECK (tipo IN ('despesa', 'receita')) NOT NULL,
    data DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    descricao TEXT
);