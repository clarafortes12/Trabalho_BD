-- Autores: 
--     Lucas Gabriel de Oliveira Gurgel - 19/0121637 
--     Maria Clara Oliveira Fortes - 19/0017503

USE hospital;

/*INSERT INTO uf (nome_UF) VALUES 
('Santa Amaro');
INSERT INTO cidade (nome_cidade, DDD, UF_idUF) VALUES 
('Santa Maria', 66, 1);
INSERT INTO bairro (nome_bairro, Cidade_idCidade) VALUES 
('Santa Maria', 1);
INSERT INTO tipo_endereco (descricao_tipoendereco) VALUES 
('Residencial');
INSERT INTO endereco (CEP, nome_rua, complemento, numero_casa, Tipo_Endereco_IdTipo_Endereco,Bairro_idBairro) VALUES 
('70673530', 'rua','bloco x',1,1,1);
INSERT INTO hospital (nome_hospital, cnpj, Endereco_idEndereco) VALUES 
('Santa Maria', '12345678912345',1);
INSERT INTO ala (descricao_Ala, Hospital_cnpj) VALUES 
('ala_norte','12345678912345');
INSERT INTO tipo_telefone (descricao_tipotelefone) VALUES 
('Residencial');
INSERT INTO tipo_convenio (descricao_tipoconvenio) VALUES 
('convenio info');
INSERT INTO sexo (descricao_sexo) VALUES 
('feminino');
INSERT INTO plano_saude (descricao_planosaude, nome_planosaude) VALUES 
('plano completo', 'compania plano');
INSERT INTO estado_civil (descricao_estadocivil) VALUES 
('solteito');
INSERT INTO telefone (numero_telefone, Cidade_idCidade, Tipo_Telefone_idTipo_Telefone) VALUES 
('99999999999', 1,1);
INSERT INTO enfermaria (descricao_enfermaria, Ala_cod_Ala, Telefone_idTelefone) VALUES 
('dermato', 1,1);
INSERT INTO laboratorio (descricao_laboratorio, Endereco_idEndereco) VALUES 
('Santana', 1);
INSERT INTO convenio (descricao_convenio, valor_convenio, Tipo_Convenio_cod_TipoConvenio, Laboratorio_cod_Laboratorio, Hospital_cnpj) VALUES 
('111111111111', 1000, 1, 1,'12345678912345');
INSERT INTO equipamento (descricao_equipamento, fabricante, Enfermaria_cod_Enfermaria) VALUES 
('maquina', 'Joao', 1);
INSERT INTO pessoa (CPF, nome_pessoa, data_nascimento, email, Endereco_idEndereco, Estado_Civil_cod_EstadoCivil, Sexo_cod_Sexo, Telefone_idTelefone) VALUES 
('11111111111', 'Joao', '2018-12-03', 'joao@hotmail.com', 1, 1, 1, 1);
INSERT INTO paciente (Plano_Saude_cod_PlanoSaude, peso_paciente, altura_paciente, Pessoa_CPF) VALUES 
('1', 1.67, 68.99, '11111111111');
INSERT INTO funcionario (salario, Pessoa_CPF) VALUES 
(15000, '11111111111');
INSERT INTO dependente (tipo_dependente,Pessoa_CPF,Funcionario_cod_Funcionario) VALUES 
('mae', '11111111111', 1);
INSERT INTO medico (CRM, titulacao, filiacao, Funcionario_cod_Funcionario) VALUES 
('111111111', 'titulo', 'filia', 1);
INSERT INTO enfermeiro (COREN, formacao_enfermeiro, Funcionario_cod_Funcionario) VALUES 
('111111111', 'forma', 1);
INSERT INTO consulta (motivo, Medico_CRM, Paciente_cod_Paciente, Enfermaria_cod_Enfermaria) VALUES 
('diaria', '111111111', 1, 1);
INSERT INTO receita (data_receita, Consulta_cod_Consulta) VALUES 
('11/11/1111', 1);
INSERT INTO exame (descricao_exame, restricao_exame, Consulta_cod_Consulta, Laboratorio_cod_Laboratorio, Enfermeiro_COREN) VALUES 
('aa','aa', 1, 1, '111111111');
INSERT INTO remedio (descricao, dias_uso, intervalo_uso, nome_remedio, Receita_idReceita) VALUES 
('aa', 30, '1h', 'loratadina', 1);*/

