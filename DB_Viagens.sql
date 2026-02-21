create database bd_viagens;
use bd_viagens;

create table tb_viajante
(
viajante_id int not null auto_increment,
viajante_nome varchar(50) not null,
viajante_destino varchar(50) not null,
primary key (viajante_id)
);

insert into tb_viajante (viajante_nome, viajante_destino)
values
('Frodo Baggins','Shire'),
('Aragorn','Gondor'),
('Galadriel','Lothlórien'),
('Legolas','Mirkwood');

create table tb_viagem
(
viagem_id int not null auto_increment,
viajanteid int not null,
custoTotal decimal(10, 2) check (custoTotal >= 0) not null,
viagemData date not null,
foreign key (viajanteid) references tb_viajante (viajante_id),
primary key (viagem_id)
);

insert into tb_viagem (viajanteid, custoTotal, viagemData)
values
(1,600.00,'2025-01-15'),
(1,900.00,'2025-02-20'),
(3,1400.00,'2025-03-10'),
(4,350.00,'2025-04-05');

select*from tb_viajante;
select*from tb_viagem;

 select viajante_id as viajanteid, viajante_nome,
 viagem_id as viagemid, custoTotal from tb_viajante
 left join tb_viagem on viajante_id = viajanteid order by viajante_nome;

select viajante_id as viajanteid, viajante_nome,
 viagem_id as viagemid, custoTotal, viagemData from tb_viajante
 left join tb_viagem on viajante_id = viajanteid
 where viagemData > '2025-02-01' order by viajante_nome;

select viajante_id as viajanteid, viajante_nome,
coalesce(sum(custoTotal), 0) as total_gasto
from tb_viajante left join tb_viagem on viajante_id = viajanteid
group by viajante_id, viajante_nome;

select viajante_id as viajanteid, viajante_nome,
sum(custoTotal) as total_gasto
from tb_viajante left join tb_viagem on viajante_id = viajanteid
group by viajante_id, viajante_nome having sum(custoTotal) > 1000;

insert into tb_viagem (viajanteid, custoTotal, viagemData)
values
(2, -100.00, '2025-05-01');

select viajante_destino, avg(custoTotal) as media_custo
from tb_viajante join tb_viagem on viajante_id = viajanteid
group by viajante_destino having avg(custoTotal) > 300;