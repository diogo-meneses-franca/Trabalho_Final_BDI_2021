DROP DATABASE IF EXISTS crispim;

-- CRIAÇÃO DO BANCO DE DADOS

CREATE DATABASE crispim;

USE crispim;

-- CRIAÇÃO DAS TABELAS DO BANCO DE DADOS

CREATE TABLE estado(
    id_estado INT NOT NULL AUTO_INCREMENT UNIQUE
    ,nome_estado VARCHAR(200) NOT NULL
    ,sigla_estado CHAR(2) NOT NULL
    ,ativo CHAR(1) NOT NULL DEFAULT 'S' CHECK(ativo IN('S', 'N'))
    ,data_cadastro_estado DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,CONSTRAINT pk_estado PRIMARY KEY estado(id_estado)
);

CREATE TABLE categoria_produto(
    id_categoria_produto INT NOT NULL AUTO_INCREMENT UNIQUE
    ,nome_categoria_produto VARCHAR(100) NOT NULL
    ,data_cadastro_categoria_produto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,ativo CHAR(1) NOT NULL DEFAULT 'S' CHECK(ativo IN('S', 'N'))
    ,CONSTRAINT pk_categoria_produto PRIMARY KEY categoria_produto(id_categoria_produto)
);

CREATE TABLE forma_de_pagamento(
    id_fpagamento INT NOT NULL AUTO_INCREMENT UNIQUE
    ,nome_fpagamento VARCHAR(100) NOT NULL
    ,data_cadastro_fpagamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,ativo CHAR(1) NOT NULL DEFAULT 'S' CHECK(ativo IN('S', 'N'))
    ,CONSTRAINT pk_fpagamento PRIMARY KEY forma_de_pagamento(id_fpagamento)
);

CREATE TABLE cidade(
    id_cidade INT NOT NULL AUTO_INCREMENT UNIQUE
    ,nome_cidade VARCHAR(200) NOT NULL
    ,data_cadastro_cidade DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,ativo CHAR(1) NOT NULL DEFAULT 'S' CHECK(ativo IN('S', 'N'))
    ,estado_id INT NOT NULL
    ,CONSTRAINT pk_cidade PRIMARY KEY cidade(id_cidade)
    ,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado(id_estado)
);

CREATE TABLE produto(
    id_produto INT NOT NULL AUTO_INCREMENT UNIQUE
    ,nome_produto VARCHAR(200) NOT NULL
    ,preco_produto DECIMAL(10,2) NOT NULL
    ,data_cadastro_produto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,ativo CHAR(1) NOT NULL DEFAULT 'S' CHECK(ativo IN('S', 'N'))
    ,categoria_id INT
    ,CONSTRAINT pk_produto PRIMARY KEY produto(id_produto)
    ,CONSTRAINT fk_categori_produto FOREIGN KEY (categoria_id) REFERENCES categoria_produto(id_categoria_produto)
);

CREATE TABLE cliente(
    id_cliente INT NOT NULL AUTO_INCREMENT UNIQUE
    ,nome_cliente VARCHAR(200) NOT NULL
    ,cpf_cliente VARCHAR(20) NOT NULL UNIQUE
    ,endereco_cliente VARCHAR(200) NOT NULL
    ,endereco_numero VARCHAR(10) NOT NULL
    ,data_cadastro_cliente DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,ativo CHAR(1) NOT NULL DEFAULT 'S' CHECK(ativo IN('S', 'N'))
    ,cidade_id INT NOT NULL
    ,CONSTRAINT pk_cliente PRIMARY KEY cliente(id_cliente)
    ,CONSTRAINT fk_cidade_cliente FOREIGN KEY (cidade_id) REFERENCES cidade(id_cidade)
);

CREATE TABLE venda(
    id_venda INT NOT NULL AUTO_INCREMENT UNIQUE
    ,data_e_hora_venda DATETIME DEFAULT CURRENT_TIMESTAMP
    ,cliente_id INT NOT NULL
    ,CONSTRAINT pk_venda PRIMARY KEY venda(id_venda)
    ,CONSTRAINT fk_venda_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
);

