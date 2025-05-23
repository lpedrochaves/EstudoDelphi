INSERT INTO fin.categorias (id, nomecategoria) VALUES (1, 'Alimentação');
INSERT INTO fin.categorias (id, nomecategoria) VALUES (2, 'Saúde');
INSERT INTO fin.categorias (id, nomecategoria) VALUES (3, 'Lazer');
INSERT INTO fin.categorias (id, nomecategoria) VALUES (4, 'Educação');
INSERT INTO fin.categorias (id, nomecategoria) VALUES (5, 'Salário');

SELECT*FROM fin.categorias;

INSERT INTO fin.tipos_pagamento (id, nomepagamento) VALUES (1, 'Crédito');
INSERT INTO fin.tipos_pagamento (id, nomepagamento) VALUES (2, 'Débito');
INSERT INTO fin.tipos_pagamento (id, nomepagamento) VALUES (3, 'PIX');
INSERT INTO fin.tipos_pagamento (id, nomepagamento) VALUES (4, 'Dinheiro');

SELECT*FROM fin.tipos_pagamento;

INSERT INTO fin.usuarios (id, nome, senha_hash) VALUES (2, 'Maria', '123');
INSERT INTO fin.usuarios (id, nome, senha_hash) VALUES (3, 'Carlos', '123');
INSERT INTO fin.usuarios (id, nome, senha_hash) VALUES (4, 'Ana', '123');

SELECT*FROM fin.usuarios;

ALTER TABLE fin.fluxo_caixa DROP CONSTRAINT fluxo_caixa_tipo_check;

ALTER TABLE fin.fluxo_caixa ADD CONSTRAINT fluxo_caixa_tipo_check 
CHECK (tipo IN ('Receita', 'Despesa', 'receita', 'despesa'));

-- José pagou um almoço com débito
INSERT INTO fin.fluxo_caixa (id, usuario_id, categoria_id, tipo_pagamento_id, data, valor, descricao, tipo)
VALUES (1, 1, 1, 2, '2025-03-18', 50.00, 'Almoço no restaurante', 'Despesa');

-- Maria recebeu seu salário via PIX
INSERT INTO fin.fluxo_caixa (id, usuario_id, categoria_id, tipo_pagamento_id, data, valor, descricao, tipo)
VALUES (2, 2, 5, 3, '2025-03-15', 3000.00, 'Salário mensal', 'Receita');

-- Carlos comprou um remédio com dinheiro
INSERT INTO fin.fluxo_caixa (id, usuario_id, categoria_id, tipo_pagamento_id, data, valor, descricao, tipo)
VALUES (3, 3, 2, 4, '2025-03-10', 120.00, 'Compra de remédios', 'Despesa');

-- Ana pagou um curso online com cartão de crédito
INSERT INTO fin.fluxo_caixa (id, usuario_id, categoria_id, tipo_pagamento_id, data, valor, descricao, tipo)
VALUES (4, 4, 4, 1, '2025-03-05', 200.00, 'Curso de inglês', 'Despesa');

-- José recebeu um pagamento por um freela
INSERT INTO fin.fluxo_caixa (id, usuario_id, categoria_id, tipo_pagamento_id, data, valor, descricao, tipo)
VALUES (5, 1, 5, 3, '2025-02-28', 500.00, 'Freelance de programação', 'Receita');

SELECT*FROM fin.fluxo_caixa;

-- Join para pega o nome das tabelas
SELECT 
    f.id,
    u.nome AS usuario,
    c.nomecategoria AS categoria,
    tp.nomepagamento AS tipos_pagamento,
    f.tipo,
    f.data,
    f.valor,
    f.descricao
FROM fin.fluxo_caixa f
JOIN fin.usuarios u ON f.usuario_id = u.id
JOIN fin.categorias c ON f.categoria_id = c.id
JOIN fin.tipos_pagamento tp ON f.tipo_pagamento_id = tp.id
ORDER BY f.data DESC;