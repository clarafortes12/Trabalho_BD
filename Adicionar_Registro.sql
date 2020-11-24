-- Autores: 
--     Lucas Gabriel de Oliveira Gurgel - 19/0121637 
--     Maria Clara Oliveira Fortes - 19/0017503

use hospital;

create procedure adicionar_uf(in nome varchar(45))
	insert into UF (nome_UF) values (nome);

create procedure adicionar_cidade(in nome varchar(45), in ddd int, in uf int)
	insert into Cidade (nome_cidade, DDD, UF_idUF) values (nome, ddd, uf);

create procedure adicionar_bairro(in nome varchar(45), in cidade int)
	insert into Bairro(nome_bairro, Cidade_idCidade) values (nome, cidade);

create procedure adicionar_tipo_endereco(in descricao varchar(45))
	insert into Tipo_Endereco(descricao_tipoendereco) values (descricao);

create procedure adicionar_endereco(in cep varchar(8), in nome_rua varchar(45), in compl varchar(45),
									in numero_casa int, in tipo_ender int, in bairro int)
	insert into Endereco(CEP, nome_rua, complemento, numero_casa, Tipo_Endereco_IdTipo_Endereco, Bairro_idBairro)
		values (cep, nome_rua, compl, numero_casa, tipo_ender, bairro);

create procedure adicionar_hospital(in nome varchar(45), in cnpj varchar(15), in endereco int)
	insert into Hospital (nome_hospital, cnpj, Endereco_idEndereco) 
		values (nome, cnpj, endereco);

create procedure adicionar_ala(in descricao varchar(45), in cnpj varchar(15))
	insert into Ala (descricao_Ala, Hospital_cnpj) values (descricao, cnpj);

create procedure adicionar_tipo_telefone(in descricao varchar(45))
	insert into Tipo_Telefone (descricao_tipotelefone) values (descricao);

create procedure adicionar_tipo_convenio(in descricao varchar(45))
	insert into Tipo_Convenio (descricao_tipoconvenio) values (descricao);

create procedure adicionar_sexo(in descricao varchar(45))
	insert into Sexo (descricao_sexo) values (descricao);

create procedure adicionar_plano_saude(in descricao varchar(45), in nome varchar(15))
	insert into Plano_Saude (descricao_planosaude, nome_planosaude) values (descricao, nome);

create procedure adicionar_estado_civil(in descricao varchar(45))
	insert into Estado_Civil (descricao_estadocivil) values (descricao);

create procedure adicionar_telefone(in numero varchar(11), in cidade int, in tipo int)
	insert into Telefone (numero_telefone, Cidade_idCidade, Tipo_Telefone_idTipo_Telefone) values (numero, cidade, tipo);

create procedure adicionar_enfermaria(in descricao mediumtext, in ala int, in telefone int)
	insert into Enfermaria (descricao_enfermaria, Ala_cod_Ala, Telefone_idTelefone) values (descricao, ala, telefone);

create procedure adicionar_laboratorio(in descricao varchar(45), in endereco int)
	insert into Laboratorio (descricao_laboratorio, Endereco_idEndereco) values (descricao, endereco);

create procedure adicionar_convenio(in descricao varchar(45), in valor float, in tipo int, in laboratorio int, in hospital varchar(45))
	insert into Convenio (descricao_convenio, valor_convenio, Tipo_Convenio_cod_TipoConvenio, Laboratorio_cod_Laboratorio, Hospital_cnpj)
		values (descricao, valor, tipo, laboratorio, hospital);

create procedure adicionar_equipamento(in descricao varchar(45), in fabricante varchar(45), in enfermaria int)
	insert into Equipamento (descricao_equipamento, fabricante, Enfermaria_cod_Enfermaria) values
		(descricao, fabricante, enfermaria);

create procedure adicionar_pessoa(in cpf varchar(12), in nome varchar(45), in data_nascimento date, in email varchar(45),
									in endereco int, in civil int, in sexo int, in telefone int)
	insert into Pessoa (CPF, nome_pessoa, data_nascimento, email, Endereco_idEndereco, 
						Estado_Civil_cod_EstadoCivil, Sexo_cod_Sexo, Telefone_idTelefone) values
				(cpf, nome, data_nascimento, email, endereco, civil, sexo, telefone);

create procedure adicionar_paciente(in codigo int, in peso float, in altura float, in cpf varchar(12))
	insert into Paciente (Plano_Saude_cod_PlanoSaude, peso_paciente, altura_paciente, Pessoa_CPF) values (codigo, peso, altura, cpf);

create procedure adicionar_funcionario(in salario float, in cpf varchar(45))
	insert into Funcionario (salario, Pessoa_CPF) values (salario, cpf);

create procedure adicionar_dependente (in tipo varchar(45), in cpf varchar(45), in funcionario int)
	insert into Dependente (tipo_dependente, Pessoa_CPF, Funcionario_cod_Funcionario) values (tipo, cpf, funcionario);

create procedure adicionar_medico(in crm varchar(45), in titulacao varchar(45), in filiacao varchar(45), in funcionario int)
	insert into Medico (CRM, titulacao, filiacao, Funcionario_cod_Funcionario) values (crm, titulacao, filiacao, funcionario);

create procedure adicionar_enfermeiro(in coren varchar(45), in formacao varchar(45), in funcionario int)
	insert into Enfermeiro (COREN, formacao_enfermeiro, Funcionario_cod_Funcionario) values (coren, formacao, funcionario);

create procedure adicionar_consulta(in motivo varchar(45), in crm varchar(45), in paciente int, in enfermaria int)
	insert into Consulta (motivo, Medico_CRM, Paciente_cod_Paciente, Enfermaria_cod_Enfermaria) values (motivo, crm, paciente, enfermaria);

create procedure adicionar_receita(in data_receita date, in consulta int)
	insert into Receita (data_receita, Consulta_cod_Consulta) values (data_receita, consulta);

create procedure adicionar_exame(in descricao varchar(45), in restricao varchar(45), in consulta int, in laboratorio int, in coren varchar(45))
	insert into Exame (descricao_exame, restricao_exame, Consulta_cod_Consulta, Laboratorio_cod_Laboratorio, Enfermeiro_COREN) values
		(descricao, restricao, consulta, laboratorio, coren);

create procedure adicionar_remedio(in descricao varchar(45), in dias int, in intervalo varchar(45), in nome varchar(45), in receita int)
	insert into Remedio (descricao, dias_uso, intervalo_uso, nome_remedio, Receita_idReceita) values
		(descricao, dias, intervalo, nome, receita);