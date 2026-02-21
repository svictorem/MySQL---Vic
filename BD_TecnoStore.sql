create database db_TecnoStore;
use db_TecnoStore;

create table tb_cliente
(
cliente_id int not null auto_increment,
cliente_nome varchar(100) not null,
cliente_cidade varchar(50) not null,
cliente_estado char(2),
primary key (cliente_id)
);

create table tb_produto
(
produto_id int not null auto_increment,
produto_nome varchar(100) not null,
produto_categoria varchar(50) not null,
produto_preco decimal(10, 2) not null,
primary key (produto_id)
);

create table tb_pedido
(
pedido_id int not null auto_increment,
clienteid int not null,
pedido_data date not null,
valor_total decimal(10, 2) not null,
foreign key (clienteid) references tb_cliente (cliente_id),
primary key (pedido_id)
);

create table tb_itensPedido
(
pedidoid int not null,
produtoid int not null,
quantidade int not null,
foreign key (pedidoid) references tb_pedido (pedido_id),
foreign key (produtoid) references tb_produto (produto_id)
);

select*from tb_cliente;
select*from tb_pedido;
select*from tb_produto;
select*from tb_itensPedido;

insert into tb_cliente (cliente_nome, cliente_cidade, cliente_estado)
values
('João Silva','São Paulo','SP'),
('Maria Souza','Campinas','SP'),
('Carlos Pereira','Rio de Janeiro','RJ'),
('Ana Lima','Belo Horizonte','MG');

insert into tb_produto (produto_nome, produto_categoria, produto_preco)
values
('Notebook Lenovo','Informática',3500.00),
('Mouse Logitech','Periféricos',150.00),
('Teclado Mecânico','Periféricos',450.00),
('Monitor Samsung','Monitores',1200.00);

insert into tb_pedido (clienteid, pedido_data, valor_total)
values
(1,'2025-10-01',3650.00),
(2,'2025-10-02',1650.00),
(1,'2025-10-05',1200.00),
(3,'2025-10-06',450.00);

insert into tb_itensPedido (pedidoid, produtoid, quantidade)
values
(1,1,100),
(1,2,100),
(1,1,101),
(2,3,101),
(1,4,102),
(1,3,103);

create view vw_clientes_SP as
select cliente_id, cliente_nome, cliente_cidade
from tb_cliente where cliente_estado = 'SP';

create view vw_vendas_resumo as
select cliente_nome, produto_nome, quantidade
from tb_cliente C 
join tb_pedido Pe on C.cliente_id = Pe.clienteid
join tb_itensPedido IP on Pe.pedido_id = IP.pedidoid
join tb_produto P on IP.produtoid = P.produto_id;

create view vw_produtos_reduzidos (Código, Produto, Preço) as
select produto_id, produto_nome, produto_preco
from tb_produto;

create view vw_top_vendas as
select produto_nome, sum(quantidade) as total_vendido
from vw_vendas_resumo
group by produto_nome
having sum(quantidade) > 50;

select produto_nome, total_vendido
from vw_top_vendas
order by produto_nome;


-- (Não consigo atualiza a vw_vendas_resumo porque ela é do tipo complexa)