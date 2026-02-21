create database bd_Lojinha2;
use bd_Lojinha2;

create table tb_clientes
(
	cliente_id int not null auto_increment,
    cliente_nome varchar(50) not null,
    cliente_cidade varchar(50) not null,
    primary key (cliente_id)
);

create table tb_pedidos
(
	pedido_id int not null auto_increment,
    clienteid int not null,
    valorTotal decimal(10, 2) check (valorTotal >= 0),
    dataPedido date,
    primary key (pedido_id),
	foreign key (clienteid) references tb_clientes(cliente_id)
);

insert into tb_clientes (cliente_nome, cliente_cidade)
values
('Anakin Skywalker','Tatooine'),
('Leia Organa','Alderaan'),
('Yoda','Dagobah'),
('Han Solo','Corellia');

insert into tb_pedidos (clienteid, valorTotal, dataPedido)
values
(1,500.00,'2025-01-15'),
(1,750.00,'2025-02-20'),
(2,1200.00,'2025-03-10'),
(2,300.00,'2025-04-05'),
(4,1500.00,'2025-05-12'),
(4,200.00,'2025-06-18'),
(4,800.00,'2025-07-22');

select*from tb_clientes;
select*from tb_pedidos;

select*from tb_pedidos p right join tb_clientes c on p.clienteid = c.cliente_id
order by cliente_nome asc;

select*from tb_pedidos p right join tb_clientes c on p.clienteid = c.cliente_id
where p.pedido_id is null;

select c.cliente_id, c.cliente_nome, sum(p.valorTotal) as totalGasto from tb_clientes c
left join tb_pedidos p on c.cliente_id = p.clienteid
group by c.cliente_id, c.cliente_nome;

select c.cliente_id, c.cliente_nome, sum(p.valorTotal) as totalGasto from tb_clientes c
left join tb_pedidos p on c.cliente_id = p.clienteid
group by c.cliente_id, c.cliente_nome having sum(p.valorTotal) > 1000;

insert into tb_pedidos (clienteid, valorTotal, dataPedido)
values
(3,-100.00,'2025-08-01');

select*from tb_pedidos where pedido_id = 8;

select c.cliente_cidade, avg(p.valorTotal) as mediaGasto from tb_clientes c
join tb_pedidos p on c.cliente_id = p.clienteid group by c.cliente_cidade
having avg(p.valorTotal) > 300;