/*DROP PROCEDURE alterar_uf;
DROP PROCEDURE alterar_cidade;
DROP PROCEDURE alterar_bairro;
DROP PROCEDURE alterar_tipo_endereco;
DROP PROCEDURE alterar_endereco;
DROP PROCEDURE alterar_hospital;
DROP PROCEDURE alterar_ala;
DROP PROCEDURE alterar_tipo_telefone;
DROP PROCEDURE alterar_tipo_convenio;
DROP PROCEDURE alterar_sexo;
DROP PROCEDURE alterar_plano_saude;
DROP PROCEDURE alterar_estado_civil;
DROP PROCEDURE alterar_telefone;
DROP PROCEDURE alterar_enfermaria;
DROP PROCEDURE alterar_laboratorio;
DROP PROCEDURE alterar_convenio;
DROP PROCEDURE alterar_equipamento;
DROP PROCEDURE alterar_pessoa;
DROP PROCEDURE alterar_paciente;
DROP PROCEDURE alterar_funcionario;
DROP PROCEDURE alterar_dependente;
DROP PROCEDURE alterar_medico;
DROP PROCEDURE alterar_enfermeiro;
DROP PROCEDURE alterar_consulta;
DROP PROCEDURE alterar_receita;
DROP PROCEDURE alterar_exame;
DROP PROCEDURE alterar_remedio;*/

CREATE PROCEDURE alterar_uf(IN id int, In nome varchar(45))
	UPDATE uf SET nome_UF = 
		CASE 
			WHEN nome <> '' THEN nome
            ELSE nome_UF
        END
    WHERE idUF = id;

CREATE PROCEDURE alterar_cidade(IN id int, In nome varchar(45), IN ddd_valor int, IN id_uf int)
	UPDATE cidade SET nome_cidade = 
		CASE 
			WHEN nome <> '' THEN nome
            ELSE nome_cidade
        END, 
        DDD = CASE 
			WHEN ddd_valor > 0 THEN ddd_valor
            ELSE DDD
        END,
        UF_idUF = CASE 
			WHEN id_uf > 0 THEN id_uf
            ELSE UF_idUF
        END
        WHERE idCidade = id;
        
CREATE PROCEDURE alterar_bairro(IN id int, In nome varchar(45), IN id_cidade int)
	UPDATE bairro SET nome_bairro = 
		CASE 
			WHEN nome <> '' THEN nome
            ELSE nome_bairro
        END, 
        Cidade_idCidade = CASE 
			WHEN id_cidade > 0 THEN id_cidade
            ELSE Cidade_idCidade
        END
        WHERE idBairro = id;

CREATE PROCEDURE alterar_tipo_endereco(IN id int, In descricao varchar(45))
	UPDATE tipo_endereco SET descricao_tipoendereco = 
		CASE 
			WHEN descricao <> '' THEN descricao
            ELSE descricao_tipoendereco
        END
    WHERE idTipo_Endereco = id;
    
CREATE PROCEDURE alterar_endereco(IN id int, In cep_valor varchar(8), In rua varchar(45), 
	In comple varchar(45), In casa int, IN idTipo int, IN idBairro int)
	UPDATE endereco SET CEP = 
		CASE 
			WHEN cep_valor <> '' THEN cep_valor
            ELSE CEP
        END, 
        nome_rua = CASE 
			WHEN rua <> '' THEN rua
            ELSE nome_rua
        END,
        complemento = CASE 
			WHEN comple <> '' THEN comple
            ELSE complemento
        END,
        numero_casa = CASE 
			WHEN casa > 0 THEN casa
            ELSE numero_casa
        END,
        Tipo_Endereco_idTipo_Endereco = CASE 
			WHEN idTipo > 0 THEN idTipo
            ELSE Tipo_Endereco_idTipo_Endereco
        END,
        Bairro_idBairro = CASE 
			WHEN idBairro > 0 THEN idBairro
            ELSE Bairro_idBairro
        END
        WHERE idEndereco = id;

CREATE PROCEDURE alterar_hospital(IN cnpj_valor varchar(15), IN cnpj_novo varchar(15) , IN nome varchar(45), IN idEndereco int)
	UPDATE hospital SET nome_hospital = 
		CASE 
			WHEN nome <> '' THEN nome
            ELSE nome_hospital
        END, 
        cnpj = CASE 
			WHEN cnpj_novo <> '' THEN cnpj_novo
            ELSE cnpj
        END,
        Endereco_idEndereco = CASE 
			WHEN idEndereco > 0 THEN idEndereco
            ELSE Endereco_idEndereco
        END
        WHERE cnpj = cnpj_valor;
        
