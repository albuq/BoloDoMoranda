--INSERE CLIENTES--
--1
INSERT INTO cliente (CPF, nome, telefone, email, username, senha) 
VALUES ('33455467890','Patrícia Souza', '1179890767', 'patricia.s@gmail.com', 'patricia.s', 'senha');
--2
INSERT INTO cliente (CPF, nome, telefone, email, username, senha) 
VALUES ('43215467890','Marcela Ferreira', '1145637890', 'marcela.f@gmail.com', 'marcela.f', 'senha');
--3
INSERT INTO cliente (CPF, nome, telefone, email, username, senha) 
VALUES ('36455467877','Carla Aparecida', '1139113454', 'carla.a@gmail.com', 'carla.a', 'senha');

--INSERE ENDEREÇOS--
--1
INSERT INTO endereco(
            logradouro, numero, bairro, cidade, estado, 
            pais, cep)
    VALUES ('Rua Oliveira Souza', '31', 'Pinheiros', 'São Paulo', 'SP', 'Brasil','03478900');
--2
INSERT INTO endereco(
            logradouro, numero, complemento, bairro, cidade, estado, 
            pais, cep)
    VALUES ('Rua Santa Marcelina', '67', 'A', 'Pompéia', 'São Paulo', 'SP', 'Brasil', '05289010');
--3
INSERT INTO endereco(
            logradouro, numero, bairro, cidade, estado, 
            pais, cep)
    VALUES ('Avenida Duilio Meneghel', '101', 'Pirituba', 'São Paulo', 'SP', 'Brasil', '05298055');

--ALTERA ENDEREÇO DE CLIENTES
--1
UPDATE cliente
   SET id_end=1
 WHERE username = 'marcela.f';
--2
UPDATE cliente
   SET id_end=2
 WHERE username = 'marcela.f';
--3
UPDATE cliente
   SET id_end=3
 WHERE username = 'carla.a';

 --INSERE BOLO
 --1
 INSERT INTO bolo(
            nome, sabor, descricao, ingredientes, imagem, preço_kg)
    VALUES ('Bolo de maçã', 'Maçã', 
    'Esse é um bolo simples, bem úmido, que é uma delícia! Com certeza ele vai ser um dos bolos favoritos da sua família.',
    'maçãs, ovos, açúcar, óleo, bicarbonato de sódio, canela em pó, extrato de baunilha, farinha de trigo, nozes picadas',
    '{"/Fotos Receitas/Bolo_maça.jpg", "/Fotos Receitas/Bolo_maça2.jpg"}', 7.9
);

INSERT INTO bolo_tradicional (id_bolo) VALUES (1);
--2
 INSERT INTO bolo(
            nome, sabor, descricao, ingredientes, imagem, preço_kg)
    VALUES ('Bolo exagero de chocolate', 'Chocolate', 'Bolo de chocolate com cobertura tipo buttercream também de chocolate. Derrete na boca e é perfeito!', 
    'açúcar, farinha de trigo, chocolate em pó, bicarbonato de sódio, fermento em pó, sal, ovos, leite, óleo, baunilha', 
    '{"/Fotos Receitas/Bolo_Chocolate.jpg", "/Fotos Receitas/Bolo_Chocolate2.jpeg"}', 8.1);

INSERT INTO bolo_tradicional (id_bolo) VALUES (2);
--3
 INSERT INTO bolo(
            nome, sabor, descricao, ingredientes, imagem, preço_kg)
    VALUES ('Bolo Sensação', 'Morango e chocolate', 'Uma massa fofinha de pão de ló, com recheio que leva morangos e cobertura com chantilly. Ficou com água na boca? ', 
    'farinha de trigo, açúcar, fermento em pó, ovos, leite, leite condensado, amido de milho, morangos, chantilly',
    '{"/Fotos Receitas/Bolo_Sensacao.jpg", "/Fotos Receitas/Bolo_Sensacao2.jpg"}', 13.55);

INSERT INTO bolo_festa (id_bolo) VALUES (3);

