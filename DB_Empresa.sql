create database empresa_bd;
use empresa_bd;

create table tb_funcionario
(
	funcionario_id int not null auto_increment,
    funcionario_nome varchar(50) not null,
    funcionario_cargo varchar(50) not null,
    funcionario_salario decimal(10, 2) not null,
    primary key(funcionario_id)
);

insert into tb_funcionario (funcionario_nome, funcionario_cargo, funcionario_salario)
values
('Fernando Henrique','Desenvolvedor',4500.00),
('Carlos Chagas','Analista',3800.00),
('Paula Fernandes','DBA',5200.00),
('Ludmila Anita','Desenvolvedor',4700.00);

select*from tb_funcionario where funcionario_cargo = 'Desenvolvedor'
order by funcionario_salario desc;

update tb_funcionario set funcionario_salario = 4000.00 where funcionario_id = 2;

select*from tb_funcionario where funcionario_id = 2;

select avg(funcionario_salario) as SalarioMedio,
count(*) as TotalFuncionarios from tb_funcionario;

delete from tb_funcionario where funcionario_salario < 4000.00;

select*from tb_funcionario;

create table tb_departamento
(
	departamento_id int not null auto_increment,
    departamento_nome varchar(50) not null,
    primary key(departamento_id)
);

insert into tb_departamento (departamento_nome)
values
('TI'),
('RH'),
('Financeiro');

select*from tb_departamento;

alter table tb_funcionario add departamentoid int,
add constraint fk_departamento
 foreign key (departamentoid) references tb_departamento(departamento_id);

update tb_funcionario set departamentoid = 1 where funcionario_id = 1;
update tb_funcionario set departamentoid = 1 where funcionario_id = 2;
update tb_funcionario set departamentoid = 3 where funcionario_id = 3;
update tb_funcionario set departamentoid = 2 where funcionario_id = 4;