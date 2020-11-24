-- Autores: 
--     Lucas Gabriel de Oliveira Gurgel - 19/0121637 
--     Maria Clara Oliveira Fortes - 19/0017503

USE hospital;

CREATE PROCEDURE excluir_uf(IN id int)
	DELETE FROM uf WHERE idUF = id;

CREATE PROCEDURE excluir_cidade(IN id int)
	DELETE FROM cidade WHERE idCidade = id;
        
CREATE PROCEDURE excluir_bairro(IN id int)
	DELETE FROM bairro WHERE idBairro = id;

CREATE PROCEDURE excluir_tipo_endereco(IN id int)
	DELETE FROM tipo_endereco WHERE idTipo_Endereco = id;
    
CREATE PROCEDURE excluir_endereco(IN id int)
	DELETE FROM endereco WHERE idEndereco = id;

CREATE PROCEDURE excluir_hospital(IN cnpj_valor varchar(15))
	DELETE FROM hospital WHERE cnpj = cnpj_valor;
        
CREATE PROCEDURE excluir_ala(IN ala_cod int)
	DELETE FROM ala WHERE cod_Ala = ala_cod;

CREATE PROCEDURE excluir_tipo_telefone(IN id int)
	DELETE FROM tipo_telefone WHERE idTipo_Telefone = id;

CREATE PROCEDURE excluir_tipo_convenio(IN id int)
	DELETE FROM tipo_convenio WHERE cod_TipoConvenio = id;

CREATE PROCEDURE excluir_sexo (IN id int)
	DELETE FROM sexo WHERE cod_Sexo = id;

CREATE PROCEDURE excluir_plano_saude(IN id int)
	DELETE FROM plano_saude WHERE cod_PlanoSaude = id;

CREATE PROCEDURE excluir_estado_civil(IN id int)
	DELETE FROM estado_civil WHERE cod_EstadoCivil = id;

CREATE PROCEDURE excluir_telefone(IN id int)
	DELETE FROM telefone WHERE cod_Enfermaria = id;

CREATE PROCEDURE excluir_laboratorio(IN id int)
	DELETE FROM laboratorio WHERE cod_Laboratorio = id;

CREATE PROCEDURE excluir_convenio(IN id int)
	DELETE FROM convenio WHERE cod_Convenio = id;

CREATE PROCEDURE excluir_equipamento(IN id int)
	DELETE FROM equipamento WHERE cod_Equipamento = id;

CREATE PROCEDURE excluir_pessoa(IN cpf_valor varchar(11))
    DELETE FROM pessoa WHERE cpf = cpf_valor;
        
CREATE PROCEDURE excluir_paciente(IN idPaciente int)
    DELETE FROM paciente WHERE cod_Paciente = idPaciente;

CREATE PROCEDURE excluir_funcionario(IN id int)
    DELETE FROM funcionario WHERE cod_Funcionario = id;

CREATE PROCEDURE excluir_dependente(IN id int)
    DELETE FROM dependente WHERE cod_Dependente = id;

CREATE PROCEDURE excluir_medico(IN CRM_valor varchar(45))
    DELETE FROM medico WHERE CRM = CRM_valor;

CREATE PROCEDURE excluir_enfermeiro(IN COREN_valor varchar(45))
    DELETE FROM enfermeiro WHERE COREN = COREN_valor;

CREATE PROCEDURE excluir_consulta(IN id int)
    DELETE FROM consulta WHERE cod_Consulta = id;

CREATE PROCEDURE excluir_receita(IN id int)
    DELETE FROM receita WHERE idReceita = id;

CREATE PROCEDURE excluir_exame(IN id int)
	DELETE FROM exame WHERE cod_Exame = id;

CREATE PROCEDURE excluir_remedio(IN id int)
    DELETE FROM remedio WHERE idRemedio = id;