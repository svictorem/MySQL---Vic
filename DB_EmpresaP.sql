create database db_empresaP;
use db_empresaP;

create table tb_funcionario
(
funcionario_id int not null auto_increment,
funcionario_nome varchar(50) not null,
funcionario_cargo varchar(50) not null,
funcionario_salario decimal(10, 2) not null,
primary key (funcionario_id)
);

insert into tb_funcionario (funcionario_nome, funcionario_cargo, funcionario_salario)
values
('Jon Snow','Desenvolvedor',4500.00),
('Daenerys Targaryen','Analista',3800.00),
('Arya Stark','Desenvolvedor',4800.00),
('Tyrion Lannister','DBA',5200.00),
('Euron Greyjoy','Suporte',3100.00);

create table tb_projeto
(
projeto_id int not null auto_increment,
projeto_nome varchar(100) not null,
projeto_responsavel varchar(50) not null,
primary key (projeto_id)
);

insert into tb_projeto (projeto_nome, projeto_responsavel)
values
('Site Institucional','Jon Snow'),
('App Mobile','Daenerys Targaryen'),
('ERP Interno','Arya Stark'),
('Dashboard BI','Varys');

select*from tb_funcionario;
select*from tb_projeto;

select funcionario_nome as nomesFuncionarios from tb_funcionario union all
select projeto_responsavel from tb_projeto;

select funcionario_nome as nomesFuncionarios from tb_funcionario union
select projeto_responsavel from tb_projeto;

select*from tb_funcionario where funcionario_nome like '%a%'
or funcionario_nome like '%A%';

select*from tb_funcionario where funcionario_salario between 4000.00 and 5000.00;

select min(funcionario_salario) as SalarioMin, 
max(funcionario_salario) as SalarioMax from tb_funcionario;

select funcionario_nome, funcionario_salario from tb_funcionario 
order by funcionario_salario desc limit 3;

select funcionario_cargo, count(*) as QuantFunc,
avg(funcionario_salario) as MediaSalario
from tb_funcionario 
group by funcionario_cargo having avg(funcionario_salario) > 4000.00;