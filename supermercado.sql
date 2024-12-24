create database supermercado;
use supermercado;

create table endereco (
id_endereco integer auto_increment primary key,
cep varchar(8) not null,
cidade varchar(50) not null,
logradouro varchar(50) not null,
bairro varchar(50) not null,
numero varchar(50) not null
);

create table produto (
id_produto integer auto_increment primary key,
protudo_nome varchar(50) not null,
descricao varchar(100),
categoria varchar(50) not null, 
preco decimal(10, 2) not null, 
codigo_barras varchar(20) not null
);


create table usuario (
id_usuario integer auto_increment primary key,
nome varchar(50) not null,
cpf varchar(11) not null,
email varchar(50) not null,
telefone varchar(50) not null,
id_endereco integer,
foreign key (id_endereco) references endereco(id_endereco)
);

create table historico_compra (
id_historico_compra integer auto_increment primary key,
data_compra date not null, 
hora_compra time not null, 
id_usuario integer, 
foreign key (id_usuario) references usuario(id_usuario), 
id_produto integer, 
foreign key (id_produto) references produto(id_produto)
);

create table colaborador (
id_colaborador integer auto_increment primary key,
nome varchar(50) not null, 
cpf varchar(50) not null,
email varchar(50) not null,
telefone varchar(50) not null,
cargo varchar(50) not null,
id_endereco integer,
foreign key (id_endereco) references endereco(id_endereco)
);

create table historico_venda (
id_historico_venda integer auto_increment primary key, 
data_compra date not null, 
hora_compra time not null, 
id_colaborador integer, 
foreign key (id_colaborador) references colaborador(id_colaborador), 
id_produto integer, 
foreign key (id_produto) references produto(id_produto)
);


-- Inserir endereços
INSERT INTO endereco (cep, cidade, logradouro, bairro, numero)
VALUES 
('06788670', 'Taboão da Serra', 'Rua Anjos', 'Panorama', '900'),
('88989200', 'Embu das Artes', 'Rua Padre Antonio', 'Jd. das Rosas', '89'),
('88020030', 'Florianópolis', 'Rua das Flores', 'Centro', '789'),
('20010010', 'Rio de Janeiro', 'Avenida Atlântica', 'Copacabana', '56');

-- Inserir produtos
INSERT INTO produto (nome, descricao, categoria, preco, codigo_barras)
VALUES 
('Água Mineral 1,5L', 'Água mineral natural, sem aditivos', 'Bebidas', 4.50, '5432109876543'),
('Açúcar Refinado 4kg', 'Açúcar cristalizado, origem nacional', 'Alimentícios', 18.20, '9876543210456'),
('Farinha de Trigo 2kg', 'Farinha refinada, ideal para panificação', 'Alimentícios', 12.50, '1234567890098'),
('Papel Higiênico 12 rolos', 'Papel higiênico macio, 2 camadas', 'Outros', 20.80, '6543210987654');

-- Inserir usuários
INSERT INTO usuario (nome, cpf, email, telefone, id_endereco)
VALUES 
('Luana Silva', '12345678901', 'luana.silva@email.com', '(11)91234-5678', 1),
('Pedro Moura', '98765432109', 'pedro.moura@email.com', '(31)98765-4321', 2),
('João Paulo', '44455566688', 'joao.paulo@email.com', '(61)94444-5555', 3),
('Mateus Oliveira', '88899900055', 'mateus.oliveira@supermercado.com', '(31)98888-9999', 4);

-- Inserir colaboradores
INSERT INTO colaborador (nome, cpf, email, telefone, cargo, id_endereco)
VALUES 
('Rafael Alves', '33344455566', 'rafael.alves@supermercado.com', '(81)933334444', 'Vendedor', 5),
('Gaba Ferreira', '77788899999', 'gaba.ferreira@supermercado.com', '(71)977778888', 'Vendedor', 6),
('Juliana Castro', '55566677744', 'juliana.castro@supermercado.com', '(21)955556666', 'Vendedor', 7),
('Leonardo Silva', '99900011122', 'leonardo.silva@supermercado.com', '(11)999990000', 'Fiscal', 8);

-- Inserir historico de compras
INSERT INTO historico_compra (data, hora, produto, quantidade)
VALUES
('2023-01-01', '09:00', 'Água Mineral 1,5L', 5),
('2023-01-05', '15:30', 'Farinha de Trigo 2kg', 2),
('2023-01-10', '12:45', 'Papel Higiênico 12 rolos', 3),
('2023-01-15', '10:15', 'Açúcar Refinado 4kg', 1),
('2023-01-20', '19:30', 'Água Mineral 1,5L', 2);

-- Inserir historico de vendas
INSERT INTO historico_venda (data, hora, total, id_produto, quantidade, forma_pagamento)
VALUES
('2023-01-01', '09:00', 22.50, 1, 5, 'Dinheiro'),
('2023-01-05', '15:30', 25.00, 2, 2, 'Cartão'),
('2023-01-10', '12:45', 62.40, 3, 3, 'Dinheiro'),
('2023-01-15', '10:15', 36.40, 4, 2, 'Cartão'),
('2023-01-20', '19:30', 45.00, 1, 10, 'Cheque'),
('2023-01-22', '14:00', 18.20, 2, 1, 'Dinheiro'),
('2023-01-25', '11:45', 82.00, 3, 4, 'Cartão'),
('2023-01-28', '17:30', 27.50, 4, 1, 'Dinheiro');

-- Selecionar dados
SELECT * FROM endereco;
SELECT * FROM produto;
SELECT * FROM usuario;
SELECT * FROM colaborador;
SELECT * FROM historico_compra;
SELECT * FROM historico_venda;

describe historico_compra;

SHOW TABLES;