CREATE PROCEDURE alterar_ala(IN ala_cod int, IN descricao varchar(45), IN cnpj varchar(15))
	UPDATE ala SET descricao_Ala = 
		CASE 
			WHEN descricao <> '' THEN descricao
            ELSE descricao_Ala
        END, 
        Hospital_cnpj = CASE 
			WHEN cnpj > 0 THEN cnpj
            ELSE Hospital_cnpj
        END
        WHERE cod_Ala = ala_cod;

CREATE PROCEDURE alterar_tipo_telefone(IN id int, In descricao varchar(45))
	UPDATE tipo_telefone SET descricao_tipotelefone = 
		CASE 
			WHEN descricao <> '' THEN descricao
            ELSE descricao_tipotelefone
        END
    WHERE idTipo_Telefone = id;

CREATE PROCEDURE alterar_tipo_convenio(IN id int, In descricao varchar(45))
	UPDATE tipo_convenio SET descricao_tipoconvenio = 
		CASE 
			WHEN descricao <> '' THEN descricao
            ELSE descricao_tipoconvenio
        END
    WHERE cod_TipoConvenio = id;

CREATE PROCEDURE alterar_sexo (IN id int, In descricao varchar(45))
	UPDATE sexo SET descricao_sexo = 
		CASE 
			WHEN descricao <> '' THEN descricao
            ELSE descricao_sexo
        END
    WHERE cod_Sexo = id;

CREATE PROCEDURE alterar_plano_saude(IN id int, In descricao varchar(45), In nome varchar(45))
	UPDATE plano_saude SET descricao_planosaude = 
		CASE 
			WHEN descricao <> '' THEN descricao
            ELSE descricao_planosaude
        END, 
        nome_planosaude = CASE 
			WHEN nome <> '' THEN nome
            ELSE nome_planosaude
        END
        WHERE cod_PlanoSaude = id;

CREATE PROCEDURE alterar_estado_civil(IN id int, In descricao varchar(45))
	UPDATE estado_civil SET descricao_estadocivil = 
		CASE 
			WHEN descricao <> '' THEN descricao
            ELSE descricao_estadocivil
        END
    WHERE cod_EstadoCivil = id;

CREATE PROCEDURE alterar_telefone(IN id int, In numero varchar(11), In idCidade int, In idTipo int )
	UPDATE telefone SET numero_telefone = 
		CASE 
			WHEN numero <> '' THEN numero
            ELSE numero_telefone
        END, 
        Cidade_idCidade = CASE 
			WHEN idCidade > 0 THEN idCidade
            ELSE Cidade_idCidade
        END, 
        Tipo_Telefone_idTipo_Telefone = CASE 
			WHEN idTipo > 0 THEN idTipo
            ELSE Tipo_Telefone_idTipo_Telefone
        END
        WHERE idTelefone = id;
        
CREATE PROCEDURE alterar_enfermaria(IN id int, In descricao varchar(45), In codAla int, In idTelefone int )
	UPDATE enfermaria SET descricao_enfermaria = 
		CASE 
			WHEN descricao <> '' THEN descricao
            ELSE descricao_enfermaria
        END, 
		Ala_cod_Ala = CASE 
			WHEN codAla > 0  THEN codAla
            ELSE Ala_cod_Ala
        END, 
        Telefone_idTelefone = CASE 
			WHEN idTelefone > 0 THEN idTelefone
            ELSE Telefone_idTelefone
        END
        WHERE cod_Enfermaria = id;

CREATE PROCEDURE alterar_laboratorio(IN id int, In descricao varchar(45), In idEndereco int )
	UPDATE laboratorio SET descricao_laboratorio = 
		CASE 
			WHEN descricao <> '' THEN descricao
            ELSE descricao_laboratorio
        END, 
        Endereco_idEndereco = CASE 
			WHEN idEndereco > 0 THEN idEndereco
            ELSE Endereco_idEndereco
        END
        WHERE cod_Laboratorio = id;

