create database db_comercio;
use db_comercio;

create table tb_categoria
(
categoria_id int not null auto_increment,
categoria_nome varchar(50) not null,
primary key (categoria_id)
);

insert into tb_categoria (categoria_nome)
values
('Eletrônicos'),
('Livros'),
('Roupas');

create table tb_produto
(
produto_id int not null auto_increment,
produto_nome varchar(100) not null,
preco decimal(10, 2) not null,
estoque int,
categoriaID int not null,
foreign key (categoriaID) references tb_categoria (categoria_id),
primary key (produto_id)
);

insert into tb_produto (produto_nome, preco, estoque, categoriaID)
values
('Smartphone Galaxy S23',5500.00,50,1),
('Notebook Dell XPS',8900.00,30,1),
('Monitor 4K LG',2300.00,45,1),
('O Senhor dos Anéis',120.50,100,2),
('Duna',89.90,80,2),
('Camiseta Básica',49.90,200,3),
('Calça Jeans',150.00,150,3);

select*from tb_categoria;
select*from tb_produto;

select p.produto_nome as produto, c.categoria_nome as categoria
from tb_produto as p inner join tb_categoria as c on p.categoriaID = c.categoria_id;

select produto_nome as nomes from tb_produto union
select categoria_nome from tb_categoria;

select*from tb_produto where produto_nome like 'Notebook%'
or produto_nome like 'Monitor%';

select*from tb_produto where preco between 50 and 500;

select categoriaID, max(preco) as Caro, min(preco) as Barato, avg(estoque) as MédiaEst
from tb_produto group by categoriaID;

select produto_nome, estoque from tb_produto order by estoque asc limit 3; 

select c.categoria_nome, count(p.produto_id) as QuantProduto, avg(p.preco) as mediaPreco
from tb_produto p inner join tb_categoria c on p.categoriaID = c.categoria_id 
group by c.categoria_nome having avg(p.preco) > 200;