CREATE TABLE item_venda(
    id_item_venda INT NOT NULL AUTO_INCREMENT UNIQUE
    ,produto_id INT NOT NULL
    ,quantidade_produto INT NOT NULL
    ,data_e_hora_item_venda DATETIME DEFAULT CURRENT_TIMESTAMP
    ,venda_id INT NOT NULL
    ,CONSTRAINT pk_item_venda PRIMARY KEY item_venda(id_item_venda)
    ,CONSTRAINT fk_produto_id FOREIGN KEY (produto_id) REFERENCES produto(id_produto)
    ,CONSTRAINT fk_venda_id FOREIGN KEY (venda_id) REFERENCES venda(id_venda)
);

CREATE TABLE pagamento(
    id_pagamento INT NOT NULL AUTO_INCREMENT UNIQUE
    ,status_pagamento VARCHAR(20) NOT NULL
    ,data_e_hora_pagamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,total_bruto INT NOT NULL
    ,desconto INT
    ,total_liquido INT NOT NULL
    ,fpagamento_id INT NOT NULL
    ,venda_id INT NOT NULL
    ,CONSTRAINT pk_pagamento PRIMARY KEY pagamento(id_pagamento)
    ,CONSTRAINT status_pagamento_padrao CHECK(status_pagamento IN('PENDENTE', 'PAGO'))
    ,CONSTRAINT fk_pagamento_fpagamento FOREIGN KEY (fpagamento_id) REFERENCES forma_de_pagamento(id_fpagamento)
    ,CONSTRAINT fk_pagamento_venda FOREIGN KEY (venda_id) REFERENCES venda(id_venda)
);

-- ALIMENTANDO O BANDO DE DADOS

-- ESTADOS

INSERT INTO estado (nome_estado, sigla_estado) VALUES ('PARANÁ', 'PR');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('RIO GRANDO DO SUL', 'RS');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('SANTA CATARINA', 'SC');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('ESPIRITO SANTO', 'ES');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('SÃO PAULO', 'SP');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('RIO DE JANEIRO', 'RJ');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('MINAS GERAIS', 'MG');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('MATO GROSSO DO SUL', 'MS');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('MATO GROSSO', 'MT');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('TOCANTINS', 'TO');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('AMAZONAS', 'AM');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('GOIÁS', 'GO');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('RONDONIA', 'RO');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('ACRE', 'AC');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('RORAIMA', 'RR');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('PARÁ', 'PA');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('AMAPÁ', 'AP');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('MARANHÃO', 'MA');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('PIAUÍ', 'PI');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('RIO GRANDE DO NORTE', 'RN');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('PARAÍBA', 'PB');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('PERNAMBUCO', 'PE');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('ALAGOAS', 'AL');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('SERGIPE', 'SE');
INSERT INTO estado (nome_estado, sigla_estado) VALUES ('BAHIA', 'BA');

-- CATEGORIAS DE PRODUTOS

INSERT INTO categoria_produto (nome_categoria_produto) VALUES ('LANCHE');
INSERT INTO categoria_produto (nome_categoria_produto) VALUES ('LANCHE GOURMET');
INSERT INTO categoria_produto (nome_categoria_produto) VALUES ('PORÇÃO');
INSERT INTO categoria_produto (nome_categoria_produto) VALUES ('COMBO');
INSERT INTO categoria_produto (nome_categoria_produto) VALUES ('SUCO');
INSERT INTO categoria_produto (nome_categoria_produto) VALUES ('BEBIDA');

-- CIDADES

INSERT INTO cidade(nome_cidade, estado_id) VALUES ('TERRA RICA', 1);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('PARANAVAÍ', 1);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('MARGINÁ', 1);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('CURITIBA', 1);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('PORTO ALEGRE', 2);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('FLORIANÓPOLIS', 3);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('ITAJAÍ', 3);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('BALNEÁRIO CAMBORIÚ', 3);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('SÃO PAULO', 5);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('SANTO ANASTÁCIO', 5);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('VITÓRIA', 4);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('RIO DE JANEIRO', 6);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('BELO HORIZONTE', 7);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('CAMPO GRANDE', 8);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('CUIABÁ', 9);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('PALMAS', 10);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('MANAUS', 11);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('GOIANIA', 12);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('PORTO VELHO', 13);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('RIO BRANCO', 14);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('BOA VISTA', 15);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('BELÉM', 16);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('MACAPÁ', 17);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('SÃO LUÍS', 18);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('TERESINA', 19);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('NATAL', 20);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('JOÃO PESSOA', 21);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('RECIFE', 22);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('MACEIÓ', 23);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('ARACAJU', 24);
INSERT INTO cidade(nome_cidade, estado_id) VALUES ('SALVADOR', 25);