CREATE PROCEDURE alterar_convenio(IN id int, In descricao varchar(45), In valor int, In idTipo int, In idLaboratorio int, In cnpj varchar(15))
	UPDATE convenio SET descricao_convenio = 
		CASE 
			WHEN descricao <> '' THEN descricao
            ELSE descricao_convenio
        END, 
        valor_convenio = CASE 
			WHEN valor > 0 THEN valor
            ELSE valor_convenio
        END, 
        Tipo_Convenio_cod_TipoConvenio = CASE 
			WHEN idTipo > 0 THEN idTipo
            ELSE Tipo_Convenio_cod_TipoConvenio
        END, 
        Laboratorio_cod_Laboratorio = CASE 
			WHEN idLaboratorio > 0 THEN idLaboratorio
            ELSE Laboratorio_cod_Laboratorio
        END, 
        Hospital_cnpj = CASE 
			WHEN cnpj <> '' THEN cnpj
            ELSE Hospital_cnpj
        END
        WHERE cod_Convenio = id;

CREATE PROCEDURE alterar_equipamento(IN id int, In descricao varchar(45), In fabricante_nome varchar(45),In idEnfermaria int)
	UPDATE equipamento SET descricao_equipamento = 
		CASE 
			WHEN descricao <> '' THEN descricao
            ELSE descricao_equipamento
        END, 
        fabricante = CASE 
			WHEN fabricante_nome <> '' THEN fabricante_nome
            ELSE fabricante
        END, 
        Enfermaria_cod_Enfermaria = CASE 
			WHEN idEnfermaria > 0 THEN idEnfermaria
            ELSE Enfermaria_cod_Enfermaria
        END
        WHERE cod_Equipamento = id;

CREATE PROCEDURE alterar_pessoa(IN cpf_valor varchar(11), IN nome varchar(45), IN nascimento date,
	IN email varchar(45), IN idEndereco int, IN idEstado int, IN idSexo int, IN idTelefone int)
    UPDATE pessoa SET nome_pessoa = 
		CASE 
			WHEN nome <> '' THEN nome
            ELSE nome_pessoa
        END, 
        data_nascimento = CASE 
			WHEN nascimento <> '' THEN nascimento
            ELSE data_nascimento
        END,
        email = CASE 
			WHEN email_valor <> '' THEN email_valor
            ELSE email
        END, 
        Endereco_idEndereco = CASE 
			WHEN idEndereco > 0 THEN idEndereco
            ELSE Endereco_idEndereco
        END, 
        Estado_Civil_cod_EstadoCivil= CASE 
			WHEN idEstado > 0 THEN idEstado
            ELSE Estado_Civil_cod_EstadoCivil
        END, 
        Sexo_cod_Sexo = CASE 
			WHEN idSexo > 0 THEN idSexo
            ELSE Sexo_cod_Sexo
        END, 
        Telefone_idTelefone = CASE 
			WHEN idTelefone > 0 THEN idTelefone
            ELSE Telefone_idTelefone
        END
        WHERE cpf = cpf_valor;
        
CREATE PROCEDURE alterar_paciente(IN idPaciente int, IN idPlano int, IN peso float, IN altura float)
    UPDATE paciente SET Plano_Saude_cod_PlanoSaude = CASE 
			WHEN idPlano > 0 THEN idPlano
            ELSE Plano_Saude_cod_PlanoSaude
        END, 
        peso_paciente = CASE 
			WHEN peso > 0 THEN peso
            ELSE peso_paciente
        END, 
        altura_paciente = CASE 
			WHEN altura > 0 THEN altura
            ELSE altura_paciente
        END
        WHERE cod_Paciente = idPaciente;

CREATE PROCEDURE alterar_funcionario(IN id int, IN salario_novo float)
    UPDATE funcionario SET salario = CASE 
			WHEN salario_novo > 0 THEN salario_novo
            ELSE salario
        END
        WHERE cod_Funcionario = id;

CREATE PROCEDURE alterar_dependente(IN id int, IN dependencia varchar(45), IN idFuncionario int)
    UPDATE funcionario SET tipo_dependente = CASE 
			WHEN dependencia <> '' THEN dependencia
            ELSE tipo_dependente
        END, 
        Funcionario_cod_Funcionario = CASE 
			WHEN idFuncionario > 0 THEN idFuncionario
            ELSE Funcionario_cod_Funcionario
        END
        WHERE cod_Dependente = id;

