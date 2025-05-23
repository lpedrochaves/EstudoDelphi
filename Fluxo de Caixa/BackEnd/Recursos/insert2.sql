SELECT * FROM fin.categorias;

SELECT * FROM fin.tipos_pagamento;

SELECT * FROM fin.fluxo_caixa;

INSERT INTO fin.fluxo_caixa(id,categoria_id,tipo_pagamento_id,tipo,data,valor,descricao)
VALUES(6,5,3,'Receita','2025-01-20',150.00,'Serviço de jardinagem');

INSERT INTO fin.fluxo_caixa(categoria_id,tipo_pagamento_id,tipo,data,valor,descricao)
VALUES(5,3,'Receita','2025-04-20',150.00,'Serviço de jardinagem');


--VERIFICAR SE A SEQUENCIA DE ID ESTA DESATUALIZADA(RESULTADO APRESENTAR VALOR MENOR QEU O ULTIMO ID GERADO)
SELECT nextval('fin.fluxo_caixa_id_seq');

--AQUI CORRIGE A SEQUENCIA PARA VOLTAR A GERAR O ID
SELECT setval('fin.fluxo_caixa_id_seq', (SELECT MAX(id) FROM fin.fluxo_caixa) + 1);