-- FORMA DE PAGAMENTO

INSERT INTO forma_de_pagamento(nome_fpagamento) VALUES ('DÉBITO');
INSERT INTO forma_de_pagamento(nome_fpagamento) VALUES ('CRÉDITO');
INSERT INTO forma_de_pagamento(nome_fpagamento) VALUES ('DINHEIRO');
INSERT INTO forma_de_pagamento(nome_fpagamento) VALUES ('PIX');

-- PRODUTOS

INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('HOT DOG', 12.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('MISTO QUENTE', 12.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('PRENSADO DE CARNE', 14.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('PRENSADO DE CARNE DUPLO', 15.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('PRENSADO DE CARNE COM BACON', 15.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('PRENSADO DE FRANGO', 14.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('PRENSADO DE FRANGO COM CATUPIRY', 15.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('PRENSADO DE FRANGO DUPLO', 15.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('PRENSADO DE FRANGO COM BACON', 15.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('X-BACON', 16.50, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('X-CALABRESA', 16.50, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('X-BURGUER', 15.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('X-CRISPINZINHO', 15.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('X-BACONLEZA', 19.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('X-EGG', 19.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('X-CRISPIN', 22.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('X-FILÉ MIGNON', 25.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('X-FILÉ DE FRANGO', 25.00, 1);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('BIG BURGUER', 15.00, 2);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('BIG SALADA', 17.00, 2);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('BIG BACON', 18.00, 2);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('BIG EGG', 18.00, 2);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('BIG ESPECIAL', 19.00, 2);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('BIG FILÉ MIGNON', 22.00, 2);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('X-COSTELA DORITOS', 25.00, 2);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('X-COSTELA BACON', 25.00, 2);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('X-COSTELA CALABRESA', 25.00, 2);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('BATATA COM QUEIJO E BACON', 18.00, 3);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('BATATA COM CHEDDAR E BACON', 20.00, 3);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('BATATA COM QUEIJO', 15.00, 3);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('BATATA COM BACON', 15.00, 3);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('CALABRESA COM CEBOLA', 20.00, 3);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('FILÉ DE TILAPIA', 25.00, 3);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('FRANGO FRITO', 20.00, 3);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('TORRESMO', 20.00, 3);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('POLENTA', 20.00, 3);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('COMBO 01', 30.00, 4);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('COMBO 02', 30.00, 4);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('SUCO DE LARANJA', 10.00, 5);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('SUCO DE MARACUJÁ', 10.00, 5);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('SUCO DE ABACAXI', 10.00, 5);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('SUCO DE ABACAXI COM HORTELÃ', 10.00, 5);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('SUCO DE LIMÃO', 10.00, 5);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('SUCO DE MORANGO', 10.00, 5);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('REFRIGERANTE LATA 350ML', 4.00, 6);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('FANTA', 4.00, 6);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('COCA', 4.00, 6);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('GUARANÁ', 4.00, 6);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('COCA-COLA 600ML', 5.00, 6);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('COCA-COLA 1L', 6.00, 6);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('COCA-COLA 2L', 10.00, 6);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('TUBAÍNA 600ML', 3.50, 6);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('TUBAÍNA 2L', 6.00, 6);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('SUCO PRATS 350ML', 4.50, 5);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('SUCO PRATS 1L', 9.00, 5);
INSERT INTO produto(nome_produto, preco_produto, categoria_id) VALUES ('SKOL LATA 350ML', 4.00, 6);

INSERT INTO cliente(nome_cliente, cpf_cliente, endereco_cliente, endereco_numero, cidade_id ) VALUES ('DIOGO MENESES DE FRANÇA', '34697928873', 'RUA MATO GROSSO', '1050', 1);
INSERT INTO cliente(nome_cliente, cpf_cliente, endereco_cliente, endereco_numero, cidade_id ) VALUES ('CARLOS EDUARDO DE FRANÇA', '04348706921', 'RUA MATO GROSSO', '1050', 1);
INSERT INTO cliente(nome_cliente, cpf_cliente, endereco_cliente, endereco_numero, cidade_id ) VALUES ('ARACELES DE MENESES', '26661568852', 'RUA DOM PEDRO I', '70 C', 10);
