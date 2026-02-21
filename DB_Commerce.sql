create database bd_commerce;
use bd_commerce;

create table tb_produto
(
	produto_id int not null auto_increment,
    produto_nome varchar(150) not null,
    produto_preço decimal(10, 2) not null,
    produto_estoque int default 0,
    primary key (produto_id)
);

create table tb_cliente
(
	cliente_id int not null auto_increment,
    cliente_nome varchar(150) not null,
    cliente_email varchar(255) not null unique,
    data_cadastro date not null,
    primary key (cliente_id)
);

select*from tb_produto;
select*from tb_cliente;

insert into tb_produto (produto_nome, produto_preço, produto_estoque)
values
('Notebook',2500.00,15),
('Smartphone',1200.00,30),
('Tablet',800.00,20),
('Monitor',600.00,25),
('Teclado Mecânico',250.00,40);

insert into tb_cliente (cliente_nome, cliente_email, data_cadastro)
values
('Majin Boo','majin_boo@dbz.com','2023-01-15'),
('Piccolo','piccolo@dbz.com','2023-02-20'),
('Goku','goku@dbz.com','2023-03-10'),
('Kuririn','kuririn@dbz.com','2023-04-05'),
('Vegeta','vegeta@dbz.com','2023-05-25');

select*from tb_produto;
select*from tb_cliente;

update tb_produto set produto_preço = 3650.00 where produto_id = 1;
select*from tb_produto where produto_id = 1;

alter table tb_produto add column produto_descrição varchar(255);
alter table tb_cliente add column cliente_telefone varchar(15);

select*from tb_produto;
select*from tb_cliente;

update tb_produto set produto_descrição = 'Notebook Dell Última Geração' where produto_id = 1;
update tb_produto set produto_descrição = 'Smartphone Mega Ultra Pro 10.000' where produto_id = 2;
update tb_produto set produto_descrição = 'Tablet Mega Ultra Power 20.000' where produto_id = 3;
update tb_produto set produto_descrição = 'Monitor 10D 100K' where produto_id = 4;
update tb_produto set produto_descrição = 'Teclado Mecânico que vira transforme e fica invisível' where produto_id = 5;

update tb_cliente set cliente_telefone = '(92) 64825-6792' where cliente_id = 1;
update tb_cliente set cliente_telefone = '(91) 84489-5655' where cliente_id = 2;
update tb_cliente set cliente_telefone = '(90) 54651-5454' where cliente_id = 3;
update tb_cliente set cliente_telefone = '(99) 16479-8448' where cliente_id = 4;
update tb_cliente set cliente_telefone = '(94) 44848-4148' where cliente_id = 5;

select*from tb_produto;
select*from tb_cliente;

alter table tb_produto change produto_preço ValorUnitario decimal(10, 2);
alter table tb_cliente change data_cadastro DataRegistro date;

select*from tb_produto;
select*from tb_cliente;

delete from tb_cliente where cliente_id = 4;
select*from tb_cliente where cliente_id = 4;

select*from tb_produto;
select*from tb_cliente;