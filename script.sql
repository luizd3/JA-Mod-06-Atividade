-- Tarefa do Módulo 6 do curso de Java Avançado da Mentorama

create database sghm; -- Sistema de Gerenciamento Hospitalar da Mentorama

-- Criação das tabelas e constraints

create table medicos (
	matricula int primary key generated by default as identity,
	nome varchar(200),
	cargo varchar(200),
	departamento varchar(200),
	telefone varchar(11)
);

create table pacientes (
	id int primary key generated by default as identity,
	nome varchar(200),
	telefone varchar(11),
	data_nascimento date
);

create table historico_internacoes (
	id int primary key generated by default as identity,
	id_paciente int,
	entrada_paciente timestamp,
	saida_paciente timestamp,
	diagnostico varchar(1000),
	matricula_medico int,
	constraint fk_paciente
		foreign key (id_paciente)
		references pacientes(id),
	constraint fk_medico
		foreign key (matricula_medico)
		references medicos(matricula)
);

-- Inserindo dados

insert into pacientes 
(nome, telefone, data_nascimento)
values
('João da Silva', '11999999999','1980-01-20'),
('Maria Joana Alves', '12888888888', '1974-11-03'),
('Paulo Roberto Souza', '11999999999', '2015-04-14');

insert into medicos 
(nome, cargo, departamento, telefone)
values
('Heitor Nunes', 'Médico Intensivista', 'UTI Adulto', '11999999999'),
('Cláudio José', 'Pediatra', 'UTI Pediátrica', '11999999999'),
('José Borges', 'Cardiologista', 'UTI Adulto', '11999999999'),
('João Souza', 'Clínico Geral', 'Pronto-Atendimento', '11999999999'),
('Vitor Salgado', 'Clínico Geral', 'UTI Adulto', '11999999999');

insert into historico_internacoes 
(id_paciente, entrada_paciente, saida_paciente, diagnostico, matricula_medico)
values
('1', '2023-05-03 10:30:00', '2023-05-04 11:45:00', 'Internação para pequena circurgia na mão', 4),
('1', '2023-05-10 09:00:00', '2023-05-11 08:34:00', 'Retorno para finalização do tratamento', 4),
('2', '2023-01-11 20:40:00', '2023-01-15 12:35:00', 'Tratamento do coração', 3),
('2', '2023-01-19 06:10:20', '2023-01-19 22:08:50', 'Exames', 3),
('2', '2023-03-02 11:05:30', '2023-03-03 21:43:34', 'Cirurgia cardíaca', 3),
('3', '2023-04-15 17:57:10', '2023-04-16 07:53:32', 'Tratamento de fratura', 2);

-- Consultas

-- Agrupamento da quantidade de internações por paciente ordenados da maior quantidade para a menor:

select 	p.nome as nome_paciente,
		count(hi.id_paciente) as quant_internacoes
from historico_internacoes hi
	inner join pacientes p 
	on hi.id_paciente = p.id
group by p.nome
order by quant_internacoes desc;

-- Agrupamento da quantidade de médicos por departamento:

select 	departamento,
		count(departamento) as quant_medicos
from medicos
group by departamento;
