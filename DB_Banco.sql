create database db_banco;
use db_banco;

create table tb_conta
(
conta_id int not null auto_increment,
conta_nome varchar(100) not null,
conta_saldo decimal(10, 2) not null,
primary key (conta_id)
);

insert into tb_conta (conta_nome, conta_saldo)
values
('Lady Gaga',1000.00),
('Bob Marley',500.00),
('Katy Perry',1500.00);

select*from tb_conta;

update tb_conta set conta_saldo = 1250.00 where conta_id = 1;

start transaction;

update tb_conta set conta_saldo = 1200.00 where conta_id = 3;
update tb_conta set conta_saldo = 800.00 where conta_id = 2;

commit;

delete from tb_conta where conta_id = 2;

select*from tb_conta where conta_saldo > 1000;

select*from tb_conta order by conta_saldo desc;