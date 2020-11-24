-- Autores: 
--     Lucas Gabriel de Oliveira Gurgel - 19/0121637 
--     Maria Clara Oliveira Fortes - 19/0017503
USE hospital;

CALL alterar_uf(IN id int, In nome varchar(45))
CALL alterar_uf(IN id int, In nome varchar(45))
CALL alterar_uf(IN id int, In nome varchar(45))

CALL alterar_cidade(IN id int, In nome varchar(45), IN ddd_valor int, IN id_uf int)

CALL alterar_bairro(IN id int, In nome varchar(45), IN id_cidade int)

CALL alterar_tipo_endereco(IN id int, In descricao varchar(45))

CALL alterar_endereco(IN id int, In cep_valor varchar(8), In rua varchar(45), 
	In comple varchar(45), In casa int, IN idTipo int, IN idBairro int)

CALL alterar_hospital(IN cnpj_valor varchar(15), IN cnpj_novo varchar(15) , IN nome varchar(45), IN idEndereco int)

CALL alterar_ala(IN ala_cod int, IN descricao varchar(45), IN cnpj varchar(15))

CALL alterar_tipo_convenio(IN id int, In descricao varchar(45))

CALL alterar_sexo (IN id int, In descricao varchar(45))

CALL alterar_plano_saude(IN id int, In descricao varchar(45), In nome varchar(45))

CALL alterar_estado_civil(IN id int, In descricao varchar(45))

CALL alterar_telefone(IN id int, In numero varchar(11), In idCidade int, In idTipo int )

CALL alterar_enfermaria(IN id int, In descricao varchar(45), In codAla int, In idTelefone int )

CALL alterar_laboratorio(IN id int, In descricao varchar(45), In idEndereco int )

CALL alterar_convenio(IN id int, In descricao varchar(45), In valor int, In idTipo int, In idLaboratorio int, In cnpj varchar(15))

CALL alterar_equipamento(IN id int, In descricao varchar(45), In fabricante_nome varchar(45),In idEnfermaria int)

CALL alterar_pessoa(IN cpf_valor varchar(11), IN nome varchar(45), IN nascimento date,
	IN email varchar(45), IN idEndereco int, IN idEstado int, IN idSexo int, IN idTelefone int)

CALL alterar_paciente(IN idPaciente int, IN idPlano int, IN peso float, IN altura float)

CALL alterar_funcionario(IN id int, IN salario_novo float)

CALL alterar_dependente(IN id int, IN dependencia varchar(45), IN idFuncionario int)

CALL alterar_medico(IN CRM_valor varchar(45), IN CRM_novo varchar(45), IN titulo varchar(45), IN filia varchar(45), IN idFuncionario int)

CALL alterar_enfermeiro(IN COREN_valor varchar(45), IN COREN_novo varchar(45), IN formacao varchar(45), IN idFuncionario int)

CALL alterar_consulta(IN id int, IN motivo_novo varchar(45), IN CRM varchar(45), IN idPaciente int , IN idEnfermaria int)

CALL alterar_receita(IN id int, IN data_nova date, IN idConsulta int)

CALL alterar_exame(IN id int, IN descricao varchar(45), IN restricao varchar(45), IN COREN varchar(45) , IN idConsulta int, IN idLaboratorio int)

CALL alterar_remedio(IN id int, IN descricao_novo varchar(45), IN dias time , IN intervalo varchar(45), IN nome varchar(45), IN idReceita int)