--4
 INSERT INTO bolo(
            nome, sabor, descricao, ingredientes, imagem, preço_kg)
    VALUES ('Bolo Prestígio', 'Coco e chocolate', 'Chocolate e coco com certeza é uma combinação deliciosa para todos os eventos especiais de sua vida!', 
    'farinha de trigo, açúcar, fermento em pó, ovos, leite, café, coco, chocolate',
    '{"/Fotos Receitas/Bolo_prestigio.jpeg", "/Fotos Receitas/Bolo_prestigio2.jpg"}', 14.00);

INSERT INTO bolo_festa (id_bolo) VALUES (4);

--INSERIR REFERENCIAS NUTRICIONAIS SEGUNDO ANVISA
INSERT INTO ref_info_nutricionais(
            valor_energetico, carboidratos, proteinas, gorduras_totais, gorduras_saturadas, fibra_alimentar, sodio)
    VALUES (2000, 300, 75, 55, 22, 25, 2400);

--INSERE INFO NUTRICIONAL DE CADA BOLO
--1
INSERT INTO info_nutricionais(
            id_bolo, valor_energetico, carboidratos, proteinas, gorduras_totais, 
            gorduras_saturadas, gorduras_trans, fibra_alimentar, sodio)
    VALUES (1, 500, 80, 22, 10, 8, 1, 4, 300);
--2
INSERT INTO info_nutricionais(
            id_bolo, valor_energetico, carboidratos, proteinas, gorduras_totais, 
            gorduras_saturadas, gorduras_trans, fibra_alimentar, sodio)
    VALUES (2, 600, 70, 42, 10, 8, 0.6, 4, 250);

--3
INSERT INTO info_nutricionais(
            id_bolo, valor_energetico, carboidratos, proteinas, gorduras_totais, 
            gorduras_saturadas, gorduras_trans, fibra_alimentar, sodio)
    VALUES (3, 700, 80, 22, 10, 10, 1, 4, 300);
--4
INSERT INTO info_nutricionais(
            id_bolo, valor_energetico, carboidratos, proteinas, gorduras_totais, 
            gorduras_saturadas, gorduras_trans, fibra_alimentar, sodio)
    VALUES (4, 710, 90, 22, 10, 18, 1, 4, 300);

--INSERE AVALIACAO
INSERT INTO avalia(
            id_bolo, cpf, nota, comentario)
    VALUES ('1', '33455467890', 10.00, 'Muito gostoso! Comprei e não durou um dia com a minha família!');

INSERT INTO avalia(
            id_bolo, cpf, nota, comentario)
    VALUES ('2', '33455467890', '8.7', 'Delícia de bolo!');

INSERT INTO avalia(
            id_bolo, cpf, nota, comentario)
    VALUES ('3', '33455467890', '10', 'Comprei pro aniversário do meu filho, todos amaram!');

INSERT INTO avalia(
            id_bolo, cpf, nota)
    VALUES ('4', '43215467890', '8');

INSERT INTO avalia(
            id_bolo, cpf, nota, comentario)
    VALUES ('3', '43215467890', '8.7', 'Gostoso, mas  a consistência poderia ser um pouco mais firme...');

INSERT INTO avalia(
            id_bolo, cpf, nota, comentario)
    VALUES ('1', '36455467877', '10', 'BOM D+++++++++');

INSERT INTO avalia(
            id_bolo, cpf, nota, comentario)
    VALUES ('4', '36455467877', '10', 'Gente, que bolo bom!');

--INSERE VENDA PRA TESTAR
INSERT INTO venda(
            data_confirmacao, valor_total, pgto_conf, 
            empacotamento_conf, despache_conf, entrega_conf)
    VALUES ('10-05-2016', 42.00, true, true, true, false);
    
INSERT INTO realiza(
            cpf, data_cadastro, id_venda)
    VALUES (36455467877, '09-05-2016', 1 );

INSERT INTO entrega(
            id_end, age_data_agendada, age_periodo_agendado, id_venda)
    VALUES (3, '23-05-2016', 'noite', 1);

INSERT INTO forma_pgto(id_venda)
    VALUES (1);

INSERT INTO pgto_cartao(
            id_pgto, numero_cartao, nome_titular, cod_seguranca, val_mes_validade, val_ano_validade, par_qtd_parcela, par_valor_parcela)
    VALUES (1, '2134567891249057', 'Carla Aparecida', '8909', '12', '2018', '1', '42.00');

INSERT INTO constitue(
            id_bolo, id_venda, porcao)
    VALUES (4, 1, 3.0);






 