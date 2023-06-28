# Atividade do módulo 6 do curso de Java Avançado da Mentorama

Criar um modelo de dados e escrever seu SQL para criação de tabelas, colunas e constrainsts atendendo aos seguintes requisitos:

O modelo deve atender um sistema hospitalar com os seguintes requisitos:

- Precisamos armazenar dados de profissionais de medicina com os seguintes campos:
  - Matrícula
  - Nome
  - Cargo
  - Departamento
  - Telefone
    
- Precisamos armazenar os dados do paciente com os seguintes campos:
  - Id
  - Nome
  - Telefone
  - Data de nascimento

- Precisamos armazenar o histórico de internações do paciente:
  - Data e hora da entrada do paciente
  - Data e hora da saída do paciente
  - Descrição do diagnóstico
  - Médico responsável

- Após a criação das tabelas, devem ser inseridos os seguintes dados:
  - 3 pacientes, cada um com pelo menos 1 histórico de internação;
  - 5 profissionais, utilizando pelo menos 3 cargos e departamentos diferentes.

- E, por fim, escreva SQL com as seguintes consultas:
  - Agrupamento da quantidade de internações por paciente ordenados da maior quantidade para a menor;
  - Agrupamento da quantidade de médicos por departamento.