CREATE PROCEDURE alterar_medico(IN CRM_valor varchar(45), IN CRM_novo varchar(45), IN titulo varchar(45), IN filia varchar(45), IN idFuncionario int)
    UPDATE medico SET CRM = CASE 
			WHEN CRM_novo <> '' THEN CRM_novo
            ELSE CRM
        END,
        titulacao = CASE 
			WHEN titulo <> '' THEN titulo
            ELSE titulacao
        END, 
        filiacao = CASE 
			WHEN filia <> '' THEN filia
            ELSE filiacao
        END, 
        Funcionario_cod_Funcionario = CASE 
			WHEN idFuncionario > 0 THEN idFuncionario
            ELSE Funcionario_cod_Funcionario
        END
        WHERE CRM = CRM_valor;

CREATE PROCEDURE alterar_enfermeiro(IN COREN_valor varchar(45), IN COREN_novo varchar(45), IN formacao varchar(45), IN idFuncionario int)
    UPDATE enfermeiro SET COREN = CASE 
			WHEN COREN_novo <> '' THEN COREN_novo
            ELSE COREN
        END,
        formacao_enfermeiro = CASE 
			WHEN formacao <> '' THEN formacao
            ELSE formacao_enfermeiro
        END, 
        Funcionario_cod_Funcionario = CASE 
			WHEN idFuncionario > 0 THEN idFuncionario
            ELSE Funcionario_cod_Funcionario
        END
        WHERE COREN = COREN_valor;

CREATE PROCEDURE alterar_consulta(IN id int, IN motivo_novo varchar(45), IN CRM varchar(45), IN idPaciente int , IN idEnfermaria int)
    UPDATE consulta SET motivo = CASE 
			WHEN motivo_novo <> '' THEN motivo_novo
            ELSE motivo
        END,
        Medico_CRM = CASE 
			WHEN CRM <> '' THEN CRM
            ELSE Medico_CRM
        END, 
        Paciente_cod_Paciente = CASE 
			WHEN idPaciente > 0 THEN idPaciente
            ELSE Paciente_cod_Paciente
        END, 
        Enfermaria_cod_Enfermaria = CASE 
			WHEN idEnfermaria > 0 THEN idEnfermaria
            ELSE Enfermaria_cod_Enfermaria
        END
        WHERE cod_Consulta = id;

CREATE PROCEDURE alterar_receita(IN id int, IN data_nova date, IN idConsulta int)
    UPDATE receita SET data_receita = CASE 
			WHEN data_nova <> '' THEN data_nova
            ELSE data_receita
        END,
        Consulta_cod_Consulta = CASE 
			WHEN idConsulta > 0 THEN idConsulta
            ELSE Consulta_cod_Consulta
        END
        WHERE idReceita = id;

CREATE PROCEDURE alterar_exame(IN id int, IN descricao varchar(45), IN restricao varchar(45), IN COREN varchar(45) , IN idConsulta int, IN idLaboratorio int)
    UPDATE exame SET descricao_exame = CASE 
			WHEN descricao <> '' THEN descricao
            ELSE descricao_exame
        END,
        restricao_exame = CASE 
			WHEN restricao <> '' THEN restricao
            ELSE restricao_exame
        END,
        Enfermeiro_COREN = CASE 
			WHEN COREN <> '' THEN COREN
            ELSE Enfermeiro_COREN
        END,
        Consulta_cod_Consulta = CASE 
			WHEN idConsulta > 0 THEN idConsulta
            ELSE Consulta_cod_Consulta
        END,
        Laboratorio_cod_Laboratorio = CASE 
			WHEN idLaboratorio > 0 THEN idLaboratorio
            ELSE Laboratorio_cod_Laboratorio
        END
        WHERE cod_Exame = id;

CREATE PROCEDURE alterar_remedio(IN id int, IN descricao_novo varchar(45), IN dias time , IN intervalo varchar(45), IN nome varchar(45), IN idReceita int)
    UPDATE remedio SET descricao = CASE 
			WHEN descricao_novo <> '' THEN descricao_novo
            ELSE descricao
        END,
       dias_uso = CASE 
			WHEN dias > 0 THEN dias
            ELSE dias_uso
        END,
        intervalo_uso = CASE 
			WHEN intervalo <> '' THEN intervalo
            ELSE intervalo_uso
        END,
        nome_remedio = CASE 
			WHEN nome <> '' THEN nome
            ELSE nome_remedio
        END,
        Receita_idReceita = CASE 
			WHEN idReceita > 0 THEN idReceita
            ELSE Receita_idReceita
        END
        WHERE idRemedio = id;